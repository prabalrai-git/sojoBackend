const { Op, literal } = require("sequelize");
const {
  User,
  News,
  Topic,
  Occupation,
  NewsTopic,
  Bookmark,
} = require("./../../models/");

exports.getGlobalNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  try {
    const user = await User.findByPk(req.user.id, {
      include: [
        {
          model: Topic,
          as: "topics",
        },
      ],
    });

    const selectedTopicIds = user.topics.map((topic) => topic.id);
    const allTopics = await Topic.findAll();
    const notSelectedTopics = allTopics.filter(
      (topic) => !selectedTopicIds.includes(topic.id)
    );

    // Shuffle notSelectedTopics array randomly
    for (let i = notSelectedTopics.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [notSelectedTopics[i], notSelectedTopics[j]] = [
        notSelectedTopics[j],
        notSelectedTopics[i],
      ];
    }

    const topicIds = [...notSelectedTopics, ...user.topics].map(
      (topic) => topic.id
    );

    const data = await News.findAll({
      limit: limit,
      offset: offset,
      include: [
        {
          model: Topic,
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
          through: {
            model: NewsTopic,
            attributes: ["order"],
          },
        },
        { model: Occupation },
      ],
      order: literal("rand()"),
    });

    let usersBookmarkedNews = await Bookmark.findAll({
      where: { userId: req.user.id },
    });

    for (let i = 0; i < data.length; i++) {
      const foundBookmarkId = usersBookmarkedNews.find(
        (item) => item.newsId === data[i].id && item.isActive
      );
      if (foundBookmarkId) {
        data[i].dataValues.isBookmarkedByUser = true;
      } else {
        data[i].dataValues.isBookmarkedByUser = false;
      }
    }

    const count = await News.count();
    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    

    return res.status(200).json({
      data: data,
      pagination: {
        currentPage: page,
        nextPage: nextPage,
        prevPage: prevPage,
        totalPages: totalPages,
      },
    });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  try {
    const user = await User.findByPk(req.user.id, {
      include: [
        {
          model: Topic,
          as: "topics",
        },
      ],
      order: [["id", "DESC"]],
    });
    const topicIds = user.topics.map((topic) => topic.id);

    const whereClasuse = {
      [Op.and]: {
        id: {
          [Op.not]: null,
        },
        [Op.or]: [
          {
            isNSFW: false,
          },
          {
            isNSFW: true,
            id: !user.skipNSFW ? { [Op.not]: null } : null,
          },
        ],
      },
    };

    const data = await News.findAll({
      include: [
        {
          model: Topic,
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
          through: {
            model: NewsTopic,
            attributes: ["order"],
          },
          order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
        },
        { model: Occupation },
      ],
      limit: limit,
      offset: offset,
      order: [["id", "DESC"]],
      where: whereClause,
    });

    let usersBookmarkedNews = await Bookmark.findAll({
      where: { userId: req.user.id },
    });

    for (let i = 0; i < data.length; i++) {
      const foundBookmarkId = usersBookmarkedNews.find(
        (item) => item.newsId === data[i].id && item.isActive
      );
      if (foundBookmarkId) {
        data[i].dataValues.isBookmarkedByUser = true;
      } else {
        data[i].dataValues.isBookmarkedByUser = false;
      }
    }

    const count = await News.count({
      include: [
        {
          model: Topic,
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
        },
      ],
      where: whereClause,
    });

    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    return res.status(200).json({
      data: data,
      pagination: {
        currentPage: page,
        nextPage: nextPage,
        prevPage: prevPage,
        totalPages: totalPages,
      },
    });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getSimilarNews = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await User.findByPk(req.user.id, { include: Topic });
    const newsExists = await News.findByPk(id, { include: Topic });
    if (!newsExists) return res.status(404).send({ err: "News not found" });
    const topicIds = user.topics.map((topic) => topic.id);
    const categoryExists = await Topic.findByPk(newsExists.topics[0].id);
    if (!categoryExists)
      return res.status(404).send({ err: "Category not found" });

    const data = await News.findAll({
      where: {
        id: {
          [Op.ne]: id,
        },
      },
      include: [
        {
          model: Topic,
          as: "topics",
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
          through: {
            model: NewsTopic,
            attributes: ["order"],
          },
          order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
        },
        {
          model: Occupation,
        },
      ],

      order: [["id", "DESC"]],
      limit: 9,
    });
    let usersBookmarkedNews = await Bookmark.findAll({
      where: { userId: req.user.id },
    });

    for (let i = 0; i < data.length; i++) {
      const foundBookmarkId = usersBookmarkedNews.find(
        (item) => item.newsId === data[i].id && item.isActive
      );
      if (foundBookmarkId) {
        data[i].dataValues.isBookmarkedByUser = true;
      } else {
        data[i].dataValues.isBookmarkedByUser = false;
      }
    }
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
