if (process.env.NODE_ENV !== "production") {
  require("dotenv").config();
}

const app = require("./app");
// const { States } = require("./models");

const { initializeApp } = require("firebase-admin/app");

initializeApp();
const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});



// const create = async ()=>{

//   await States.bulkCreate([
//     {
//       "name": "All",
//       "code": "ALL"
//     },
//     {
//       "name": "Andhra Pradesh",
//       "code": "AP"
//     },
//     {
//       "name": "Arunachal Pradesh",
//       "code": "AR"
//     },
//     {
//       "name": "Assam",
//       "code": "AS"
//     },
//     {
//       "name": "Bihar",
//       "code": "BR"
//     },
//     {
//       "name": "Chhattisgarh",
//       "code": "CG"
//     },
//     {
//       "name": "Goa",
//       "code": "GA"
//     },
//     {
//       "name": "Gujarat",
//       "code": "GJ"
//     },
//     {
//       "name": "Haryana",
//       "code": "HR"
//     },
//     {
//       "name": "Himachal Pradesh",
//       "code": "HP"
//     },
//     {
//       "name": "Jharkhand",
//       "code": "JH"
//     },
//     {
//       "name": "Karnataka",
//       "code": "KA"
//     },
//     {
//       "name": "Kerala",
//       "code": "KL"
//     },
//     {
//       "name": "Madhya Pradesh",
//       "code": "MP"
//     },
//     {
//       "name": "Maharashtra",
//       "code": "MH"
//     },
//     {
//       "name": "Manipur",
//       "code": "MN"
//     },
//     {
//       "name": "Meghalaya",
//       "code": "ML"
//     },
//     {
//       "name": "Mizoram",
//       "code": "MZ"
//     },
//     {
//       "name": "Nagaland",
//       "code": "NL"
//     },
//     {
//       "name": "Odisha",
//       "code": "OD"
//     },
//     {
//       "name": "Punjab",
//       "code": "PB"
//     },
//     {
//       "name": "Rajasthan",
//       "code": "RJ"
//     },
//     {
//       "name": "Sikkim",
//       "code": "SK"
//     },
//     {
//       "name": "Tamil Nadu",
//       "code": "TN"
//     },
//     {
//       "name": "Telangana",
//       "code": "TG"
//     },
//     {
//       "name": "Tripura",
//       "code": "TR"
//     },
//     {
//       "name": "Uttar Pradesh",
//       "code": "UP"
//     },
//     {
//       "name": "Uttarakhand",
//       "code": "UK"
//     },
//     {
//       "name": "West Bengal",
//       "code": "WB"
//     }
//   ]
//   )
// }
//  create()