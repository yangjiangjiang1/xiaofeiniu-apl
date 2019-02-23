/*菜品类别相关路由*/
//创建路由器
const express = require("express");
const pool = require("../../pool");
var router = express.Router();
module.exports = router;

router.get('/', (req, res) => {
    pool.query('SELECT * FROM xfn_category ORDER BY cid', (err, result) => {
      if (err) throw err;
      var jsonData = JSON.stringify(result);
      res.send('doData(' + jsonData + ')');
    })
  })



router.delete('/:cid',(req,res)=>{
    pool.query("update xfn_dish set categoryId=null where categoryId=?",req.params.cid,(err,result)=>{
        if(err) throw err;
    })
    pool.query("delete from xfn_category where cid=?",req.params.cid,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:200, msg: '1 category deleted'})
        }else{
            res.send({code:400, msg: '0 category deleted'})
        }
    })
})



router.post('/',(req,res)=>{
    var data = req.body;
    pool.query("insert into xfn_category set ?", data,(err,result)=>{
        if(err) throw err
        res.send({code: 200, msg: '1 category added'})
    })
   
})


router.put('/',(req,res)=>{
    var data = req.body;
    pool.query("update xfn_category set ? where cod=?,"[data,data.cid],(err,result)=>{
        if(err) throw err
        if(result.changedRows>0){  //实际修改了一行
            res.send({code:200, msg: '1 category modified'})
          }else if(result.affectedRows==0){  //影响到0行
            res.send({code:400, msg:'category not exits'})
          }else if(result.affectedRows==1 && result.changedRows==0){ //影响到1行，但修改了0行——新值与旧值完全一样
            res.send({code:401, msg:'no category modified'})
          }
    })
})