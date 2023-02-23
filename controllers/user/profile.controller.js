const User = require("./../../models/User.model");

exports.getProfile = async (req, res) => {
  try {
    data = await User.findById(req.user._id).populate("occupation");
    data.password = undefined;
    if (!data) return res.status(401).send({ err: "Unauthorized" });
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

// profile
exports.completeProfile = async (req, res) => {
  let { gender, occupation, ageGroup, skipPolitical, skipNSFW } = req.body;

  gender = gender && gender.trim();
  occupation = occupation && occupation.trim();

  if (!occupation)
    return res.status(400).send({ err: "Occupation is required" });

  if (!ageGroup) return res.status(400).send({ err: "Age Group is required" });

  try {
    const user = await User.findById(req.user._id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    if (user.isComplete)
      return res.status(400).send({ err: "Account already completed" });

    const data = await user.updateOne({
      gender,
      occupation,
      skipNSFW,
      skipPolitical,
      ageGroup,
      isComplete: true,
    });

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

// profile
exports.updateDetails = async (req, res) => {
  let { gender, occupation, ageGroup, skipPolitical, skipNSFW } = req.body;

  gender = gender && gender.trim();
  occupation = occupation && occupation.trim();

  if (!occupation)
    return res.status(400).send({ err: "Occupation is required" });

  if (!ageGroup) return res.status(400).send({ err: "Age Group is required" });

  try {
    const user = await User.findById(req.user._id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    const data = await user.updateOne({
      gender,
      occupation,
      skipNSFW,
      skipPolitical,
      ageGroup,
    });

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
