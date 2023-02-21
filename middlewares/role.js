exports.isAdmin = (req, res, next) => {
  console.log(req.user.role);
  if (req.user.role === "admin") {
    next();
  } else {
    return res.status(401).send({ msg: "Not authorized" });
  }
};
