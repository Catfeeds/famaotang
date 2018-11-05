<?php
namespace Zxapi\Controller;
use Think\Controller;
/*订单管理 app 接口   Comm */
class OrderController extends CommController {
	
	//获取待发货， 待确认的订单数
	public function getnum(){

		$map = array();
		$num = array('login'=>'1','stat'=>'1');
		$Orders = M('Orders');

		$map=array();
		$map['od_unitcode']= $this->qycode;
		$map['od_rcdlid']= 0;

		//待确认订单数
		$map['od_state']=0;
		$num['confirm'] = $Orders->where($map)->count();

		//待发货的订单数
		$map['od_state']=1;
		$num['already'] = $Orders->where($map)->count();
		
		//部分发货的订单数
		$map['od_state']=2;
		$num['part'] = $Orders->where($map)->count();
		echo json_encode($num);
	}


	/**
	 * 订单列表
	 */
	public function getOrderList(){
     	$od_state = intval(trim(I('post.od_state', 0)));
		$maxid=intval(I('post.maxid',0));
		$minid=intval(I('post.minid',0));
		
		//分页
		$Orders = M('Orders');
		$map=array();
		if($maxid==0 && $minid==0){
			
		}else if($maxid>0){
			$map['od_id']=array('GT',$maxid);
		}else if($minid>0){
			$map['od_id']=array('LT',$minid);
		}

		$map['od_unitcode']=$this->qycode;
		
		$map['od_state']=$od_state;
		
		$map['od_rcdlid'] = 0;

		$list = $Orders->where($map)->order('od_id DESC')->limit(20)->select();
		
		
		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Dealer = M('Dealer');
		$Shipment = M('Shipment');

		$imgpath = BASE_PATH.'/Public/uploads/product/';
        foreach($list as $k=>$v){
			//订单详细
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$this->qycode;
			$map2['oddt_odid']=$v['od_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品信息
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$this->qycode;
				$data3=$Product->where($map3)->find();
				if($data3){
					if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
						$data2[$kk]['oddt_propic']=$data3['pro_pic'];  //商品图
					}else{
						$data2[$kk]['oddt_propic']='';
					}
				}else{
					$data2[$kk]['oddt_propic']='';
				}
				
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($vv['oddt_prodbiao']>0){
					$oddt_unitsqty=$vv['oddt_prodbiao'];
					
					if($vv['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
					}
					
					if($vv['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
				}else{
					$oddt_totalqty=$vv['oddt_qty'];
				}
				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$this->qycode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_oddtid']=$vv['oddt_id'];
				$map3['ship_dealer']=$v['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
					}
				}else{
					$data2[$kk]['oddt_shipqty']=0;
					$data3=0;
				}

				

				//发货记录
				if(($v['od_state']==1 || $v['od_state']==2 || $v['od_state']==3) && $data3!=0 ){
					$data2[$kk]['part_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary shipment-button part-shipment" orderId="'.$v['od_id'].'"  odblId="'.$v['od_id'].'" odState="'.$od_state.'" oddtId="'.$vv['oddt_id'].'">发货记录</button>';
				}else{
					$data2[$kk]['part_shipment'] = '';
				}

				
				//出货按钮
				if($v['od_state']==1 || $v['od_state']==2 || $v['od_state']==3){
					if($oddt_totalqty>0){
						if($oddt_totalqty>$data3){
							$data2[$kk]['oddt_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary botton-right fh" orderId="'.$v['od_id'].'" odblId="'.$v['od_id'].'" oddtId="'.$vv['oddt_id'].'" oddt_proid="'.$vv['oddt_proid'].'" oddt_attrid="'.$vv['oddt_attrid'].'">出　货</button>'; 
							// od_id='.$v['od_id'].'&odbl_id='.$v['od_id'].'&oddt_id='.$vv['oddt_id'].''
						}else{
							$data2[$kk]['oddt_shipment']='';
						}
					}else{
						if($vv['oddt_qty']>$data3){
							$data2[$kk]['oddt_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary botton-right fh" orderId="'.$v['od_id'].'" odblId="'.$v['od_id'].'" oddtId="'.$vv['oddt_id'].'" oddt_proid="'.$vv['oddt_proid'].'" oddt_attrid="'.$vv['oddt_attrid'].'">出　货</button>';
						}else{
							$data2[$kk]['oddt_shipment']='';
						}
					}
				}else{
					$data2[$kk]['oddt_shipment']='';
				}
				
			}

			$list[$k]['orderdetail']=$data2;
			
			//下单时间
			$list[$k]['od_addtime'] = date('Y-m-d', $list[$k]['od_addtime']);
			
			//下单代理信息
			$map3=array();
			$data3=array();
			$map3['dl_id']=$v['od_oddlid'];
			$map3['dl_unitcode']=$this->qycode;
			$data3=$Dealer->where($map3)->find();
			if($data3){
				$list[$k]['od_dl_name']=$data3['dl_name'];
				$list[$k]['od_dl_tel']=$data3['dl_tel'];
			}else{
				$list[$k]['od_dl_name']='';
				$list[$k]['od_dl_tel']='';
			}
			 
			//允许操作
			$caozuostr='<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style order-details" orderId="'.$v['od_id'].'"  odblId="'.$v['od_id'].'"  odState="'.$od_state.'" >订单详情</button>';
			
			//取消订单
			if($v['od_state']==0 || $v['od_state']==1 ){
				$caozuostr.= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style order-cancel" orderId="'.$v['od_id'].'"  odblId="'.$v['od_id'].'" odState="'.$od_state.'" >取消订单</button>';
			}
		    //确认订单
 			if($v['od_state']==0){
				$caozuostr.='<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style order-confirm" orderId="'.$v['od_id'].'"  odblId="'.$v['od_id'].'" odState="'.$od_state.'" >确认订单</button>';
			}
			//完成发货
			if($v['od_state']==1 || $v['od_state']==2){
				$caozuostr.= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style finishship" orderId="'.$v['od_id'].'"  odblId="'.$v['od_id'].'" odState="'.$od_state.'" >完成发货</button>';
			}
			
			
			$list[$k]['caozuostr']=$caozuostr;	
		}

		if($maxid==0 && $minid==0 && count($list)>0){
			reset($list);
			$maxid = current($list)['od_id'];
			$minid = end($list)['od_id'];
		}else if($maxid>0){
			if(count($list)>0){
				reset($list);
				$maxid = current($list)['od_id'];
				$minid=0;
			}else{
				$maxid=0;
				$minid=0;
			}
		}else if($minid>0){
			if(count($list)>0){
				reset($list);
				$maxid=0;
				$minid = end($list)['od_id'];
			}else{
				$maxid=0;
				$minid=0;
			}
		}else{
			$maxid=0;
			$minid=0;
		}
		
		$msg =  array('login'=>'1','stat'=>'1','list'=>$list,'maxid'=>$maxid,'minid'=>$minid, 'od_state'=> $od_state);
		echo json_encode($msg);

	}


	/**
	 * 取消、确认下家订单
	 */
	
	public function canceldlorder(){
		$odbl_id=intval(I('post.odbl_id',0));
		$od_id=intval(I('post.od_id',0));
		$state=intval(I('post.state',0));
		$od_state=intval(I('post.od_state',0));

		$msg = array('login'=>'1','stat'=>'1', 'msg'=>'', 'ok'=>0);

		if($state==1){
			$state=1;
			$odlg_action='确认订单';
		}else if($state==9){
			$state=9;
			$odlg_action='取消订单';
		}else{
			
			$msg['stat'] = 0;
			$msg['msg'] = '无该操作权限';
			$msg['ok'] = 0;
			echo json_encode($msg);
			exit;
		}
		

		$Orders= M('Orders');
		$Orderlogs= M('Orderlogs');
		$Shipment= M('Shipment');
		
		if($od_id>0){
			//修改订单关系表状态

			$map=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$data = $Orders->where($map)->find();
			if($data){
				//只有待确认、待发货的订单才能取消 确认
				if($data['od_state']==0 || $data['od_state']==1){
					//是否有出货记录 如有则不能取消
                    $map3=array();
					$data3=array();
					$map3['ship_unitcode']=$this->qycode;
					$map3['ship_odid']=$od_id;
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->find();
					if($data3){
						$msg['stat'] = 0;
						$msg['msg'] = '该订单已有出货记录，不能取消';
						$msg['ok'] = 0;
						echo json_encode($msg);
						exit;
					}
					
					//修改原始订单状态

						$map2=array();
						$updata2=array();
						$map2['od_unitcode']=$this->qycode;
						$map2['od_id']=$od_id;
						$updata2['od_state']=$state;
						$Orders->where($map2)->save($updata2);

					
					 //取消下家订单
					if($state==9){
						//预付款 余额 设 无效
						$Yufukuan= M('Yufukuan');
						$Balance= M('Balance');
						
						//取消返利
						$map2=array();
						$updata2=array();
						$map2['yfk_unitcode']=$this->qycode;
						$map2['yfk_type']=2;
						$map2['yfk_oddlid']=$data['od_oddlid'];
						$map2['yfk_odid']=$od_id;
						$updata2['yfk_state']=0;
						$Yufukuan->where($map2)->save($updata2);
						
						//取消订单款项
						$map2=array();
						$updata2=array();
						$map2['bl_unitcode']=$this->qycode;
						$map2['bl_type']=2;
						$map2['bl_sendid']=$data['od_oddlid'];
						$map2['bl_odid']=$od_id;
						$updata2['bl_state']=0;
						$Balance->where($map2)->save($updata2);

						//预付款 余额 设 无效 end
					}
					
					//订单操作日志 begin
					$odlog_arr=array(
								'odlg_unitcode'=>$this->qycode,  
								'odlg_odid'=>$od_id,
								'odlg_orderid'=>$data['od_orderid'],
								'odlg_dlid' => $this->subuserid,
								'odlg_dlusername' => $this->subusername, 
								'odlg_dlname'=> $this->subusername,
								'odlg_action'=>$odlg_action,
								'odlg_type'=>0, //0-企业 1-经销商
								'odlg_addtime'=>time(),
								'odlg_ip'=>real_ip(),
								'odlg_link'=>__SELF__
								);
					$Orderlogs = M('Orderlogs');
					$rs3=$Orderlogs->create($odlog_arr,1);
					if($rs3){
						$Orderlogs->add();
					}
					//订单操作日志 end
					
					$msg['msg'] = '操作成功';
					$msg['ok'] = 1;
					echo json_encode($msg);
					exit;
				}else{
					$msg['stat'] = 0;
					$msg['msg'] = '该订单已处理，不能取消';
					$msg['ok'] = 0;
				    echo json_encode($msg);
					exit;
				}
			}else{
				$msg['stat'] = 0;
				$msg['msg'] = '没有该记录';
				$msg['ok'] = 0;
				echo json_encode($msg);
				exit;
			}
			
		}else{
			$msg['stat'] = 0;
			$msg['msg'] = '没有该记录';
			$msg['ok'] = 0;
			echo json_encode($msg);
			exit;
		}



	}


	/**
	 * 订单详情
	 */
	public function dlorderdetail(){

		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));
		$od_state=intval(I('post.od_state',0));

		$msg = array('login'=>'1','stat'=>'1','msg'=>'');
		
		if($od_id>0){
			$Orders= M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=0;
			$data = $Orders->where($map)->find();
			if($data){
				//订单产品详细
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment= M('Shipment');
				$Dealer= M('Dealer');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$this->qycode;
				$map2['oddt_odid']=$data['od_id'];
				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$imgpath = BASE_PATH.'/Public/uploads/product/';
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$this->qycode;
					$data3=$Product->where($map3)->find();
					if($data3){
						if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
							$data2[$kk]['oddt_propic']=$data3['pro_pic'];
						}else{
							$data2[$kk]['oddt_propic']='';
						}
					}else{
						$data2[$kk]['oddt_propic']='';
					}
					
					//订购数 发货数
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($vv['oddt_prodbiao']>0){
						$oddt_unitsqty=$vv['oddt_prodbiao'];
						
						if($vv['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
						}
						
						if($vv['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
					}else{
					$oddt_totalqty=$vv['oddt_qty'];
					}
					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qycode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_oddtid']=$vv['oddt_id'];
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
			
					if($data3){
						if($oddt_unitsqty>0){
							$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
						}else{
							$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
						}
					}else{
						$data2[$kk]['oddt_shipqty']=0;
						$data3=0;
					}
					
					//发货记录
					if(($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==3) && $data3!=0 ){
						$data2[$kk]['part_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary shipment-button part-shipment" orderId="'.$data['od_id'].'"  odblId="'.$data['od_id'].'" odState="'.$od_state.'" oddtId="'.$vv['oddt_id'].'">发货记录</button>';
					}else{
						$data2[$kk]['part_shipment'] = '';
					}


					//出货按钮
					if($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==3){
						if($oddt_totalqty>0){
							if($oddt_totalqty>$data3){
								$data2[$kk]['oddt_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary botton-right fh" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" oddtId="'.$vv['oddt_id'].'" oddt_proid="'.$vv['oddt_proid'].'" oddt_attrid="'.$vv['oddt_attrid'].'">出货</button>'; 
						//od_id='.$data['od_id'].'&odbl_id='.$data['od_id'].'&oddt_id='.$vv['oddt_id'].''
							}else{
								$data2[$kk]['oddt_shipment']='';
							}
						}else{
							if($vv['oddt_qty']>$data3){
								$data2[$kk]['oddt_shipment']= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary botton-right fh" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" oddtId="'.$vv['oddt_id'].'" oddt_proid="'.$vv['oddt_proid'].'" oddt_attrid="'.$vv['oddt_attrid'].'">出货</button>';

							}else{
								$data2[$kk]['oddt_shipment']='';
							}
						}
					}else{
						$data2[$kk]['oddt_shipment']='';
					}



					
				}
				$data['orderdetail']=$data2;

				//下单时间
				$data['od_addtime'] = date('Y-m-d H:i:s', $data['od_addtime']);
				
				//下单代理信息
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['od_oddlid'];
				$map3['dl_unitcode']=$this->qycode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['od_dl_name']=$data3['dl_name'];
					$data['od_dl_tel']=$data3['dl_tel'];
					$data['od_dl_weixin']=$data3['dl_weixin'];
				}else{
					$data['od_dl_name']='';
					$data['od_dl_tel']='';
					$data['od_dl_weixin']='';
				}
				
				//快递物流
				if($data['od_express']>0){
				    $map3=array();
					$data3=array();
					$Express= M('Express');
					$map3['exp_id']=$data['od_express'];
					$data3=$Express->where($map3)->find();
					if($data3){
						$data['od_expressname']=$data3['exp_name'];
						//可以从快递100接口获取数据
						
						
					}else{
						$data['od_expressname']='';
					}
				}else{
					$data['od_expressname']='';
				}
				
				//状态
				if($data['od_state']==0){
					$data['od_state_str']='待确认';
				}else if($data['od_state']==1){
					$data['od_state_str']='待发货';
				}else if($data['od_state']==2){
					$data['od_state_str']='部分发货';
				}else if($data['od_state']==3){
					$data['od_state_str']='已发货';
				}else if($data['od_state']==8){
					$data['od_state_str']='已完成';
				}else if($data['od_state']==9){
					$data['od_state_str']='已取消';
				}else{
					$data['od_state_str']='未知';
				}
				
				$imgpath2 = BASE_PATH.'/Public/uploads/orders/';
				
				if(is_not_null($data['od_paypic']) && file_exists($imgpath2.$data['od_paypic'])){
					$data['odbl_paypic']=$data['od_paypic'];
				}else{
					$data['odbl_paypic']='';
				}
				
				
				//允许操作
				$caozuostr='';
				

				//完成记录
				/*if($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==3 ){
					$caozuostr.= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style .finish" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" odState="'.$od_state.'" >完成订单</button>';
				}*/

				//od_id='.$data['od_id'].'&odbl_id='.$data['od_id'].'&od_state='.$od_state.''

				//发货记录
				/*if($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==8){
					$caozuostr.= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style part-shipment" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" odState="'.$od_state.'" >发货记录</button>';
				}*/
				
				// 取消订单
				if($data['od_state']==0 || $data['od_state']==1){
					$caozuostr.= '<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style order-cancel" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" odState="'.$od_state.'" >取消订单</button>';
				}

			    //确认订单
	 			if($data['od_state']==0){
					$caozuostr.='<button type="button" class="mui-btn mui-btn-primary mui-bg-primary button-style order-confirm" orderId="'.$data['od_id'].'" odblId="'.$data['od_id'].'" odState="'.$od_state.'" >确认订单</button>';
				}
				

				$data['caozuostr']=$caozuostr;	
				
				//操作日志
				$Orderlogs= M('Orderlogs');
				$map2=array();
				$map2['odlg_unitcode']=$this->qycode;
				$map2['odlg_odid']=$od_id;

				$logs = $Orderlogs->where($map2)->order('odlg_addtime DESC')->limit(50)->select();
				foreach($logs as $kkk=>$vvv){
					if($vvv['odlg_type']==0){
						 $logs[$kkk]['odlg_dlname']='总公司';
					}
				}

				if($data['od_remark'] == null ){
					$data['od_remark'] = '';
				}

				
				$msg['info'] = $data;
				echo json_encode($msg);
				exit;
			}else{
				
				$msg['stat'] = '0';
				$msg['msg'] = '没有该记录';
				echo json_encode($msg);
				exit;
			}
		}else{
			$msg['stat'] = '0';
			$msg['msg'] = '没有该记录';
			echo json_encode($msg);
			exit;
		}


	}

	/**
	 * 发货订单信息
	 */
	public function odshipinfo(){
		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));
		$oddt_id=intval(I('post.oddt_id',0));
		$oddt_proid=intval(I('post.oddt_proid',0));
		$oddt_attrid=intval(I('post.oddt_attrid',0));
		$msg = array('login'=>'1','stat'=>'1','msg'=>'');

		if($od_id>0 && $oddt_id>0){
            //对应订单
			$Orders= M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$order = $Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
						$msg['stat'] = 0;
						$msg['msg'] = '该订单暂不能出货';
						echo json_encode($msg);
						exit;
				}else{

				 //收货代理信息 下单代理
	            $Dealer= M('Dealer');
				$map3=array();
				$data3=array();
				$map3['dl_id']=$order['od_oddlid'];
				$map3['dl_unitcode']=$this->qycode;
				$map3['dl_status']=1;
				$data3=$Dealer->where($map3)->find();

				if($data3){
					$order['od_dl_name']=$data3['dl_name'];
					$order['od_dl_username']=$data3['dl_username'];
				}else{

					$msg['stat'] = 0;
					$msg['msg'] = '下单代理不存在或已禁用';
					echo json_encode($msg);
					exit;
				}


				//订单产品详细
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment= M('Shipment');
				$Dealer= M('Dealer');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$this->qycode;
				$map2['oddt_odid']=$order['od_id'];
				$map2['oddt_proid']=$oddt_proid;
				$map2['oddt_attrid']=$oddt_attrid;
				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$this->qycode;
					$data3=$Product->where($map3)->find();
					
					//订购数 发货数
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($vv['oddt_prodbiao']>0){
						$oddt_unitsqty=$vv['oddt_prodbiao'];
						
						if($vv['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
						}
						
						if($vv['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
					}else{
						$oddt_totalqty=$vv['oddt_qty'];
					}
					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qycode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_oddtid']=$vv['oddt_id'];
					$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
			
					if($data3){
						if($oddt_unitsqty>0){
							$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
						}else{
							$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
						}
					}else{
						$data2[$kk]['oddt_shipqty']=0;
					}
					
				}
				// $data['orderdetail']=$data2;
				$order['pro'] = $data2;

				$msg['info'] = $order;
				echo json_encode($msg);
				exit;


				}
			}else{
			
				$msg['stat'] = 0;
				$msg['msg'] = '没有该记录';
				echo json_encode($msg);
				exit;
			}
		}
	}

	/**
	 * 获取仓库
	 */
	public function getwarehouse(){
		$map=array();
		$map['wh_unitcode']=$this->qycode;
		$Warehouse = M('Warehouse');
		$list = $Warehouse->where($map)->order('wh_id ASC')->select();
		$warehouselist=array();
		foreach($list as $k=>$v){ 
		   $warehouselist[$k]['value']=$v['wh_id'];
		   $warehouselist[$k]['text']=$v['wh_name'];
		}
		$msg=array('login'=>'1','stat'=>'1','list'=>$warehouselist);
		echo json_encode($msg);
		exit;
	}


	/**
	 * 扫码验证
	 */
    public function odshipscanres(){
        $Haspurview=$this->checksu_qypurview('30002',0);
        // var_dump( $Haspurview);
		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));
		$oddt_id=intval(I('post.oddt_id',0));
		$oddt_proid=intval(I('post.oddt_proid',0));
		$oddt_attrid=intval(I('post.oddt_attrid',0));

		$ship_whid=intval(I('post.ship_whid',0));
		$ship_barcode=I('post.ship_barcode','');
		$scancount = I('post.pronum', 0);

		$msg=array('login'=>'1','stat'=>'1','msg'=>'');
		
		if($od_id==0  || $oddt_id==0){
			$msg['stat'] = 0;
			$msg['msg'] = '该订单记录不存在';
			echo json_encode($msg);
			exit;
		}
		if($ship_whid==0){
			$msg['stat'] = 0;
			$msg['msg'] = '请选择出货仓库';
			echo json_encode($msg);
			exit;
		}
		if($ship_barcode==''){
			$msg['stat'] = 0;
			$msg['msg'] = '请填写产品条码';
			echo json_encode($msg);
			exit;
		}

		if($od_id>0 && $oddt_id>0){
            //对应订单
			$Orders= M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=0;//下给公司的订单
			$order = $Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
					$msg['stat'] = 0;
					$msg['msg'] = '该订单暂不能出货';
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg['stat'] = 0;
				$msg['msg'] = '该订单暂不能出货';
				echo json_encode($msg);
				exit;
			}


			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$this->qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$data = $Orderdetail->where($map)->find();
			if($data){
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				
				if($data['oddt_prodbiao']>0){
					$oddt_unitsqty=$data['oddt_prodbiao'];
					
					if($data['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_prozbiao'];
					}
					
					if($data['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$data['oddt_qty'];
				}else{
					$oddt_totalqty=$data['oddt_qty'];
				}
				if($oddt_totalqty==0 || $oddt_totalqty==$data['oddt_qty']){
					$data['oddt_totalqty']='';
				}else{
					$data['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				//发货数
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$this->qycode;
				$map3['ship_odid']=$data['oddt_odid'];
				$map3['ship_oddtid']=$data['oddt_id'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				
				if($data3){
					if($oddt_unitsqty>0){
						$data['oddt_shipqty']=floor($data3/$oddt_unitsqty).$data['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data['oddt_shipqty']=$data3.$data['oddt_prounits'];
					}
				}else{
					$data['oddt_shipqty']=0;
				}

			}else{
				$this->error('没有该记录','',2);
			}
			
			//对产品条码处理
			$ship_barcode=trim($ship_barcode);
			//检测条码是否格式正确
            if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$ship_barcode)){
            	$msg=array('login'=>'1','stat'=>'0','msg'=>'条码信息不正确');
				echo json_encode($msg);
				exit;
            }

            //检测该条码是否已存在
            $map2=array();
            $data2=array();
            $map2['ship_unitcode']=$this->qycode;
            $map2['ship_barcode'] = $ship_barcode;
            $map2['ship_deliver']=0;
            $data2=$Shipment->where($map2)->find();
            if(is_not_null($data2)){
	            $g='条码 '.$ship_barcode.' 已存在';
				$msg=array('login'=>'1','stat'=>'0','msg'=>$g);
				echo json_encode($msg);
				exit;
            }

            //检测是否已发行  大标小标信息在这
            $barcode=array();
            $barcode=wlcode_to_packinfo($ship_barcode,$this->qycode);
            
            if(!is_not_null($barcode)){
                $msg=array('login'=>'1','stat'=>'0','msg'=>'录入条码 '.$ship_barcode.' 出错，该条码还没发行。');
				echo json_encode($msg);
				exit;
            }

            //是否出货
            $map2=array();
            $where=array();
            $data2=array();
            if($barcode['code']!=''){
                $where[]=array('EQ',$barcode['code']);
            }
            if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
                $where[]=array('EQ',$barcode['tcode']);
            }
            if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
                $where[]=array('EQ',$barcode['ucode']);
            }
            $where[]='or';
            $map2['ship_barcode'] = $where;
            $map2['ship_unitcode']=$this->qycode;
            $map2['ship_deliver']=0;
            $data2=$Shipment->where($map2)->find();
            if(is_not_null($data2)){
                $msg=array('login'=>'1','stat'=>'0','msg'=>'录入条码 '.$ship_barcode.' 出错，该条码已存在。'
                	);
				echo json_encode($msg);
				exit;
            }
			
			//$Storage= M('Storage');
 			//$map3=array();
			//$map3['stor_unitcode']=$this->qycode;
			//$map3['stor_barcode'] = $where;
			//$dataStro=$Storage->where($map3)->find();
            //if(!is_not_null($dataStro)){
            //	$g='条码 '.$ship_barcode.'还没入库';
			//	$msg=array('login'=>'1','stat'=>'0','msg'=>$g);
			//	echo json_encode($msg);
			//	exit;
            //}else{
				
            //	$map3['stor_pro'] =$oddt_proid;
            //	$map3['stor_attrid'] =$oddt_attrid;
            //	$dataStro=$Storage->where($map3)->find();
            //	if(!is_not_null($dataStro)){
            //		$g='条码 '.$ship_barcode.'产品与订单产品不一致';
			//		$msg=array('login'=>'1','stat'=>'0','msg'=>$g);
			//		echo json_encode($msg);
			//		exit;
            //	}
            //}

            //检测是否拆箱
            $Chaibox= M('Chaibox');
            $map2=array();
            $data2=array();
            $map2['chai_unitcode']=$this->qycode;
            $map2['chai_barcode'] = $ship_barcode;
            $map2['chai_deliver']=0;
            $data2=$Chaibox->where($map2)->find();

            if(is_not_null($data2)){
                $msg=array('login'=>'1','stat'=>'0','msg'=>'录入条码 '.$ship_barcode.' 出错，该条码已经拆箱，不能再使用。');
				echo json_encode($msg);
				exit;
            }
            //统计已扫产品数
            $scancount=$scancount+$barcode['qty']; 
            //比较订购数 是否 小于 已发货数和已扫码数
            if($oddt_totalqty < ($scancount + $data3)){
            	$msg=array('login'=>'1','stat'=>'0','msg'=>'扫描产品数大于要发的产品数');
				echo json_encode($msg);
				exit;
            }

            $msg=array('login'=>'1','stat'=>'1','brcode'=>$ship_barcode,'tcode'=>$barcode['tcode'],'ucode'=>$barcode['ucode'],'qty'=>$barcode['qty'], 'scancount' => $scancount);
			echo json_encode($msg);
			exit;
		}else{
            $msg=array('login'=>'1','stat'=>'0','msg'=>'该订单记录不存在');
			echo json_encode($msg);
			exit;
		}

	}

	/**
	 * 扫码出货保存
	 */
	public function odshipscanres_save(){
        // $this->check_qypurview('13001',1);
		//--------------------------------
		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));
		$oddt_id=intval(I('post.oddt_id',0));
		$oddt_proid=intval(I('post.oddt_proid',0));
		$oddt_attrid=intval(I('post.oddt_attrid',0));

