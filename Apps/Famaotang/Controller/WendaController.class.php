<?php
namespace Famaotang\Controller;
use Think\Controller;
class WendaController extends CommController {
    //代理须知
    public function index(){
        $map['bas_unitcode']=$this->qy_unitcode;
        $Jfmobasic= M('Jfmobasic');
        $data=$Jfmobasic->where($map)->find();
        if($data){
        	$bas_profile=$data['bas_help'];
        }else{
            $bas_profile='';
        }
     
       $this->assign('bas_content', $bas_profile);
       $this->display('index');
    }


}