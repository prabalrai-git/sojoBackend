const {States} = require("./../models/");


exports.getAllStates = async (req,res)=>{
    try {
        const data = await States.findAll({});
        return res.status(200).json({ data });

    } catch (error) {
        console.log(error);
        return res.status(500).json({error})
    }
}