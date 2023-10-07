import express from "express";
import { deleteLike, getLikeRestaurant, getLikeUser, like } from "../controllers/likeController.js";
const resRouter = express.Router();
resRouter.post("",like);
resRouter.get("/res/:res_id",getLikeRestaurant)
resRouter.get("/user/:user_id", getLikeUser)
resRouter.delete("/xu-ly-unlike/:user_id/:res_id",deleteLike);
export default resRouter;