const { DataTypes, Sequelize } = require("sequelize");
const sequelize = require("./../db/db");

const News = sequelize.define(
  "news",
  {
    title: {
      type: DataTypes.STRING,
      allowNull: false,
      trim: true,
    },
    previewText: {
      type: DataTypes.STRING,
      allowNull: false,
      trim: true,
    },
    news: {
      type: DataTypes.TEXT,
      allowNull: false,
      trim: true,
    },
    isFeatured: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    isNSFW: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    isPaid: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    sponsorURL: {
      type: DataTypes.STRING,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    publicId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    views: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
    },
    // boomarkedUserIds: {
    //   type: DataTypes.ARRAY(Sequelize.INTEGER),
    //   defaultValue: [],
    // },
    ageGroup: {
      type: DataTypes.STRING,
      allowNull: false,
      get: function () {
        return JSON.parse(this.getDataValue("ageGroup"));
      },
      set: function (value) {
        this.setDataValue("ageGroup", JSON.stringify(value));
      },
    },
    gender: {
      type: DataTypes.STRING,
      allowNull: false,
      get: function () {
        return JSON.parse(this.getDataValue("gender"));
      },
      set: function (value) {
        this.setDataValue("gender", JSON.stringify(value));
      },
    },
    states:{
      type: DataTypes.STRING,
      allowNull: false,
      get:function(){
        return JSON.parse(this.getDataValue("states"));
        
      },
      set: function (value){
        this.setDataValue("states",JSON.stringify(value))
      },
      defaultValue: JSON.stringify(29)

    },
    // isbookmarkedByUser: {
    //   type: DataTypes.VIRTUAL,
    //   get() {
    //     return async function (userId) {
    //       const bookmark = await Sequelize.models.Bookmark.findOne({
    //         where: {
    //           news_id: this.news_id,
    //           userId: userId,
    //           isActive: true,
    //         },
    //       });
    //       return bookmark !== null;
    //     };
    //   },
    // },
  },
  {
    timestamps: true,
  }
);

module.exports = News;
