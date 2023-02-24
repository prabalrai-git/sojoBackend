const { User, News, Topic } = require("./../../models/");

exports.getNews = async (req, res) => {
  try {
    const user = await User.findByPk(req.user._id);
    const data = await News.findAll({
      include: [{ model: Topic }, { model: Occupation }],
      where: {
        topicId: {
          [Op.in]: user.topics,
        },
      },
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
    const user = await User.findByPk(req.user._id);
    const newsExists = await News.findByPk(id, { include: Topic });
    if (!newsExists) return res.status(404).send({ err: "News not found" });

    const categoryExists = await Topic.findByPk(newsExists.topic[0]._id);
    if (!categoryExists)
      return res.status(404).send({ err: "Category not found" });

    const data = await News.findAll({
      where: {
        id: {
          [Op.ne]: id,
        },
        topicId: {
          [Op.in]: user.topics,
        },
      },
      include: [Topic, "occupation"],
      limit: 9,
    });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
