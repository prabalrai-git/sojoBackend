const { Op } = require("sequelize");
const { News, Topic, Occupation } = require("./../models/");

exports.getTopNews = async (req, res) => {
  try {
    const data = await News.findAll({
      include: [
        {
          model: Topic,
          as: "topics",
        },
        {
          model: Occupation,
          as: "occupations",
        },
      ],
    });
    return res.status(200).json({ data });
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
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getSimilarNews = async (req, res) => {
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
          where: {
            id: categoryExists.id,
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

exports.getNewsByCategoryId = async (req, res) => {
  const { id } = req.params;
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
      include: [
        {
          model: Topic,
          as: "topics",
          where: {
            id: categoryExists.id,
          },
        },
        {
          model: Occupation,
          as: "occupations",
        },
      ],
      limit: 9,
    });

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
