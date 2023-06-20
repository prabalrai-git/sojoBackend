const { Op } = require("sequelize");
const {
  Bookmark,
  User,
  News,
  Topic,
  NewsTopic,
  Occupation,
} = require("../../models");

exports.addBookMark = async (req, res) => {
  // return res.status(200).json({ userId, newsId });
  try {
    const { userId, newsId } = req.body;

    // Check if the user and article exist
    const user = await User.findByPk(userId);

    const article = await News.findByPk(newsId);
    // return res.status(200).json({ article });

    if (!user || !article) {
      return res.status(404).json({ message: "User or article not found" });
    }

    // Create the bookmark
    const bookmark = await Bookmark.create({
      userId: userId,
      newsId: newsId,
    });

    res.status(201).json(bookmark);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

// remove bookmark i.e isActive set to false

exports.toogleOrAddBookmark = async (req, res) => {
  try {
    const { userId, newsId } = req.body;

    const user = await User.findByPk(userId);

    const article = await News.findByPk(newsId);
    // return res.status(200).json({ article });

    if (!user || !article) {
      return res.status(404).json({ message: "User or article not found" });
    }

    const [bookmark, created] = await Bookmark.findOrCreate({
      where: { userId, newsId },
      defaults: {
        userId,
        newsId,
      },
    });
    // const bookmark = await User.findOne({  });

    if (created) {
      return res
        .status(201)
        .json({ msg: "Bookmark added", bookmark: bookmark });
    } else {
      await bookmark.update({ isActive: !bookmark.isActive });
      res
        .status(201)
        .json({ msg: "Bookmark exits, isActive toggled", bookmark: bookmark });
    }

    // Create the bookmark
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

// getBookmark by userId

exports.getBookmarkedNews = async (req, res) => {
  const { userId } = req.body;

  try {
    // const user = await User.findByPk(userId);

    // if (!user) {
    //   return res.status(404).json({ message: "User not found" });
    // }
    // const user = await User.findByPk(userId, {
    //   include: [
    //     {
    //       model: Topic,
    //       as: "topics",
    //     },
    //   ],
    //   order: [["id", "DESC"]],
    // });
    // const topicIds = user.topics.map((topic) => topic.id);

    // const whereClause = {
    //   [Op.and]: {
    //     id: {
    //       [Op.not]: null,
    //     },
    //     [Op.or]: [
    //       {
    //         isNSFW: false,
    //       },
    //       {
    //         isNSFW: true,
    //         id: !user.skipNSFW ? { [Op.not]: null } : null,
    //       },
    //     ],
    //   },
    // };

    // return res.status(200).json({ user: user });
    const bookmarks = await Bookmark.findAll({
      where: { userId: userId, isActive: true },
      include: [
        // {
        //   model: Topic,
        //   where: {
        //     id: {
        //       [Op.in]: topicIds,
        //     },
        //   },
        //   through: {
        //     model: NewsTopic,
        //     attributes: ["order"],
        //   },
        //   order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
        // },
        // { model: News },
      ],
      // order: [["id", "DESC"]],
      // where: whereClause,
    });

    var BookmarkedNewsIds = [];

    bookmarks.map((item) => BookmarkedNewsIds.push(item.newsId));

    var BookmarkedNews = [];

    for (let i = 0; i <= BookmarkedNewsIds.length; i++) {
      // return res.send(BookmarkedNewsIds);
      const data = await News.findByPk(BookmarkedNewsIds[i], {
        include: [
          {
            model: Topic,
            as: "topics",
            through: {
              model: NewsTopic,
              attributes: ["order"],
            },
            order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
          },
          {
            model: Occupation,
            as: "occupations",
          },
        ],
      });
      BookmarkedNews.push(data);
    }
    // return res.send({ msg: "hello", BookmarkedNews });
    if (bookmarks.length < 1) {
      return res.status(404).json({ msg: "No any bookmarks for the user" });
    } else {
      // const bookmarkedNews = bookmarks.map((bookmark) => bookmark.news);
      return res
        .status(200)
        .json({ nbsp: BookmarkedNews.length, bookmarkedNews: BookmarkedNews });
    }

    // const bookmarks = user.bookmarks.map((bookmark) => bookmark.news);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};
