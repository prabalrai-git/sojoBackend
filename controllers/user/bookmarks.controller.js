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
    const { newsId } = req.body;
    const userId = req.user.id;

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
    const { newsId } = req.body;
    const userId = req.user.id;

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

  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) :3;
  const offset = (page - 1) * limit;
  const userId = req.user.id;

  try {

    const bookmarks = await Bookmark.findAll({
      limit: limit,
      offset: offset,
      where: { userId: userId, isActive: true },
      
    });



    var BookmarkedNews = [];

    for (let i = 0; i < bookmarks.length; i++) {
      const data = await News.findByPk(bookmarks[i]?.newsId, {
    
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

    const count = await Bookmark.count({
  
      where: { userId: userId, isActive: true },
      
    });


    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    if (bookmarks.length < 1) {
      return res.status(404).json({ msg: "No any bookmarks for the user" });
    } else {
      // const bookmarkedNews = bookmarks.map((bookmark) => bookmark.news);
      return res
        .status(200)
        .json({ nbsp:BookmarkedNews.length , pagination: {
          currentPage: page,
          nextPage: nextPage,
          prevPage: prevPage,
          totalPages: totalPages,
        },  bookmarkedNews: BookmarkedNews });
    }

    // const bookmarks = user.bookmarks.map((bookmark) => bookmark.news);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};
exports.getBookmarkedNewsByCategoryId = async (req, res) => {

  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) :9;
  const { id } = req.params;
  const offset = (page - 1) * limit;
  const userId = req.user.id;

  try {
    const categoryExists = await Topic.findByPk(id);

    if (!categoryExists)
    return res.status(404).send({ err: "Category not found" });

    const bookmarks = await Bookmark.findAll({

      where: { userId: userId, isActive: true },
      
    });

    var BookmarkedNewsIds = [];

    bookmarks.map((item) => BookmarkedNewsIds.push(item.newsId));

    var BookmarkedNews = [];
 
    for (let i = 0; i <= BookmarkedNewsIds.length; i++) {
      // return res.send(BookmarkedNewsIds);
      const data = await News.findByPk(BookmarkedNewsIds[i], {
        limit: limit,
        offset: offset,
        include: [
          {
            model: Topic,
            as: "topics",
            where: {
              id: categoryExists.id,
            },
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

    
    const count = BookmarkedNews.length;
    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    if (bookmarks.length < 1) {
      return res.status(404).json({ msg: "No any bookmarks for the user" });
    } else {
      // const bookmarkedNews = bookmarks.map((bookmark) => bookmark.news);
      return res
        .status(200)
        .json({ nbsp:BookmarkedNews.length , pagination: {
          currentPage: page,
          nextPage: nextPage,
          prevPage: prevPage,
          totalPages: totalPages,
        },  bookmarkedNews: BookmarkedNews });
    }

    // const bookmarks = user.bookmarks.map((bookmark) => bookmark.news);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Internal server error" });
  }
};
