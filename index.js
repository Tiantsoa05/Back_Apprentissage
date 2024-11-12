import express from "express";
import cors from "cors";
import StudentRouter from "./src/routers/StudentRouter.js";
import InscriptionRouter from "./src/routers/InscriptionRouter.js";

const app = express();

app.use(express.json());
app.use(cors());

app.use("/students", StudentRouter);
app.use("/inscription", InscriptionRouter);

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});