		$ship_whid=intval(I('post.ship_whid',0));
		$ship_barcode = trim(I('post.ship_barcode', ''));
		$ship_remark = trim(I('post.ship_remark', ''));
		
		if($od_id==0  || $oddt_id==0){
			$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单记录不存在');
			echo json_encode($msg);
			exit;
		}
		if($ship_whid==0){
            $msg=array('login'=>'1','stat'=>'0','msg'=>'请选择出货仓库');
			echo json_encode($msg);
			exit;
		}
		
		if($ship_barcode==''){
            $msg=array('login'=>'1','stat'=>'0','msg'=>'请正确录入产品条码');
			echo json_encode($msg);
			exit;
		}

        
        $linearr=explode('|', $ship_barcode);
		if(count($linearr)<=0){
            $msg=array('login'=>'1','stat'=>'0','msg'=>'请正确录入产品条码');
			echo json_encode($msg);
			exit;
		}

		
		if($od_id>0 && $oddt_id>0){
            //对应订单
			$Orders= M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$order = $Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
					$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单暂不能出货');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('login'=>'1','stat'=>'0','msg'=>'没有该记录');
				echo json_encode($msg);
				exit;
			}
			
            //收货代理信息 下单代理
            $Dealer= M('Dealer');
			$map3=array();
			$data3=array();
			$map3['dl_id']=$order['od_oddlid'];
			$map3['dl_unitcode']=$this->qycode;
			$map3['dl_status']=1;
			$data3=$Dealer->where($map3)->find();

