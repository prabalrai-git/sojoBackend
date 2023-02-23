const User = require("./../../models/User.model");
const News = require("./../../models/News.model");
const Topics = require("./../../models/Topic.model");

exports.getNews = async (req, res) => {
  try {
    const user = await User.findById(req.user._id);
    const data = await News.find({
      topic: {
        $in: user.topics,
      },
    }).populate(["topic", "occupation"]);
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getSimilarNews = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await User.findById(req.user._id);
    const newsExists = await News.findById(id);
    if (!newsExists) return res.status(404).send({ err: "News not found" });

    const categoryExists = await Topics.findById(newsExists.topic[0]._id);
    if (!categoryExists)
      return res.status(404).send({ err: "Category not found" });

    const data = await News.find({
      _id: {
        $ne: id,
      },
      topic: {
        $in: user.topics,
      },
    })
      .populate(["topic", "occupation"])
      .limit(9);
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
