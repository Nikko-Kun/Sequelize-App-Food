import sequelize from "../models/index.js";
import initModels from "../models/init-models.js";
import { errorCode, successCode } from "../configs/response.js";
const models = initModels(sequelize);
const addOrder = async (req, res) => {
  try{
    let { user_id, food_id, amount, code, arr_sub_id } = req.body;
    const arr_sub_id_string = JSON.stringify(arr_sub_id)
    await models.order.create({
        user_id,
        food_id,
        amount,
        code,
        arr_sub_id:arr_sub_id_string,
      });
    successCode(res,req.body,"Thêm Order thành công");
  }
  catch(error){
    console.error(error.message)
    errorCode(res, "Lỗi Back-End");
  }

};
export default addOrder;
