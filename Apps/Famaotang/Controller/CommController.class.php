<?php
namespace Famaotang\Controller;
use Think\Controller;
     
    class CommController extends Controller
    {
        protected $qy_unitcode;
        protected $qy_fwkey;
        protected $qy_fwsecret;
        protected $dltj_arrs; //有效推荐人列表
        protected $dllower_arrs; //有效下级代理列表

        public function _initialize()
        {
           
            $this->qy_unitcode = is_not_null(C('QY_UNITCODE')) ? trim(C('QY_UNITCODE')):'';
            $this->qy_fwkey = is_not_null(C('QY_FWKEY')) ? trim(C('QY_FWKEY')):'';
            $this->qy_fwsecret = is_not_null(C('QY_FWSECRET')) ? trim(C('QY_FWSECRET')):'';

            if($this->qy_unitcode=='' || $this->qy_fwkey=='' || $this->qy_fwsecret==''){
                echo 'error:No record';
                exit;
            }

        }
        //判断登录 消费用户 使用用户账号
        public function is_user_login(){
            $user_check=cookie('user_check');
            $user_name=session('user_name');
            $user_time=session('user_time');
            $user_id=session('user_id');
            $user_unitcode=session('user_unitcode');


            if($user_check=='' || $user_name=='' || $user_time=='' || $user_id=='' || $user_unitcode==''){
                return false;
            }else{
                if($user_unitcode==$this->qy_unitcode){
                    if($user_check==MD5($user_name.$user_time).MD5($user_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
	
	    //判断微信登录 消费用户 微信
        public function is_user_wxlogin(){
            $user_check=cookie('user_check');
            $user_name=session('user_name');
            $user_time=session('user_time');
            $user_id=session('user_id');
            $user_unitcode=session('user_unitcode');
			$user_openid=session('user_openid');

            if($user_check=='' || $user_name=='' || $user_time=='' || $user_id=='' || $user_unitcode==''|| $user_openid==''){
                return false;
            }else{
                if($user_unitcode==$this->qy_unitcode){
                    if($user_check==MD5($user_openid.$user_time).MD5($user_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//判断登录 经销商 用户名登录  
        public function is_jxuser_login(){
            $jxuser_check=cookie('jxuser_check');
            $jxuser_time=session('jxuser_time');
            $jxuser_id=session('jxuser_id');
            $jxuser_unitcode=session('jxuser_unitcode');

            
            if($jxuser_check=='' || $jxuser_time=='' || $jxuser_id=='' || $jxuser_unitcode==''){
                return false;
            }else{
                if($jxuser_unitcode==$this->qy_unitcode){
                    if($jxuser_check==MD5($jxuser_id.$jxuser_time).MD5($jxuser_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//判断微信登录 经销商 微信
        public function is_jxuser_wxlogin(){
            $jxuser_check=cookie('jxuser_check');
            $jxuser_time=session('jxuser_time');
            $jxuser_id=session('jxuser_id');
            $jxuser_unitcode=session('jxuser_unitcode');
			$jxuser_openid=session('jxuser_openid');
            
			
            if($jxuser_check=='' || $jxuser_time=='' || $jxuser_id=='' || $jxuser_unitcode==''|| $jxuser_openid==''){
                return false;
            }else{
                if($jxuser_unitcode==$this->qy_unitcode){
                    if($jxuser_check==MD5($jxuser_openid.$jxuser_time).MD5($jxuser_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//返回上家ID 根据申请的级别和推荐人的上家 $jxid-推荐人的上家  $apply_level-申请级别 
		public function get_dlbelong($jxid,$apply_level){
			$Dltype = M('Dltype');
			$Dealer = M('Dealer');
			//上家信息-1
			$map=array();
			$data=array();
			$map['dl_id']=intval($jxid);
			$map['dl_unitcode']=$this->qy_unitcode;
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_status']==1){
					//上家的级别-1
					$map2=array();
					$data2=array();
					$map2['dlt_id']=$data['dl_type'];
					$map2['dlt_unitcode']=$this->qy_unitcode;
					$data2=$Dltype->where($map2)->find();
					if($data2){
						if($apply_level<=$data2['dlt_level']){  //如果申请的级别高于 或 同级 
						    if($data['dl_belong']>0){
							    return $this->get_dlbelong($data['dl_belong'],$apply_level);
							}else{
								return 0;
							}
						}else{
							return $data['dl_id'];
						}
					}else{
						return false;
					}
				}else{  //上家的上家
					if($data['dl_belong']>0){
						return $this->get_dlbelong($data['dl_belong'],$apply_level);
					}else{
						return 0;
					}
				}
			}else{
				return false;
			}
		}
		

        //递归返回推荐人数组 $dlid--代理id
        public function get_dltjarray($dlid){
            $Dealer = M('Dealer');
            //
            $map=array();
            $data=array();
            $map['dl_id']=intval($dlid);
            $map['dl_unitcode']=session('unitcode');
            $data=$Dealer->where($map)->find();
            if($data){
                if($data['dl_referee']>0){
                    $map2=array();
                    $data2=array();
                    $map2['dl_id'] = $data['dl_referee'];
                    $map2['dl_unitcode']=session('unitcode');
                    $data2 = $Dealer->where($map2)->find();
                    if($data2){
                        if ($data2['dl_status']==1)
                        { 
                            $this->dltj_arrs[]=array('id'=>$data2['dl_id'],'name'=>$data2['dl_name'],'level'=>$data2['dl_level']);
                            if($data2['dl_referee']!=$data['dl_id']){
                                $this->get_dltjarray($data2['dl_id']);  
                            }
                        }
                    }
                }
                // else
                // {
                //  $this->dltj_arrs[]=array('id'=>'0','name'=>'总公司','level'=>'0');
                // }
            }
        }

         //递归返回下级所有代理数组 $dlid--代理id
        public function get_dllowerarray($dlid){
            $Dealer = M('Dealer');
            $map=array();
            $data=array();
            $map['dl_belong']=intval($dlid);
            $map['dl_unitcode']=$this->qy_unitcode;
            $data=$Dealer->where($map)->field('dl_id,dl_name,dl_level,dl_status,dl_type')->select();
            if ($data){
                foreach ($data as $k => $v) {
                   if ($v['dl_status']==1)
                   {   
                        $this->dllower_arrs[]=array('id'=>$v['dl_id'],'name'=>$v['dl_name'],'level'=>$v['dl_level'],'typeid'=>$v['dl_type']);                            
                        $this->get_dllowerarray($v['dl_id']);
                   }
                } 
            }
        }


        //库存查询
        /*@probean  产品信息
          @dl_id    代理id
         */
        public function mystock($probean,$dl_id){
            //--------------------------------
            $Model=M();
            //库存订货总量  有效订货（订单状态 已发货 已完成）
            $map4=array();
            $map4['a.od_unitcode'] =$this->qy_unitcode;
            $map4['a.od_state'] = array('in', '3,8');  //完成的订单 
            if ($dl_id>0)
            {
                $map4['a.od_oddlid'] =$dl_id; //下单代理session('jxuser_id')
                $map4['a.od_id'] = array('exp','=b.oddt_odid');
                $map4['a.od_virtualstock']=1; //0--非虚拟库存订单 1--虚拟库存订单
            }
            if ($probean)
            {
                $map4['b.oddt_proid']=$probean['sc_proid'];
                // $map4['b.oddt_attrid']=$probean['sc_attrid'];
            }
            $list4 = $Model->table('fw_orders a,fw_orderdetail b')->where($map4)->order('a.od_addtime DESC')->select();
            $oddt_totalqty = 0; //虚拟订货总量
            foreach($list4 as $kk=>$vv){
                //订购数量
                $oddt_unitsqty=0; //每单位包装的数量
                if($vv['oddt_prodbiao']>0){
                    $oddt_unitsqty=$vv['oddt_prodbiao'];
                    
                    if($vv['oddt_prozbiao']>0){
                        $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
                    }
                    
                    if($vv['oddt_proxbiao']>0){
                        $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
                    }
                    
                    $oddt_totalqty += $oddt_unitsqty*$vv['oddt_qty'];
                }else{
                    $oddt_totalqty += $vv['oddt_qty'];
                }
            }

            // var_dump($dl_id);
            // var_dump($oddt_totalqty);
            //下级代理订货总量(包括有效的和未处理的)
            $map4=array();
            $map4['a.od_unitcode'] =$this->qy_unitcode;
            $map4['a.od_state'] = array('in', '0,1,2,3,8');  //完成的订单 
            if ($dl_id>0)
            {
                $map4['a.od_rcdlid'] = $dl_id; //下单代理session('jxuser_id')
                $map4['a.od_id'] = array('exp','=b.oddt_odid');
                $map4['a.od_virtualstock']=1; //0--非虚拟库存订单 1--虚拟库存订单
            }
            if ($probean)
            {
                $map4['b.oddt_proid']=$probean['sc_proid'];
                // $map4['b.oddt_attrid']=$probean['sc_attrid'];
            }
            $list4 = $Model->table('fw_orders a,fw_orderdetail b')->where($map4)->order('a.od_addtime DESC')->select();
            
            $virtualshipoddt_totalqty = 0; //下订货总量
            foreach($list4 as $kk=>$vv){
                //订购数量
                $oddt_unitsqty=0; //每单位包装的数量
                if($vv['oddt_prodbiao']>0){
                    $oddt_unitsqty=$vv['oddt_prodbiao'];
                    
                    if($vv['oddt_prozbiao']>0){
                        $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
                    }
                    
                    if($vv['oddt_proxbiao']>0){
                        $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
                    }
                    
                    $virtualshipoddt_totalqty += $oddt_unitsqty*$vv['oddt_qty'];
                }else{
                    $virtualshipoddt_totalqty += $vv['oddt_qty'];
                }
            } 
         
            //实际发货总量(包括有效的和未处理的)
            $map4=array();
            $map4['a.od_unitcode'] = $this->qy_unitcode;
            $map4['a.od_state'] = array('in', '0,1,2,3,8');  //完成的订单
            if ($dl_id>0) 
            {
                $map4['a.od_oddlid'] =$dl_id; //下单代理session('jxuser_id')
                $map4['a.od_id'] = array('exp','=b.oddt_odid');
                $map4['a.od_virtualstock']=0; //0--非虚拟库存订单 1--虚拟库存订单
            }
            if ($probean)
            {
                $map4['b.oddt_proid']=$probean['sc_proid'];
                // $map4['b.oddt_attrid']=$probean['sc_attrid'];
            }

            $list4 = $Model->table('fw_orders a,fw_orderdetail b')->where($map4)->order('a.od_addtime DESC')->select();
            $shipoddt_totalqty = 0; //实际发货总量
            foreach($list4 as $kk=>$vv){
                    //订购数量
                    $oddt_unitsqty=0; //每单位包装的数量
                    if($vv['oddt_prodbiao']>0){
                        $oddt_unitsqty=$vv['oddt_prodbiao'];
                        
                        if($vv['oddt_prozbiao']>0){
                            $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
                        }
                        
                        if($vv['oddt_proxbiao']>0){
                            $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
                        }
                        
                        $shipoddt_totalqty += $oddt_unitsqty*$vv['oddt_qty'];
                    }else{
                        $shipoddt_totalqty += $vv['oddt_qty'];
                    }

            }
            //剩余库存
            $surplusqty=$oddt_totalqty-$virtualshipoddt_totalqty-$shipoddt_totalqty;
            if (intval($surplusqty)<0)
            $surplusqty=0;
            return intval($surplusqty);
        }
    		
        public function _empty()
        {
          header('HTTP/1.0 404 Not Found');
          echo'error:404';
          exit;
        }
}