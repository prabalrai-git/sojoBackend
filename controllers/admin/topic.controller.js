const { Topic } = require("./../../models/");

const { handleText } = require("./../../helper/text");

exports.postTopic = async (req, res) => {
  try {
    let { name } = req.body;
    if (!name || name.trim().legnth <= 0)
      return res.status(400).send({ err: "Name cannot be empty" });
    name = handleText(name);
    const topicExists = await Topic.findOne({ name });
    if (topicExists)
      return res.status(409).send({ err: "Topic already exists" });

    const topic = new Topic({ name });

    await topic.save();

    return res.status(201).json({ data: topic });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.updateTopic = async (req, res) => {
  const id = req.params.id;
  let { name } = req.body;
  if (!name || name.trim().legnth <= 0)
    return res.status(400).send({ err: "Name cannot be empty" });
  name = handleText(name);
  try {
    const topic = await Topic.findById(id);
    if (!topic) return res.status(404).send({ err: "Topic not found" });
    const data = await topic.update({
      name,
    });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.deleteTopic = async (req, res) => {
  try {
    const id = req.params.id;
    const topic = await Topic.findById(id);
    if (!topic) return res.status(404).send({ err: "Topic not found" });
    await Topic.findOneAndDelete({ _id: id });
    return res.status(200).send({ msg: "Topic deleted" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
