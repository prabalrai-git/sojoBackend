if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const app = require("./app");
const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
  require("./db/db"), console.log(`Listening on port ${PORT}`);
});
