const Occupation = require("./../models/Occupation.model");

exports.getOccupations = async (req, res) => {
  try {
    const data = await Occupation.find();
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.getOccupationById = async (req, res) => {
  try {
    const id = req.params.id;
    const occupation = await Occupation.findById(id);
    if (!occupation)
      return res.status(404).send({ err: "Occupation not found" });
    return res.status(200).json({ data: occupation });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
