const { News, Topic, Occupation } = require("./../../models/");
const { cloudinaryConfig } = require("./../../helper/cloudinary");
const { handleText } = require("./../../helper/text");
const fs = require("fs");
const cloudinary = require("cloudinary");

exports.getAllNews = async (req, res) => {
  try {
    const data = await News.findAll({
      include: [
        {
          model: Topic,
          as: "topics",
        },
        {
          model: Occupation,
          as: "occupation",
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
      include: [Topic, Occupation],
    });
    if (!data) return res.status(404).send({ err: "News not found" });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.postNews = async (req, res) => {
  cloudinaryConfig();
  let {
    title,
    previewText,
    news,
    topics,
    ageGroup,
    gender,
    occupations,
    isFeatured,
    isNSFW,
    isPaid,
    sponsorURL,
  } = req.body;

  if (!title || title.trim().length <= 0)
    return res.status(400).send({ err: "Title cannot be empty" });
  if (!previewText || previewText.trim().length <= 0)
    return res.status(400).send({ err: "Preview Text cannot be empty" });
  if (!news || news.trim().length <= 0)
    return res.status(400).send({ err: "News cannot be empty" });
  if (!topics || topics.length <= 0)
    return res.status(400).send({ err: "Topic cannot be empty" });
  if (!ageGroup || ageGroup.length <= 0)
    return res.status(400).send({ err: "Age Group cannot be empty" });
  if (!occupations || occupations.length <= 0)
    return res.status(400).send({ err: "Occupation cannot be empty" });

  if (!req.file) return res.status(400).send({ err: "Image is required" });

  title = handleText(title);
  previewText = handleText(previewText);

  if (previewText.length >= 250) {
    return res.status(400).send({ err: "Preview text is too long" });
  }

  try {
    const upload = await cloudinary.v2.uploader.upload(req.file.path);
    fs.unlinkSync(req.file.path);
    const newsData = await News.create({
      title,
      previewText,
      news,
      ageGroup,
      gender,
      isFeatured,
      isNSFW,
      isPaid,
      sponsorURL,
      image: upload.secure_url,
      publicId: upload.public_id,
    });

    await newsData.addOccupations(occupations);
    await newsData.addTopics(topics);

    const data = await News.findByPk(newsData.id, {
      include: [
        {
          model: Topic,
          as: "topics",
          attributes: ["id", "name"],
          through: {
            attributes: [],
          },
        },
        {
          model: Occupation,
          as: "occupations",
          attributes: ["id", "name"],
          through: {
            attributes: [],
          },
        },
      ],
    });

    return res.status(201).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.updateNews = async (req, res) => {
  cloudinaryConfig();
  let {
    title,
    previewText,
    news,
    topic,
    ageGroup,
    gender,
    occupation,
    isFeatured,
    isNSFW,
    isPaid,
    sponsorURL,
    image,
  } = req.body;
  const { id } = req.params;

  if (!title || title.trim().length <= 0)
    return res.status(400).send({ err: "Title cannot be empty" });
  if (!previewText || previewText.trim().length <= 0)
    return res.status(400).send({ err: "Preview Text cannot be empty" });
  if (!news || news.trim().length <= 0)
    return res.status(400).send({ err: "News cannot be empty" });
  if (!topic || topic.length <= 0)
    return res.status(400).send({ err: "Topic cannot be empty" });
  if (!ageGroup || ageGroup.length <= 0)
    return res.status(400).send({ err: "Age Group cannot be empty" });
  if (!occupation)
    return res.status(400).send({ err: "Occupation cannot be empty" });

  if (!req.file && !image)
    return res.status(400).send({ err: "Image is required" });

  title = handleText(title);
  previewText = handleText(previewText);

  if (previewText.length >= 250) {
    return res.status(400).send({ err: "Preview text is too long" });
  }

  let upload;
  try {
    const newsExists = await News.findByPk(id);
    if (!newsExists) return res.status(404).send({ err: "News not found" });

    if (req.file) {
      await cloudinaryV2.uploader.destroy(newsExists.publicId);
      upload = await cloudinaryV2.uploader.upload(req.file.path);
      fs.unlinkSync(req.file.path);
    }

    const topicIds = topic.map((topicId) => parseInt(topicId));
    const ageGroups = ageGroup.map((age) => parseInt(age));
    const genders = gender.map((genderType) => parseInt(genderType));

    const data = await newsExists.update({
      title,
      previewText,
      news,
      topicId: topicIds,
      ageGroup: ageGroups,
      gender: genders,
      occupationId: parseInt(occupation),
      isFeatured,
      isNSFW,
      isPaid,
      sponsorURL,
      image: upload ? upload.secure_url : newsExists.image,
      publicId: upload ? upload.public_id : newsExists.publicId,
    });

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.deleteNews = async (req, res) => {
  cloudinaryConfig();
  const { id } = req.params;
  try {
    const news = await News.findByPk(id);
    if (!news) return res.status(404).send({ err: "News not found" });

    await cloudinary.v2.uploader.destroy(news.publicId);
    await news.destroy();

    return res.status(200).send({ msg: "News deleted successfully" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
