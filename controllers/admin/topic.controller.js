const { Topic, User, Occupation } = require("./../../models/");
const cloudinaryConfig = require("./../../utils/cloudinary");
const cloudinary = require("cloudinary");
const { handleText } = require("./../../helper/text");
const fs = require("fs");
const path = require("path");
const sharp = require("sharp");
const sequelize = require("../../db/db"); // initialize sequelize instance

const { QueryTypes } = require("sequelize");

exports.postTopic = async (req, res) => {
  cloudinaryConfig();
  let { name } = req.body;
  if (!name || name.trim().length <= 0)
    return res.status(400).send({ err: "Name cannot be empty" });
  name = handleText(name);
  if (!req.file) return res.status(400).send({ err: "Image is required" });

  try {
    const compressedFilePath = path.join(
      __dirname,
      "../../",
      "uploads",
      "newtopic.jpeg"
    );

    await sharp(req.file.path).jpeg({ quality: 16 }).toFile(compressedFilePath);
    const upload = await cloudinary.v2.uploader.upload(compressedFilePath, {
      // quality: "auto",
      fetch_format: "auto",
    });
    fs.unlinkSync(req.file.path);
    fs.unlinkSync(compressedFilePath);

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
      const compressedFilePath = path.join(
        __dirname,
        "../../",
        "uploads",
        "newTopic.jpeg"
      );

      await sharp(req.file.path)
        .jpeg({ quality: 16 })
        .toFile(compressedFilePath);
      const upload = await cloudinary.v2.uploader.upload(compressedFilePath, {
        // quality: "auto",
        fetch_format: "auto",
      });
      fs.unlinkSync(req.file.path);
      fs.unlinkSync(compressedFilePath);

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

exports.getTopicsByPopularity = async (req, res) => {
  try {
    const data = await sequelize.query(
      "SELECT t.id, t.name, COUNT(*) AS repetition_count FROM user_topics AS ut INNER JOIN topics AS t ON ut.topicId = t.id GROUP BY t.id, t.name ORDER BY repetition_count DESC;",
      { type: QueryTypes.SELECT }
    );
    return res.status(200).json({ data });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: "Internal server error" });
  }
};
