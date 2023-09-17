const { User } = require("./../../models");
const axios = require("axios");

exports.getUsers = async (req, res) => {
  try {
    const dataold = await User.findAll({
      order: [["id", "DESC"]],
    });

    const userActivity = await axios.get(
      `https://backendv1.sojonews.com/api/v1/users/profile/getUserActivity?`
    );
    const userActivityData = userActivity.data.data;

    const data = dataold.map((user) => {
      const matchingActivity = userActivityData.find(
        (activity) => activity.userId === user.id
      );
      // console.log(matchingActivity, "heeeee", user.dataValues);
      if (matchingActivity) {
        user.dataValues.userIsActiveToday = matchingActivity.isActive;
      } else {
        user.dataValues.userIsActiveToday = false;
      }
      return user;
    });

    // for (let i = 0; i <= data.length; )
    return res.status(200).json({ data });
  } catch (err) {
    console.log(err);
    return res.status(500).send({ err });
  }
};
