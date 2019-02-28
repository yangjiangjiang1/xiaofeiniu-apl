const express = require('express')
const pool = require('../../pool')
var router = express.Router();
module.exports = router;



router.get('/',(req,res)=>{
    pool.query('select * from xfn_settings limit 1',(err,result)=>{
     if(err) throw err
     res.send(result[0]); 
    })
})

//修改全局信息

router.put('/',(req,res)=>{
    pool.query('update xfn_settings set ?',req.body,(err,result)=>{
     if(err) throw err
     res.send({code:200, msg:'settings updated succ'}); 
    })
})