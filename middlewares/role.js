exports.isAdmin = (req, res, next) => {
  if (req.user.role === "admin") {
    next();
  } else {
    return res.status(401).send({ msg: "Not authorized" });
  }
};

exports.isUser = (req, res, next) => {
  console.log(req.user);
  if (req.user.role === "user" || req.user.role === "admin") {
    next();
  } else {
    return res.status(401).send({ msg: "Not authorized" });
  }
};
