/// this was used only for references and testing purposes

const admin = require("firebase-admin");

const serviceAccount = require("../sojonewsapp-251bd-firebase-adminsdk-fvjkb-f6b611470b.json");
const fs = require("fs");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const registrationToken =
  "fFU8Y9gcTGq07q0WQQ18kg:APA91bGKcPRRouyvHM63VTmQYdC4pRUC3CGD2fibZAWLoslcAxbU2rvUvfre1RcUnUtCdz7CQ6WKuU1zN6bToIkFv6xiEZaJzBKyyrkhZPPQA0UCPAPXN9QpwNZlp5BttPYUOiTzfprW";
const topic = ["test", "test"];
// Create a list containing up to 500 registration tokens.
// These registration tokens come from the client FCM SDKs.

const message = {
  notification: {
    title: "India's Inflation Rises to 4.81%",
    body: "India's consumer price index (CPI) inflation climbed to 4.81% in June ",
  },
  android: {
    notification: {
      color: "#26b160",
      imageUrl:
        "https://res.cloudinary.com/dnp0fffl7/image/upload/v1689253608/jm4mgueoqlnef1zrrfnf.webp",
    },
  },
  // tokens: [registrationToken],
  topic: topic,
};

// Send a message to the device corresponding to the provided
// registration token.
admin
  .messaging()
  .send(message)
  .then((response) => {
    // Response is a message ID string.
    console.log("Successfully sent message:", response);
  })
  .catch((error) => {
    console.log("Error sending message:", error);
  });
