import express from 'express';
import resRouter from './resRouter.js';
import  rateRouter  from './rateRouter.js';
import orderRouter from './orderRouter.js';
const rootRouter = express.Router();
rootRouter.use("/like",resRouter);
rootRouter.use("/rate",rateRouter);
rootRouter.use("/order",orderRouter);


export default rootRouter;