const { Op } = require("sequelize");
const {
  News,
  Topic,
  Occupation,
  NewsTopic,
  Bookmark,
  User,
} = require("./../models/");

exports.getTopNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  try {
    const data = await News.findAll({
      limit: limit,
      offset: offset,
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
      order: [["id", "DESC"]],
    });

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

exports.getNewsById = async (req, res) => {
  const { id } = req.params;

  try {
    const data = await News.findByPk(id, {
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

    if (!data) return res.status(404).send({ err: "News not found" });
    await data.update({
      views: data.views + 1,
    });

    if (req.query.userId) {
      let usersBookmarkedNews = await Bookmark.findAll({
        where: { userId: req.query.userId },
      });

      const foundBookmarkId = usersBookmarkedNews.find(
        (item) => item.newsId === data.id && item.isActive
      );
      // return res.send(foundBookmarkId);

      if (foundBookmarkId) {
        data.dataValues.isBookmarkedByUser = true;
      } else {
        data.dataValues.isBookmarkedByUser = false;
      }
    }

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getSimilarNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  const { id } = req.params;
  try {
    const newsExists = await News.findByPk(id, {
      include: [{ model: Topic }],
    });
    if (!newsExists) return res.status(404).send({ err: "News not found" });

    const categoryExists = await Topic.findByPk(newsExists.topics[0].id);
    if (!categoryExists)
      return res.status(404).send({ err: "Category not found" });

    const data = await News.findAll({
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
        },
      ],
      where: {
        id: {
          [Op.ne]: id,
        },
      },
      order: [["id", "DESC"]],
      limit: limit,
      offset: offset,
    });

    if (data.length < 1) {
      try {
        const data2 = await News.findAll({
          limit: limit,
          offset: offset,
          include: [
            {
              model: Topic,
              as: "topics",
              through: {
                model: NewsTopic,
                attributes: ["order"],
              },
              order: [
                [{ model: NewsTopic, as: "news_topics" }, "order", "ASC"],
              ],
            },
            {
              model: Occupation,
              as: "occupations",
            },
          ],
          order: [["id", "DESC"]],
        });

        const count = await News.count();
        const totalPages = Math.ceil(count / limit);
        const nextPage = page < totalPages ? page + 1 : null;
        const prevPage = page > 1 ? page - 1 : null;

        return res.status(200).json({
          data: data2,
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
    }
    const count = await News.count();
    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    return res.status(200).json({
      data,
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

exports.getNewsByCategoryId = async (req, res) => {
  const { id } = req.params;

  const { userId } = req.query;

  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  try {
    const categoryExists = await Topic.findByPk(id);
    if (!categoryExists)
      return res.status(404).send({ err: "Category not found" });
    const data = await News.findAll({
      where: {
        id: {
          [Op.ne]: id,
        },
      },
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
      order: [["id", "DESC"]],
    });

    if (userId) {
      let usersBookmarkedNews = await Bookmark.findAll({
        where: { userId: userId },
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
    }

    const count = await News.count({
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
            id: categoryExists.id,
          },
        },
      ],
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

exports.getNewsBySearchTerm = async (req, res) => {
  const { term } = req.params;

  const userId = req.query.userId;

  try {
    const data1 = await News.findAll({
      where: {
        [Op.or]: [{ title: { [Op.like]: "%" + term + "%" } }],
      },
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
      order: [["id", "DESC"]],
    });
    // search on topic title
    const data2 = await News.findAll({
      include: [
        {
          model: Topic,
          as: "topics",
          where: {
            [Op.or]: [{ name: { [Op.startsWith]: term.trim() } }],
          },
          through: {
            model: NewsTopic,
            attributes: ["order"],
          },
          // order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
        },

        {
          model: Occupation,
          as: "occupations",
        },
      ],
    });

    const data = data1.concat(data2);
    if (userId) {
      let usersBookmarkedNews = await Bookmark.findAll({
        where: { userId: userId },
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
    }

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.numberOfNewsForToday = async (req, res) => {
  const currentDate = new Date();
  currentDate.setHours(0, 0, 0, 0); // Set the time to the beginning of the day.

  const endOfDay = new Date(currentDate);
  endOfDay.setHours(23, 59, 59, 999); // Set the time to the end of the day.

  const user = await User.findByPk(req.user.id, {
    include: [
      {
        model: Topic,
        as: "topics",
      },
    ],
    order: [["id", "DESC"]],
  });

  let topicIds = user.topics.map((topic) => topic.id);
  if (user.skipPolitical) {
    topicIds = topicIds.filter((item) => item.id !== 1);
    await user.removeTopic(1);
  }

  const whereClause = {
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
    createdAt: {
      [Op.gte]: currentDate,
      [Op.lte]: endOfDay,
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
    // limit: limit,
    // offset: offset,
    order: [["id", "DESC"]],
    where: whereClause,
  });

  // const count = await News.count({
  //   where: {
  //     createdAt: {
  //       [Op.gte]: currentDate,
  //       [Op.lte]: endOfDay,
  //     },
  //   },
  // });

  return res.status(200).send({ countOfNewsToday: data.length });
};
