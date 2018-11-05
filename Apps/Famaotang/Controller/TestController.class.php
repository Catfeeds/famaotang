<?php
namespace Famaotang\Controller;
use Think\Controller;
class TestController extends CommController {
    //公司简介
    public function index(){
//        $map['dl_id']=1;
       $a=M('Dealer')->where(['dl_id'=>4])->find();
       dump($a) ;
    }


}