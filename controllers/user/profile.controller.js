const {
  User,
  Topic,
  Occupation,
  UserActiveStatus,
} = require("./../../models/");
const bcrypt = require("bcrypt");
const { sendEmail } = require("../../utils/nodemailer");
const { Op } = require("sequelize");

exports.getProfile = async (req, res) => {
  // return res.send({ id: req.user.id });
  try {
    const data = await User.findByPk(req.user.id, {
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
      attributes: { exclude: ["password"] },
    });
    if (!data) {
      return res.status(401).send({ err: "Unauthorized" });
    }
    return res.status(200).json({ data });
  } catch (err) {
    console.error(err);
    return res.status(500).send({ err });
  }
};

exports.skipCompleteProfile = async (req, res) => {
  try {
    const user = await User.findByPk(req.user.id);
    if (!user) {
      return res.status(404).send({ err: "User not found" });
    }
    if (!user.isActive) {
      return res.status(400).send({ err: "Account not activated" });
    }

    if (user.isComplete) {
      return res.status(400).send({ err: "Account already completed" });
    }

    await user.update({
      gender: req.body.gender ? req.body.gender : null,
      occupationId: req.body.occupation ? +req.body.occupation : null,
      stateId: req.body.state ? +req.body.state : null,
      skipNSFW: req.body.skipNSFW ? req.body.skipNSFW : false,
      skipPolitical: req.body.skipPolitical ? req.body.skipPolitical : false,
      ageGroup: req.body.ageGroup ? req.body.ageGroup : null,
      isComplete: true,
    });

    const updatedUser = await User.findByPk(req.user.id, {
      attributes: { exclude: ["password"] },
    });

    return res.status(200).json({ data: updatedUser });
  } catch (err) {
    console.error(err);
    return res.status(500).send({ err });
  }
};
exports.completeProfile = async (req, res) => {
  let { gender, occupation, ageGroup, skipPolitical, skipNSFW, state } =
    req.body;
  gender = gender && gender.trim();
  // occupation = occupation && occupation.trim();

  if (!occupation) {
    return res.status(400).send({ err: "Occupation is required" });
  }
  if (!state) {
    return res.status(400).send({ err: "State is required" });
  }

  if (!ageGroup) {
    return res.status(400).send({ err: "Age Group is required" });
  }

  if (!occupation) {
    return res.status(400).send({ err: "Occupation is required" });
  }
  if (!state) {
    return res.status(400).send({ err: "State is required" });
  }

  if (!ageGroup) {
    return res.status(400).send({ err: "Age Group is required" });
  }

  try {
    const user = await User.findByPk(req.user.id);
    if (!user) {
      return res.status(404).send({ err: "User not found" });
    }
    if (!user.isActive) {
      return res.status(400).send({ err: "Account not activated" });
    }

    if (user.isComplete) {
      return res.status(400).send({ err: "Account already completed" });
    }

    await user.update({
      gender,
      occupationId: +occupation,
      stateId: +state,
      skipNSFW,
      skipPolitical,
      ageGroup,
      isComplete: true,
    });

    const updatedUser = await User.findByPk(req.user.id, {
      attributes: { exclude: ["password"] },
    });

    return res.status(200).json({ data: updatedUser });
  } catch (err) {
    console.error(err);
    return res.status(500).send({ err });
  }
};

