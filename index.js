/*
小肥牛扫码点餐项目API子系统
*/ 
console.log(new Date().toLocaleString());
console.log("准备启动API服务器....")

const port = 8090;
const express = require("express");
const categoryRouter = require('./routes/admin/category')
const adminRouter = require('./routes/admin/admin')
const dishRouter = require('./routes/admin/dish');
const cors = require('cors')
const bodyParser = require("body-parser")
var app = express();
app.listen(port,()=>{
    console.log("Sereve Listening:"+port);
});
app.use(cors());
app.use(bodyParser.json())
app.use('/admin/category',categoryRouter);
app.use('/admin/dish', dishRouter);
app.use('/admin',adminRouter);