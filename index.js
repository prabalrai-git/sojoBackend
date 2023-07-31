if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const app = require("./app");

const admin = require("firebase-admin");

const serviceAccount = require("./sojonewsapp-251bd-firebase-adminsdk-fvjkb-f6b611470b.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const PORT = process.env.PORT || 9000;

app.get("/", (req, res) => {
  res.status(200).send(`<h1>Sojo news</h1>`);
});
app.get("/api/v1", (req, res) => {
  res.status(200).send(`<h1>Sojo news</h1>`);
});
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