// update profile details
exports.updateDetails = async (req, res) => {
  let { gender, occupation, ageGroup, skipPolitical, skipNSFW, state } =
    req.body;

  gender = gender && gender.trim();

  if (!occupation)
    return res.status(400).send({ err: "Occupation is required" });

  if (!ageGroup) return res.status(400).send({ err: "Age Group is required" });

  try {
    const user = await User.findByPk(req.user.id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    const data = await user.update({
      gender,
      occupationId: +occupation,
      stateId: +state,
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

// update personal information
exports.updatePersonalInformation = async (req, res) => {
  let { email, phone } = req.body;

  email = email && email.trim();
  phone = phone && phone.trim();

  if (!email) return res.status(400).send({ err: "Email is required" });

  // if (!phone) return res.status(400).send({ err: "Phone number is required" });

  try {
    const user = await User.findByPk(req.user.id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    // const data = await user.update({
    //   email,
    //   phone,
    // });

    const data = { email, phone };

    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

// update topics
exports.updateTopics = async (req, res) => {
  let { topics } = req.body;
  if (!topics || topics.length <= 0)
    return res.status(400).send({ err: "Please select at least one topic" });

  try {
    const user = await User.findByPk(req.user.id);
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    await user.setTopics([]);
    await user.addTopics(topics);

    const data = await user.save();
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

// Update user password
exports.updatePassword = async (req, res) => {
  const { newPassword, confirmPassword } = req.body;

  if (!newPassword || newPassword.trim().length <= 0)
    return res.status(400).send({ err: "Password cannot be empty" });

  // Check if the new password and confirm password match
  if (newPassword !== confirmPassword) {
    return res.status(400).send({ err: "Passwords do not match" });
  }

  if (newPassword.length <= 5)
    return res.status(400).send({ err: "Password too short" });

  try {
    // Find the user by id
    const user = await User.findByPk(req.user.id);

    if (!user) return res.status(404).send({ err: "User not found" });

    const password = bcrypt.hashSync(newPassword, 10);
    // Update the user's password
    await user.update({
      password,
    });

    return res.status(200).json({ msg: "Password updated successfully" });
  } catch (err) {
    console.error(err);
    res.status(500).json({ err: "Server error" });
  }
};

exports.addTopic = async (req, res) => {
  let { id } = req.params;
  if (!id) return res.status(400).send({ err: "Topic is required" });

  try {
    const user = await User.findByPk(req.user.id, {
      include: ["topics"],
    });
    if (!user) return res.status(404).send({ err: "User not found" });
    if (!user.isActive)
      return res.status(400).send({ err: "Account not activated" });

    const topic = await Topic.findByPk(id);
    if (!topic) return res.status(404).send({ err: "Topic doesn't exist" });

    let topicExists = false;
    user.topics.forEach((topic) => {
      if (topic.id === Number(id)) {
        topicExists = true;
      }
    });
    if (topicExists) {
      console.log("tryng to remove the topic, id asdasd");
      await user.removeTopic(id);
    } else {
      await user.addTopic(topic);
    }

    const data = await user.save();
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};

exports.deactivateAccount = async (req, res) => {
  try {
    const response = await User.destroy({ where: { id: req.user.id } });
    res.status(200).json({ successMsg: true, response });
  } catch (error) {
    console.log("Error", error);
    res.status(500).json({ successMsg: false, Msg: "Internal serever error" });
  }
};

exports.addUserActivity = async (req, res) => {
  try {
    const data = await UserActiveStatus.create({
      userId: req.user.id,
      isActive: true,
    });

    return res.status(200).json({ data, success: true });
  } catch (error) {
    console.log(error);
    return res.status(500).send({ error });
  }
};

exports.getUserActivity = async (req, res) => {
  const { userId, date, startDate, endDate } = req.query;

  try {
    if (date) {
      const data = await UserActiveStatus.findAll({
        where: {
          userId: userId,
          date: date,
        },
      });
      return res.status(200).json({ data, date });
    }
    if (!userId && !startDate && !endDate) {
      const today = new Date();
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, "0"); // Month is 0-based, so we add 1 and pad with leading zero if needed
      const day = String(today.getDate()).padStart(2, "0");
      const formattedDate = `${year}-${month}-${day}`;
      const data = await UserActiveStatus.findAll({
        where: {
          date: formattedDate,
        },
      });
      return res.status(200).json({ data });
    }

    if (startDate && endDate) {
      const data = await UserActiveStatus.findAll({
        where: {
          date: {
            [Op.between]: [startDate, endDate],
          },
        },
        include: [{ model: User }],
      });
      return res.status(200).json({ data, startDate, endDate });
    }
    const data = await UserActiveStatus.findAll({
      where: {
        userId: userId,
      },
    });
    return res.status(200).json({ data });
  } catch (error) {
    console.log(error);
    return res.status(500).send({ error });
  }
};
