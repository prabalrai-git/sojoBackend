const User = require("./../models/User.model");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { handleText } = require("./../helper/text");

exports.login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ email });
    if (!user) return res.status(400).send({ err: "Invalid email" });
    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) return res.status(400).send({ err: "Invalid Password" });
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
      expiresIn: "1d",
    });

    const data = {
      token,
      id: user.id,
    };
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.signup = async (req, res) => {
  let { username, email, password, phone } = req.body;

  username = username && username.trim();
  phone = phone && phone.trim();

  if (!username) return res.status(400).send({ err: "Username is required" });
  if (!phone) return res.status(400).send({ err: "Phone number is required" });

  try {
    const userEmailExists = await User.findOne({ email });
    if (userEmailExists)
      return res.status(400).send({ err: "Email already registered" });

    const userUsernameExists = await User.findOne({ username });
    if (userUsernameExists)
      return res.status(400).send({ err: "Username already registered" });

    const user = new User({
      username,
      email,
      password,
      phone,
      // gender,
      // occupation,
      // getPoliticalNews,
      // getNSFWNews,
      isActive: true,
      // topics,
    });
    const data = await user.save();
    return res.status(201).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.updateDetails = async (req, res) => {
  let { gender, occupation, getPoliticalNews, getNSFWNews, topics } = req.body;
  const { id } = req.params;

  gender = gender && gender.trim();
  occupation = occupation && occupation.trim();

  if (!gender) return res.status(400).send({ err: "Gender is required" });
  if (!occupation)
    return res.status(400).send({ err: "Occupation is required" });
  if (topics.length <= 0)
    return res.status(400).send({ err: "Topics are required" });
  try {
    const user = await User.findById(id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    user.gender = gender;
    user.occupation = occupation;
    user.getPoliticalNews = getPoliticalNews;
    user.getNSFWNews = getNSFWNews;
    user.topics = topics;
    user.isComplete = true;

    const data = await user.update();

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
