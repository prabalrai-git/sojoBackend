const { QueryTypes } = require("sequelize");
const { States } = require("./../models/");

exports.getAllStates = async (req, res) => {
  try {
    const data = await States.findAll({});
    return res.status(200).json({ data });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error });
  }
};

exports.getStateByPopularity = async (req, res) => {
  try {
    const data = await sequelize.query(
      "SELECT t.id, t.name, COUNT(*) AS repetition_count FROM users AS ut INNER JOIN states AS t ON ut.stateId = t.id GROUP BY t.id, t.name ORDER BY repetition_count DESC;",
      { type: QueryTypes.SELECT }
    );
    return res.status(200).json({ data });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: "Internal server error" });
  }
};
