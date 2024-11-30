import express from "express";
import cors from "cors";
import StudentRouter from "./src/routers/StudentRouter.js";
import InscriptionRouter from "./src/routers/InscriptionRouter.js";
import io from "./src/tools/socket-io.js";

const app = express();


app.use(express.json());
app.use(cors());

app.use("/students", StudentRouter);
app.use("/inscription", InscriptionRouter);

io.on("connection",(socket)=>{
  console.log(' Connected socket id + ' + socket.id);
  io.emit("message", "Hello World");
  socket.on("disconnect",()=>{
    console.log('user disconnected');
  })
  socket.onAny((eventName, ...args) => {
    console.log(`Event received: ${eventName}`, args);
  });
})


app.listen(3000, () => {
  console.log("Server is running on port 3000");
});