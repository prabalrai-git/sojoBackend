const { News, Topic, Occupation } = require("./../../models/");
const { cloudinaryConfig } = require("./../../helper/cloudinary");
const { handleText } = require("./../../helper/text");
const fs = require("fs");
const cloudinary = require("cloudinary");
const { Op } = require("sequelize");
const { Sequelize } = require("../../db/db");

exports.getAllNews = async (req, res) => {
  const page = req.query.page ? parseInt(req.query.page) : 1; // default page is 1
  const limit = req.query.limit ? parseInt(req.query.limit) : 9;
  const offset = (page - 1) * limit;
  const search = req.query.search || "";

  try {
    const data = await News.findAll({
      where: {
        [Op.or]: [{ title: { [Op.like]: "%" + search + "%" } }],
      },

      include: [
        {
          model: Topic,
          as: "topics",
          attributes: [
            "id",
            "name",
            [Sequelize.literal('"topics->news_topic"."order"'), "order", "ASC"],
          ],
        },
        {
          model: Occupation,
          as: "occupations",
        },
      ],
      order: [["id", "DESC"]],
      limit: limit,
      offset: offset,
    });
    const count = await News.count();
    const totalPages = Math.ceil(count / limit);
    const nextPage = page < totalPages ? page + 1 : null;
    const prevPage = page > 1 ? page - 1 : null;
    return res.status(200).json({
      data: data,
      pagination: {
        currentPage: page,
        nextPage: nextPage,
        prevPage: prevPage,
        totalPages: totalPages,
      },
    });
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
    topic,
    ageGroup,
    gender,
    occupation,
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
  if (!topic || topic.length <= 0)
    return res.status(400).send({ err: "Topic cannot be empty" });
  if (!ageGroup || ageGroup.length <= 0)
    return res.status(400).send({ err: "Age Group cannot be empty" });
  if (!occupation || occupation.length <= 0)
    return res.status(400).send({ err: "Occupation cannot be empty" });

  if (!req.file) return res.status(400).send({ err: "Image is required" });

  title = handleText(title);
  previewText = handleText(previewText);

  try {
    const upload = await cloudinary.v2.uploader.upload(req.file.path);
    fs.unlinkSync(req.file.path);

    let newsData = await News.create({
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

    ageGroup = Array.isArray(ageGroup) ? ageGroup : [ageGroup];
    gender = Array.isArray(gender) ? gender : [gender];
    const topicsArr = Array.isArray(topic) ? topic : [topic];
    const topicIds = topicsArr.map((t) => t); // extract the topic ids

    const orderArr = topicsArr.map((t, index) => {
      return { topicId: t, order: index + 1 };
    });

    await newsData.addTopics(topicIds, {
      through: orderArr,
    });

    const occupationArr = Array.isArray(occupation) ? occupation : [occupation];
    const occupationIds = occupationArr.map((t) => t);
    await newsData.addOccupations(occupationIds);

    const data = await News.findByPk(newsData.id, {
      include: [
        {
          model: Topic,
          as: "topics",
          attributes: ["id", "name"],
          through: {
            attributes: ["order"], // include the order value in the result
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

  try {
    let newsData = await News.findByPk(id);

    if (!newsData) {
      return res.status(404).send({ err: "News not found" });
    }

    if (req.file) {
      const upload = await cloudinary.v2.uploader.upload(req.file.path);
      fs.unlinkSync(req.file.path);

      if (newsData.publicId) {
        await cloudinary.v2.uploader.destroy(newsData.publicId);
      }

      newsData.image = upload.secure_url;
      newsData.publicId = upload.public_id;
    }

    newsData.title = title;
    newsData.previewText = previewText;
    newsData.news = news;
    newsData.ageGroup = ageGroup;
    newsData.gender = gender;
    newsData.isFeatured = isFeatured;
    newsData.isNSFW = isNSFW;
    newsData.isPaid = isPaid;
    newsData.sponsorURL = sponsorURL;

    await newsData.setOccupations([]);
    await newsData.setTopics([]);

    const topicsArr = Array.isArray(topic) ? topic : [topic];
    const topicIds = topicsArr.map((t) => t); // extract the topic ids

    const orderArr = topicsArr.map((t, index) => {
      return { topicId: t, order: index + 1 };
    });

    await newsData.addTopics(topicIds, {
      through: orderArr,
    });

    const occupationArr = Array.isArray(occupation) ? occupation : [occupation];
    const occupationIds = occupationArr.map((t) => t);
    await newsData.addOccupations(occupationIds);

    await newsData.save();

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
