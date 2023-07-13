const { HomeTitle } = require("./../../models");

const { handleText } = require("./../../helper/text");

exports.postTitle = async (req, res) => {
  try {
    let { title } = req.body;
    if (!title || title.trim().length <= 0)
      return res.status(400).send({ err: "Title cannot be empty" });
    title = handleText(title);

    const data = await HomeTitle.findAll();
    console.log(data);
    if (data.length > 0) {
      await HomeTitle.destroy({
        where: {
          id: data[0].id,
        },
      });
    }

    const newTitle = await HomeTitle.create({ title });
    return res.status(201).json({ data: newTitle });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getTitle = async (req, res) => {
  try {
    const data = await HomeTitle.findAll();

    return res.status(201).json({ data: data[0] });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
