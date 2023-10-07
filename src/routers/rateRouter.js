import express from "express";
import { addRate, getRateRestaurant, getRateUser } from "../controllers/rateController.js";
const rateRouter = express.Router();
rateRouter.get("/res/:res_id",getRateRestaurant)
rateRouter.get("/user/:user_id",getRateUser)
rateRouter.post("",addRate);




export  default rateRouter;