			if($data3){
				$order['od_dl_name']=$data3['dl_name'];
				$order['od_dl_username']=$data3['dl_username'];
			}else{
				$msg=array('login'=>'1','stat'=>'0','msg'=>'下单代理不存在或已禁用');
				echo json_encode($msg);
				exit;
			}
			
			//仓库
			$map2=array();
			$map2['wh_id']=$ship_whid;
			$map2['wh_unitcode']=$this->qycode;
			$Warehouse = M('Warehouse');
			$data2=$Warehouse->where($map2)->find();
			if($data2){
				$order['od_wh_name']=$data2['wh_name'];
			}else{
				$msg=array('login'=>'1','stat'=>'0','msg'=>'请选择出货仓库');
				echo json_encode($msg);
				exit;
			}



			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$this->qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$data = $Orderdetail->where($map)->find();
			if($data){
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($data['oddt_prodbiao']>0){
					$oddt_unitsqty=$data['oddt_prodbiao'];
					
					if($data['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_prozbiao'];
					}
					
					if($data['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$data['oddt_qty'];
				}else{
					$oddt_totalqty=$data['oddt_qty'];
				}
				if($oddt_totalqty==0 || $oddt_totalqty==$data['oddt_qty']){
					$data['oddt_totalqty']='';
				}else{
					$data['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				//发货数
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$this->qycode;
				$map3['ship_odid']=$data['oddt_odid'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$data['oddt_shipqty']=floor($data3/$oddt_unitsqty).$data['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data['oddt_shipqty']=$data3.$data['oddt_prounits'];
					}
				}else{
					$data['oddt_shipqty']=0;
				}

			}else{
				$msg=array('login'=>'1','stat'=>'0','msg'=>'没有该记录');
				echo json_encode($msg);
				exit;
			}
			
			//对产品条码处理
			$msgs=array();
			$kk=0;
			$success=0; //有效条码
			$fail=0;    //无效条码
			$ship_barcode='';
			$Chaibox= M('Chaibox');
			$successarr=array();
			$scancount=0;
			$ship_date=time();
			//$Storage= M('Storage');
			foreach($linearr as $key =>$li){
				$ship_barcode=trim($li);
                if($ship_barcode==''){
                     continue;
                }
				//检测条码是否格式正确
                if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$ship_barcode)){
                    $msgs[$kk]['barcode']=$ship_barcode;
                    $msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($ship_barcode).' 出错，条码应由数字字母组成</span>';
					$msgs[$kk]['qty']=0;
					$msgs[$kk]['ok']= 0;
					$kk=$kk+1;
					$fail=$fail+1;
					continue;
                }
				
                //检测该条码是否已存在
                $map2=array();
                $data2=array();
                $map2['ship_unitcode']=$this->qycode;
                $map2['ship_barcode'] = $ship_barcode;
                $map2['ship_deliver']=0;
                $data2=$Shipment->where($map2)->find();
                if(is_not_null($data2)){
					$msgs[$kk]['barcode']=$ship_barcode;
                    $msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，该条码已存在。</span>';
					$msgs[$kk]['qty']=0;
					$msgs[$kk]['ok']= 0;
					$kk=$kk+1;
					$fail=$fail+1;
                    continue;
                }
				
                //检测是否已发行
                $barcode=array();
                $barcode=wlcode_to_packinfo($ship_barcode,$this->qycode);
                
                if(!is_not_null($barcode)){
                   $msgs[$kk]['barcode']=$ship_barcode;
					$msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，该条码还没发行。</span>';
					$msgs[$kk]['qty']=0;
					$msgs[$kk]['ok']= 0;
					$kk=$kk+1;
					$fail=$fail+1;
                    continue;

                }
				
                //是否出货
                $map2=array();
                $where=array();
                $data2=array();
                if($barcode['code']!=''){
                    $where[]=array('EQ',$barcode['code']);
                }
                if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
                    $where[]=array('EQ',$barcode['tcode']);
                }
                if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
                    $where[]=array('EQ',$barcode['ucode']);
                }
                $where[]='or';
                $map2['ship_barcode'] = $where;
                $map2['ship_unitcode']=$this->qycode;
                $map2['ship_deliver']=0;
                $data2=$Shipment->where($map2)->find();
                if(is_not_null($data2)){
					$msgs[$kk]['barcode']=$ship_barcode;
                    $msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，该条码已存在。</span>';
					$msgs[$kk]['qty']=$barcode['qty'];//产品数量
					$kk=$kk+1;
					$msgs[$kk]['ok']= 0;
					$fail=$fail+1;
                    continue;
                }
				
             //   $map3=array();
			//	$map3['stor_unitcode']=$this->qycode;
			//	$map3['stor_barcode'] = $where;
			//	$map3['stor_barcode'] = $where;
			//	$dataStro=$Storage->where($map3)->find();
        	//	if(!is_not_null($dataStro)){
			//		$msgs[$kk]['barcode']=$ship_barcode;
             //      	$msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，还没入库。</span>';
			//		$msgs[$kk]['qty']=$barcode['qty'];//产品数量
			//		$kk=$kk+1;
			//		$msgs[$kk]['ok']= 0;
			//		$fail=$fail+1;
             //       continue;
        	//	}	

                //检测是否拆箱
                $map2=array();
                $data2=array();
                $map2['chai_unitcode']=$this->qycode;
                $map2['chai_barcode'] = $ship_barcode;
                $map2['chai_deliver']=0;
                $data2=$Chaibox->where($map2)->find();

                if(is_not_null($data2)){
					$msgs[$kk]['barcode']=$ship_barcode;
                    $msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，该条码已经拆箱，不能再使用。</span>';
					$msgs[$kk]['qty']=0;
					$msgs[$kk]['ok']= 0;
					$kk=$kk+1;
					$fail=$fail+1;
                    continue;
                }
				
			    if(array_key_exists(strval($ship_barcode),$successarr)===false){
				    //判断已有记录是否有小标或大标 待完善
				
				    //判断录入条码的产品数是否超出要出货的数 待完善
					
					//有效条码入库 记录拆箱 tcode-大    ucode-中
					$insert=array();
					$insert['ship_unitcode']=$this->qycode;
					$insert['ship_number']=$order['od_orderid'];
					$insert['ship_deliver']=0;
					$insert['ship_dealer']=$order['od_oddlid'];  //下单代理收货代理
					$insert['ship_pro']=$data['oddt_proid']; //产品id
					$insert['ship_odid']=$od_id;  //订单id
					$insert['ship_odblid']=$odbl_id; //订单关系id
					$insert['ship_oddtid']=$oddt_id;//订单详情id
					$insert['ship_whid']=$ship_whid;
					$insert['ship_proqty']=$barcode['qty'];
					$insert['ship_barcode']=$ship_barcode;
					$insert['ship_date']=$ship_date;
					$insert['ship_ucode']=$barcode['ucode'];
					$insert['ship_tcode']=$barcode['tcode'];
					$insert['ship_remark']=$ship_remark;
					$insert['ship_cztype']=0;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
					$insert['ship_czid']=$this->subuserid;
					$insert['ship_czuser']=$this->subusername;
					
					$rs=$Shipment->create($insert,1);
					if($rs){
					    $result = $Shipment->add(); 
					    if($result){
							//记录拆箱
							if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
								$insert2=array();
								$data3=array();
								$insert2['chai_unitcode']=$this->qycode;
								$insert2['chai_barcode']=$barcode['tcode'];
								$insert2['chai_deliver']=0;
								$data3=$Chaibox->where($insert2)->find();
								if(!$data3){
									$insert2['chai_addtime']=$ship_time;
									$Chaibox->create($insert2,1);
									$Chaibox->add(); 

								}
							}
							if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
								$insert3=array();
								$data4=array();
								$insert3['chai_unitcode']=$this->qycode;
								$insert3['chai_barcode']=$barcode['ucode'];
								$insert3['chai_deliver']=0;
								$data4=$Chaibox->where($insert3)->find();
								if(!$data4){
									$insert3['chai_addtime']=$ship_time;
									$Chaibox->create($insert3,1);
									$Chaibox->add(); 
								}
							}

							//记录日志 begin
							$log_arr=array();
							$log_arr=array(
										'log_qyid'=>$this->subuserid,
										'log_user'=>$this->subusername,
										'log_qycode'=>$this->qycode,
										'log_action'=>'出货导入',
										'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
										'log_addtime'=>time(),
										'log_ip'=>real_ip(),
										'log_link'=>__SELF__,
										'log_remark'=>json_encode($insert)
										);
							save_log($log_arr);
							//记录日志 end

							$msgs[$kk]['barcode']=$ship_barcode;
							$msgs[$kk]['error']='添加条码 <b>'.$ship_barcode.' </b> 成功。';
							$msgs[$kk]['qty']=$barcode['qty'];
							$msgs[$kk]['ok']= 1;
							$kk=$kk+1;
							$successarr[strval($ship_barcode)]=$barcode['qty'];
							$success=$success+1;
							$scancount=$scancount+$barcode['qty'];
							continue;
					    }else{
							$msgs[$kk]['barcode']=$ship_barcode;
							$msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，条码不正确。</span>';
							$msgs[$kk]['qty']=0;
							$msgs[$kk]['ok']= 0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
					    }
					}else{
						$msgs[$kk]['barcode']=$ship_barcode;
						$msgs[$kk]['error']='<span style="color:#FF0000">添加条码 '.$ship_barcode.' 出错，条码不正确。</span>';
						$msgs[$kk]['qty']=0;
						$msgs[$kk]['ok']= 0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}

				}else{
					$msgs[$kk]['barcode']=$ship_barcode;
                    $msgs[$kk]['error']='<span style="color:#FF0000">录入条码 '.$ship_barcode.' 出错，该条码重复录入。</span>';
					$msgs[$kk]['qty']=0;
					$msgs[$kk]['ok']= 0;
					$kk=$kk+1;
					$fail=$fail+1;
                    continue;
				}
			}
			$msg=array('login'=>'1','stat'=>'1','list'=>$msgs,'shipfail'=>$fail,'shipok'=>$success);
			echo json_encode($msg);
			exit;	
		}else{
			
            $msg=array('login'=>'1','stat'=>'0','msg'=>'该订单记录不存在');
			echo json_encode($msg);
			exit;
		}

	}

	/**
	 * 完成发货获取订单信息
	 */
    public function getOrderInfo(){
		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));
		
		
		//判断权限
		$Qyinfo= M('Qyinfo');
		$map2=array();
		$map2['qy_code']=$this->qycode;
		$map2['qy_active']=1;
		$qydata=$Qyinfo->where($map2)->find();
		if($qydata){
			$qy_purview_arr=array();
			$purview_arr=array();
			$qy_purview=$qydata['qy_purview'];
			if(is_not_null($qy_purview)){
				$qy_purview_arr=explode(",", $qy_purview);
				foreach($qy_purview_arr as $k =>$v){
					$purview_arr[$v]=$v;
				}
			}else{
				$purview_arr=array();
			}
		}else{
			$msg=array('login'=>'0','stat'=>'0','msg'=>'授权过期，请重新登录');
			echo json_encode($msg);
			exit;
		}
		//---------
		

		$msg = array('login'=>'1','stat'=>'1','msg'=>'');
		
		if($od_id>0){
			$Orders= M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=0;
			$data = $Orders->where($map)->find();
			if($data){
				//订单产品详细
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment= M('Shipment');
				$Dealer= M('Dealer');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$this->qycode;
				$map2['oddt_odid']=$data['od_id'];
				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$imgpath = BASE_PATH.'/Public/uploads/product/';
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$this->qycode;
					$data3=$Product->where($map3)->find();
					if($data3){
						if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
							$data2[$kk]['oddt_propic']=$data3['pro_pic'];
						}else{
							$data2[$kk]['oddt_propic']='';
						}
					}else{
						$data2[$kk]['oddt_propic']='';
					}
					
					//订购数 
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($vv['oddt_prodbiao']>0){
						$oddt_unitsqty=$vv['oddt_prodbiao'];
						
						if($vv['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
						}
						
						if($vv['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
					}else{
						$oddt_totalqty=$vv['oddt_qty'];
					}
					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					//发货数
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qycode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
			
					if($data3){
						if($oddt_unitsqty>0){
							$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
						}else{
							$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
						}
						
						if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
							if(isset($purview_arr['13004'])){
								//完成订单不以完成出货为条件 如:极限动力
								$msg['stat'] = '2';
							}
						}
						
					}else{
						
						$data2[$kk]['oddt_shipqty']=0;
						
						if(isset($purview_arr['13004'])){
							//完成订单不以完成出货为条件 如:极限动力
							$msg['stat'] = '2';
						}
					}	
				}
				$data['orderdetail']=$data2;

				//下单时间
				$data['od_addtime'] = date('Y-m-d H:i:s', $data['od_addtime']);
				
				//下单代理信息
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['od_oddlid'];
				$map3['dl_unitcode']=$this->qycode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['od_dl_name']=$data3['dl_name'];
					$data['od_dl_tel']=$data3['dl_tel'];
					$data['od_dl_weixin']=$data3['dl_weixin'];
				}else{
					$data['od_dl_name']='';
					$data['od_dl_tel']='';
					$data['od_dl_weixin']='';
				}
				
				//快递物流
				if($data['od_express']>0){
				    $map3=array();
					$data3=array();
					$Express= M('Express');
					$map3['exp_id']=$data['od_express'];
					$data3=$Express->where($map3)->find();
					if($data3){
						$data['od_expressname']=$data3['exp_name'];
						//可以从快递100接口获取数据
						
						
					}else{
						$data['od_expressname']='';
					}
				}else{
					$data['od_expressname']='';
				}
				
				//状态
				if($data['od_state']==0){
					$data['od_state_str']='待确认';
				}else if($data['od_state']==1){
					$data['od_state_str']='待发货';
				}else if($data['od_state']==2){
					$data['od_state_str']='部分发货';
				}else if($data['od_state']==3){
					$data['od_state_str']='已发货';
				}else if($data['od_state']==8){
					$data['od_state_str']='已完成';
				}else if($data['od_state']==9){
					$data['od_state_str']='已取消';
				}else{
					$data['od_state_str']='未知';
				}
				
				
				
				if(isset($purview_arr['13004']) && $msg['stat']==2){
					//完成订单不以完成出货为条件 如:极限动力
					$msg['msg'] = '该订单还没完成出货，点击[继续发货]将强行完成发货';
				}

				$msg['info'] = $data;
				echo json_encode($msg);
				exit;
			}else{
				// $this->error('没有该记录','',2);
				$msg['stat'] = '0';
				$msg['msg'] = '没有该记录';
				echo json_encode($msg);
				exit;
			}
		}else{
			$msg['stat'] = '0';
			$msg['msg'] = '没有该记录';
			echo json_encode($msg);
			exit;
		}


	}


	/**
	 * 完成出货 获取物流快递
	 */
	public function getExpress(){
		//物流快递
		$Express = M('Express');
		$map=array();
		$expresslist = $Express->where($map)->order('exp_addtime DESC')->select();
		$list=array();
		foreach($expresslist as $k=>$v){ 
		   $list[$k]['value']=$v['exp_id'];
		   $list[$k]['text']=$v['exp_name'];
		}
		$msg = array('login'=>'1','stat'=>'1','msg'=>'', 'list'=>$list);
		echo json_encode($msg);
	}

	/**
	 * 完成发货 保存
	 */
    public function odfinishship_save(){
        // $this->check_qypurview('13001',1);
		
		$od_id=intval(I('post.od_id',0));
		$odbl_id=intval(I('post.odbl_id',0));

		
		//判断权限
		$Qyinfo= M('Qyinfo');
		$map2=array();
		$map2['qy_code']=$this->qycode;
		$map2['qy_active']=1;
		$qydata=$Qyinfo->where($map2)->find();
		if($qydata){
			$qy_purview_arr=array();
			$purview_arr=array();
			$qy_purview=$qydata['qy_purview'];
			if(is_not_null($qy_purview)){
				$qy_purview_arr=explode(",", $qy_purview);
				foreach($qy_purview_arr as $k =>$v){
					$purview_arr[$v]=$v;
				}
			}else{
				$purview_arr=array();
			}
		}else{
			$msg=array('login'=>'0','stat'=>'0','msg'=>'授权过期，请重新登录');
			echo json_encode($msg);
			exit;
		}
		//---------
		
		if($od_id>0){
			$od_express=intval(I('post.od_express',0));
			$od_expressnum=I('post.expressnum','');
			$od_remark=I('post.remark','');
			if($od_express<=0){
				$msg=array('login'=>'1','stat'=>'0','msg'=>'请选择物流快递');
				echo json_encode($msg);
				exit;
			}
			
			$Orders = M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=0;//下给公司的订单
			$data = $Orders->where($map)->find();
			if($data){	
				//检测是否能发货 //订购数 发货数
				$Orderdetail = M('Orderdetail');
				$Shipment = M('Shipment');
				$map2=array();
				$oddetail=array();
				$map2['oddt_unitcode']=$this->qycode;
				$map2['oddt_odid']=$od_id;
				$oddetail = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$proids=array();
				foreach($oddetail as $kk=>$vv){

					$proids[]=$vv['oddt_proid'];

					//订购数 
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($vv['oddt_prodbiao']>0){
						$oddt_unitsqty=$vv['oddt_prodbiao'];
						
						if($vv['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
						}
						
						if($vv['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
					}else{
						$oddt_totalqty=$vv['oddt_qty'];
					}
					if($oddt_totalqty==0){
						$oddt_totalqty=$vv['oddt_qty'];
					}
					
					//发货数
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qycode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
					if($data3){
						if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
							if(isset($purview_arr['13004'])){
								//完成订单不以完成出货为条件 如:极限动力

							}else{
								$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单还没完成出货');
								echo json_encode($msg);
								exit;
							}
						}	
                        if( $oddt_totalqty<$data3){
							$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单出货的数量大于订购数量');
							echo json_encode($msg);
							exit;
						}
					}else{
						if(isset($purview_arr['13004'])){
							//完成订单不以完成出货为条件 如:极限动力
						}else{
							$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单还没完成出货');
							echo json_encode($msg);
							exit;
						}
					}
				}
			}else{
				$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单记录不存在');
				echo json_encode($msg);
				exit;
			}
			
			$Orders= M('Orders');

			
			//写入物流信息
			$map2=array();
			$updata2=array();
			$map2['od_unitcode']=$this->qycode;
			$map2['od_id']=$od_id;
			
			$updata2['od_express']=$od_express;
			$updata2['od_expressnum']=$od_expressnum;
			$updata2['od_remark']=$od_remark;
			if($data['od_express']<=0){
				$updata2['od_expressdate']=time();
			}
			$Orders->where($map2)->save($updata2);
			

			
			//修改原始订单状态

				$map2=array();
				$updata2=array();
				$map2['od_unitcode']=$this->qycode;
				$map2['od_id']=$od_id;
				$updata2['od_state']=3;
				$Orders->where($map2)->save($updata2);

			if($data['od_express']<=0){

			 	//订单返利 begin
			 	$fanli_dlid1=0; //返利给的代理商1
			 	$fanli_dlid2=0; //返利给的代理商2
			 	$fanli_dlid3=0; //返利给的代理商3
			 	$ismaiduan=0;
			 	$fanli_dlname1='';
			 	$fanli_dlname2='';
			 	$fanli_dlname3='';
				$fanli_dlusername1='';
			 	$fanli_dlusername2='';
			 	$fanli_dlusername3='';
			 	$Dealer = M('Dealer');
			 	//下单人
			 	$map3=array();
			 	$orderdealer=array();
			 	$map3['dl_unitcode'] = $this->qycode;
			 	$map3['dl_id'] = $data['od_oddlid'];  //下单的代理
			 	$orderdealer=$Dealer->where($map3)->find();
			 	if($orderdealer){
			 		$Profanli= M('Profanli');
			 		$map2=array();
			 		$map2['pfl_unitcode'] = $this->qycode;
			 		$map2['pfl_dltype'] = $orderdealer['dl_type'];
			 		$where=array();
			 		$where['pfl_fanli1'] = array('GT',0);
			 		$where['pfl_maiduan'] = array('GT',0);  //是否设置卖断返利
			 		$where['_logic'] = 'or';
			 		$map2['_complex'] = $where;
					
			 		if($proids){
			 			$map2['pfl_proid'] = array('IN',$proids);
			 		}
			 		$data2=$Profanli->where($map2)->find(); //是否有设置返利
					

			 			//返利
			 			if($data2){
			 				if($orderdealer['dl_referee']>0){

			 					//下单代理的推荐人 
			 					$map4=array();
			 					$data4=array();
			 					$map4['dl_unitcode'] = $this->qycode;
			 					$map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人
			 					$map4['dl_status'] = 1;
								
			 					$data4=$Dealer->where($map4)->find();
			 					if($data4){
			 						//如果推荐人和发货人不相同  则都返利给推荐人
			 						if($data4['dl_id']>0){
										
										//前2级 同级推荐有返利
										if($orderdealer['dl_level']==$data4['dl_level'] && ($orderdealer['dl_level']==1 || $orderdealer['dl_level']==2)){
											$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
											$fanli_dlname1=$data4['dl_name'];
											$fanli_dlusername1=$data4['dl_username'];
											
											//推荐人的推荐人
											if($data4['dl_referee']>0){
												$map6=array();
												$data6=array();
												$map6['dl_unitcode'] = $this->qycode;
												$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
												$map6['dl_status'] = 1;
												$data6=$Dealer->where($map6)->find();
												if($data6){
													if($data6['dl_type']==$data4['dl_type']){
														$fanli_dlid2=$data6['dl_id']; //返利给的代理商1
														$fanli_dlname2=$data6['dl_name'];
														$fanli_dlusername2=$data6['dl_username'];
													}
												}
											}
											
											
										}
			 						}
			 					}
								
			 					//写入返利数据
			 					if($fanli_dlid1>0){
			 						$Fanlidetail = M('Fanlidetail');
			 						foreach($oddetail as $kk=>$vv){
			 							$map7=array();
			 							$data7=array();
			 							$map7['pfl_unitcode'] = $this->qycode;
			 							$map7['pfl_proid'] = $vv['oddt_proid'];
			 							$map7['pfl_dltype'] = $data4['dl_type'];
			 							$map7['pfl_fanli1'] = array('GT',0);
			 							$data7=$Profanli->where($map7)->find();
			 							//如果订单产品有设置返利 1层
			 							if($data7){
			 								if($data7['pfl_fanli1']>0){
			 									$map8=array();
			 									$data8=array();
			 									$map8['fl_unitcode'] = $this->qycode;
			 									$map8['fl_type'] = 2;
			 									$map8['fl_odid'] = $vv['oddt_odid'];
			 									$map8['fl_proid'] = $vv['oddt_proid'];
												$map8['fl_oddtid'] = $vv['oddt_id'];
			 									$map8['fl_oddlid'] = $orderdealer['dl_id'];
			 									$map8['fl_level'] = 1;
			 									$data8 = $Fanlidetail->where($map8)->find();
			 									if(!$data8){

													//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
													if($data7['pfl_fanli1']>0 && $data7['pfl_fanli1']<1){
														$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_dlprice']*$vv['oddt_qty'];
													}else{
														$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
													}

													
			 										$data5=array();
			 										$data5['fl_unitcode'] = $this->qycode;
			 										$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
			 										$data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
			 										$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
			 										$data5['fl_money'] = $pfl_fanli1sum;
			 										$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
			 										$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
			 										$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
			 										$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
			 										$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
													$data5['fl_oddtid']  = $vv['oddt_id'];  //订单详细id
			 										$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
			 										$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
			 										$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
			 										$data5['fl_addtime']  = time();
			 										$data5['fl_remark'] ='代理 '.$orderdealer['dl_name'].'('.$orderdealer['dl_username'].') 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
			 										$rs5=$Fanlidetail->create($data5,1);
			 										if($rs5){
			 											$Fanlidetail->add();
			 										}
			 									}
			 								}
			 							}
										
			 							//如果有设置2层返利
			 							if($fanli_dlid2>0){
			 								$map7=array();
			 								$data7=array();
			 								$map7['pfl_unitcode'] = $this->qycode;
			 								$map7['pfl_proid'] = $vv['oddt_proid'];
			 								$map7['pfl_dltype'] = $data4['dl_type'];
			 								$map7['pfl_fanli2'] = array('GT',0);
			 								$data7=$Profanli->where($map7)->find();
			 								if($data7){
			 									if($data7['pfl_fanli2']>0){
			 										$map8=array();
			 										$data8=array();
			 										$map8['fl_unitcode'] = $this->qycode;
			 										$map8['fl_type'] = 2;
			 										$map8['fl_odid'] = $vv['oddt_odid'];
			 										$map8['fl_proid'] = $vv['oddt_proid'];
													$map8['fl_oddtid'] = $vv['oddt_id'];
			 										$map8['fl_oddlid'] = $orderdealer['dl_id'];
			 										$map8['fl_level'] = 2;
			 										$data8 = $Fanlidetail->where($map8)->find();
													
			 										if(!$data8){

														//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
														if($data7['pfl_fanli2']>0 && $data7['pfl_fanli2']<1){
															$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_dlprice']*$vv['oddt_qty'];
														}else{
															$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
														}

														
			 											$data5=array();
			 											$data5['fl_unitcode'] = $this->qycode;
			 											$data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
			 											$data5['fl_senddlid'] = 0; //发放返利的代理
			 											$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
			 											$data5['fl_money'] = $pfl_fanli2sum;
			 											$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
			 											$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
			 											$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
			 											$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
			 											$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
														$data5['fl_oddtid']  = $vv['oddt_id'];  //订单详细id
			 											$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
			 											$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
			 											$data5['fl_level']  = 2;  //返利的层次，1-第一层返利 2-第二层返利
			 											$data5['fl_addtime']  = time();
			 											$data5['fl_remark'] ='代理 '.$fanli_dlname1.'('.$fanli_dlusername1.') 的邀请代理 '.$orderdealer['dl_name'].'('.$orderdealer['dl_username'].') 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
			 											$rs5=$Fanlidetail->create($data5,1);
			 											if($rs5){
			 												$Fanlidetail->add();
			 											}
			 										}
			 									}
			 								}
			 							}
			 						}
			 					}	
			 				}
			 			}
			 	}
			 	//返利 end
				
				//订单操作日志 begin
				$odlog_arr=array(
							'odlg_unitcode'=>$this->qycode,  
							'odlg_odid'=>$od_id,
							'odlg_orderid'=>$data['od_orderid'],
							'odlg_dlid'=>$this->subuserid,
							'odlg_dlusername'=>$this->subusername,
							'odlg_dlname'=>$this->subusername,
							'odlg_action'=>'完成发货',
							'odlg_type'=>0, //0-企业 1-经销商
							'odlg_addtime'=>time(),
							'odlg_ip'=>real_ip(),
							'odlg_link'=>__SELF__
							);
				$Orderlogs = M('Orderlogs');
				$rs3=$Orderlogs->create($odlog_arr,1);
				if($rs3){
					$Orderlogs->add();
				}
				//订单操作日志 end
			}
			$msg=array('login'=>'1','stat'=>'1','msg'=>'物流信息提交成功');
			echo json_encode($msg);
			exit;

		}else{
			$msg=array('login'=>'1','stat'=>'0','msg'=>'该订单记录不存在');
			echo json_encode($msg);
			exit;
		}
	}

    /**
     * 获取出货记录
     */
	public function fhjl(){
        $maxid=intval(I('post.maxid',0));
		$minid=intval(I('post.minid',0));
		$ship_odid = intval(I('post.odid',0));
		$ship_odblid = intval(I('post.odblid',0));
		$ship_oddtid = intval(I('post.oddtid',0));

		if($ship_odid>0){
			$Orders= M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qycode;
			$map['od_id']=$ship_odid;
			$map['od_rcdlid']=0;//下给公司的订单
			$data = $Orders->where($map)->find();
			if(!$data){	
				$msg=array('login'=>'1','stat'=>'1','msg'=>'该记录不存在');
				echo json_encode($msg);
				exit;
			}
				
		}

		$Shipment= M('Shipment');
        $map=array();
        $parameter=array();
        $map['ship_unitcode']=$this->qycode;
		$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
		if($maxid==0 && $minid==0){
			
		}else if($maxid>0){
			$map['ship_id']=array('GT',$maxid);
		}else if($minid>0){
			$map['ship_id']=array('LT',$minid);
		}
		$map['ship_odid'] = $ship_odid;
		$map['ship_odblid'] = $ship_odblid;
		$map['ship_oddtid'] = $ship_oddtid;
        $list = $Shipment->where($map)->order('ship_id DESC')->limit(20)->select();
		$Dealer = M('Dealer');
		$Product = M('Product');
		$newlist=array();
		foreach($list as $k=>$v){ 
			$newlist[$k]['ship_id']=$v['ship_id'];
		    $newlist[$k]['ship_barcode']=$v['ship_barcode'];
			$newlist[$k]['ship_date']=date('Y-m-d',$v['ship_date']);
			$newlist[$k]['ship_number']=$v['ship_number'];
		
            $map2=array();
            $map2['dl_unitcode']=$this->qycode;
            $map2['dl_id'] = $v['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $newlist[$k]['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $newlist[$k]['dl_name']='';
            }
			
            $map2=array();
            $map2['pro_unitcode']=$this->qycode;
            $map2['pro_id'] = $v['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                $newlist[$k]['pro_name']=$Proinfo['pro_name'];
            }else{
                $newlist[$k]['pro_name']='';
            }	

            //操作    
			if(($data['od_state']==1 || $data['od_state']==2) && $v['ship_deliver']==0){
				$newlist[$k]['ship_deletestr']='<span href="#" class="delete-button" shipId="'.$v['ship_id'].'">删除</span>';
			}else{
				$newlist[$k]['ship_deletestr']='';
			}
		}
		
		if($maxid==0 && $minid==0 && count($newlist)>0){
			reset($newlist);
			$maxid = current($newlist)['ship_id'];
			$minid = end($newlist)['ship_id'];
		}else if($maxid>0){
			if(count($newlist)>0){
				reset($newlist);
				$maxid = current($newlist)['ship_id'];
				$minid=0;
			}else{
				$maxid=0;
				$minid=0;
			}
		}else if($minid>0){
			if(count($newlist)>0){
				reset($newlist);
				$maxid=0;
				$minid = end($newlist)['ship_id'];
			}else{
				$maxid=0;
				$minid=0;
			}
		}else{
			$maxid=0;
			$minid=0;
		}
		
		
		$msg=array('login'=>'1','stat'=>'1','list'=>$newlist,'maxid'=>$maxid,'minid'=>$minid);
		echo json_encode($msg);
		exit;
	}

	/**
	 * 删除出货记录
	 */
	public function deleteFhjl(){
		// $this->check_qypurview('30008',1);

        $map['ship_id']=intval(I('post.ship_id',0));
        $map['ship_unitcode']=$this->qycode;
        $Shipment= M('Shipment');
        $Chaibox= M('Chaibox');
        //判断是否可删 保持数据完整性 待完善
        $data=$Shipment->where($map)->find();
        if($data){
			//如果是按订单出货 并且已确认收货 
			if($data['ship_odid']>0){
				$Orders= M('Orders');
				$map2=array();
				$order=array();
				$map2['od_unitcode']=$this->qycode;
				$map2['od_id']=$data['ship_odid'];
				$order = $Orders->where($map2)->find();
				if($order){
					if($order['od_state']==3){
						$msg = array('login'=>'1', 'stat' => '0', 'msg'=>'该出货记录对应订单已发货，暂不能删除', 'ok'=>'0');
				        echo json_encode($msg);
				        exit;
					    
				    }
					if($order['od_state']==8){
						$msg = array('login'=>'1', 'stat' => '0', 'msg'=>'该出货记录对应订单已确认收货，暂不能删除', 'ok'=>'0');
				        echo json_encode($msg);
				        exit;
					}
				}else{
					$msg = array('login'=>'1', 'stat' => '0', 'msg'=>'该出货记录对应订单记录不存在，暂不能删除', 'ok'=>'0');
				    echo json_encode($msg);
				    exit;
				}
			}
			
            //如果经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$this->qycode;
            $map2['ship_deliver']=array('gt',0);
            $map2['ship_id'] = array('NEQ',$data['ship_id']);

            $where=array();
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);
            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
            	$msg = array('login'=>'1', 'stat' => '0', 'msg'=>'该出货记录已被下级经销商重新出货，暂不能删除', 'ok'=>'0');
				echo json_encode($msg);
				exit;
              
            }

           //判断处理拆箱记录
            if($data['ship_tcode']!='' || $data['ship_ucode']!=''){

				if($data['ship_tcode']!='' &&  $data['ship_tcode']!=$data['ship_barcode']){	
                    $map2=array();
                    $map2['ship_tcode']=$data['ship_tcode'];
                    $map2['ship_unitcode']=$this->qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_tcode'];
                        $map3['chai_unitcode']=$this->qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['ship_ucode']!='' && $data['ship_ucode']!=$data['ship_barcode'] && $data['ship_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['ship_ucode']=$data['ship_ucode'];
                    $map2['ship_unitcode']=$this->qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_ucode'];
                        $map3['chai_unitcode']=$this->qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['ship_tcode']=$data['ship_tcode'];
                    $map22['ship_unitcode']=$this->qycode;
					$map22['ship_deliver']=0;  
                    $map22['ship_id'] = array('NEQ',$data['ship_id']);
                    $data22=$Shipment->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['ship_tcode'];
                        $map33['chai_unitcode']=$this->qycode;
						$map33['chai_deliver'] = 0;
                        $Chaibox->where($map33)->delete(); 
                    }
                }
            }
             
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>$this->subuserid,
                        'log_user'=>$this->subusername,
                        'log_qycode'=>$this->qycode,
                        'log_action'=>'删除出货记录',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $Shipment->where($map)->delete(); 
            $msg = array('login'=>'1', 'stat' => '1', 'msg'=>'删除成功', 'ok'=>'1');
	        echo json_encode($msg);
	        exit;
        }else{
            $msg = array('login'=>'1', 'stat' => '0', 'msg'=>'没有该记录', 'ok'=>'0');
        	echo json_encode($msg);
        	exit;
        }     
        
	}

	/**
	 * 获取出货详细
	 */
	public function detail(){
        $shid=intval(I('post.shid',0));
		
        if($shid<=0){
			$msg=array('login'=>'1','stat'=>'0','msg'=>'没有该记录或已删除');
			echo json_encode($msg);
			exit;
		}
		$Dealer = M('Dealer');
		$Warehouse= M('Warehouse');
		$Product = M('Product');
		$Shipment= M('Shipment');
		$map=array();
		$map['ship_unitcode']=$this->qycode;
		$map['ship_id']=$shid;
		$data=$Shipment->where($map)->find();
		if($data){
            $map2=array();
            $map2['dl_unitcode']=$this->qycode;
            $map2['dl_id'] = $data['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $data['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $data['dl_name']='';
            }
			
            $map2=array();
            $map2['pro_unitcode']=$this->qycode;
            $map2['pro_id'] = $data['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                $data['pro_name']=$Proinfo['pro_name'];
            }else{
                $data['pro_name']='';
            }

            //检测是否已发行  大标小标信息在这
            $barcode=array();
            $barcode=wlcode_to_packinfo($data['ship_barcode'],$this->qycode);
            
            if( $barcode){
               $data['pro_number']= $barcode['qty'];
            }else{
            	 $data['pro_number']= '';
            }
			
			$map2=array();
            $map2['wh_unitcode']=$this->qycode;
            $map2['wh_id'] = $data['ship_whid'];
            $Warehouseinfo = $Warehouse->where($map2)->find();
            if($Warehouseinfo){
                  $data['wh_name']=$Warehouseinfo['wh_name'];
            }else{
                  $data['wh_name']='';
            }

            $data['ship_date']=date('Y-m-d',$data['ship_date']);			
			
			$msg=array('login'=>'1','stat'=>'1','list'=>$data);
			echo json_encode($msg);
			exit;
		}else{
			$msg=array('login'=>'1','stat'=>'0','msg'=>'没有该记录或已删除');
			echo json_encode($msg);
			exit;
		}
	}
	
}