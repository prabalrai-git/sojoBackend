const { Op } = require("sequelize");
const { User, News, Topic, Occupation } = require("./../../models/");

exports.getNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 3;
  const offset = (page - 1) * limit;
  try {
    const user = await User.findByPk(req.user.id, {
      include: [
        {
          model: Topic,
        },
      ],
      order: [["id", "DESC"]],
    });
    const topicIds = user.topics.map((topic) => topic.id);

    const data = await News.findAll({
      include: [
        {
          model: Topic,
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
        },
        { model: Occupation },
      ],
      limit: limit,
      offset: offset,
      order: [["id", "DESC"]],
    });

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
      include: [
        {
          model: Topic,
          where: {
            id: {
              [Op.in]: topicIds,
            },
          },
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
      limit: 9,
    });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
