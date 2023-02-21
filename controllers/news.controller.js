const News = require("./../models/News.model");

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
