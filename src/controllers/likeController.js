import sequelize from "../models/index.js";
import initModels from "../models/init-models.js";
import {errorCode,successCode} from "../configs/response.js"
const models = initModels(sequelize);
const like = async (req,res)=>{
    try{
        let {user_id, res_id} = req.body;
        let data = {user_id, res_id};
        await models.like_res.create(
            {user_id,
             res_id,
             date_like:new Date()
            }
        );
       successCode(res,data,"Like thành công");
    }
    catch{
        errorCode(res, "Lỗi Back-End")
    }
}
const deleteLike = async (req,res)=>{
    try {
        let { user_id,res_id } = req.params;
        await models.like_res.destroy(
            {
                where:{
                    user_id,
                    res_id
                }
            }
      );
      successCode(res, "Unlike thành công");  
      } catch {
        errorCode(res,"Lỗi Back-End");
      }
}

const getLikeRestaurant = async (req,res)=>{
    try{
        const {res_id} = req.params
        let data = await models.restaurant.findAll({
            include:["like_res"],
            where:{res_id}
        })
        successCode(res,data,"Lấy dữ liệu thành công")
    }
    catch{
        errorCode(res,"Lỗi Back-End")
    }
}
const getLikeUser = async (req,res)=>{
    try{
        const {user_id} = req.params
        let data = await models.user.findAll({
            include:["like_res"],
            where:{user_id}
        })
        successCode(res,data,"Lấy dữ liệu thành công")
    }
    catch{
        errorCode(res,"Lỗi Back-End")
    }
}
export  {like,getLikeRestaurant,getLikeUser,deleteLike};