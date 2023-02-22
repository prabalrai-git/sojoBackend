const Topic = require("./../models/Topic.model");

exports.getTopics = async (req, res) => {
  try {
    const data = await Topic.find();
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getTopicById = async (req, res) => {
  const id = req.params.id;
  try {
    const topic = await Topic.findById(id);
    if (!topic) return res.status(404).send({ err: "Topic not found" });
    return res.status(200).json({ data: topic });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
