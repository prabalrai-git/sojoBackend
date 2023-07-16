const { Topic } = require("./../../models/");
const cloudinaryConfig = require("./../../utils/cloudinary");
const cloudinary = require("cloudinary");
const { handleText } = require("./../../helper/text");
const fs = require("fs");

exports.postTopic = async (req, res) => {
  cloudinaryConfig();
  let { name } = req.body;
  if (!name || name.trim().length <= 0)
    return res.status(400).send({ err: "Name cannot be empty" });
  name = handleText(name);
  if (!req.file) return res.status(400).send({ err: "Image is required" });

  try {
    const upload = await cloudinary.v2.uploader.upload(req.file.path, {
      quality: "auto",
      fetch_format: "auto",
    });
    fs.unlinkSync(req.file.path);
    const topicExists = await Topic.findOne({ where: { name } });
    if (topicExists)
      return res.status(409).send({ err: "Topic already exists" });

    const topic = await Topic.create({
      name,
      image: upload.secure_url,
      publicId: upload.public_id,
    });

    return res.status(201).json({ data: topic });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.updateTopic = async (req, res) => {
  cloudinaryConfig();
  const id = req.params.id;
  let { name, image } = req.body;
  if (!name || name.trim().length <= 0)
    return res.status(400).send({ err: "Name cannot be empty" });
  name = handleText(name);

  if (!req.file && !image)
    return res.status(400).send({ err: "Image is required" });

  try {
    const topic = await Topic.findByPk(id);
    if (!topic) return res.status(404).send({ err: "Topic not found" });
    if (req.file) {
      const upload = await cloudinary.v2.uploader.upload(req.file.path, {
        quality: "auto",
        fetch_format: "auto",
      });
      fs.unlinkSync(req.file.path);

      if (topic.publicId) {
        await cloudinary.v2.uploader.destroy(topic.publicId);
      }

      topic.image = upload.secure_url;
      topic.publicId = upload.public_id;
    }
    const data = await topic.save();
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.deleteTopic = async (req, res) => {
  cloudinaryConfig();
  try {
    const id = req.params.id;
    const topic = await Topic.findByPk(id);
    if (!topic) return res.status(404).send({ err: "Topic not found" });
    if (topic.publicId) {
      await cloudinary.v2.uploader.destroy(topic.publicId);
    }
    await topic.destroy();
    return res.status(200).send({ msg: "Topic deleted" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};