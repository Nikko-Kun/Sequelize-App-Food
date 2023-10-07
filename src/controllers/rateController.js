import sequelize from "../models/index.js";
import initModels from "../models/init-models.js";
import {errorCode,successCode} from "../configs/response.js"
const models = initModels(sequelize);
const addRate = async (req,res)=>{
    try{
        const {user_id,res_id, amount} = req.body;
        let data = {user_id,res_id,amount};
        await models.rate_res.create({
            user_id,res_id,amount,date_rate:new Date()
        })
        successCode(res, data, "Thêm đánh giá thành công")
    }
    catch{
        errorCode(res, "Lỗi Back-End");
    }
}
const getRateRestaurant = async (req,res)=>{
    try{
        const {res_id} = req.params
        let data = await models.restaurant.findAll({
            include:["rate_res"],
            where:{res_id}
        })
        successCode(res,data,"Lấy dữ liệu thành công")
    }
    catch{
        errorCode(res,"Lỗi Back-End")
    }
}
const getRateUser = async (req,res)=>{
    try{
        const {user_id} = req.params
        let data = await models.user.findAll({
            include:["res_id_restaurant_rate_res"],
            where:{user_id}
        })
        successCode(res,data,"Lấy dữ liệu thành công")
    }
    catch{
        errorCode(res,"Lỗi Back-End")
    }
}
export {getRateRestaurant,getRateUser,addRate};