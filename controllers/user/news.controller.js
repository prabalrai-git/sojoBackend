const { Op } = require("sequelize");
const { User, News, Topic, Occupation } = require("./../../models/");

exports.getNews = async (req, res) => {
  try {
    const user = await User.findByPk(req.user.id, {
      include: [
        {
          model: Topic,
        },
      ],
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
    });
    return res.status(200).json({ data });
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

      limit: 9,
    });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
