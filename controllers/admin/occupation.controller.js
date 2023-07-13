const { Occupation } = require("./../../models");

const { handleText } = require("./../../helper/text");

exports.postOccupation = async (req, res) => {
  try {
    let { name } = req.body;
    if (!name || name.trim().length <= 0)
      return res.status(400).send({ err: "Name cannot be empty" });
    name = handleText(name);
    const occupationExists = await Occupation.findOne({ where: { name } });
    if (occupationExists)
      return res.status(409).send({ err: "Occupation already exists" });

    const occupation = await Occupation.create({ name });

    return res.status(201).json({ data: occupation });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.updateOccupation = async (req, res) => {
  const id = req.params.id;
  let { name } = req.body;
  if (!name || name.trim().length <= 0)
    return res.status(400).send({ err: "Name cannot be empty" });
  name = handleText(name);
  try {
    const occupation = await Occupation.findByPk(id);
    if (!occupation)
      return res.status(404).send({ err: "Occupation not found" });
    const data = await occupation.update({
      name,
    });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.deleteOccupation = async (req, res) => {
  try {
    const id = req.params.id;
    const occupation = await Occupation.findByPk(id);
    if (!occupation)
      return res.status(404).send({ err: "Occupation not found" });
    await Occupation.destroy({ where: { id } });
    return res.status(200).send({ msg: "Occupation deleted" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
