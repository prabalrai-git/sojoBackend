const { News, Topic, Occupation, NewsTopic } = require("./../../models/");
const { cloudinaryConfig } = require("./../../helper/cloudinary");
const { handleText } = require("./../../helper/text");
const fs = require("fs");
const cloudinary = require("cloudinary");
const { Op } = require("sequelize");
const sharp = require("sharp");
const path = require("path");

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
          through: {
            model: NewsTopic,
            attributes: ["order"],
          },
          order: [[{ model: NewsTopic, as: "news_topics" }, "order", "ASC"]],
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

exports.getNewsByTitle = async (req, res) => {
  const search = req.params.search || "";

  try {
    const searchWords = search.split(/\s+/); // split search string into individual words

    const whereClauses = searchWords.map((word) => ({
      title: { [Op.like]: "%" + word + "%" },
    }));

    const data = await News.findAll({
      where: { [Op.and]: whereClauses },
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
      include: [
        {
          model: Topic,
          as: "topics",
          through: {
            model: NewsTopic,
            attributes: ["order"],
            order: [["order", "ASC"]],
          },
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
    states,
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
  if (!states || states.length <= 0)
    return res.status(400).send({ err: "State cannot be empty" });

  if (!req.file) return res.status(400).send({ err: "Image is required" });

  title = handleText(title);
  previewText = handleText(previewText);

 console.log(states.length,'11111111111111111111111111111111111111111111111111111111111111111111111111111');


  // const stateNumber =  states.length >1? states.map(Number):[Number(states)];
  try {
    const compressedFilePath = path.join(
      __dirname,
      "../../",
      "uploads",
      "resized.png"
    );

    await sharp(req.file.path).png({ quality: 30 }).toFile(compressedFilePath);

    // return res.send(compressedFile);
    const upload = await cloudinary.v2.uploader.upload(compressedFilePath);
    fs.unlinkSync(req.file.path);
    fs.unlinkSync(compressedFilePath);

    let newsData = await News.create({
      title,
      previewText,
      news,
      ageGroup,
      gender,
      states,
      isFeatured,
      isNSFW,
      isPaid,
      sponsorURL,
      image: upload.secure_url,
      publicId: upload.public_id,
    });

    ageGroup = Array.isArray(ageGroup) ? ageGroup : [ageGroup];
    gender = Array.isArray(gender) ? gender : [gender];
  states = Array.isArray(states)? states: [states];

    const topicsArr = Array.isArray(topic) ? topic : [topic];
    const topicOrders = topicsArr.map((t, i) => ({
      topicId: t,
      newsId: newsData.id,
      order: i,
    }));
    await NewsTopic.bulkCreate(topicOrders);



    const occupationArr = Array.isArray(occupation) ? occupation : [occupation];
    const occupationIds = occupationArr.map((t) => t);
    await newsData.addOccupations(occupationIds);

    const data = await News.findByPk(newsData.id, {
      include: [
        {
          model: Topic,
          as: "topics",
          attributes: ["id", "name"],
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
    states,
    image,
  } = req.body;
  const { id } = req.params;

//  return console.log(states,"2333333333333sdfsddddddddddddddddddddddddddddddd33333333333333333333333333333");

  // const stateNumber = states.length >1? states?.map(Number):[Number(states)];



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
    if (!states || states.length <= 0)
    return res.status(400).send({ err: "State cannot be empty" });


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
      const compressedFilePath = path.join(
        __dirname,
        "../../",
        "uploads",
        "resized.png"
      );

      await sharp(req.file.path)
        .png({ quality: 30 })
        .toFile(compressedFilePath);
      const upload = await cloudinary.v2.uploader.upload(compressedFilePath);
      fs.unlinkSync(req.file.path);
      fs.unlinkSync(compressedFilePath);

      if (newsData.publicId) {
        await cloudinary.v2.uploader.destroy(newsData.publicId);
      }

      newsData.image = upload.secure_url;
      newsData.publicId = upload.public_id;
    }

    newsData.title = title;
    newsData.previewText = previewText;
    newsData.news = news;
    newsData.states =states,

    newsData.ageGroup = ageGroup;
    newsData.gender = gender;
    newsData.isFeatured = isFeatured;
    newsData.isNSFW = isNSFW;
    newsData.isPaid = isPaid;
    newsData.sponsorURL = sponsorURL;

    await newsData.setOccupations([]);
    await newsData.setTopics([]);

    const topicsArr = Array.isArray(topic) ? topic : [topic];
    const topicOrders = topicsArr.map((t, i) => ({
      topicId: t,
      newsId: newsData.id,
      order: i,
    }));

    await NewsTopic.bulkCreate(topicOrders);

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
