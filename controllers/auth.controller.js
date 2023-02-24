const { User } = require("./../models/");
const { Token } = require("./../models/");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const generateToken = require("./../helper/token");
const { sendEmail } = require("./../utils/nodemailer");

exports.login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ where: { email } });
    if (!user) return res.status(400).send({ err: "Invalid email" });
    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) return res.status(400).send({ err: "Invalid Password" });
    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
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
    const emailExists = await User.findOne({ where: { email } });
    if (emailExists && !emailExists.isActive) {
      const token = await Token.findOne({
        where: { user: emailExists.id },
      });
      if (token) {
        await Token.destroy({
          where: { user: emailExists.id },
        });
      }
      await User.destroy({ where: { id: emailExists.id } });
    }
    if (emailExists && emailExists.isActive) {
      return res.status(409).send({ err: "Email already registered" });
    }

    const user = await User.create({
      username,
      email,
      password,
      phone,
      registrationType: "email",
    });

    const token = generateToken(4);
    await sendEmail(user.email, "Verify Account", token);
    await Token.create({ userId: user.id, token });
    const data = user.toJSON();
    delete data.password;
    return res.status(201).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.postVerificationToken = async (req, res) => {
  const { token } = req.body;
  try {
    const validToken = await Token.findOne({
      where: { token },
    });

    if (!validToken) {
      return res.status(400).send({ err: "Invalid token" });
    }

    console.log(validToken);

    const user = await User.findByPk(validToken.userId);
    if (user.isActive) {
      return res
        .status(400)
        .send({ err: "Account already activated please login" });
    }

    user.isActive = true;
    await user.save();
    await validToken.destroy();

    return res.status(200).send({ msg: "Account activated" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.resendVerificationToken = async (req, res) => {
  const { email } = req.body;

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) return res.status(401).send({ err: "Email not registered" });
    if (user.isActive)
      return res
        .status(400)
        .send({ err: "Your account has already been activated" });
    const token = generateToken(4);
    await sendEmail(user.email, "Verify Account", token);

    await Token.create({
      userId: user.id,
      token,
    });
    return res.status(200).send({ msg: "Mail sent successfully" });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
