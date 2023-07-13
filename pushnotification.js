
const admin = require("firebase-admin");

const serviceAccount = require("./sojonewsapp-251bd-firebase-adminsdk-fvjkb-f6b611470b.json")

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

// Create a list containing up to 500 registration tokens.
// These registration tokens come from the client FCM SDKs.
const registrationToken = 'fe4aJsKCTLemBU3L0uHgEo:APA91bHrTbnXsbUjEQaOWawddcHyOoXnq7ZxVPDkfmOIqkD1LCklnfOBT9kaB4hPTEkQv2c_W_Wi6sE6BX5yQAlcEgrSBANQ7sAZkDV3JJ_s6LU5F_6-AZXrfOE91cJSJJeIDufZJAVg';

const message = {
    data: {
      score: '850',
      time: '2:45'
    },
    tokens: [registrationToken]
  };
  
  // Send a message to the device corresponding to the provided
  // registration token.
  admin.messaging().sendMulticast(message)
    .then((response) => {
      // Response is a message ID string.
      console.log('Successfully sent message:', response);
    })
    .catch((error) => {
      console.log('Error sending message:', error);
    });