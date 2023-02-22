const News = require("./../models/News.model");
const Topics = require("./../models/Topic.model");

exports.getTopNews = async (req, res) => {
  try {
    const data = await News.find().populate(["topic", "occupation"]);
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getNewsById = async (req, res) => {
  const { id } = req.params;
  try {
    const data = await News.findById(id).populate(["topic", "occupation"]);
    if (!data) return res.status(404).send({ err: "News not found" });
    await data.updateOne({
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
        $in: categoryExists._id,
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
