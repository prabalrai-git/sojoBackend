if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const app = require("./app");

const admin = require("firebase-admin");

const serviceAccount = require("./sojonewsapp-251bd-firebase-adminsdk-fvjkb-f6b611470b.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
