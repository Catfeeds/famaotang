<?php
namespace Famaotang\Controller;
use Think\Controller;
class OrdersController extends CommController {
	
	//订单首页
	public function home(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		
		$od_type=intval(I('get.od_type',0));
		$Orders=M('Orders');
		$Dealer=M('Dealer');

		//我的订单
        //待确定od_status=0
        $maps=array();
		$maps['od_unitcode']=$this->qy_unitcode;
		$maps['od_oddlid']=session('jxuser_id');
		$maps['od_state']=0;
 		$maps['od_virtualstock']=0;
		$mysodcount= $Orders->where($maps)->count();
		if($mysodcount){
		}else{
			$mysodcount=0;
		}
		
		//待发货od_status=array('in','1,2');
		$mapm=array();
		$mapm['od_unitcode']=$this->qy_unitcode;
		$mapm['od_oddlid']=session('jxuser_id');
		$mapm['od_state']=array('in','1,2');
		$mapm['od_virtualstock']=0;
		$mymodcount= $Orders->where($mapm)->count();
		if($mymodcount){
		}else{
			$mymodcount=0;
		}
		
 		//已发货
		$mapf=array();
		$mapf['od_unitcode']=$this->qy_unitcode;
		$mapf['od_oddlid']=session('jxuser_id');
		$mapf['od_state']=3;
		$mapf['od_virtualstock']=0;
		$myfodcount= $Orders->where($mapf)->count();
		if($myfodcount){
		}else{
			$myfodcount=0;
		}
		
		//已完成
		$mapf=array();
		$mapf['od_unitcode']=$this->qy_unitcode;
		$mapf['od_oddlid']=session('jxuser_id');
		$mapf['od_state']=8;
		$mapf['od_virtualstock']=0;
		$mywodcount= $Orders->where($mapf)->count();
		if($mywodcount){
		}else{
			$mywodcount=0;
		}
		
 		//已取消od_status=9
		$mapy=array();
		$mapy['od_unitcode']=$this->qy_unitcode;
		$mapy['od_oddlid']=session('jxuser_id');
		$mapy['od_state']=9;
		$mapy['od_virtualstock']=0;
		$myyodcount= $Orders->where($mapy)->count();
		if($myyodcount){
			
		}else{
			$myyodcount=0;
		}
		
		//下家的订单
		
        //待确定od_status=0
        $maps=array();
		$maps['od_unitcode']=$this->qy_unitcode;
		$maps['od_rcdlid']=session('jxuser_id');
		$maps['od_state']=0;
 		$maps['od_virtualstock']=0;
		$dlsodcount= $Orders->where($maps)->count();
		if($dlsodcount){
		}else{
			$dlsodcount=0;
		}
		
		//待发货od_status=array('in','1,2');
		$mapm=array();
		$mapm['od_unitcode']=$this->qy_unitcode;
		$mapm['od_rcdlid']=session('jxuser_id');
		$mapm['od_state']=array('in','1,2');
		$mapm['od_virtualstock']=0;
		$dlmodcount= $Orders->where($mapm)->count();
		if($dlmodcount){
		}else{
			$dlmodcount=0;
		}
		
 		//已发货
		$mapf=array();
		$mapf['od_unitcode']=$this->qy_unitcode;
		$mapf['od_rcdlid']=session('jxuser_id');
		$mapf['od_state']=array('in','3');
		$mapf['od_virtualstock']=0;
		$dlfodcount= $Orders->where($mapf)->count();
		if($dlfodcount){
		}else{
			$dlfodcount=0;
		}
		
		//已完成
		$mapf=array();
		$mapf['od_unitcode']=$this->qy_unitcode;
		$mapf['od_rcdlid']=session('jxuser_id');
		$mapf['od_state']=8;
		$mapf['od_virtualstock']=0;
		$dlwodcount= $Orders->where($mapf)->count();
		if($dlwodcount){
		}else{
			$dlwodcount=0;
		}
		
 		//已取消od_status=9
		$mapy=array();
		$mapy['od_unitcode']=$this->qy_unitcode;
		$mapy['od_rcdlid']=session('jxuser_id');
		$mapy['od_state']=9;
		$mapy['od_virtualstock']=0;
		$dlyodcount= $Orders->where($mapy)->count();
		if($dlyodcount){
		}else{
			$dlyodcount=0;
		}
//		判断是否显示同区域发货按钮
//        $map20['dl_id']=session('jxuser_id');
//        $dealer=$Dealer->where($map20)->find();
//        if($dealer['dl_level']==1 && $dealer['dl_sz_sheng']!=0){
//            $show=1;
//        }
//        if($dealer['dl_level']==2 && $dealer['dl_sz_qu']!=0){
//            $show=1;
//        }
//        if($dealer['dl_sz_sheng']!=0&& $dealer['dl_sz_shi']!=0&&$dealer['dl_level']<3){
//                $show=1;
//        }else{
//            $show=0;
//        }

//        dump($show);die();
		$this->assign('mysodcount', $mysodcount);
		$this->assign('mymodcount', $mymodcount);
		$this->assign('myfodcount', $myfodcount);
		$this->assign('mywodcount', $mywodcount);
		$this->assign('myyodcount', $myyodcount);
		
		$this->assign('dlsodcount', $dlsodcount);
		$this->assign('dlmodcount', $dlmodcount);
		$this->assign('dlfodcount', $dlfodcount);
		$this->assign('dlwodcount', $dlwodcount);
		$this->assign('dlyodcount', $dlyodcount);
		
		$this->assign('od_type', $od_type);
		$this->assign('show', $show);
        $this->display('home');
		
	}
	
	
    //我的订单
    public function index(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
    
		$od_state=intval(I('get.od_state',0));
		$keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));
		
		
        $parameter=array();
		$parameter['od_state']=$od_state;
		$Orders = M('Orders');
		$map=array();
		$map['od_unitcode']=$this->qy_unitcode;
		$map['od_oddlid']=session('jxuser_id');
		
		if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);
            
            $keyword=sub_str($keyword,30,false);
            $where['od_orderid']=array('LIKE', ''.$keyword.'%');
            $where['od_contact']=array('LIKE', ''.$keyword.'%');
			$where['od_tel']=array('LIKE', ''.$keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
			
			$parameter['keyword']=$keyword;
			$od_state=999;
		}else{
			if($od_state==1 || $od_state==2){
				$map['od_state']=array('in','1,2');
			}else{
				$map['od_state']=$od_state;
			}
		}
        $map['od_virtualstock']=0;
		
		$count = $Orders->where($map)->count();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
		$list = $Orders->where($map)->order('od_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Shipment = M('Shipment');
		
		$imgpath = BASE_PATH.'/Public/uploads/product/';
        foreach($list as $k=>$v){
			//订单详细
			$odtotalqty=0; //订单总数量
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$this->qy_unitcode;
			$map2['oddt_odid']=$v['od_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
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
				
				//订购数量
				$oddt_totalqty=0; //总订购数
				$oddt_unitsqty=0; //每单位包装的数量
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
				
				$odtotalqty+=$oddt_totalqty; 
				
				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				//已发数量
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_oddtid']=$vv['oddt_id'];
				$map3['ship_dealer']=session('jxuser_id'); //出货接收方
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
			$list[$k]['orderdetail']=$data2;
			$list[$k]['odtotalqty']=$odtotalqty;
			//状态 我的订单状态 以fw_orders表为主
			if($v['od_state']==0){
				$list[$k]['od_state_str']='待确认';
			}else if($v['od_state']==1){
				$list[$k]['od_state_str']='待发货';
			}else if($v['od_state']==2){
				$list[$k]['od_state_str']='部分发货';
			}else if($v['od_state']==3){
				$list[$k]['od_state_str']='已发货';
			}else if($v['od_state']==8){
			    $list[$k]['od_state_str']='已完成';
			}else if($v['od_state']==9){
				$list[$k]['od_state_str']='已取消';
			}else{
				$list[$k]['od_state_str']='未知';
			}
			/*
			//允许操作
			$caozuostr='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/orderdetail?od_id='.$v['od_id'].'&od_state='.$od_state.'').'"  >订单详细</div> ';
			
			//上传凭证
			if($v['od_state']==0 || $v['od_state']==1){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/uploadpaypic?od_id='.$v['od_id'].'&od_state='.$od_state.'').'"  >上传凭证</div> ';
			}
			//取消订单
			if($v['od_state']==0){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/cancelmyorder?od_id='.$v['od_id'].'&od_state='.$od_state.'').'"  >取消订单</div> ';
			}
			//确认收货
			if($v['od_state']==3){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/confirmreceipt?od_id='.$v['od_id'].'&od_state='.$od_state.'').'"  >确认收货</div> ';
			}
			
			$list[$k]['caozuostr']=$caozuostr;
			
			*/
				
		}
		
		$this->assign('od_state', $od_state);
		$this->assign('page', $show);
		$this->assign('list', $list);
        $this->assign('od_state', $od_state);
        $this->display('index');
    }
	
	//取消我的订单
	public function cancelmyorder(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$od_state=intval(I('get.od_state',0));
		$Orders= M('Orders');
		$Orderlogs= M('Orderlogs');
		
		if($od_id>0){
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_oddlid']=session('jxuser_id');
			$map['od_id']=$od_id;
			$data=$Orders->where($map)->find();
			
			//只有待确认的订单才可以自己取消
			if($data['od_state']==0){
				$updata2=array();
				$updata2['od_state']=9;
				$Orders->where($map)->save($updata2);
				
				//处理付款信息
				//余额 设 无效

				$Balance= M('Balance');
				
				//取消订单款项
				$map2=array();
				$updata2=array();
				$map2['bl_unitcode']=$this->qy_unitcode;
				$map2['bl_type']=2;
				$map2['bl_sendid']=session('jxuser_id');
				$map2['bl_odid']=$od_id;
				$updata2['bl_state']=0;
				$Balance->where($map2)->save($updata2);

				//预付款 余额 设 无效 end

				//订单操作日志 begin
				$odlog_arr=array(
							'odlg_unitcode'=>$this->qy_unitcode,  
							'odlg_odid'=>$od_id,
							'odlg_orderid'=>$data['od_orderid'],
							'odlg_dlid'=>session('jxuser_id'),
							'odlg_dlusername'=>session('jxuser_username'),
							'odlg_dlname'=>session('jxuser_dlname'),
							'odlg_action'=>'取消订单',
							'odlg_type'=>1, //0-企业 1-经销商
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
				
				$this->redirect(C('MODULE_NAME').'/Orders/index/od_state/'.$data['od_state'].'','' , 0, '');
			}else{
				$this->error('该订单已处理，不能取消','',2);
			}
			
		}else{
			$this->error('没有该记录','',2);
		}
	}
	
	
	//确认收货-我的订单
	public function confirmreceipt(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$od_state=intval(I('get.od_state',10));

		$Orders= M('Orders');
		$Orderlogs= M('Orderlogs');
		
		if($od_id>0){
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_oddlid']=session('jxuser_id');
			$map['od_id']=$od_id;
			$data=$Orders->where($map)->find();
			
			//只有已发货的订单才能确认收货
			if($data['od_state']==3){
				$updata2=array();
				$updata2['od_state']=8;
				$Orders->where($map)->save($updata2);
				
				//处理付款信息
				//解冻返利 解冻款项

				$Balance= M('Balance');

				//订单款项
				$map2=array();
				$updata2=array();
				$map2['bl_unitcode']=$this->qy_unitcode;
				$map2['bl_type']=2;
				$map2['bl_sendid']=session('jxuser_id');
				$map2['bl_odid']=$od_id;
				
				$updata2['bl_state']=1;
				$Balance->where($map2)->save($updata2);
				

				//预付款 余额 设 有效 end
				//解冻返利 end
				
				//订单操作日志 begin
				$odlog_arr=array(
							'odlg_unitcode'=>$this->qy_unitcode,  
							'odlg_odid'=>$od_id,
							'odlg_orderid'=>$data['od_orderid'],
							'odlg_dlid'=>session('jxuser_id'),
							'odlg_dlusername'=>session('jxuser_username'),
							'odlg_dlname'=>session('jxuser_dlname'),
							'odlg_action'=>'确认收货',
							'odlg_type'=>1, //0-企业 1-经销商
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
				$this->redirect(C('MODULE_NAME').'/Orders/index/od_state/'.$data['od_state'].'','' , 0, '');
			}else{
				$this->error('该订单还没发货，不能确认收货','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		
		
	}
	
	//上传支付凭证
	public function uploadpaypic(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$od_state=intval(I('get.od_state',0)); //10为全部
		
		if($od_id>0){
			$Orders=M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_oddlid']=session('jxuser_id');
			$map['od_state']=array('in','0,1,2');
			$map['od_id']=$od_id;
			$data = $Orders->where($map)->find();
			if($data){
				$imgpath = BASE_PATH.'/Public/uploads/orders/';
				if(is_not_null($data['od_paypic']) && file_exists($imgpath.$data['od_paypic'])){
					$data['od_paypic_str']=__ROOT__.'/Public/uploads/orders/'.$data['od_paypic'];
				}else{
					$data['od_paypic_str']='';
				}
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		$this->assign('ordersinfo', $data);
		$this->assign('od_id', $od_id);
		$this->assign('od_state', $od_state);
		$this->display('uploadpaypic');
	}
	
	//通过localResizeIMG4压缩上传 临时保存图片文件 统一为jpeg
	public function uploadpic(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		
		$base64_image_content=$_POST['pic_file'];
		$img='';
		$type='jpeg'; //jpeg
		if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)){
			$img = base64_decode(str_replace($result[1], '', $base64_image_content)); //返回文件流
	    }
        $imgpath=BASE_PATH.'/Public/uploads/temp/';
		$filename=uniqid().mt_rand(100,999).'.'.$type;
		$tmp_file=$imgpath.$filename;
		if($img!=''){
			$im = imagecreatefromstring($img); //resource(2) of type (gd) 图像资源
			if($im !== false){
				$rs=imagejpeg ($im, $tmp_file); //图像流（image）以 JPEG 格式输出到标准输出(浏览器或者文件)
				if($rs !== false){
					$msg=array('stat'=>'0','filename'=>$filename);
					echo json_encode($msg);
					exit;
				}else{
					$msg=array('stat'=>'1','filename'=>'');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>'2','filename'=>'');
				echo json_encode($msg);
				exit;	
			}
		}else{
			$msg=array('stat'=>'3','filename'=>'');
			echo json_encode($msg);
			exit;
		}
	}
	
	
	//上传支付凭证 保存
	public function uploadpaypic_save(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('post.od_id',0));
		$od_state=intval(I('post.od_state',10));
		if($od_id>0){
			$Orders= M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$data = $Orders->where($map)->find();
			if($data){
				//保存文件 begin 
				$file_name=I('post.file_name','');
				
				if($file_name==''){
					$this->error('请上传图片','',2);
				}else{
					$imgpath=BASE_PATH.'/Public/uploads/orders/'.$this->qy_unitcode;
					$temppath=BASE_PATH.'/Public/uploads/temp/';
					if (!file_exists($imgpath)) {
						mkdir($imgpath);
					}
					
					if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
						$data2=array();
					    $data2['od_paypic']=$this->qy_unitcode.'/'.$file_name;
					    $rs=$Orders->where($map)->save($data2);
						if($rs){
							@unlink($imgpath.'/'.$data['od_paypic']); 
							@unlink($temppath.$file_name); 
						}
					}else{
                        $this->error('上传图片失败','',2);
					}
				}
				//保存文件 end
			    $this->redirect(C('MODULE_NAME').'/Orders/orderdetail?od_id='.$od_id.'&od_state='.$od_state.'','' , 0, '');

			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
	}
	
	//=========================================
    //代理预充yuchong的订单
    public function dlycorders(){
		exit;
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_state=intval(I('get.od_state',10));
		$back=intval(I('get.back',0)); //0订单、1我的
		$Orders=M('Orders');
		//下级代理的订单
        $dlsodcount=0;//待确定0
        $dlmodcount=0;//待发货1，2
        $dlfodcount=0;//已发货3
		//待确定od_status=0
		$mapdls=array();
		$mapdls['od_unitcode']=$this->qy_unitcode;
		$mapdls['od_oddlid']=session('jxuser_id');
		$mapdls['od_state']=0;
		$mapdls['od_virtualstock']=1;
		$dlsodcount= $Orders->where($mapdls)->count();
		//待发货od_status=array('in','1,2');
		$mapdlm=array();
		$mapdlm['od_unitcode']=$this->qy_unitcode;
		$mapdlm['od_oddlid']=session('jxuser_id');
		$mapdlm['od_virtualstock']=1;
		$mapdlm['od_state']=array('in','1,2');
		$dlmodcount= $Orders->where($mapdlm)->count();
		//已发货od_status=0
		$mapdlf=array();
		$mapdlf['od_unitcode']=$this->qy_unitcode;
		$mapdlf['od_oddlid']=session('jxuser_id');
		$mapdlf['od_virtualstock']=1;
		$mapdlf['od_state']=3;
		$dlfodcount= $Orders->where($mapdlf)->count();


		$mapdl=array();
		$mapdl['od_unitcode']=$this->qy_unitcode;
		$mapdl['od_oddlid']=session('jxuser_id');
		$mapdl['od_virtualstock']=1;

		$count =$Orders->where($mapdl)->count();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
		$list =$Orders->where($mapdl)->field('od_id,od_state,od_orderid,od_total,od_addtime')->order('od_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Shipment = M('Shipment');
		$imgpath = BASE_PATH.'/Public/uploads/product/';
		foreach($list as $k=>$v){
			//订单详细
			$odtotalqty=0; //订单总数量
			$list[$k]['od_shipall']=0; //是否已全出货
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$this->qy_unitcode;
			$map2['oddt_odid']=$v['od_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
				$data3=$Product->where($map3)->field('pro_id,pro_pic')->find();
				if($data3){
					if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
						$data2[$kk]['oddt_propic']=$data3['pro_pic'];
					}else{
						$data2[$kk]['oddt_propic']='';
					}
				}else{
					$data2[$kk]['oddt_propic']='';
				}
				
				//订购数量
				$oddt_totalqty=0; //总订购数
				$oddt_unitsqty=0; //每单位包装的数量
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
				
				$odtotalqty+=$oddt_totalqty; 

				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				//已发数量
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_deliver']=session('jxuser_id'); //发货方
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
				//已全部出货
				if (intval($data2[$kk]['oddt_shipqty'])>=intval($oddt_totalqty))
				{
					$list[$k]['od_shipall']=1;
				}
			}
			$list[$k]['odtotalqty']=$odtotalqty;
			$list[$k]['odoneself']=1;
			$list[$k]['orderdetail']=$data2;
			//状态 我的订单状态 以fw_orders表为主
			if($v['od_state']==0){
				$list[$k]['od_state_str']='待确认';
			}else if($v['od_state']==1){
				$list[$k]['od_state_str']='待发货';
			}else if($v['od_state']==2){
				$list[$k]['od_state_str']='部分发货';
			}else if($v['od_state']==3){
				$list[$k]['od_state_str']='已发货';
			}else if($v['od_state']==8){
			    $list[$k]['od_state_str']='已完成';
			}else if($v['od_state']==9){
				$list[$k]['od_state_str']='已取消';
			}else{
				$list[$k]['od_state_str']='未知';
			}
		}

		// var_dump($list);
		// exit;

		$this->assign('dlsodcount', $dlsodcount);
		$this->assign('dlmodcount', $dlmodcount);
		$this->assign('dlfodcount', $dlfodcount);
		$this->assign('dlcodcount', $dlcodcount);

	
		$this->assign('list', $list);
        $this->assign('od_state', $od_state);
        $this->assign('back', $back); 
        $this->assign('page', $show);
        $this->display('dlycorders');
    }

	//我的订单详细
	public function orderdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$ly_status=intval(I('get.ly_status',0));

		if($od_id>0){
			$Dealer=M('Dealer');
			$Orders=M("Orders");
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$data =$Orders->where($map)->find();
			if($data){

				//订单产品详细
				$odtotalqty=0; //订单总数量
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment = M('Shipment');
				$Express = M('Express');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$this->qy_unitcode;
				$map2['oddt_odid']=$data['od_id'];

				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$imgpath = BASE_PATH.'/Public/uploads/product/';
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$this->qy_unitcode;
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
					$odtotalqty+=$oddt_totalqty;

					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_dealer']=session('jxuser_id'); //出货接收方
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
				$data['odtotalqty']=$odtotalqty;
				$data['orderdetail']=$data2;

				//下单代理信息
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['od_oddlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
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
				//接单代理
				if($data['od_rcdlid']>0){
					$map3=array();
					$data3=array();
					$map3['dl_id']=$data['od_rcdlid'];
					$map3['dl_unitcode']=$this->qy_unitcode;
					$data3=$Dealer->where($map3)->find();
					if($data3){
						$data['od_rcdl_name']='姓名：'.$data3['dl_name'];
						$data['od_rcdl_tel']=$data3['dl_tel'];
						$data['od_rcdl_weixin']=$data3['dl_weixin'];
					}else{
						$data['od_rcdl_name']='';
						$data['od_rcdl_tel']='';
						$data['od_rcdl_weixin']='';
					}
				}else{
					$data['od_rcdl_name']='总公司';
					$data['od_rcdl_tel']='';
					$data['od_rcdl_weixin']='';
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
					$data['od_paypic_str']=__ROOT__.'/Public/uploads/orders/'.$data['od_paypic'];
				}else{
					$data['od_paypic_str']='';
				}
				//快递物流
				if($data['od_express']>0){
				    $map3=array();
					$data3=array();
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
				
				//操作日志
				$Orderlogs= M('Orderlogs');
				$map2=array();
				$map2['odlg_unitcode']=$this->qy_unitcode;
				$map2['odlg_odid']=$od_id;

				$logs = $Orderlogs->where($map2)->order('odlg_addtime DESC')->limit(50)->select();
				foreach($logs as $kkk=>$vvv){
					if($vvv['odlg_type']==0){
						 $logs[$kkk]['odlg_dlname']='总公司';
					}
				}
			
			}else{
				$this->error('没有该记录2','',2);
			}
		}else{
			$this->error('没有该记录1','',2);
		}
		
		$this->assign('orderlogs', $logs);
		$this->assign('ordersinfo', $data);
		$this->assign('od_state', $data['od_state']);
		$this->assign('od_id', $od_id);
		$this->display('orderdetail');
	}
	
	//=========================================
    //下级代理的订单
    public function dlorders(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
    
		$od_state=intval(I('get.od_state',0));
		$keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));
		
		
        $parameter=array();
		$parameter['od_state']=$od_state;
		$Orders = M('Orders');
		$map=array();
		$map['od_unitcode']=$this->qy_unitcode;
		$map['od_rcdlid']=session('jxuser_id');
		
		if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);
            
            $keyword=sub_str($keyword,30,false);
            $where['od_orderid']=array('LIKE', ''.$keyword.'%');
            $where['od_contact']=array('LIKE', ''.$keyword.'%');
			$where['od_tel']=array('LIKE', ''.$keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
			
			$parameter['keyword']=$keyword;
			$od_state=999;
		}else{
			if($od_state==1 || $od_state==2){
				$map['od_state']=array('in','1,2');
			}else{
				$map['od_state']=$od_state;
			}
		}
        $map['od_virtualstock']=0;
		
		$count = $Orders->where($map)->count();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
		$list = $Orders->where($map)->order('od_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Shipment = M('Shipment');
		
		$imgpath = BASE_PATH.'/Public/uploads/product/';
        foreach($list as $k=>$v){
			//订单详细
			$odtotalqty=0; //订单总数量
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$this->qy_unitcode;
			$map2['oddt_odid']=$v['od_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
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
				
				//订购数量
				$oddt_totalqty=0; //总订购数
				$oddt_unitsqty=0; //每单位包装的数量
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
				
				$odtotalqty+=$oddt_totalqty; 
				
				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				//已发数量
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_oddtid']=$vv['oddt_id'];
				$map3['ship_dealer']=session('jxuser_id'); //出货接收方
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
				
				if($v['od_state']==1 || $v['od_state']==2 || $v['od_state']==3){
					if($oddt_totalqty>0){
						if($oddt_totalqty>$data3){
							$data2[$kk]['oddt_canship']=1;
						}else{
							$data2[$kk]['oddt_canship']=0;
						}
					}else{

						$data2[$kk]['oddt_canship']=0;
					}
				}else{
					$data2[$kk]['oddt_canship']=0;
				}
			}
			
			$list[$k]['orderdetail']=$data2;
			$list[$k]['odtotalqty']=$odtotalqty;
			//状态 我的订单状态 以fw_orders表为主
			if($v['od_state']==0){
				$list[$k]['od_state_str']='待确认';
			}else if($v['od_state']==1){
				$list[$k]['od_state_str']='待发货';
			}else if($v['od_state']==2){
				$list[$k]['od_state_str']='部分发货';
			}else if($v['od_state']==3){
				$list[$k]['od_state_str']='已发货';
			}else if($v['od_state']==8){
			    $list[$k]['od_state_str']='已完成';
			}else if($v['od_state']==9){
				$list[$k]['od_state_str']='已取消';
			}else{
				$list[$k]['od_state_str']='未知';
			}
			

			/*
			//允许操作
			$caozuostr='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/dlorderdetail?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >订单详细</div> ';
			
			//确认订单
			if($v['odbl_state']==0){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/canceldlorder?state=1&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >确认订单</div> ';
			}
		    //取消订单
 			if($v['odbl_state']==0 || $v['odbl_state']==1 ){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/canceldlorder?state=9&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >取消订单</div> ';
			}
			$list[$k]['caozuostr']=$caozuostr;
			*/
				
		}
		
		$this->assign('od_state', $od_state);
		$this->assign('page', $show);
		$this->assign('list', $list);
        $this->assign('od_state', $od_state);

        $this->display('dlorders');
    }

    //=========================================
    //代理的订单搜索
    public function dlorderssearch(){
		exit;
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		//$search_type=intval(I('get.search_type',0)); //0、出货 1、提货 2、预充
		$keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));

		$Orders=M('Orders');
		$mapdl=array();
		$parameter=array();
		$dl_id='';
        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);

            $keyword=sub_str($keyword,20,false);
   //          $where['od_id']=array('LIKE', '%'.$keyword.'%');
   //          $where['dladd_address']=array('LIKE', '%'.$keyword.'%');
			// $where['dladd_tel']=array('LIKE', '%'.$keyword.'%');
			$where['od_orderid']=array('EQ',$keyword);
				$parameterdl=array();
				$map=array();
				$Dealer=M('Dealer');
				$map['dl_unitcode']=$this->qy_unitcode;
				$map['dl_status']=1;
				$wheredl['dl_weixin']=array('EQ',$keyword);
				$wheredl['dl_tel']=array('EQ',$keyword);
            	$wheredl['_logic'] = 'or';
            	$map['_complex'] = $wheredl;
 				$data = $Dealer->where($map)->find();
				if ($data)
				{
					$dl_id=$data['dl_id'];
				}
			if ($dl_id!='')
				$where['od_oddlid']=array('EQ',$dl_id);
            $where['_logic'] = 'or';
            $mapdl['_complex'] = $where;		
        }
		
        // $map['dladd_unitcode']=session('unitcode');
        // $Dladdress = M('Dladdress');
        // $count = $Dladdress->where($map)->count();
        // $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        // $show = $Page->show();
        // $list = $Dladdress->where($map)->order('dladd_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		$mapdl['od_unitcode']=$this->qy_unitcode;
		$mapdl['od_rcdlid']=session('jxuser_id');
		$list =$Orders->where($mapdl)->field('od_id,od_state,od_orderid,od_total,od_addtime')->order('od_addtime DESC')->limit(100)->select();
		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Shipment = M('Shipment');
		$imgpath = BASE_PATH.'/Public/uploads/product/';
		foreach($list as $k=>$v){
			//订单详细
			$odtotalqty=0; //订单总数量
			$list[$k]['od_shipall']=0; //是否已全出货
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$this->qy_unitcode;
			$map2['oddt_odid']=$v['od_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
				$data3=$Product->where($map3)->field('pro_id,pro_pic')->find();
				if($data3){
					if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
						$data2[$kk]['oddt_propic']=$data3['pro_pic'];
					}else{
						$data2[$kk]['oddt_propic']='';
					}
				}else{
					$data2[$kk]['oddt_propic']='';
				}
				
				//订购数量
				$oddt_totalqty=0; //总订购数
				$oddt_unitsqty=0; //每单位包装的数量
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
				
				$odtotalqty+=$oddt_totalqty; 

				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				//已发数量
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_deliver']=session('jxuser_id'); //发货方
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
				//已全部出货
				if (intval($data2[$kk]['oddt_shipqty'])>=intval($oddt_totalqty))
				{
					$list[$k]['od_shipall']=1;
				}
			}
			$list[$k]['odtotalqty']=$odtotalqty;
			$list[$k]['odoneself']=1;
			$list[$k]['orderdetail']=$data2;
			//状态 我的订单状态 以fw_orders表为主
			if($v['od_state']==0){
				$list[$k]['od_state_str']='待确认';
			}else if($v['od_state']==1){
				$list[$k]['od_state_str']='待发货';
			}else if($v['od_state']==2){
				$list[$k]['od_state_str']='部分发货';
			}else if($v['od_state']==3){
				$list[$k]['od_state_str']='已发货';
			}else if($v['od_state']==8){
			    $list[$k]['od_state_str']='已完成';
			}else if($v['od_state']==9){
				$list[$k]['od_state_str']='已取消';
			}else{
				$list[$k]['od_state_str']='未知';
			}
		}

		$this->assign('list', $list);
        $this->assign('od_state', $od_state);
        $this->display('dlorderssearch');
    }
	
   //取消、确认下家订单
	public function canceldlorder(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

		$od_id=intval(I('get.od_id',0));
		$state=intval(I('get.state',0));
		
		if($state==1){
			$state=1;
			$odlg_action='确认订单';
		}else if($state==9){
			$state=9;
			$odlg_action='取消订单';
		}else{
			$this->error('无该操作权限','',2);
		}
		
		$Orders= M('Orders');
		$Orderlogs= M('Orderlogs');
		$Shipment= M('Shipment');
		
		if($od_id>0){
			//修改订单关系表状态
            $Orders=M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=session('jxuser_id');
			$data = $Orders->where($map)->find();
			if($data){
				//只有待确认、待发货的订单才能取消 确认
				if($data['od_state']==0 || $data['od_state']==1){
					//是否有出货记录 如有则不能取消
                    $map3=array();
					$data3=array();
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_odid']=$od_id;
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->find();
					if($data3){
						 $this->error('该订单已有出货记录，不能取消','',2);
					}
			
					//修改原始订单状态
					$updata=array();
					$updata['od_state']=$state;
					$Orders->where($map)->save($updata);
		
					//订单操作日志 begin
					$odlog_arr=array(
						'odlg_unitcode'=>$this->qy_unitcode,  
						'odlg_odid'=>$od_id,
						'odlg_orderid'=>$data['od_orderid'],
						'odlg_dlid'=>session('jxuser_id'),
						'odlg_dlusername'=>session('jxuser_username'),
						'odlg_dlname'=>session('jxuser_dlname'),
						'odlg_action'=>$odlg_action,
						'odlg_type'=>1, //0-企业 1-经销商
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
					

					$this->redirect(C('MODULE_NAME').'/Orders/dlorders/od_state/'.$data['od_state'].'','' , 0, '');

				}else{
				    $this->error('该订单已处理，不能取消','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
		}else{
			$this->error('没有该记录','',2);
		}
	
	}
	
	//下家的订单详细
	public function dlorderdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		
		if($od_id>0){
			$Orders=M('Orders');
			$map=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$map['od_rcdlid']=session('jxuser_id');
			$data =$Orders->where($map)->find();
			if($data){
				//订单产品详细
				$odtotalqty=0; //订单总数量
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment= M('Shipment');
				$Dealer= M('Dealer');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$this->qy_unitcode;
				$map2['oddt_odid']=$data['od_id'];
				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$imgpath = BASE_PATH.'/Public/uploads/product/';
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$this->qy_unitcode;
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

					$odtotalqty+=$oddt_totalqty;

					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_odid']=$vv['oddt_odid'];
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
	
					//出货按钮

					if($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==3){
						
						if($oddt_totalqty>0){
							if($oddt_totalqty>$data3){
								$data2[$kk]['oddt_shipment']=1;
							}else{
								$data2[$kk]['oddt_shipment']=0;
							}
						}else{
							if($vv['oddt_qty']>$data3){
								$data2[$kk]['oddt_shipment']=1;
							}else{
								$data2[$kk]['oddt_shipment']=0;
							}
						}
					}else{
						$data2[$kk]['oddt_shipment']=0;
					}
					
				}

				$data['odtotalqty']=$odtotalqty;
				$data['orderdetail']=$data2;
				
				//下单代理信息
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['od_oddlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
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
				
				//接单代理
				if($data['od_rcdlid']>0){
					$map3=array();
					$data3=array();
					$map3['dl_id']=$data['od_rcdlid'];
					$map3['dl_unitcode']=$this->qy_unitcode;
					$data3=$Dealer->where($map3)->find();
					if($data3){
						$data['od_rcdl_name']='姓名：'.$data3['dl_name'];
						$data['od_rcdl_tel']=$data3['dl_tel'];
						$data['od_rcdl_weixin']=$data3['dl_weixin'];
					}else{
						$data['od_rcdl_name']='';
						$data['od_rcdl_tel']='';
						$data['od_rcdl_weixin']='';
					}
				}else{
					$data['od_rcdl_name']='总公司';
					$data['od_rcdl_tel']='';
					$data['od_rcdl_weixin']='';
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
					$data['od_paypic_str']=__ROOT__.'/Public/uploads/orders/'.$data['od_paypic'];
				}else{
					$data['od_paypic_str']='';
				}
				
				
				// //允许操作

				
				//操作日志
				$Orderlogs= M('Orderlogs');
				$map2=array();
				$map2['odlg_unitcode']=$this->qy_unitcode;
				$map2['odlg_odid']=$od_id;

				$logs = $Orderlogs->where($map2)->order('odlg_addtime DESC')->limit(50)->select();
				foreach($logs as $kkk=>$vvv){
					if($vvv['odlg_type']==0){
						 $logs[$kkk]['odlg_dlname']='总公司';
					}
				}
			
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		


		$this->assign('orderlogs', $logs);

		$this->assign('od_state', $data['od_state']);
		$this->assign('ordersinfo', $data);
		$this->assign('od_id', $od_id);
		$this->display('dlorderdetail');
	}
	
	//完成发货
	public function odfinishship(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$action=I('post.action','');
		
		
		if($action=='save'){
			$od_id=intval(I('post.od_id',0));
			$od_state=intval(I('post.od_state',10));
			
			if($od_id>0){
				$od_express=intval(I('post.od_express',0));
				$od_expressnum=I('post.od_expressnum','');
				$od_remark=I('post.od_remark','');
			    if($od_express<=0){
					$msg=array('stat'=>0,'msg'=>'请选择物流快递');
					echo json_encode($msg);
					exit;
				}
				
				$Orders=M('Orders');
				$map=array();
				$map['od_unitcode']=$this->qy_unitcode;
				$map['od_id']=$od_id;
				$map['od_rcdlid']=session('jxuser_id');
				$data =$Orders->where($map)->find();
				if($data){
					//检测是否能发货 //订购数 发货数
					$Orderdetail = M('Orderdetail');
					$Shipment = M('Shipment');
					$map2=array();
					$oddetail=array();
					$map2['oddt_unitcode']=$this->qy_unitcode;
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

						//发货数
						$map3=array();
						$data3=array();
						$map3['ship_pro']=$vv['oddt_proid'];
						$map3['ship_unitcode']=$this->qy_unitcode;
						$map3['ship_odid']=$vv['oddt_odid'];
						$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
						$data3=$Shipment->where($map3)->sum('ship_proqty');
						if($data3){
							if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
								$msg=array('stat'=>0,'msg'=>'该订单还没完成出货');
								echo json_encode($msg);
								exit;
							}

                            if( $oddt_totalqty<$data3){
								$msg=array('stat'=>0,'msg'=>'该订单出货的数量大于订购数量');
								echo json_encode($msg);
								exit;
							}
						}else{
							$msg=array('stat'=>0,'msg'=>'该订单还没完成出货');
							echo json_encode($msg);
							exit;
						}
					}
				}else{
					$msg=array('stat'=>0,'msg'=>'该订单记录不存在');
					echo json_encode($msg);
					exit;
				}
				
				
				//写入物流信息
				$map2=array();
				$updata2=array();
				$map2['od_unitcode']=$this->qy_unitcode;
				$map2['od_id']=$od_id;
				
				$updata2['od_express']=$od_express;
				$updata2['od_expressnum']=$od_expressnum;
				$updata2['od_dealremark']=$od_remark;
				if($data['od_express']<=0){
				    $updata2['od_expressdate']=time();
				}
				$Orders->where($map2)->save($updata2);
				

				// //修改原始订单状态

				$map2=array();
				$updata2=array();
				$map2['od_unitcode']=$this->qy_unitcode;
				$map2['od_id']=$od_id;
				$updata2['od_state']=3;
				$Orders->where($map2)->save($updata2);
					
				if($data['od_express']<=0){

					//订单返利 begin
					$fanli_dlid1=0; //返利给的代理商1
					$fanli_dlid2=0; //返利给的代理商2
					
					$fanli_dlname1='';
					$fanli_dlname2='';
					
					$fanli_dlusername1='';
					$fanli_dlusername2='';
					
					$Dealer = M('Dealer');
					$Fanlidetail = M('Fanlidetail');
					//下单人
					$map3=array();
					$orderdealer=array();
					$map3['dl_unitcode'] = $this->qy_unitcode;
					$map3['dl_id'] = $data['od_oddlid'];  //下单的代理
					$orderdealer=$Dealer->where($map3)->find();
					if($orderdealer){
						$Profanli= M('Profanli');
						$map2=array();
						$map2['pfl_unitcode'] = $this->qy_unitcode;
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
							
							/*
							if($orderdealer['dl_referee']>0){
								
								//下单代理的推荐人 如果正常并与发货人不同 则返利
								$map4=array();
								$data4=array();
								$map4['dl_unitcode'] = $this->qy_unitcode;
								$map4['dl_id'] = $orderdealer['dl_referee'];  //下单代理的推荐人
								$map4['dl_status'] = 1;
								
								$data4=$Dealer->where($map4)->find();
								if($data4){
									//如果推荐人和发货人不相同 则都返利给推荐人
									if(session('jxuser_id')!=$data4['dl_id']){
										
										//前2级 同级推荐有返利
										if($orderdealer['dl_level'] == $data4['dl_level'] && ($orderdealer['dl_level']==1 || $orderdealer['dl_level']==2)){
											//
											$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
											$fanli_dlname1=$data4['dl_name'];
											$fanli_dlusername1=$data4['dl_username'];
											//推荐人的推荐人
											if($data4['dl_referee']>0){
												$map6=array();
												$data6=array();
												$map6['dl_unitcode'] = $this->qy_unitcode;
												$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
												$map6['dl_status'] = 1;
												$data6=$Dealer->where($map6)->find();
												if($data6){
													//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 并同级
													if(session('jxuser_id') != $data6['dl_id']){
														if($data4['dl_type']==$data6['dl_type']){
															$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
															$fanli_dlname2=$data6['dl_name'];
															$fanli_dlusername2=$data6['dl_username'];
														}
													}
												}
											}
												
										}
									}
								}
								
					
								//写入返利数据
								if($fanli_dlid1>0){									
									foreach($oddetail as $kk=>$vv){
										$map7=array();
										$data7=array();
										$map7['pfl_unitcode'] = $this->qy_unitcode;
										$map7['pfl_proid'] = $vv['oddt_proid'];
										$map7['pfl_dltype'] = $orderdealer['dl_type'];
										$map7['pfl_fanli1'] = array('GT',0);
										$data7=$Profanli->where($map7)->find();
										//如果订单产品有设置返利 1层
										if($data7){
											if($data7['pfl_fanli1']>0){
												$map8=array();
												$data8=array();
												$map8['fl_unitcode'] = $this->qy_unitcode;
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
													$data5['fl_unitcode'] = $this->qy_unitcode;
													$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
													$data5['fl_senddlid'] = session('jxuser_id'); //上家发放返利
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
											$map7['pfl_unitcode'] = $this->qy_unitcode;
											$map7['pfl_proid'] = $vv['oddt_proid'];
											$map7['pfl_dltype'] = $orderdealer['dl_type'];
											$map7['pfl_fanli2'] = array('GT',0);
											$data7=$Profanli->where($map7)->find();
											if($data7){
												if($data7['pfl_fanli2']>0){
													$map8=array();
													$data8=array();
													$map8['fl_unitcode'] = $this->qy_unitcode;
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
														$data5['fl_unitcode'] = $this->qy_unitcode;
														$data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
														$data5['fl_senddlid'] = session('jxuser_id'); //发放返利的代理
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
							*/
					    }

					}
					//返利 end
					
					//订单操作日志 begin
					$odlog_arr=array(
								'odlg_unitcode'=>$this->qy_unitcode,  
								'odlg_odid'=>$od_id,
								'odlg_orderid'=>$data['od_orderid'],
								'odlg_dlid'=>session('jxuser_id'),
								'odlg_dlusername'=>session('jxuser_username'),
								'odlg_dlname'=>session('jxuser_dlname'),
								'odlg_action'=>'完成发货',
								'odlg_type'=>1, //0-企业 1-经销商
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
				
				$msg=array('stat'=>1,'msg'=>'物流信息提交成功');
				echo json_encode($msg);
				exit;
			}else{
				$msg=array('stat'=>0,'msg'=>'该订单记录不存在');
				echo json_encode($msg);
				exit;
			}
		}else{
			$od_id=intval(I('get.od_id',0));
			$od_state=intval(I('get.od_state',0));
			
			if($od_id>0){
				$Orders=M('Orders');
				$map=array();
				$map['od_unitcode']=$this->qy_unitcode;
				$map['od_id']=$od_id;
				$map['od_rcdlid']=session('jxuser_id');
				$data =$Orders->where($map)->find();
				if($data){
					//检测是否能发货 //订购数 发货数
					$Orderdetail = M('Orderdetail');
					$Shipment = M('Shipment');
					$map2=array();
					$data2=array();
					$map2['oddt_unitcode']=$this->qy_unitcode;
					$map2['oddt_odid']=$od_id;
					$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();

					foreach($data2 as $kk=>$vv){
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


						//发货数
						$map3=array();
						$data3=array();
						$map3['ship_pro']=$vv['oddt_proid'];
						$map3['ship_unitcode']=$this->qy_unitcode;
						$map3['ship_odid']=$vv['oddt_odid'];
						$map3['ship_oddtid']=$vv['oddt_id'];
						$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
						$data3=$Shipment->where($map3)->sum('ship_proqty');
						if($data3){
							if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
								$this->error('该订单还没完成出货','',2);
								exit;
							}
							if( $oddt_totalqty<$data3){
								$this->error('该订单出货的数量大于订购数量','',2);
								exit;
							}
						}else{
							$this->error('该订单还没完成出货','',2);
							exit;
						}
					}

                    if($data['od_express']<=0){
						$title='确认完成发货';
					}else{
						$title='确认修改物流';
					}

				}else{
					$this->error('没有该记录','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
			//物流快递
			$Express = M('Express');
			$map=array();
			$expresslist = $Express->where($map)->order('exp_addtime DESC')->select();
			
			
			$this->assign('title', $title);
			$this->assign('expresslist', $expresslist);
			$this->assign('ordersinfo', $data);
			$this->assign('od_id', $od_id);
			$this->assign('od_state', $od_state);
			
			$this->display('odfinishship');
		}
	}
	
	
	//按订单出货扫码 
	public function odshipscan(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		
		
		if($od_id>0&& $oddt_id>0){
            //对应订单
			$Orders=M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$order = $Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
					$this->error('该订单暂不能出货','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$Product= M('Product');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$this->qy_unitcode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$data = $Orderdetail->where($map)->find();
			if($data){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$data['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
				$data3=$Product->where($map3)->find();
				if($data3){
					if(is_not_null($data3['pro_pic'])){
						$data['oddt_propic']=$data3['pro_pic'];
					}else{
						$data['oddt_propic']='';
					}
				}else{
					$data['oddt_propic']='';
				}
				
				
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
				
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
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
                // $data['oddt_proname']=$data['oddt_proname']." ".$data['oddt_color'].$data['oddt_size'];
					
				//统计扫描纪录 已扫产品数量 session 保存json数据
				$brcodestr=session('jxodbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					
					if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
					}

					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
				}
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_WXAPPID'), C('QY_WXAPPSECRET'),C('QY_WXAPPTEMPNAME'));
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('oddt_id', $oddt_id);
		$this->assign('success', $success);
		$this->assign('jishu', 1);
		$this->assign('list', $brcodearr);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		$this->assign('ordersinfo', $data);
		$this->display('odshipscan');
	}
	
	
	//代理商按订单出货扫描结果
    public function odshipscanres(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$brcode=I('get.brcode','');
		
		$msg='';
		$success=0;
		if($brcode==''){
			$msg='条码不能为空';
			goto gotoEND;
            exit;
		}
		$barr=explode(',',$brcode);
		$brcode=end($barr);
        if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
			$msg='条码信息不正确';
			goto gotoEND;
            exit;
        }
		
		if($od_id>0&& $oddt_id>0){
            //对应订单
			$Orders=M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$order =$Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
					$this->error('该订单暂不能出货','',2);
				}
			}else{
				$this->error('该订单记录不存在','',2);
			}
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$Product= M('Product');
			$map=array();
			$oddetail=array();
			$map['oddt_unitcode']=$this->qy_unitcode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$oddetail = $Orderdetail->where($map)->find();
			if($oddetail){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$oddetail['oddt_proid'];
				$map3['pro_unitcode']=$this->qy_unitcode;
				$data3=$Product->where($map3)->find();
				if($data3){
					if(is_not_null($data3['pro_pic'])){
						$oddetail['oddt_propic']=$data3['pro_pic'];
					}else{
						$oddetail['oddt_propic']='';
					}
				}else{
					$oddetail['oddt_propic']='';
				}
				
				
				//订购数 
				$oddt_totalqty=0;  //要发的总数
				$oddt_unitsqty=0;  //一个包装里的产品数
				if($oddetail['oddt_prodbiao']>0){
					$oddt_unitsqty=$oddetail['oddt_prodbiao'];
					
					if($oddetail['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
					}
					
					if($oddetail['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
				}else{
					$oddt_totalqty=$oddetail['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
					$oddetail['oddt_totalqty']='';
				}else{
					$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				 $oddetail['oddt_proname']=$oddetail['oddt_proname'].$oddetail['oddt_color'].$oddetail['oddt_size'];
				 
				//发货数
				$Shipment= M('Shipment');
				$map3=array();
				$shipproqty=0;
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_oddtid']=$oddetail['oddt_id'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
				if($shipproqty){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
					}else{
						$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
				
				//统计扫描纪录 已扫产品数量 session 保存json数据
				$brcodestr=session('jxodbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
					}
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
				}
				//判断出货的数量是否等于订购数量
				if($oddt_totalqty<=($scanprocount+$shipproqty)){
					$msg='已扫产品数量已够';
					goto gotoEND;
					exit;
				}
				
				//检测该条码是否属于该经销商1
				$map=array();
				$data=array();
				$Chaibox= M('Chaibox');
				$barcode=array();
				
				$map['ship_unitcode']=$this->qy_unitcode;
				$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
				$map['ship_barcode'] = $brcode;
				$map['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
				$map3['ship_oddtid']=$oddetail['oddt_id'];
				$data=$Shipment->where($map)->find();
				if($data){
					//检测该条码是否已被使用1
					$map2=array();
					$map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_barcode'] = $brcode;
					$map2['ship_deliver']=session('jxuser_id');
					
					$data2=$Shipment->where($map2)->find();
					if($data2){
						$msg='条码 <b>'.$brcode.'</b> 已出货';
						goto gotoEND;
						exit;
					}else{
						$barcode['code']=$data['ship_barcode'];
						$barcode['tcode']=$data['ship_tcode'];
						$barcode['ucode']=$data['ship_ucode'];
						$barcode['qty']=$data['ship_proqty'];
						$barcode['pro']=$data['ship_pro'];
						$barcode['shipnumber']=$data['ship_number'];
						$barcode['pro_name']=$oddetail['oddt_proname'];
					}
					
					//判断出货的数量是否等于订购数量 加上正在扫的
					if($oddt_totalqty<($scanprocount+$shipproqty+$barcode['qty'])){
						$msg='扫码产品数量超出订购数';
						goto gotoEND;
						exit;
					}
				}else{
					//检测是否已发行
					$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
					
					if(!is_not_null($barcode)){
						$msg='条码 <b>'.$brcode.'</b> 不存在或还没发行';
						goto gotoEND;
						exit;
					}
					$barcode['pro_name']=$oddetail['oddt_proname'];
					
					//判断出货的数量是否等于订购数量 加上正在扫的
					if($oddt_totalqty<($scanprocount+$shipproqty+$barcode['qty'])){
						$msg='扫码产品数量超出订购数';
						goto gotoEND;
						exit;
					}
					

					//检测该条码是否属于该经销商2
					$map=array();
					$where=array();
					
					//tcode-  中标    ucode-大标   code--当前条码
					if($barcode['code']!=''){
						$where[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
						$where[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
						$where[]=array('EQ',$barcode['ucode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
						$where[]=array('EQ',$barcode['ucode']);
					}				
					
					$where[]='or';
					$map['ship_barcode'] = $where;
					$map['ship_unitcode']=$this->qy_unitcode;
					$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$map['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
					$map3['ship_oddtid']=$oddetail['oddt_id'];
					$data=$Shipment->where($map)->find();
					if(is_not_null($data)){
						//检测该条码是否已被使用2
						$map2=array();
						$where2=array();

						if($barcode['code']!=''){
							$where2[]=array('EQ',$barcode['code']);
						}
						if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
							$where2[]=array('EQ',$barcode['tcode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
							$where2[]=array('EQ',$barcode['ucode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
							$where2[]=array('EQ',$barcode['ucode']);
						}
						
						
						$where2[]='or';
						$map2['ship_barcode'] = $where2;
						$map2['ship_unitcode']=$this->qy_unitcode;
						$map2['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
						$map3['ship_oddtid']=$oddetail['oddt_id'];
						$data2=$Shipment->where($map2)->find();
						if($data2){
							$msg='条码 <b>'.$brcode.'</b> 已出货';
							goto gotoEND;
							exit;
						}	
						$barcode['pro']=$data['ship_pro'];
						$barcode['shipnumber']=$data['ship_number'];
					}else{
						$msg='对不起，你没有条码 <b>'.$brcode.'</b> 操作权限，或该条码产品与发货产品不对应';
						$barcode=array();
						goto gotoEND;
						exit;
					}	
				}
				
				//检测是否拆箱
				$map2=array();
				$map2['chai_unitcode']=$this->qy_unitcode;
				$map2['chai_barcode'] = $brcode;
				$map2['chai_deliver'] = session('jxuser_id'); //ship_deliver--出货方   ship_dealer--收货方
				$data2=$Chaibox->where($map2)->find();
				if($data2){
					$msg='条码 <b>'.$brcode.'</b> 已经拆箱，不能再使用';
					$barcode=array();
					goto gotoEND;
					exit;
				}
				
				if(is_not_null($barcode)){
					
					//暂存session
					$brcodestr=session('jxodbrcode');
					$brcodearrall=array();
					if(is_not_null($brcodestr)){
						$brcodearrall=json_decode($brcodestr,true);
						if(json_last_error()!=0){
							$this->error('JSON ERROR','',2);
							exit; 
						}
						if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
							$brcodearr=array();
						}else{
							$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
						}
						if(array_key_exists(strval($brcode),$brcodearr)===false){
							
							if($barcode['tcode']=='' && $barcode['ucode']==''){
								if(array_key_exists(strval($brcode),$brcodearr)===false){
									$brcodearr[strval($brcode)]=$barcode['qty'];
								}else{
									$msg='条码 <b>'.$brcode.'</b> 的小标条码已在扫描记录里';
									$barcode=array();
									goto gotoEND;
									exit;
								}
							}else{
								if($barcode['ucode']==$barcode['tcode']){
									if(array_key_exists(strval($barcode['tcode']),$brcodearr)===false){	
										if(array_key_exists(strval($brcode),$brcodearr)===false){
											$brcodearr[strval($brcode)]=$barcode['qty'];
										}else{
											$msg='条码 <b>'.$brcode.'</b> 的小标条码已在扫描记录里';
											$barcode=array();
											goto gotoEND;
											exit;
										}
										
									}else{
										$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
										$barcode=array();
										goto gotoEND;
										exit;
									}
								}else{
									if(array_key_exists(strval($barcode['ucode']),$brcodearr)===false  && array_key_exists(strval($barcode['tcode']),$brcodearr)===false){
										$brcodearr[strval($brcode)]=$barcode['qty'];
									}else{
										$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
										$barcode=array();
										goto gotoEND;
										exit;
									}
								}
							}
							
						}else{
							$msg='条码 <b>'.$brcode.'</b> 已在扫描记录里';
							$barcode=array();
							goto gotoEND;
							exit;
						}
					}else{
						$brcodearr[strval($brcode)]=$barcode['qty'];
					}
					$brcodearrall[strval($od_id.$oddt_id)]=$brcodearr;
					$brcodestr=json_encode($brcodearrall);
					session('jxodbrcode',$brcodestr); 
					
					$msg='条码 <b>'.$brcode.'</b> 扫描成功!';
					$success=1;
				}else{
					$msg='对不起，你没有条码 <b>'.$brcode.'</b> 操作权限';
					$barcode=array();
					goto gotoEND;
					exit;
				}

			}else{
				$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
                exit;
			}
		}else{
			$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
            exit;
		}

		/////////////
		gotoEND:
		
	    //统计扫描纪录
		$brcodestr=session('jxodbrcode');

		$scancount=0; //已扫标签数
		$scanprocount=0; //已扫产品数
		if(is_not_null($brcodestr)){
			$brcodearrall=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
			if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
				$brcodearr=array();
			}else{
				$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
			}
			foreach($brcodearr as $k=>$v){
				if(intval($v)>0){
					$scancount=$scancount+1;
					$scanprocount=$scanprocount+intval($v);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_WXAPPID'), C('QY_WXAPPSECRET'),C('QY_WXAPPTEMPNAME'));
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('oddt_id', $oddt_id);
		
		$this->assign('ordersinfo', $oddetail);
		$this->assign('msg', $msg);
		$this->assign('brcode', $brcode);
		$this->assign('success', $success);
		$this->assign('barinfo', $barcode);
		$this->assign('jishu', 1);
        $this->assign('list', $brcodearr);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
        // $this->display('odshipscanres');
        $this->display('odshipscan');
	}
	
	//扫描记录
	public function odshipscanlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		
		if($od_id>0 && $oddt_id>0){
			
			//统计扫描纪录
			$brcodestr=session('jxodbrcode');

			$scancount=0; //已扫标签数
			$scanprocount=0; //已扫产品数
			if(is_not_null($brcodestr)){
				$brcodearrall=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
				if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
					$brcodearr=array();
				}else{
					$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
				}
				
				foreach($brcodearr as $k=>$v){
					if(intval($v)>0){
						$scancount=$scancount+1;
						$scanprocount=$scanprocount+intval($v);
					}else{
						unset($brcodearr[$k]);
					}
				}
				
				if(count($brcodearr)<=0){
					$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
				}
			}else{
				$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
				
			}
			
            //对应订单
			$Orders= M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$order = $Orders->where($map)->find();
			if($order){
				if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
					$this->error('该订单暂不能出货',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
				}
			}else{
				$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$this->qy_unitcode;
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
				
				$data['oddt_proname']=$data['oddt_proname'].$data['oddt_color'].$data['oddt_size'];
				
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
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
				$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
			}
		}else{
			$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
		}
		
		
			
		$Jssdk = new \Org\Util\Jssdk(C('QY_WXAPPID'), C('QY_WXAPPSECRET'),C('QY_WXAPPTEMPNAME'));
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('oddt_id', $oddt_id);
		
		$this->assign('ordersinfo', $data);
		$this->assign('jishu', 1);
        $this->assign('list', $brcodearr);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
        $this->display('odshipscanlist');
	}
	
   //扫描记录-移除
    public function odshipremove(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$brcode=I('get.brcode','');
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		if($od_id>0 && $oddt_id>0){
			$msg='';
			if($brcode==''){
				$this->error('没有该扫描纪录','',2);
			}

			if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
				$this->error('没有该扫描纪录','',2);
			}
			
			$brcodestr=session('jxodbrcode');

			if(is_not_null($brcodestr)){
				$brcodearrall=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
				if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
					$brcodearr=array();
				}else{
					$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
				}
				
				foreach($brcodearr as $k=>$v){
					if(intval($v)>0){
					}else{
						unset($brcodearr[$k]);
					}
				}
				unset($brcodearr[strval($brcode)]);
				
				$brcodearrall[strval($od_id.$oddt_id)]=$brcodearr;
				$brcodestr=json_encode($brcodearrall);
				session('jxodbrcode',$brcodestr); 
			}
			
			$this->success('移除成功',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),1);
			
		}else{
			$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
		}
	}
	
	
    //确认出货
    public function odshipping(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$step=intval(I('get.step',0));
		
		if($od_id>0 && $oddt_id>0){

			if($step==1){  //确认出货
				//统计扫描纪录
				$brcodestr=session('jxodbrcode');
				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
					}
					
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
					
					if(count($brcodearr)<=0){
						$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
				}
				
				//对应订单
				$Orders=M('Orders');
				$map=array();
				$order=array();
				$map['od_unitcode']=$this->qy_unitcode;
				$map['od_id']=$od_id;
				$order =$Orders->where($map)->find();
				if($order){
					if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
						$this->error('该订单暂不能出货',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
					}
				}else{
					$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
				}
				$ship_dealer=$order['od_oddlid']; //收货的经销商
				$od_orderid=$order['od_orderid'];
				unset($order);	
				//对应产品
				$Orderdetail= M('Orderdetail');
				$Shipment= M('Shipment');
				$Chaibox= M('Chaibox');
				
				$map=array();
				$oddetail=array();
				$map['oddt_unitcode']=$this->qy_unitcode;
				$map['oddt_id']=$oddt_id;
				$map['oddt_odid']=$od_id;
				$oddetail = $Orderdetail->where($map)->find();
				if($oddetail){
					//订购数 发货数
					$oddt_totalqty=0;  //要发的总数
					$oddt_unitsqty=0;  //一个包装里的产品数
					if($oddetail['oddt_prodbiao']>0){
						$oddt_unitsqty=$oddetail['oddt_prodbiao'];
						
						if($oddetail['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
						}
						
						if($oddetail['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
					}else{
						$oddt_totalqty=$oddetail['oddt_qty'];
					}
					
					if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
						$oddetail['oddt_totalqty']='';
					}else{
						$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$oddetail['oddt_proname']=$oddetail['oddt_proname'].$oddetail['oddt_color'].$oddetail['oddt_size'];

					$map3=array();
					$shipproqty=0;  //已发的产品数
					$map3['ship_pro']=$oddetail['oddt_proid'];
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_odid']=$oddetail['oddt_odid'];
					$map3['ship_oddtid']=$oddetail['oddt_id'];
					$map3['ship_dealer']=$ship_dealer; //出货接收方
					$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
					if($shipproqty){
						if($oddt_unitsqty>0){
							$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
						}else{
							$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
						}
					}else{
						$oddetail['oddt_shipqty']=0;
					}
					
					//判断出货的数量是否等于订购数量
					if($oddt_totalqty<($scanprocount+$shipproqty)){
						$this->error('扫码产品数量超出订购数',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
				}
				
				//验证经销商
				$Dealer = M('Dealer');
				$map2=array();
				$map2['dl_id']=$ship_dealer;
				$map2['dl_status']=1;
				$dealerinfo=$Dealer->where($map2)->find();
				if($dealerinfo){
					$dealerinfo['dl_name']=wxuserTextDecode2($dealerinfo['dl_name']);
				}else{
					$this->error('下单代理商已被停用','',2);
				}
				
				//保存出货记录
				$ship_time=time();
				$brcarr=array();
				$kk=0;
				$success=0;
				$fail=0;
				foreach($brcodearr as $key=>$v){ 
				
					$brcode=$key;
					if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
							
					//检测该条码是否属于该经销商1
					$map=array();
					$data=array();
					$barcode=array();
					$map['ship_unitcode']=$this->qy_unitcode;
					$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$map['ship_barcode'] = $brcode;
					$map['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
					$data=$Shipment->where($map)->find();
					if($data){
						//检测该条码是否已被使用1
						$map2=array();
						$data2=array();
						$map2['ship_unitcode']=$this->qy_unitcode;
						$map2['ship_barcode'] = $brcode;
						$map2['ship_deliver']=session('jxuser_id');
								
						$data2=$Shipment->where($map2)->find();
						if($data2){
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
							$brcarr[$kk]['qty']=0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}else{
							$barcode['code']=$data['ship_barcode'];
							$barcode['tcode']=$data['ship_tcode'];
							$barcode['ucode']=$data['ship_ucode'];
							$barcode['qty']=$data['ship_proqty'];
							$barcode['pro']=$data['ship_pro'];
							$barcode['shipnumber']=$data['ship_number'];
						}
					}else{
						//检测是否已发行
						$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
								
						if(!is_not_null($barcode)){
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码不存在或还没发行</span>';
							$brcarr[$kk]['qty']=0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}
								
						//检测该条码是否属于该经销商2
						$map=array();
						$where=array();
						$data=array();
						
						if($barcode['code']!=''){
							$where[]=array('EQ',$barcode['code']);
						}
						if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
							$where[]=array('EQ',$barcode['tcode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
							$where[]=array('EQ',$barcode['ucode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
							$where[]=array('EQ',$barcode['ucode']);
						}
						
						
						$where[]='or';
						$map['ship_barcode'] = $where;
						$map['ship_unitcode']=$this->qy_unitcode;
						$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
						$map['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
						$data=$Shipment->where($map)->find();
						if(is_not_null($data)){
							//检测该条码是否已被使用2
							$map2=array();
							$where2=array();
							$data2=array();
							
							if($barcode['code']!=''){
								$where2[]=array('EQ',$barcode['code']);
							}
							if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
								$where2[]=array('EQ',$barcode['tcode']);
							}
							if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
								$where2[]=array('EQ',$barcode['ucode']);
							}
							if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
								$where2[]=array('EQ',$barcode['ucode']);
							}
							
							
							$where2[]='or';
							$map2['ship_barcode'] = $where2;
							$map2['ship_unitcode']=$this->qy_unitcode;
							$map2['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
							$map2['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
							$data2=$Shipment->where($map2)->find();
							if($data2){
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
								$brcarr[$kk]['qty']=$barcode['qty'];
								$kk=$kk+1;
								$fail=$fail+1;
								continue;
							}
							$barcode['pro']=$data['ship_pro'];
							$barcode['whid']=$data['ship_whid'];
							$barcode['shipnumber']=$data['ship_number'];
						}else{
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限，或该条码产品与发货产品不对应</span>';
							$brcarr[$kk]['qty']=$barcode['qty'];
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}
					}
					//检测是否拆箱
					$map2=array();
					$data2=array();
					$map2['chai_unitcode']=$this->qy_unitcode;
					$map2['chai_barcode'] = $brcode;
					$map2['chai_deliver'] = session('jxuser_id');
					$data2=$Chaibox->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已经拆箱，不能再使用</span>';
						$brcarr[$kk]['qty']=$barcode['qty'];
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
					//保存记录
					if(is_not_null($barcode)){
						$insert=array();
						$insert['ship_unitcode']=$this->qy_unitcode;
						$insert['ship_number']=$od_orderid;  //如果按订单发货 这里放订单号
						$insert['ship_deliver']=session('jxuser_id');  //ship_deliver--出货方
						$insert['ship_dealer']=$ship_dealer;   //ship_dealer--收货方
						$insert['ship_pro']=$barcode['pro'];
						$insert['ship_odid']=$od_id;  //订单id
						$insert['ship_oddtid']=$oddt_id; //订单详细id
						$insert['ship_whid']=$barcode['whid'];
						$insert['ship_proqty']=$barcode['qty'];
						$insert['ship_barcode']=$brcode;
						$insert['ship_date']=$ship_time;
						$insert['ship_ucode']=$barcode['ucode'];
						$insert['ship_tcode']=$barcode['tcode'];
						$insert['ship_remark']=$oddetail['oddt_proname'];
						$insert['ship_cztype']=2;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
						$insert['ship_czid']=session('jxuser_id');
						$insert['ship_czuser']=session('jxuser_username');

						$rs=$Shipment->create($insert,1);
						if($rs){
						   $result = $Shipment->add(); 
						   if($result){
								//记录拆箱
								if($barcode['ucode']!='' && $barcode['tcode']==$barcode['ucode']){
									$insert2=array();
									$data3=array();
									$insert2['chai_unitcode']=$this->qy_unitcode;
									$insert2['chai_barcode']=$barcode['ucode'];
									$insert2['chai_deliver']=session('jxuser_id');
									$data3=$Chaibox->where($insert2)->find();
									if(!$data3){
										$insert2['chai_addtime']=$ship_time;
										$Chaibox->create($insert2,1);
										$Chaibox->add(); 
									}
								}
								
								if($barcode['ucode']!='' && $barcode['tcode']!=$barcode['ucode']){
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$this->qy_unitcode;
									$insert3['chai_barcode']=$barcode['tcode'];
									$insert3['chai_deliver']=session('jxuser_id');
									$data4=$Chaibox->where($insert3)->find();
									if(!$data4){
										$insert3['chai_addtime']=$ship_time;
										$Chaibox->create($insert3,1);
										$Chaibox->add(); 
									}	
									
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$this->qy_unitcode;
									$insert3['chai_barcode']=$barcode['ucode'];
									$insert3['chai_deliver']=session('jxuser_id');
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
											'log_qyid'=>session('jxuser_id'),
											'log_user'=>session('jxuser_username'),
											'log_qycode'=>$this->qy_unitcode,
											'log_action'=>'经销商出货',
											'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
											'log_addtime'=>time(),
											'log_ip'=>real_ip(),
											'log_link'=>__SELF__,
											'log_remark'=>json_encode($insert)
											);
								save_log($log_arr);
								//记录日志 end
								
								
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='添加条码 <b>'.$brcode.' </b> 成功。';
								$brcarr[$kk]['qty']=$barcode['qty'];
								$kk=$kk+1;
								$success=$success+1;
								continue;
							}else{
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
								$brcarr[$kk]['qty']=0;
								$kk=$kk+1;
								$fail=$fail+1;
								continue;
							}
						}else{
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
							$brcarr[$kk]['qty']=0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}	
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
				}
				session('jxodbrcode',null);
				
				//重新计算已发的产品数
				$map3=array();
				$shipproqty=0;  //已发的产品数
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_oddtid']=$oddetail['oddt_id'];
				$map3['ship_dealer']=$ship_dealer; //出货接收方
				$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
				if($shipproqty){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
					}else{
						$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
				
				$this->assign('od_id', $od_id);
				$this->assign('oddt_id', $oddt_id);
				$this->assign('fail', $fail);
				$this->assign('success', $success);
				
				$this->assign('ordersinfo', $oddetail);
				$this->assign('list', $brcarr);
				$this->assign('dealerinfo', $dealerinfo);
				
				$this->display('odshipping2');
				
			}else{         
				//统计扫描纪录
				$brcodestr=session('jxodbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$oddt_id)];
					}
					
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
					
					if(count($brcodearr)<=0){
						$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('没有扫描纪录',U(C('MODULE_NAME').'/Orders/odshipscan/od_id/'.$od_id.'/oddt_id/'.$oddt_id.''),2);
				}
				
				//对应订单
				$Orders= M('Orders');
				$map=array();
				$order=array();
				$map['od_unitcode']=$this->qy_unitcode;
				$map['od_id']=$od_id;

				$order = $Orders->where($map)->find();
				if($order){
					if($order['od_state']!=1 && $order['od_state']!=2 && $order['od_state']!=3){
						$this->error('该订单暂不能出货',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
					}
				}else{
					$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
				}
				
				
				//对应产品
				$Orderdetail= M('Orderdetail');
				$map=array();
				$data=array();
				$map['oddt_unitcode']=$this->qy_unitcode;
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
					
					$data['oddt_proname']=$data['oddt_proname'].$data['oddt_color'].$data['oddt_size'];
					
					$Shipment= M('Shipment');
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$data['oddt_proid'];
					$map3['ship_unitcode']=$this->qy_unitcode;
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
					$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
				}
				
				$this->assign('od_id', $od_id);
				$this->assign('oddt_id', $oddt_id);
				
				$this->assign('ordersinfo', $data);
				$this->assign('jishu', 1);
				$this->assign('list', $brcodearr);
				$this->assign('scancount', $scancount);
				$this->assign('scanprocount', $scanprocount);
				$this->display('odshipping1');
			}
		}else{
			$this->error('该订单记录不存在',U(C('MODULE_NAME').'/Orders/dlorders/od_state/1'),2);
		}
	}	
	
	//经销商出货记录
    public function odshiplist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$back=intval(I('get.back',0));
		$isdetail=intval(I('get.isdetail',0));
		
		
		if($od_id>0 && $oddt_id>0){
            //对应订单
			$Orders=M('Orders');
			$map=array();
			$order=array();
			$map['od_unitcode']=$this->qy_unitcode;
			$map['od_id']=$od_id;
			$order =$Orders->where($map)->find();
			if($order){
				$od_state=$order['od_state'];
				$od_oddlid=$order['od_oddlid']; //下单
				$od_rcdlid==$order['od_rcdlid']; //接单
			}else{
				$this->error('没有该记录','',2);
			}
			if($od_oddlid==session('jxuser_id')){
				$ismyod=1;
			}else{
				$ismyod=0;
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$Shipment= M('Shipment');
			$oddetail=array();
			$map=array();
			$map['oddt_unitcode']=$this->qy_unitcode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$oddetail = $Orderdetail->where($map)->find();
			if($oddetail){
				//订购数 
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($oddetail['oddt_prodbiao']>0){
					$oddt_unitsqty=$oddetail['oddt_prodbiao'];
					
					if($oddetail['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
					}
					
					if($oddetail['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
				}else{
					$oddt_totalqty=$oddetail['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
					$oddetail['oddt_totalqty']='';
				}else{
					$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				//发货数
				$map3=array();
				$data3=0;
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$this->qy_unitcode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_oddtid']=$oddetail['oddt_id'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($data3/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$data3.'件)';
					}else{
						$oddetail['oddt_shipqty']=$data3.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
			//对应订单的出货记录
			$Dealer= M('Dealer');
			$Product= M('Product');

			//出货记录
			$map=array();
			$parameter=array();
			$map['ship_unitcode']=$this->qy_unitcode;
			if($od_oddlid==session('jxuser_id')){
				$map['ship_dealer']=session('jxuser_id');//ship_deliver--出货方   ship_dealer--收货方
			}else{
				$map['ship_deliver']=session('jxuser_id');//ship_deliver--出货方   ship_dealer--收货方
			}
			$map['ship_odid']=$od_id;
			$map['ship_pro']=$oddetail['oddt_proid'];

			$count = $Shipment->where($map)->count();
			$Page = new \Think\Page($count,50,$parameter);
			$show = $Page->show();
			if($show=='<div>    </div>'){
				$show='';
			}
			$list = $Shipment->where($map)->order('ship_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
			foreach($list as $k=>$v){
                //出货方
	            $list[$k]['ship_dealer_from']=$v['ship_deliver'];    //出货方
				$list[$k]['ship_date_from']=$v['ship_date'];  

				
				if($list[$k]['ship_dealer_from']==''){
					$list[$k]['ship_dealer_from_name']='';
				}else if($list[$k]['ship_dealer_from']==0){
					$list[$k]['ship_dealer_from_name']='总公司';
				}else{
					if($v['ship_deliver']==session('jxuser_id')){
						$list[$k]['ship_dealer_from_name']='我';
					}else{
						$map2=array();
						$map2['dl_id']=$v['ship_deliver'];
						$map2['dl_unitcode']=$this->qy_unitcode;
						$data2=$Dealer->where($map2)->find();
						if($data2){
							$list[$k]['ship_dealer_from_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
						}else{
							$list[$k]['ship_dealer_from_name']='';
						}
					}
				}
				
				//对应发给的经销商
				if($v['ship_dealer']==session('jxuser_id')){
					$list[$k]['ship_dealer_name']='我';
				}else{
					$map2=array();
					$map2['dl_id']=$v['ship_dealer']; //收货方
					$map2['dl_unitcode']=$this->qy_unitcode;
					$data2=$Dealer->where($map2)->find();
					if($data2){
						$list[$k]['ship_dealer_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
					}else{
						$list[$k]['ship_dealer_name']='';
					}
				}

			
			}

			//对应的产品
			$map2=array();
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_id'] = $oddetail['oddt_proid'];
			$Proinfo = $Product->where($map2)->find();
			if($Proinfo){
				$oddetail['oddt_propic']=$Proinfo['pro_pic'];
			}else{

				$oddetail['oddt_propic']='';
			}
			
			
		}else{
            $this->error('没有该记录','',1);
		}
		

		$this->assign('ismyod', $ismyod);
		$this->assign('od_id', $od_id);
		$this->assign('oddt_id', $oddt_id);
		$this->assign('od_state', $od_state);
		$this->assign('isdetail', $isdetail);
		$this->assign('back', $back);
        $this->assign('ordersinfo', $oddetail);
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);	
        $this->display('odshiplist');
		
	}	
    
	//出货记录详细
    public function odshipdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
        $shid=intval(I('get.shid',0));
		
		$map=array();
		$map['ship_id']=$shid;
		$map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_deliver']=session('jxuser_id');
		$Shipment= M('Shipment');
		$data=$Shipment->where($map)->find();
		if($data){
			$Dealer= M('Dealer');
			$Product = M('Product');
			//上级经销商信息
			$brcode=$data['ship_barcode'];
            $map2=array();
			$map2['ship_unitcode']=$this->qy_unitcode;
			$map2['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
			$map2['ship_barcode'] = $brcode;
			$data2=$Shipment->where($map2)->find();
		    if($data2){
                $data['ship_dealer_from']=$data2['ship_deliver'];  
				$data['ship_date_from']=$data2['ship_date'];  
		    }else{
				//检测是否已发行
				$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
				
				if(!is_not_null($barcode)){
					$data['ship_dealer_from']='';
					$data['ship_date_from']='';
				}else{
					$map3=array();
					$where3=array();
					if($barcode['code']!=''){
						$where3[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
						$where3[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
						$where3[]=array('EQ',$barcode['ucode']);
					}
					$where3[]='or';
					$map3['ship_barcode'] = $where3;
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$data3=$Shipment->where($map3)->find();
					if(is_not_null($data3)){
                        $data['ship_dealer_from']=$data3['ship_deliver'];  
				        $data['ship_date_from']=$data3['ship_date'];
					}else{
					    $data['ship_dealer_from']='';
					    $data['ship_date_from']='';
					}
				}
		    }
			if($data['ship_dealer_from']==''){
				$data['ship_dealer_from_name']='';
			}else if($data['ship_dealer_from']==0){
				$data['ship_dealer_from_name']='总公司';
			}else{
				$map2=array();
				$map2['dl_id']=$data['ship_dealer_from'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['ship_dealer_from_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
				}else{
					$data['ship_dealer_from_name']='';
				}
			}
			
			//对应发给的经销商
		    $map2=array();
		    $map2['dl_id']=$data['ship_dealer'];
		    $map2['dl_unitcode']=$this->qy_unitcode;
		    $map2['dl_belong']=session('jxuser_id');
		    $data2=$Dealer->where($map2)->find();
			if($data2){
				$data['ship_dealer_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
			}else{
			    $data['ship_dealer_name']='';
			}
			//对应的产品
            $map2=array();
            $map2['pro_unitcode']=$this->qy_unitcode;
            $map2['pro_id'] = $data['ship_pro'];
            $Proinfo = $Product->where($map2)->find();
            if($Proinfo){
                $data['ship_pro_name']=$Proinfo['pro_name'];
				$data['ship_pro_number']=$Proinfo['pro_number'];
				$data['ship_pro_pic']=$Proinfo['pro_pic'];
            }else{
                $data['ship_pro_name']='';
				$data['ship_pro_number']='';
				$data['ship_pro_pic']='';
            }
		}else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('od_id', $od_id);
		$this->assign('oddt_id', $oddt_id);
        $this->assign('shipinfo', $data);
        $this->display('odshipdetail');
	}	
	
    //经销商删除出货记录 只有下级经销商没有处理的条码才可以删除
    public function odshdelete(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$od_id=intval(I('get.od_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
        $shid=intval(I('get.shid',0));

		$map=array();
		$map['ship_id']=$shid;
		$map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
		$Shipment= M('Shipment');
		$data=$Shipment->where($map)->find();
        //判断是否可删 保持数据完整性

        if($data){
			//如果确认收货 对应订单
			$Orders=M('Orders');
			$map2=array();
			$order=array();
			$map2['od_unitcode']=$this->qy_unitcode;
			$map2['od_id']=$data['ship_odid'];
			$order =$Orders->where($map2)->find();
			if($order){
				if($order['od_state']==3){
					$this->error('该出货记录对应订单已发货，暂不能删除','',2);
				}
				if($order['od_state']==8){
					$this->error('该出货记录对应订单已确认收货，暂不能删除','',2);
				}
			}else{
				$this->error('该出货记录对应订单记录不存在，暂不能删除','',2);
			}
			
            //如果下级经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$this->qy_unitcode;
            $map2['ship_deliver']=$date['ship_dealer'];

            $where=array();
			
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);

            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
               $this->error('该出货记录已被下级经销商重新出货，暂不能删除','',2);
            }
			
            $Chaibox= M('Chaibox');
            //判断处理拆箱记录
            if($data['ship_tcode']!='' || $data['ship_ucode']!=''){

				if($data['ship_ucode']!='' &&  $data['ship_tcode']==$data['ship_ucode']){	
                    $map2=array();
                    $map2['ship_ucode']=$data['ship_ucode'];
                    $map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_deliver']=session('jxuser_id');  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_ucode'];
                        $map3['chai_unitcode']=$this->qy_unitcode;
						$map3['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['ship_ucode']!=''  &&  $data['ship_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['ship_tcode']=$data['ship_tcode'];
                    $map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_deliver']=session('jxuser_id');  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_tcode'];
                        $map3['chai_unitcode']=$this->qy_unitcode;
						$map3['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['ship_ucode']=$data['ship_ucode'];
                    $map22['ship_unitcode']=$this->qy_unitcode;
					$map22['ship_deliver']=session('jxuser_id');  
                    $map22['ship_id'] = array('NEQ',$data['ship_id']);
                    $data22=$Shipment->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['ship_ucode'];
                        $map33['chai_unitcode']=$this->qy_unitcode;
						$map33['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map33)->delete(); 
                    }
                }
            }
            $Shipment->where($map)->delete(); 
			
			
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('jxuser_id'),
						'log_user'=>session('jxuser_username'),
                        'log_qycode'=>$this->qy_unitcode,
                        'log_action'=>'经销商删除出货记录',
						'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
			$this->success('删除成功',U(C('MODULE_NAME').'/Orders/odshiplist?od_id='.$od_id.'&oddt_id='.$oddt_id.''),2);
        }else{
            $this->error('没有该记录','',2);
        }     
    }
  
	//=========================================
	//订货产品
	public function prolist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}

		$map = array();
        $Product = M('Product');
        $map['pro_unitcode']=$this->qy_unitcode;
        $map['pro_active']=1;
        $count = $Product->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Product->where($map)->order('pro_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        
		$Proprice = M('Proprice');
        foreach($list as $k=>$v){ 
		    //代理价
			$map=array();
			$data=array();
			$map['pri_proid']=$v['pro_id'];
			$map['pri_unitcode']=$this->qy_unitcode;
			$map['pri_dltype']=$dl_type;
			$data=$Proprice->where($map)->find();
			
            if($data){
                $list[$k]['pro_dlprice']=$data['pri_price'];
            }else{
                $list[$k]['pro_dlprice']='';
            }
			
        }

        $this->assign('list', $list);
        $this->assign('page', $show);
	
		$this->display('prolist');
	}
	
	//订货产品详细
	public function prodetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		
		$map=array();
		$data=array();
		$map['pro_id']=intval(I('get.pro_id',0));
        $map['pro_unitcode']=$this->qy_unitcode;
        $map['pro_active']=1;
        $Product = M('Product');
		$data=$Product->where($map)->find();
		if($data){
		    //代理价
			$map2=array();
			$data2=array();
			$map2['pri_proid']=$data['pro_id'];
			$map2['pri_unitcode']=$this->qy_unitcode;
			$map2['pri_dltype']=$dl_type;
			$Proprice = M('Proprice');
			$data2=$Proprice->where($map2)->find();
            if($data2){
                $data['pro_dlprice']=$data2['pri_price'];
            }else{
                $data['pro_dlprice']='';
            }
			
			$data['pro_pic_str']='<img src="'.__ROOT__.'/Public/uploads/product/'.$data['pro_pic'].'"  border="0" style="width:100%" >';
			
			
			//颜色尺码
			$Yifuattr = M('Yifuattr');
			$map2=array();
			$map2['attr_unitcode']=$this->qy_unitcode;
			$map2['attr_proid'] = $data['pro_id'];
			$colorlist = $Yifuattr->where($map2)->field('attr_color')->group('attr_color')->select();
			foreach($colorlist as $k=>$v){
				$map3=array();
				$map3['attr_unitcode']=$this->qy_unitcode;
				$map3['attr_proid'] = $data['pro_id'];
				$map3['attr_color'] = $v['attr_color'];
				$data3 = $Yifuattr->where($map3)->field('attr_size')->group('attr_size')->select();
				$sizestr='';
				foreach($data3 as $kk=>$vv){
					if($sizestr==''){
						$sizestr='|'.trim($vv['attr_size']).'|';
					}else{
						$sizestr.=trim($vv['attr_size']).'|';
					}
				}
				$colorlist[$k]['sizes']=$sizestr;
			}
			
			
			$map2=array();
			$map2['attr_unitcode']=$this->qy_unitcode;
			$map2['attr_proid'] = $data['pro_id'];
			$sizelist = $Yifuattr->where($map2)->field('attr_size')->group('attr_size')->select();
			
			foreach($sizelist as $k=>$v){
				$map3=array();
				$map3['attr_unitcode']=$this->qy_unitcode;
				$map3['attr_proid'] = $data['pro_id'];
				$map3['attr_size'] = $v['attr_size'];
				$data3 = $Yifuattr->where($map3)->field('attr_color')->group('attr_color')->select();
				
				$colorstr='';
				foreach($data3 as $kk=>$vv){
					if($colorstr==''){
						$colorstr='|'.trim($vv['attr_color']).'|';
					}else{
						$colorstr.=trim($vv['attr_color']).'|';
					}
				}
				$sizelist[$k]['colors']=$colorstr;
			}
			
			
			$wvsh='100%';//滚图宽高比
			$imgpath = BASE_PATH.'/Public/uploads/product/';
			if(is_not_null($data['pro_pic']) && file_exists($imgpath.$data['pro_pic'])){
				$arr=getimagesize($imgpath.$adlist[0]['ad_pic']);
				if(false!=$arr){
					$w=$arr[0];
					$h=$arr[1];
					$wvsh=(($h/$w)*100).'%';
				}
			}
			
			$this->assign('wvsh', $wvsh);
		}else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('colorlist', $colorlist);
		$this->assign('sizelist', $sizelist);
		$this->assign('proinfo', $data);
		
		$this->display('prodetail');
	}
	
	//购物车
	public function shopcart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
			$dl_belong=$data['dl_belong'];
			$dl_level=$data['dl_level'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		
		if($dl_level>4){
			$this->error('对不起，合伙人以上才允许下单','',1);
		}
		
        $Shopcart = M('Shopcart');
		
		//删除24小时前的没下单的购物车记录
		$map2=array();
		$map2['sc_unitcode']=$this->qy_unitcode;
		$map2['sc_dlid']=session('jxuser_id');
		$map2['sc_addtime']=array('ELT',(time()-3600*24));
		$Shopcart->where($map2)->delete(); 
		

		$map=array();
        $map['sc_unitcode']=$this->qy_unitcode;
        $map['sc_dlid'] = session('jxuser_id');
        $data = $Shopcart->where($map)->order('sc_addtime DESC')->select();
		
		$Product = M('Product');
		$Proprice = M('Proprice');
		$total=0;//总费用
		$totalqty=0; //总件数量
		$allcheck=true; //是否全选
		foreach($data as $k=>$v){
			$map2=array();
			$data2=array();
			$map2['pro_id']=$v['sc_proid'];
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_active']=1;
			
			//产品
			$data2=$Product->where($map2)->find();
			if($data2){
				$data[$k]['pro_name']=$data2['pro_name'];
				$data[$k]['pro_pic']=$data2['pro_pic'];
				$data[$k]['pro_price']=$data2['pro_price'];
				$data[$k]['pro_stock']=$data2['pro_stock'];
				
				//代理价
				$map3=array();
				$data3=array();
				$map3['pri_proid']=$data2['pro_id'];
				$map3['pri_unitcode']=$this->qy_unitcode;
				$map3['pri_dltype']=$dl_type;

				$data3=$Proprice->where($map3)->find();
				if($data3){
					$data[$k]['pro_dlprice']=$data3['pri_price'];
					$data[$k]['pri_minimum']=$data3['pri_minimum'];
				}else{
					$data[$k]['pro_dlprice']='';
					$data[$k]['pri_minimum']=0;
				}
	
				
				 if ($v['sc_status']==1)
				{
					$allcheck=false;	
				}else
				{

					//总件数量
					$sc_totalqty=0; //总订购数
					$pro_unitsqty=0; //每单位包装的数量
					if($vv['oddt_prodbiao']>0){
						$pro_unitsqty=$vv['oddt_prodbiao'];
						if($vv['oddt_prozbiao']>0){
							$pro_unitsqty=$pro_unitsqty*$vv['oddt_prozbiao'];
						}
					
						if($vv['oddt_proxbiao']>0){
							$pro_unitsqty=$pro_unitsqty*$vv['oddt_proxbiao'];
						}	
						$sc_totalqty=$pro_unitsqty*$v['sc_qty'];
					}else{
						$sc_totalqty=$v['sc_qty'];
					}
					$totalqty+=$sc_totalqty;
					


					//总价格
					$total=$total+$data[$k]['pro_dlprice']*$v['sc_qty'];
				}
				
			}else{
				$data[$k]['pro_name']='';
				$data[$k]['pro_pic']='';
				$data[$k]['pro_price']='';
				$data[$k]['pro_dlprice']='';
				$data[$k]['pro_stock']='';
			}
			//移除没有代理价的购物记录
			if($data[$k]['pro_dlprice']==''){
				$map3=array();
				$map3['sc_unitcode']=$this->qy_unitcode;
				$map3['sc_dlid']=session('jxuser_id');
				$map3['sc_id']=$v['sc_id'];
				$Shopcart->where($map3)->delete();
			}
			
		}
		
		//合伙人 如果订购一定数量 则优惠
		/*
		if($dl_level==1){
			$dldiscount=C('DLPRICE_DISCOUNT');
			
			if(isset($dldiscount['num']) && $totalqty >=$dldiscount['num'] && isset($dldiscount['discount'])){
				
				$total=0;
				foreach($data as $kk=>$vv){
					if($vv['pro_dlprice']>=$dldiscount['discount']){
					    $data[$kk]['pro_dlprice']=$vv['pro_dlprice']-$dldiscount['discount'];
					    $total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}else{
						$total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}
				}
			}
		}
		*/
		
		
		

		$this->assign('dl_belong', $dl_belong);
		$this->assign('allcheck', $allcheck);
		$this->assign('totalqty', $totalqty);
		$this->assign('total', $total);
		$this->assign('shopcartlist', $data);
		
		$this->display('shopcart');
		
	}
	
	//添加入购物车
	public function addshopcart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		
		$pro_id=intval(I('param.pro_id',0));
		$qty=intval(I('param.qty',1));
		$color=trim(I('param.color',''));
		$size=trim(I('param.size',''));
		$attr_id=0;
		
		if($pro_id<=0){
			$this->error('没有该记录','',2);
		}
		
		if($color!=''){
			 //颜色尺码是否存在
			 $map2=array();
			 $map2['attr_unitcode']=$this->qy_unitcode;
			 $map2['attr_proid']=$pro_id;
			 $map2['attr_color']=$color;
			 $map2['attr_size']=$size;
			 $Yifuattr = M('Yifuattr');
			 $data2=$Yifuattr->where($map2)->find();
			 if($data2){
				$attr_id=$data2['attr_id'];
			 }else{
				$this->error('选择颜色不存在','',2);
			 }
		}
		
		$map=array();
		$data=array();
		$map['pro_id']=$pro_id;
        $map['pro_unitcode']=$this->qy_unitcode;
        $map['pro_active']=1;
        $Product = M('Product');
		$data=$Product->where($map)->find();
		if($data){
		    //代理价
			$map2=array();
			$data2=array();
			$map2['pri_proid']=$data['pro_id'];
			$map2['pri_unitcode']=$this->qy_unitcode;
			$map2['pri_dltype']=$dl_type;
			$Proprice = M('Proprice');
			$data2=$Proprice->where($map2)->find();
            if($data2){
                $data['pro_dlprice']=$data2['pri_price'];
            }else{
                $data['pro_dlprice']='';
            }
			
			if($data['pro_dlprice']==''){
				$this->error('该产品还没设置代理价格，暂不能订购','',2);
			}else{
				$map3=array();
			    $data3=array();
				$data4=array();
			    $map3['sc_proid']=$data['pro_id'];
				$map3['sc_attrid']=$attr_id;
			    $map3['sc_unitcode']=$this->qy_unitcode;
				$map3['sc_dlid']=session('jxuser_id');
				//添加购物车
				$Shopcart = M('Shopcart');
				$data3=$Shopcart->where($map3)->find();
				if($data3){ //如果购物车有 修改数量
					$data4['sc_qty']=$data3['sc_qty']+$qty;
			        $Shopcart->where($map3)->save($data4);
					
				}else{ //如果购物车没 添加
					$data4['sc_unitcode']=$this->qy_unitcode;
					$data4['sc_dlid']=session('jxuser_id');
					$data4['sc_proid']=$pro_id;
					$data4['sc_attrid']=$attr_id;
				    $data4['sc_color']=$color;
					$data4['sc_size']=$size;
					$data4['sc_qty']=$qty;
					$data4['sc_addtime']=time();
                    $rs=$Shopcart->create($data4,1);
			        if($rs){
						$result = $Shopcart->add(); 
						if($result){
						}else{
							$this->error('添加入购物车失败','',2);
						}
					}else{
						$this->error('添加入购物车失败','',2);
					}
				}
			}
		}else{
			$this->error('没有该记录','',2);
		}
	
		$this->redirect('/'.C('MODULE_NAME').'/Orders/shopcart' ,'', 0, '');
	}
	
	//修改购物车
	public function modifycart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		

		$map=array();
		$data=array();
		$sc_id=intval(I('get.sc_id',0));
		$qty=intval(I('get.sc_qty',1));
		$Shopcart = M('Shopcart');
		$map['sc_id']=$sc_id;
		$map['sc_unitcode']=$this->qy_unitcode;
		$map['sc_dlid']=session('jxuser_id');
		$data=$Shopcart->where($map)->find();
		if($data){
			$map2=array();
			$data2=array();
			$map2['pro_id']=$data['sc_proid'];
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_active']=1;
			$Product = M('Product');
			$data2=$Product->where($map2)->find();
			if($data2){
				//修改购物车数量
				$data4=array();
				$data4['sc_qty']=$qty;
			    $Shopcart->where($map)->save($data4);
				
				$map5=array();
				$map5['sc_unitcode']=$this->qy_unitcode;
				$map5['sc_dlid'] = session('jxuser_id');
				$data5 = $Shopcart->where($map5)->order('sc_addtime DESC')->select();
			
				$Proprice = M('Proprice');
				$total=0;
				
				foreach($data5 as $k=>$v){
					$map2=array();
					$data2=array();
					$map2['pro_id']=$v['sc_proid'];
					$map2['pro_unitcode']=$this->qy_unitcode;
					$map2['pro_active']=1;
					
					//产品
					$data2=$Product->where($map2)->find();
					if($data2){
						$data5[$k]['pro_name']=$data2['pro_name'];
						$data5[$k]['pro_pic']=$data2['pro_pic'];
						$data5[$k]['pro_price']=$data2['pro_price'];
						$data5[$k]['pro_stock']=$data2['pro_stock'];
						
						//代理价
						$map3=array();
						$data3=array();
						$map3['pri_proid']=$data2['pro_id'];
						$map3['pri_unitcode']=$this->qy_unitcode;
						$map3['pri_dltype']=$dl_type;
						
						$data3=$Proprice->where($map3)->find();
						if($data3){
							$data5[$k]['pro_dlprice']=$data3['pri_price'];
							$total=$total+$data5[$k]['pro_dlprice']*$v['sc_qty'];
						}else{
							$data5[$k]['pro_dlprice']='';
						}
					}else{
						$data5[$k]['pro_name']='';
						$data5[$k]['pro_pic']='';
						$data5[$k]['pro_price']='';
						$data5[$k]['pro_dlprice']='';
						$data5[$k]['pro_stock']='';
					}
				}
				// $msg=array('stat'=>1,'scid'=>$sc_id,'qty'=>$qty,'total'=>$total);
				// echo json_encode($msg);
				// exit;
			}else{
				$this->error('该购物车产品已移除',U(C('MODULE_NAME').'/Orders/shopcart'),2);
				// $msg=array('stat'=>0,'msg'=>'该购物车记录已移除');
				// echo json_encode($msg);
				// exit;
			}
		}else{
			$this->error('该购物车记录已移除',U(C('MODULE_NAME').'/Orders/shopcart'),2);
		 //    $msg=array('stat'=>0,'msg'=>'该购物车记录已移除');
			// echo json_encode($msg);
			// exit;
		}
		$this->redirect(C('MODULE_NAME').'/Orders/shopcart','' , 0, '');
	}
	
	//取消或选中购物车的产品
	public function checkcart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

		$sc_id=intval(I('get.sc_id',0));
		$checkAll=intval(I('get.checkall',0));
		$Shopcart= M('Shopcart');	
		if($sc_id>0){
			$map=array();
			$map['sc_unitcode']=$this->qy_unitcode;
			$map['sc_dlid']=session('jxuser_id');
			$map['sc_id']=$sc_id;
			$data=$Shopcart->where($map)->find();
			if ($data)
			{
				//修改购物车数量
				$data1=array();
				if ($data['sc_status']==0)
					$data1['sc_status']=1;
				else
					$data1['sc_status']=0;
			    $Shopcart->where($map)->save($data1);
			}
		}else
		{
			$sc_status=0;
			if ($checkAll==1)
				$sc_status=1;
			$map=array();
			$map['sc_unitcode']=$this->qy_unitcode;
			$map['sc_dlid']=session('jxuser_id');
			$data=$Shopcart->where($map)->select();
			foreach ($data as $k => $v) {
				//修改购物车数量
				$data1=array();
				$data1['sc_status']=$sc_status;
			    $Shopcart->where($map)->save($data1);
			}	
		}
		$this->redirect(C('MODULE_NAME').'/Orders/shopcart','' , 0, '');
	}

    //移除购物车
	public function removecart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$sc_id=intval(I('get.sc_id',0));
		$Shopcart= M('Shopcart');
		
		if($sc_id>0){
			$map3=array();
			$map3['sc_unitcode']=$this->qy_unitcode;
			$map3['sc_dlid']=session('jxuser_id');
			$map3['sc_id']=$sc_id;
			$Shopcart->where($map3)->delete();
		}
		
		$this->redirect(C('MODULE_NAME').'/Orders/shopcart','' , 0, '');
	}
	
	//核对订单
	public function checkshopcart(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];
			$dl_name=$data['dl_name'];//下单人
			$dl_level=$data['dl_level'];
			$dl_deposit=$data['dl_deposit'];
			$dl_belong=$data['dl_belong'];  //上家id
			$dl_referee=$data['dl_referee'];  //推荐人id
			
			//if($dl_deposit<=0 || empty($dl_deposit)){
			//     $this->error('对不起,请先提交保证金','',3);
			//}
			
			
            $Dltype= M('Dltype');
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$data['dl_type'];
			$dltypeinfo = $Dltype->where($map3)->find();
            if($dltypeinfo){
                $dlt_firstquota=$dltypeinfo['dlt_firstquota'];  //首次下单额金额
				$dlt_minnum=$dltypeinfo['dlt_minnum'];  //订单最低补货金额
			}else{
				session('jxuser_id',null);
				session('jxuser_unitcode',null);
				$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
				exit;
			}
			
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		
		if($dl_level>4){
			$this->error('对不起，合伙人以上才允许下单','',1);
		}
		
        $Shopcart = M('Shopcart');
		$Orders = M('Orders');
		
		//删除24小时前的没下单的购物车记录
		$map2=array();
		$map2['sc_unitcode']=$this->qy_unitcode;
		$map2['sc_dlid']=session('jxuser_id');
		$map2['sc_addtime']=array('ELT',(time()-3600*24));
		$Shopcart->where($map2)->delete(); 
		
		$map=array();
        $map['sc_unitcode']=$this->qy_unitcode;
        $map['sc_dlid'] = session('jxuser_id');
        $map['sc_status']=0;
        $data = $Shopcart->where($map)->order('sc_addtime DESC')->select();
		if(count($data)<=0){
			$this->error('对不起,购物车为空','',1);
		}
		
		$Product = M('Product');
		$Proprice = M('Proprice');
		$total=0;
		$totalqty=0;
		$proqty=array();
		foreach($data as $k=>$v){
			$map2=array();
			$data2=array();
			$map2['pro_id']=$v['sc_proid'];
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_active']=1;
			
			//产品
			$data2=$Product->where($map2)->find();
			if($data2){
				$data[$k]['pro_name']=$data2['pro_name'];
				$data[$k]['pro_pic']=$data2['pro_pic'];
				$data[$k]['pro_price']=$data2['pro_price'];
				$data[$k]['pro_stock']=$data2['pro_stock'];

				//代理价
				$map3=array();
				$data3=array();
				$map3['pri_proid']=$data2['pro_id'];
				$map3['pri_unitcode']=$this->qy_unitcode;
				$map3['pri_dltype']=$dl_type;

				$data3=$Proprice->where($map3)->find();
				if($data3){
					$data[$k]['pro_dlprice']=$data3['pri_price'];
					$total=$total+$data[$k]['pro_dlprice']*$v['sc_qty'];
					
					if(isset($proqty[$v['sc_proid']])){
						$proqty[$v['sc_proid']]['qty']+=$v['sc_qty'];
					}else{
						$proqty[$v['sc_proid']]['qty']=$v['sc_qty'];
						$proqty[$v['sc_proid']]['pri_minimum']=$data3['pri_minimum'];
						$proqty[$v['sc_proid']]['pro_name']=$data2['pro_name'];
					}
					
				}else{
					$this->error('对不起,产品没设置代理价格','',1);
				}
				
				$totalqty=$totalqty+$v['sc_qty'];
			}else{
				$this->error('对不起,产品不存在','',1);
			}
		}
//		dump($totalqty);die();
		//是否首次下单
        $map5 = array();
		$map5['od_oddlid'] = session('jxuser_id');
		$map5['od_unitcode'] = $this->qy_unitcode;
		$map5['od_state'] = array('NEQ',9);
		$odcount = $Orders->where($map5)->count();
		//首次最低订单金额
		if($dlt_firstquota>0 && $dlt_firstquota>$total && $odcount==0){
			$this->error('对不起，首次订单最低拿货金额为：'.$dlt_firstquota.'',U(C('MODULE_NAME').'/Orders/shopcart'),3);
			exit;
		}
		
        //补货最低订单金额
		if($dlt_minnum>0 && $dlt_minnum>$total && $odcount>0){
			$this->error('对不起，订单最低补货金额为：'.$dlt_minnum.'',U(C('MODULE_NAME').'/Orders/shopcart'),3);
			exit;
		}
		
		
////		最低补货量判断
////        dump($proqty);die();
		foreach($proqty as $kk=>$vv){
			if($vv['pri_minimum']>$vv['qty']){
				$this->error('对不起，产品'.$vv['pro_name'].' 的最低补货量为：'.$vv['pri_minimum'].'',U(C('MODULE_NAME').'/Orders/shopcart'),2);
				exit;
			}
		}
		
		
		
		//合伙人 如果订购一定数量 则优惠
		/*
		if($dl_level==1){
			$dldiscount=C('DLPRICE_DISCOUNT');
			if(isset($dldiscount['num']) && $totalqty >=$dldiscount['num'] && isset($dldiscount['discount'])){
				$total=0;
				foreach($data as $kk=>$vv){
					if($vv['pro_dlprice']>=$dldiscount['discount']){
					    $data[$kk]['pro_dlprice']=$vv['pro_dlprice']-$dldiscount['discount'];
					    $total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}else{
						$total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}
				}
			}
		}
		*/
		
		
		//收货地址
		$dladd_id=intval(I('get.dladd_id',0));
		$Dladdress = M('Dladdress');
		if($dladd_id<=0){
			$map=array();
			$data2=array();
			$map['dladd_unitcode']=$this->qy_unitcode;
			$map['dladd_dlid'] = session('jxuser_id');
			$data2 = $Dladdress->where($map)->order('dladd_default DESC,dladd_id DESC')->limit(1)->select();
			if(count($data2)<=0){
				$dladd_id=0;
				$dladd_address=array();
			}else{
				$dladd_id=$data2[0]['dladd_id'];
				$dladd_address=$data2[0];
			}
		}else{
			$map=array();
			$data2=array();
			$map['dladd_dlid']=session('jxuser_id');
			$map['dladd_unitcode']=$this->qy_unitcode;
			$map['dladd_id']=$dladd_id;
			$data2=$Dladdress->where($map)->find();
			if($data2){
				$dladd_id=$data2['dladd_id'];
				$dladd_address=$data2;
			}else{
				$dladd_id=0;
				$dladd_address=array();
			}
		}

		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp2=time();
		$sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		
		
		//可用金额  前4级用余额支付
		/*
        if($dl_level==1 || $dl_level==2 || $dl_level==3 || $dl_level==4){
			
			$Balance= M('Balance');

			//余额 增加(有效的)
			$yueaddsum=0;
			$map2=array();
			$map2['bl_receiveid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3');  //余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 
			$map2['bl_state']=1;  //状态 1-有效 0-无效 2-冻结
			$yueaddsum = $Balance->where($map2)->sum('bl_money'); 
			if($yueaddsum){
			}else{
				$yueaddsum=0;
			}

			 //余额 减少(冻结)
			$yuefreezeminussum=0;
			$map2=array();
			$map2['bl_sendid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3');  
			$map2['bl_state']=2;  //状态 1-有效 0-无效 2-冻结
			$map2['bl_isyfk']=0;  //是否预付款支付
			$yuefreezeminussum = $Balance->where($map2)->sum('bl_money'); 
			if($yuefreezeminussum){
			}else{
				$yuefreezeminussum=0;
			}
			
			//余额 减少(有效的)
			$yueminussum=0;
			$map2=array();
			$map2['bl_sendid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3'); 
			$map2['bl_state']=1;  //状态 1-有效 0-无效 2-冻结
			$map2['bl_isyfk']=0;  //是否预付款支付
			$yueminussum = $Balance->where($map2)->sum('bl_money'); 
			if($yueminussum){
			}else{
				$yueminussum=0;
			}
			$yuesurplus=$yueaddsum-$yueminussum-$yuefreezeminussum; //剩余余额

		}else{
			$yuesurplus=0;
		}
		

		$this->assign('yuesurplus', $yuesurplus);
		$this->assign('dl_level', $dl_level);
		*/

		//可用金额 end
		
		
		$this->assign('ttamp', $ttamp2);
		$this->assign('sture', $sture2);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_addtime',time());
		$this->assign('dladd_id', $dladd_id);
		$this->assign('dladd_address', $dladd_address);
		$this->assign('total', $total);
		$this->assign('totalqty',$totalqty);
		$this->assign('shopcartlist', $data);
		$this->assign('dl_belong', $dl_belong);

		$this->display('checkshopcart');
		
	}
	
	//提交保存订单
	public function submitorders(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$msg=array('stat'=>2,'msg'=>'提交超时');
			echo json_encode($msg);
			exit;
		}
		if(($nowtime - $ttamp) > 1200) {
			$msg=array('stat'=>2,'msg'=>'提交超时');
			echo json_encode($msg);
			exit;
		}
		
		$dladd_id=intval(I('post.dladd_id',0));
		$od_remark=trim(I('post.od_remark',''));
		$paytype=intval(I('post.paytype',0));
		$wuliu=trim(I('post.wuliu',''));
		
		//代理商信息
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_type=$data['dl_type'];  //代理商级别id
			$dl_belong=$data['dl_belong'];  //上家id
			$dl_referee=$data['dl_referee'];  //推荐人id
			$dl_username=$data['dl_username'];  
			$dl_name=$data['dl_name'];  
			$dl_level=$data['dl_level'];  //代理级别
			
            $Dltype= M('Dltype');
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$data['dl_type'];
			$dltypeinfo = $Dltype->where($map3)->find();
            if($dltypeinfo){
                $dl_level=$dltypeinfo['dlt_level'];  //代理级别
				$dlt_firstquota=$dltypeinfo['dlt_firstquota'];  //首次下单额金额
				$dlt_minnum=$dltypeinfo['dlt_minnum'];  //订单最低补货金额
			}else{
				session('jxuser_id',null);
				session('jxuser_unitcode',null);
				$msg=array('stat'=>2,'msg'=>'授权已过期，请重新登录');
				echo json_encode($msg);
				exit;
			}
			
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$msg=array('stat'=>2,'msg'=>'授权已过期，请重新登录');
			echo json_encode($msg);
			exit;
		}
	    
		//收货地址
		$Dladdress = M('Dladdress');
		$address=array();
		if($dladd_id>0){
			$map=array();
			$data=array();
			$map['dladd_dlid']=session('jxuser_id');
			$map['dladd_unitcode']=$this->qy_unitcode;
			$map['dladd_id']=$dladd_id;
			$address=$Dladdress->where($map)->find();
			if($address){
				
			}else{
				$msg=array('stat'=>0,'msg'=>'请选择收货地址');
				echo json_encode($msg);
				exit;
			}
		}else{
			$msg=array('stat'=>0,'msg'=>'请选择收货地址');
			echo json_encode($msg);
			exit;
		}
		
		//购物车
        $Shopcart = M('Shopcart');
		$Orders = M('Orders');
		$map=array();
		$data=array();
        $map['sc_unitcode']=$this->qy_unitcode;
        $map['sc_dlid'] = session('jxuser_id');
		$map['sc_status']=0;
        $data = $Shopcart->where($map)->order('sc_addtime DESC')->select();
		if(count($data)<=0){
			$msg=array('stat'=>0,'msg'=>'购物车为空');
			echo json_encode($msg);
			exit;
		}
		
		$Product = M('Product');
		$Proprice = M('Proprice');
		$total=0;
		$totalqty=0;
		$proqty=array();
		
		foreach($data as $k=>$v){
			$map2=array();
			$data2=array();
			$map2['pro_id']=$v['sc_proid'];
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_active']=1;
			
			//产品
			$data2=$Product->where($map2)->find();
			if($data2){
				$data[$k]['pro_name']=$data2['pro_name'];
				$data[$k]['pro_number']=$data2['pro_number'];
				$data[$k]['pro_pic']=$data2['pro_pic'];
				$data[$k]['pro_price']=$data2['pro_price'];
				$data[$k]['pro_stock']=$data2['pro_stock'];
				$data[$k]['pro_units']=$data2['pro_units'];
				$data[$k]['pro_dbiao']=$data2['pro_dbiao'];
				$data[$k]['pro_zbiao']=$data2['pro_zbiao'];
				$data[$k]['pro_xbiao']=$data2['pro_xbiao'];
				
				//代理价
				$map3=array();
				$data3=array();
				$map3['pri_proid']=$data2['pro_id'];
				$map3['pri_unitcode']=$this->qy_unitcode;
				$map3['pri_dltype']=$dl_type;

				$data3=$Proprice->where($map3)->find();
				if($data3){
					$data[$k]['pro_dlprice']=$data3['pri_price'];
					$total=$total+$data[$k]['pro_dlprice']*$v['sc_qty'];
					
                    if(isset($proqty[$v['sc_proid']])){
						$proqty[$v['sc_proid']]['qty']+=$v['sc_qty'];
					}else{
						$proqty[$v['sc_proid']]['qty']=$v['sc_qty'];
						$proqty[$v['sc_proid']]['pri_minimum']=$data3['pri_minimum'];
						$proqty[$v['sc_proid']]['pro_name']=$data2['pro_name'];
					}
					
					
				}else{
					$data[$k]['pro_dlprice']='';
				}
				$totalqty=$totalqty+$v['sc_qty'];
			}else{
				$data[$k]['pro_name']='';
				$data[$k]['pro_number']='';
				$data[$k]['pro_pic']='';
				$data[$k]['pro_price']='';
				$data[$k]['pro_dlprice']='';
				$data[$k]['pro_stock']='';
			}
		}
		
		//是否首次下单
        $map5 = array();
		$map5['od_oddlid'] = session('jxuser_id');
		$map5['od_unitcode'] = $this->qy_unitcode;
		$map5['od_state'] = array('NEQ',9);
		$odcount = $Orders->where($map5)->count();
		//首次最低订单金额
		if($dlt_firstquota>0 && $dlt_firstquota>$total && $odcount==0){
			$msg=array('stat'=>2,'msg'=>'对不起，首次订单最低拿货金额为：'.$dlt_firstquota);
			echo json_encode($msg);
			exit;
			
		}
		
        //补货最低订单金额
		if($dlt_minnum>0 && $dlt_minnum>$total && $odcount>0){
			$msg=array('stat'=>2,'msg'=>'对不起，订单最低补货金额为：'.$dlt_minnum);
			echo json_encode($msg);
			exit;
		}
		
		
       //最低补货量判断
		//foreach($proqty as $kk=>$vv){
		//	if($vv['pri_minimum']>$vv['qty']){
		//		$msg=array('stat'=>2,'msg'=>'对不起，产品'.$vv['pro_name'].' 的最低补货量为：'.$vv['pri_minimum']);
		//		echo json_encode($msg);
		//		exit;
		//	}
		//}
		

		
		//合伙人 如果订购一定数量 则优惠
		/*
		if($dl_level==1){
			$dldiscount=C('DLPRICE_DISCOUNT');
			if(isset($dldiscount['num']) && $totalqty >=$dldiscount['num'] && isset($dldiscount['discount'])){
				$total=0;
				foreach($data as $kk=>$vv){
					if($vv['pro_dlprice']>=$dldiscount['discount']){
					    $data[$kk]['pro_dlprice']=$vv['pro_dlprice']-$dldiscount['discount'];
					    $total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}else{
						$total=$total+$data[$kk]['pro_dlprice']*$vv['sc_qty'];
					}
				}
			}
		}
		*/
		
		
		//保存订单
		if($total<=0){
			$msg=array('stat'=>2,'msg'=>'购物车为空');
			echo json_encode($msg);
			exit;
		}
		
		//选择的支付方式 余额是否够
		//可用金额 前4级使用支付
		
		$Balance= M('Balance');
		/*
		if($paytype==1 && $dl_level<=4){
			//余额 增加(有效的)
			$yueaddsum=0;
			$map2=array();
			$map2['bl_receiveid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3');  //余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 
			$map2['bl_state']=1;  //状态 1-有效 0-无效 2-冻结
			$yueaddsum = $Balance->where($map2)->sum('bl_money'); 
			if($yueaddsum){
			}else{
				$yueaddsum=0;
			}

			 //余额 减少(冻结)
			$yuefreezeminussum=0;
			$map2=array();
			$map2['bl_sendid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3');  
			$map2['bl_state']=2;  //状态 1-有效 0-无效 2-冻结
			$map2['bl_isyfk']=0;  //是否预付款支付
			$yuefreezeminussum = $Balance->where($map2)->sum('bl_money'); 
			if($yuefreezeminussum){
			}else{
				$yuefreezeminussum=0;
			}
			
			//余额 减少(有效的)
			$yueminussum=0;
			$map2=array();
			$map2['bl_sendid']=session('jxuser_id');
			$map2['bl_unitcode']=$this->qy_unitcode;
			$map2['bl_type']=array('IN','1,2,3'); 
			$map2['bl_state']=1;  //状态 1-有效 0-无效 2-冻结
			$map2['bl_isyfk']=0;  //是否预付款支付
			$yueminussum = $Balance->where($map2)->sum('bl_money'); 
			if($yueminussum){
			}else{
				$yueminussum=0;
			}
			$yuesurplus=$yueaddsum-$yueminussum-$yuefreezeminussum; //剩余余额
			
			if($total>$yuesurplus){
				$msg=array('stat'=>0,'msg'=>'余额可用金额不够');
				echo json_encode($msg);
				exit;
			}
		
		}
		*/
		//可用金额 end
//记录发货人
//        dump($address['dladd_sheng']);
//        dump($address['dladd_shi']);
//        dump($address['dladd_qu']);
//		die();
//        $msg=array('stat'=>0,'msg'=>$address['dladd_sheng']);
//        echo json_encode($msg);
//        exit;
		$orderarr=array();
		$od_orderid=date('YmdHis',$nowtime).mt_rand(1000,9999);
		
		$orderarr['od_unitcode']=$this->qy_unitcode;
		$orderarr['od_orderid']=$od_orderid;
		$orderarr['od_total']=$total;
		$orderarr['od_addtime']=$nowtime;
		$orderarr['od_contact']=$address['dladd_contact'];
		$orderarr['od_addressid']=$address['dladd_id'];
		$orderarr['od_sheng']=$address['dladd_sheng'];
		$orderarr['od_shi']=$address['dladd_shi'];
		$orderarr['od_qu']=$address['dladd_qu'];
//		判断发货人
        $map30['dl_sz_sheng']=$address['dladd_sheng'];
        $map30['dl_sz_shi']=$address['dladd_shi'];
        $map30['dl_sz_qu']=$address['dladd_qu'];
        $sheng_city_qu=$Dealer->where($map30)->find();
        if($sheng_city_qu){
            if($sheng_city_qu['dl_id']==session('jxuser_id')){
                $orderarr['od_fhdlid']=0;
            }else{
                $orderarr['od_fhdlid']=$sheng_city_qu['dl_id'];
            }

        }else{
            $orderarr['od_fhdlid']=0;
        }
		$orderarr['od_jie']=0;
		$orderarr['od_address']=$address['dladd_address'];
		$orderarr['od_tel']=$address['dladd_tel'];
		$orderarr['od_express']=0;
		$orderarr['od_expressnum']='';
		$orderarr['od_expressdate']=0;
		$orderarr['od_state']=0;
		$orderarr['od_paypic']=''; //凭证图片
		$orderarr['od_belongship']=0; //是否转上家发货
		$orderarr['od_remark']=$od_remark.' '.$wuliu;

	
		$orderarr['od_oddlid']=session('jxuser_id');  //下单代理
		$orderarr['od_rcdlid']=$dl_belong;  //接收订单的代理id 0则为总公司
		$orderarr['od_virtualstock']=0;
		$orderarr['od_fugou']=0;
		$orderarr['od_dltype']=$dl_type; //下单时代理级别
//		$orderarr['od_dl_level']=$dl_level; //下单时代理等级

        $rs=$Orders->create($orderarr,1);
		if($rs){
		    $result = $Orders->add(); 
		    if($result){
						
						//冻结余额 前2级使用支付
						$paystr='';
						/*
						if($paytype==1 && $dl_level<=4){
							$paystr='-余额支付';
							$data4=array();
							$data4['bl_unitcode']=$this->qy_unitcode;
							$data4['bl_type']=2;  //余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 
							$data4['bl_sendid']=session('jxuser_id');   //发款id
				            $data4['bl_receiveid']=$dl_belong;  //收款id
							$data4['bl_money']=$total;
							$data4['bl_odid']=$result;
							$data4['bl_orderid']=$od_orderid;
							$data4['bl_addtime']=$nowtime;
							$data4['bl_remark']='订购产品款项:订单号'.$od_orderid;
							$data4['bl_state']=2; //状态 1-有效 0-无效 2-冻结
							$data4['bl_rcid']=0;
							$data4['bl_isyfk']=0;

							
							$rs4=$Balance->create($data4,1);
							if($rs4){
				                $resu4=$Balance->add();
								if($resu4){
									
								}else{
									//提交订单失败 把之前订单信息删除
									$map3=array();
									$map3['od_unitcode']=$this->qy_unitcode;
									$map3['od_id']=$result;
									$map3['od_oddlid']=session('jxuser_id');
									$Orders->where($map3)->delete();
								
									
									$msg=array('stat'=>0,'msg'=>'提交订单失败');
									echo json_encode($msg);
									exit;
								}
							}else{
								//提交订单失败 把之前订单信息删除
								$map3=array();
								$map3['od_unitcode']=$this->qy_unitcode;
								$map3['od_id']=$result;
								$map3['od_oddlid']=session('jxuser_id');
								$Orders->where($map3)->delete();
							

								$msg=array('stat'=>0,'msg'=>'提交订单失败');
								echo json_encode($msg);
								exit;
							}
						}
						*/

				
				

						//订单详细
						$Orderdetail = M('Orderdetail');
						foreach($data as $k=>$v){
							if($v['pro_dlprice']!=''){
								$detailarr=array();
								$detailarr['oddt_unitcode']=$this->qy_unitcode;
								$detailarr['oddt_odid']=$result;
								$detailarr['oddt_orderid']=$od_orderid;
								$detailarr['oddt_proid']=$v['sc_proid'];
								$detailarr['oddt_proname']=$v['pro_name'];
								$detailarr['oddt_pronumber']=$v['pro_number'];
								$detailarr['oddt_prounits']=$v['pro_units'];
								$detailarr['oddt_prodbiao']=$v['pro_dbiao'];
								$detailarr['oddt_prozbiao']=$v['pro_zbiao'];
								$detailarr['oddt_proxbiao']=$v['pro_xbiao'];
								$detailarr['oddt_price']=$v['pro_price'];
								$detailarr['oddt_dlprice']=$v['pro_dlprice'];
								$detailarr['oddt_qty']=$v['sc_qty'];
								$detailarr['oddt_attrid']=$v['sc_attrid'];
								$detailarr['oddt_color']=$v['sc_color'];
								$detailarr['oddt_size']=$v['sc_size'];
								$rs3=$Orderdetail->create($detailarr,1);
								if($rs3){
									$result3 = $Orderdetail->add();
									if($result3){

									}else{
										//提交订单失败 把之前订单信息删除
										$map3=array();
										$map3['od_unitcode']=$this->qy_unitcode;
										$map3['od_id']=$result;
										$map3['od_oddlid']=session('jxuser_id');
										$Orders->where($map3)->delete();
										
										
										$map3=array();
										$map3['oddt_unitcode']=$this->qy_unitcode;
										$map3['oddt_odid']=$result;
										$Orderdetail->where($map3)->delete();
										
										$msg=array('stat'=>0,'msg'=>'提交订单失败');
										echo json_encode($msg);
										exit;
									}
								}else{
									//提交订单失败 把之前订单信息删除
									$map3=array();
									$map3['od_unitcode']=$this->qy_unitcode;
									$map3['od_id']=$result;
									$map3['od_oddlid']=session('jxuser_id');
									$Orders->where($map3)->delete();
									
									$map3=array();
									$map3['oddt_unitcode']=$this->qy_unitcode;
									$map3['oddt_odid']=$result;
									$Orderdetail->where($map3)->delete();
									
									$msg=array('stat'=>0,'msg'=>'提交订单失败');
									echo json_encode($msg);
									exit;
								}
							}
						}
						//删除购物车
						$map3=array();
						$map3['sc_unitcode']=$this->qy_unitcode;
						$map3['sc_dlid']=session('jxuser_id');
						$map3['sc_status']=0;
						$Shopcart->where($map3)->delete();
						
						//订单操作日志 begin
						$odlog_arr=array(
									'odlg_unitcode'=>$this->qy_unitcode,  
									'odlg_odid'=>$result,
									'odlg_orderid'=>$od_orderid,
									'odlg_dlid'=>session('jxuser_id'),
									'odlg_dlusername'=>session('jxuser_username'),
									'odlg_dlname'=>session('jxuser_dlname'),
									'odlg_action'=>'创建订单'.$paystr,
									'odlg_type'=>1, //0-企业 1-经销商
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
						$msg=array('stat'=>1,'msg'=>'提交订单成功');
						echo json_encode($msg);
						exit;
		    }else{
				$msg=array('stat'=>0,'msg'=>'提交订单失败');
				echo json_encode($msg);
				exit;
		    }
		}else{
			$msg=array('stat'=>0,'msg'=>'提交订单失败');
			echo json_encode($msg);
			exit;
		}
	}
	
	
	//订单收货地址
    public function orderaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$dladd_id=intval(I('get.dladd_id',0));
		
        $Dladdress = M('Dladdress');
		$map=array();
        $map['dladd_unitcode']=$this->qy_unitcode;
        $map['dladd_dlid'] = session('jxuser_id');
        $data = $Dladdress->where($map)->order('dladd_default DESC,dladd_id DESC')->select();
		
		foreach($data as $k=>$v){ 

		}
		
		$this->assign('dladd_id', $dladd_id);
		$this->assign('addresslist', $data);
		$this->display('orderaddress');
	}
	
	
   //=====================================================
   //代理地址管理
    public function dladdress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$dladd_id=intval(I('get.dladd_id',0));
		$fromod=intval(I('get.fromod',0));

        $Dladdress = M('Dladdress');
		$map=array();
        $map['dladd_unitcode']=$this->qy_unitcode;
        $map['dladd_dlid'] = session('jxuser_id');
        $data = $Dladdress->where($map)->order('dladd_default DESC,dladd_id DESC')->select();
	
		foreach($data as $k=>$v){ 

		}
		if (intval($fromod)==1)
			$this->assign('addtitle','选择地址');
		else
			$this->assign('addtitle','我的地址');
		$this->assign('dladd_id', $dladd_id);
		$this->assign('fromod', $fromod);
		$this->assign('addresslist', $data);
		$this->display('dladdress');
		
	}
	
   //新增地址
    public function addaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$f=intval(I('get.f',0));
        $addressinfo=array();
		$this->assign('addressinfo', $addressinfo);
		$this->assign('dladd_id', 0);
		$this->assign('f', $f);
		$this->assign('addtitle', '新增地址');
		$this->display('addaddress');
		
	}
	
    //编辑地址
    public function updateaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$dladd_id=intval(I('get.addid',0));
		$fromod=intval(I('get.fromod',0));
		$Dladdress= M('Dladdress');
		
		if($dladd_id>0){
			$map=array();
			$map['dladd_unitcode']=$this->qy_unitcode;
			$map['dladd_dlid']=session('jxuser_id');
			$map['dladd_id']=$dladd_id;
			
			$data=$Dladdress->where($map)->find();
			if($data){
				
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			// $this->error('没有该记录','',2);
		}
		
		if (intval($dladd_id)>0)
			$this->assign('addtitle', '编辑地址');
		else
			$this->assign('addtitle', '新增地址');
		$this->assign('fromod', $fromod);
		$this->assign('addressinfo', $data);
		$this->assign('dladd_id', $dladd_id);
		$this->display('addaddress');
	}
	
	//保存地址
	public function saveaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$dladd_id=intval(I('post.dladd_id',0));	
		$dladd_contact=I('post.dladd_contact','');
		$dladd_tel=I('post.dladd_tel','');
		$dladd_address=I('post.dladd_address','');
		$dladd_sheng=intval(I('post.seachprov',0));
		$dladd_shi=intval(I('post.seachcity',0));
		$dladd_qu=intval(I('post.seachdistrict',0));
		$dladd_diqustr=I('post.dladd_diqustr','');
		$dladd_default=intval(I('post.dladd_default',0));
//dump($dladd_sheng);
//dump($dladd_shi);
//dump($dladd_qu);
//die();
		$fromod=intval(I('post.fromod',0));
		
		if($dladd_contact==''){
			$msg=array('stat'=>0,'msg'=>'请填写姓名');
			echo json_encode($msg);
			exit;
		}
		if($dladd_diqustr==''){
			$msg=array('stat'=>0,'msg'=>'请选择地区');
			echo json_encode($msg);
			exit;
		}
		if($dladd_address==''){
			$msg=array('stat'=>0,'msg'=>'请填写地址');
			echo json_encode($msg);
			exit;
		}
		if($dladd_tel==''){
			$msg=array('stat'=>0,'msg'=>'请填写电话');
			echo json_encode($msg);
			exit;
		}
		$Dladdress= M('Dladdress');
		
		if($dladd_id>0){  //修改地址
			$map2=array();
			$map2['dladd_unitcode']=$this->qy_unitcode;
			$map2['dladd_dlid']=session('jxuser_id');
			$data2=$Dladdress->where($map2)->count();
			if($data2){
				$data=array();
				$data['dladd_unitcode']=$this->qy_unitcode;
				$data['dladd_dlid']=session('jxuser_id');
				$data['dladd_contact']=$dladd_contact;
				$data['dladd_sheng']=$dladd_sheng;
				$data['dladd_shi']=$dladd_shi;
				$data['dladd_qu']=$dladd_qu;
				$data['dladd_diqustr']=$dladd_diqustr;
				$data['dladd_address']=$dladd_address;
				$data['dladd_tel']=$dladd_tel;

				if (intval($data2)>1)
				{
					if ($dladd_default==1)
					{
						$map3=array();
						$map3['dladd_unitcode']=$this->qy_unitcode;
						$map3['dladd_dlid']=session('jxuser_id');
						$map3['dladd_default']=1;
						$data3=$Dladdress->where($map3)->find();
						if ($data3)
						{
							$map4=array();
							$data4=array();
            				$map4['dladd_unitcode']=$this->qy_unitcode;
           					$map4['dladd_dlid'] = session('jxuser_id');
							$map4['dladd_id']=$data3['dladd_id'];
							$data4['dladd_default'] =0;
							$rs=$Dladdress->where($map4)->save($data4);

							$map=array();
            				$map['dladd_unitcode']=$this->qy_unitcode;
           					$map['dladd_dlid'] = session('jxuser_id');
							$map['dladd_id'] =$dladd_id;
							$data['dladd_default'] =1;
							$rs=$Dladdress->where($map)->save($data);
						}else
						{
							$map=array();
            				$map['dladd_unitcode']=$this->qy_unitcode;
           					$map['dladd_dlid'] = session('jxuser_id');
							$map['dladd_id'] = $dladd_id;
							$data['dladd_default'] =1;
							$rs=$Dladdress->where($map)->save($data);
						}
					}
					else
					{
						$map=array();
            			$map['dladd_unitcode']=$this->qy_unitcode;
           				$map['dladd_dlid'] = session('jxuser_id');
						$map['dladd_id'] = $dladd_id;
						$data['dladd_default'] =0;
						$rs=$Dladdress->where($map)->save($data);
					}
				}
				else
				{
					$map=array();
            		$map['dladd_unitcode']=$this->qy_unitcode;
           			$map['dladd_dlid'] = session('jxuser_id');
					$map['dladd_id'] = $dladd_id;
					$data['dladd_default'] =1;
					$rs=$Dladdress->where($map)->save($data);			
				}
				if($rs){
					$msg=array('stat'=>1,'msg'=>'地址修改成功','fromod'=>$fromod);
					echo json_encode($msg);
					exit;
				}elseif($rs===0){
					$msg=array('stat'=>1,'msg'=>'地址修改成功','fromod'=>$fromod);
					echo json_encode($msg);
					exit;
				}else{
					$msg=array('stat'=>0,'msg'=>'地址修改失败');
					echo json_encode($msg);
					exit;
				}
			}else
			{
				$msg=array('stat'=>0,'msg'=>'地址记录不存在');
				echo json_encode($msg);
				exit;
			}
		}else{    //添加地址
			$data=array();
			$data['dladd_unitcode']=$this->qy_unitcode;
			$data['dladd_dlid']=session('jxuser_id');
			$data['dladd_contact']=$dladd_contact;
			$data['dladd_sheng']=$dladd_sheng;
			$data['dladd_shi']=$dladd_shi;
			$data['dladd_qu']=$dladd_qu;
			$data['dladd_diqustr']=$dladd_diqustr;
			$data['dladd_address']=$dladd_address;
			$data['dladd_tel']=$dladd_tel;	
					
			$rs=$Dladdress->create($data,1);
			if($rs){
			   $result = $Dladdress->add(); 
			   if($result){
					$map2=array();
					$map2['dladd_unitcode']=$this->qy_unitcode;
					$map2['dladd_dlid']=session('jxuser_id');
					$map2['dladd_default']=1;
					$data2=$Dladdress->where($map2)->find();
					if($data2){
						if ($dladd_default==1)
						{
							$map3=array();
							$map3['dladd_unitcode']=$this->qy_unitcode;
					    	$map3['dladd_dlid']=session('jxuser_id');
					    	$map3['dladd_id']=$data2['dladd_id'];						
                       		$updata['dladd_default']=0;
                        	$Dladdress->where($map3)->save($updata);

                        	$map4=array();
							$map4['dladd_unitcode']=$this->qy_unitcode;
					    	$map4['dladd_dlid']=session('jxuser_id');
					    	$map4['dladd_id']=$result;						
                       		$updata['dladd_default']=1;
                        	$Dladdress->where($map4)->save($updata);
						}
					}else{
						$map3=array();
						$map3['dladd_unitcode']=$this->qy_unitcode;
					    $map3['dladd_dlid']=session('jxuser_id');
					    $map3['dladd_id']=$result;						
                        $updata['dladd_default']=1;
                        $Dladdress->where($map3)->save($updata);
					}
					$msg=array('stat'=>1,'msg'=>'地址添加成功','fromod'=>$fromod);
					echo json_encode($msg);
					exit;
			   }else{
					$msg=array('stat'=>0,'msg'=>'地址添加失败');
					echo json_encode($msg);
					exit;
			   }
			}else{
					$msg=array('stat'=>0,'msg'=>'地址添加失败');
					echo json_encode($msg);
					exit;
			}
		}
		$this->display('addaddress');
		
	}
	
	//设置默认地址
	public function defaultaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$dladd_id=intval(I('get.addid',0));
		$Dladdress= M('Dladdress');
		
		if($dladd_id>0){
			$map2=array();
			$map2['dladd_unitcode']=$this->qy_unitcode;
			$map2['dladd_dlid']=session('jxuser_id');
			$updata2['dladd_default']=0;
			$Dladdress->where($map2)->save($updata2);
			
			$map3=array();
			$map3['dladd_unitcode']=$this->qy_unitcode;
			$map3['dladd_dlid']=session('jxuser_id');
			$map3['dladd_id']=$dladd_id;
			
			$updata3['dladd_default']=1;
			$Dladdress->where($map3)->save($updata3);
			
			$this->redirect(C('MODULE_NAME').'/Orders/dladdress','' , 0, '');
		}else{
			$this->error('没有该记录','',2);
		}
		
	}
   
   //删除地址
	public function deleteaddress(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$dladd_id=intval(I('get.addid',0));
		$fromod=intval(I('get.fromod',0));
		$Dladdress= M('Dladdress');
		
		if($dladd_id>0){
			$map=array();
			$map['dladd_unitcode']=$this->qy_unitcode;
			$map['dladd_dlid']=session('jxuser_id');
			$map['dladd_id']=$dladd_id;
			$map['dladd_default']=1;
			
			$data=$Dladdress->where($map)->find();
			if($data){
				$this->error('该地址已设置为默认，暂不能删除','',2);
			}
			
			$map3=array();
			$map3['dladd_unitcode']=$this->qy_unitcode;
			$map3['dladd_dlid']=session('jxuser_id');
			$map3['dladd_id']=$dladd_id;		
			$Dladdress->where($map3)->delete();
			$this->redirect(C('MODULE_NAME').'/Orders/dladdress/fromod/'.$fromod.'','' , 0, '');
		}else{
			$this->error('没有该记录','',2);
		}
	}
//	区域发货
    public function region_order(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
            $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }

        $od_state=intval(I('get.od_state',0));
//        dump($od_state);die();
        $keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));
        $parameter=array();
        $parameter['od_state']=$od_state;
        $Orders = M('Orders');
        $Dealer = M('Dealer');
        $map20['dl_id']=session('jxuser_id');
        $data20=$Dealer->where($map20)->find();
        $map=array();
        $map['od_unitcode']=$this->qy_unitcode;
        $map['od_sheng']=$data20['dl_sz_sheng'];
        $map['od_shi']=$data20['dl_sz_shi'];
        $map['od_qu']=$data20['dl_sz_qu'];
        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);

            $keyword=sub_str($keyword,30,false);
            $where['od_orderid']=array('LIKE', ''.$keyword.'%');
            $where['od_contact']=array('LIKE', ''.$keyword.'%');
            $where['od_tel']=array('LIKE', ''.$keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;

            $parameter['keyword']=$keyword;
            $od_state=999;
        }else{
            if($od_state==1 || $od_state==2){
                $map['od_state']=array('in','1,2');
            }else{
                $map['od_state']=$od_state;
            }
        }
        $map['od_virtualstock']=0;

        $map['od_oddlid']=array('neq',session('jxuser_id'));
//        if($data20['dl_level']=1){
//            $map['od_dl_level']=array('neq',$data20['dl_level']);
//        }else{
//            $map['od_dl_level'] = array(array('neq',$data20['dl_level']),array('neq',$data20['dl_level']-1),'and');
//
//        }

        $count = $Orders->where($map)->count();
        $Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Orders->where($map)->order('od_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
//        foreach ($list as $k => $v) {
//            if($v['od_oddlid']==session('jxuser_id')||$v['od_dltype']==$data20['dl_level']){
//                unset($list[$k]);
////                continue;
//            }
//        }
        $Product = M('Product');
        $Orderdetail = M('Orderdetail');
        $Shipment = M('Shipment');

        $imgpath = BASE_PATH.'/Public/uploads/product/';
        foreach($list as $k=>$v){
            //订单详细
            $odtotalqty=0; //订单总数量
            $map2=array();
            $data2=array();
            $map2['oddt_unitcode']=$this->qy_unitcode;
            $map2['oddt_odid']=$v['od_id'];
            $data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
            foreach($data2 as $kk=>$vv){
                //产品
                $map3=array();
                $data3=array();
                $map3['pro_id']=$vv['oddt_proid'];
                $map3['pro_unitcode']=$this->qy_unitcode;
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

                //订购数量
                $oddt_totalqty=0; //总订购数
                $oddt_unitsqty=0; //每单位包装的数量
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

                $odtotalqty+=$oddt_totalqty;

                if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
                    $data2[$kk]['oddt_totalqty']='';
                }else{
                    $data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
                }

                //已发数量
                $map3=array();
                $data3=array();
                $map3['ship_pro']=$vv['oddt_proid'];
                $map3['ship_unitcode']=$this->qy_unitcode;
                $map3['ship_odid']=$vv['oddt_odid'];
                $map3['ship_oddtid']=$vv['oddt_id'];
                $map3['ship_dealer']=session('jxuser_id'); //出货接收方
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

                if($v['od_state']==1 || $v['od_state']==2 || $v['od_state']==3){
                    if($oddt_totalqty>0){
                        if($oddt_totalqty>$data3){
                            $data2[$kk]['oddt_canship']=1;
                        }else{
                            $data2[$kk]['oddt_canship']=0;
                        }
                    }else{

                        $data2[$kk]['oddt_canship']=0;
                    }
                }else{
                    $data2[$kk]['oddt_canship']=0;
                }
            }

            $list[$k]['orderdetail']=$data2;
            $list[$k]['odtotalqty']=$odtotalqty;
            //状态 我的订单状态 以fw_orders表为主
            if($v['od_state']==0){
                $list[$k]['od_state_str']='待确认';
            }else if($v['od_state']==1){
                $list[$k]['od_state_str']='待发货';
            }else if($v['od_state']==2){
                $list[$k]['od_state_str']='部分发货';
            }else if($v['od_state']==3){
                $list[$k]['od_state_str']='已发货';
            }else if($v['od_state']==8){
                $list[$k]['od_state_str']='已完成';
            }else if($v['od_state']==9){
                $list[$k]['od_state_str']='已取消';
            }else{
                $list[$k]['od_state_str']='未知';
            }

            /*
            //允许操作
            $caozuostr='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/dlorderdetail?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >订单详细</div> ';

            //确认订单
            if($v['odbl_state']==0){
                $caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/canceldlorder?state=1&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >确认订单</div> ';
            }
            //取消订单
             if($v['odbl_state']==0 || $v['odbl_state']==1 ){
                $caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./'.C('MODULE_NAME').'/Orders/canceldlorder?state=9&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >取消订单</div> ';
            }
            $list[$k]['caozuostr']=$caozuostr;
            */

        }
//        $count=$count-1;
        $this->assign('od_state', $od_state);
        $this->assign('page', $show);
        $this->assign('list', $list);
        $this->assign('od_state', $od_state);
//        $this->assign('count', $count);
        $this->display('region_order');
    }
    //取消、确认区域订单
    public function cancelquyorder(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
            $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
        //--------------------------------

        $od_id=intval(I('get.od_id',0));
        $state=intval(I('get.state',0));

        if($state==1){
            $state=1;
            $odlg_action='确认订单';
        }else if($state==9){
            $state=9;
            $odlg_action='取消订单';
        }else{
            $this->error('无该操作权限','',2);
        }

        $Orders= M('Orders');
        $Orderlogs= M('Orderlogs');
//        $Shipment= M('Shipment');
        if($od_id>0){
            //修改订单关系表状态
            $Orders=M('Orders');
            $map=array();
            $map['od_unitcode']=$this->qy_unitcode;
            $map['od_id']=$od_id;
//            $map['od_rcdlid']=session('jxuser_id');
            $data = $Orders->where($map)->find();
//            dump($data);die();
            if($data){
                //只有待确认、待发货的订单才能取消 确认
                if($data['od_state']==0 || $data['od_state']==1){
//                    //是否有出货记录 如有则不能取消
//                    $map3=array();
//                    $data3=array();
//                    $map3['ship_unitcode']=$this->qy_unitcode;
//                    $map3['ship_odid']=$od_id;
//                    $map3['ship_dealer']=$data['od_oddlid']; //出货接收方
//                    $data3=$Shipment->where($map3)->find();
//                    if($data3){
//                        $this->error('该订单已有出货记录，不能取消','',2);
//                    }

                    //修改原始订单状态
                    $updata=array();
                    $updata['od_state']=$state;
                    $Orders->where($map)->save($updata);

                    //订单操作日志 begin
                    $odlog_arr=array(
                        'odlg_unitcode'=>$this->qy_unitcode,
                        'odlg_odid'=>$od_id,
                        'odlg_orderid'=>$data['od_orderid'],
                        'odlg_dlid'=>session('jxuser_id'),
                        'odlg_dlusername'=>session('jxuser_username'),
                        'odlg_dlname'=>session('jxuser_dlname'),
                        'odlg_action'=>$odlg_action,
                        'odlg_type'=>1, //0-企业 1-经销商
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


                    $this->redirect(C('MODULE_NAME').'/Orders/region_order/od_state/'.$data['od_state'].'','' , 0, '');

                }else{
                    $this->error('该订单已处理，不能取消','',2);
                }
            }else{
                $this->error('没有该记录','',2);
            }

        }else{
            $this->error('没有该记录','',2);
        }

    }
//区域订单详情
    public function quyorderdetail(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
            $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
        //--------------------------------
        $od_id=intval(I('get.od_id',0));

        if($od_id>0){
            $Orders=M('Orders');
            $map=array();
            $map['od_unitcode']=$this->qy_unitcode;
            $map['od_id']=$od_id;
//            $map['od_rcdlid']=session('jxuser_id');
            $data =$Orders->where($map)->find();
            if($data){
                //订单产品详细
                $odtotalqty=0; //订单总数量
                $Orderdetail= M('Orderdetail');
                $Product= M('Product');
                $Shipment= M('Shipment');
                $Dealer= M('Dealer');

                $map2=array();
                $data2=array();
                $map2['oddt_unitcode']=$this->qy_unitcode;
                $map2['oddt_odid']=$data['od_id'];
                $data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
                $imgpath = BASE_PATH.'/Public/uploads/product/';
                foreach($data2 as $kk=>$vv){
                    //产品
                    $map3=array();
                    $data3=array();
                    $map3['pro_id']=$vv['oddt_proid'];
                    $map3['pro_unitcode']=$this->qy_unitcode;
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

                    $odtotalqty+=$oddt_totalqty;

                    if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
                        $data2[$kk]['oddt_totalqty']='';
                    }else{
                        $data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
                    }

                    $map3=array();
                    $data3=array();
                    $map3['ship_pro']=$vv['oddt_proid'];
                    $map3['ship_unitcode']=$this->qy_unitcode;
                    $map3['ship_odid']=$vv['oddt_odid'];
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

                    //出货按钮

                    if($data['od_state']==1 || $data['od_state']==2 || $data['od_state']==3){

                        if($oddt_totalqty>0){
                            if($oddt_totalqty>$data3){
                                $data2[$kk]['oddt_shipment']=1;
                            }else{
                                $data2[$kk]['oddt_shipment']=0;
                            }
                        }else{
                            if($vv['oddt_qty']>$data3){
                                $data2[$kk]['oddt_shipment']=1;
                            }else{
                                $data2[$kk]['oddt_shipment']=0;
                            }
                        }
                    }else{
                        $data2[$kk]['oddt_shipment']=0;
                    }

                }

                $data['odtotalqty']=$odtotalqty;
                $data['orderdetail']=$data2;

                //下单代理信息
                $map3=array();
                $data3=array();
                $map3['dl_id']=$data['od_oddlid'];
                $map3['dl_unitcode']=$this->qy_unitcode;
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

                //接单代理
                if($data['od_rcdlid']>0){
                    $map3=array();
                    $data3=array();
                    $map3['dl_id']=$data['od_rcdlid'];
                    $map3['dl_unitcode']=$this->qy_unitcode;
                    $data3=$Dealer->where($map3)->find();
                    if($data3){
                        $data['od_rcdl_name']='姓名：'.$data3['dl_name'];
                        $data['od_rcdl_tel']=$data3['dl_tel'];
                        $data['od_rcdl_weixin']=$data3['dl_weixin'];
                    }else{
                        $data['od_rcdl_name']='';
                        $data['od_rcdl_tel']='';
                        $data['od_rcdl_weixin']='';
                    }
                }else{
                    $data['od_rcdl_name']='总公司';
                    $data['od_rcdl_tel']='';
                    $data['od_rcdl_weixin']='';
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
                    $data['od_paypic_str']=__ROOT__.'/Public/uploads/orders/'.$data['od_paypic'];
                }else{
                    $data['od_paypic_str']='';
                }


                // //允许操作


                //操作日志
                $Orderlogs= M('Orderlogs');
                $map2=array();
                $map2['odlg_unitcode']=$this->qy_unitcode;
                $map2['odlg_odid']=$od_id;

                $logs = $Orderlogs->where($map2)->order('odlg_addtime DESC')->limit(50)->select();
                foreach($logs as $kkk=>$vvv){
                    if($vvv['odlg_type']==0){
                        $logs[$kkk]['odlg_dlname']='总公司';
                    }
                }

            }else{
                $this->error('没有该记录','',2);
            }
        }else{
            $this->error('没有该记录','',2);
        }



        $this->assign('orderlogs', $logs);

        $this->assign('od_state', $data['od_state']);
        $this->assign('ordersinfo', $data);
        $this->assign('od_id', $od_id);
        $this->display('quyorderdetail');
    }
//    区域完成发货
    public function quyodfinishship(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
            $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
        //--------------------------------
        $action=I('post.action','');


        if($action=='save'){
            $od_id=intval(I('post.od_id',0));
            if($od_id>0) {
                $od_express = intval(I('post.od_express', 0));
                $od_expressnum = I('post.od_expressnum', '');
                $od_remark = I('post.od_remark', '');
                if ($od_express <= 0) {
                    $this->error('请选择物流快递', '', 2);
                    exit;
                }

                $Orders = M('Orders');
                $map = array();
                $map['od_unitcode'] = $this->qy_unitcode;
                $map['od_id'] = $od_id;
                $map['od_rcdlid'] = 0;//下给公司的订单
                $data = $Orders->where($map)->find();

                if ($data) {
                    //检测是否能发货 //订购数 发货数
                    $Orderdetail = M('Orderdetail');
                    $Shipment = M('Shipment');
                    $map2 = array();
                    $oddetail = array();
                    $map2['oddt_unitcode'] =  $this->qy_unitcode;
                    $map2['oddt_odid'] = $od_id;
                    $oddetail = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
                    $proids = array();
                    foreach ($oddetail as $kk => $vv) {

                        $proids[] = $vv['oddt_proid'];

                        //订购数
                        $oddt_totalqty = 0;
                        $oddt_unitsqty = 0;
                        if ($vv['oddt_prodbiao'] > 0) {
                            $oddt_unitsqty = $vv['oddt_prodbiao'];

                            if ($vv['oddt_prozbiao'] > 0) {
                                $oddt_unitsqty = $oddt_unitsqty * $vv['oddt_prozbiao'];
                            }

                            if ($vv['oddt_proxbiao'] > 0) {
                                $oddt_unitsqty = $oddt_unitsqty * $vv['oddt_proxbiao'];
                            }

                            $oddt_totalqty = $oddt_unitsqty * $vv['oddt_qty'];
                        }
                        if ($oddt_totalqty == 0) {
                            $oddt_totalqty = $vv['oddt_qty'];
                        }

                        $oddetail[$kk]['oddt_totalqty'] = $oddt_totalqty;

//                        //发货数
//                        $map3=array();
//                        $data3=array();
//                        $map3['ship_pro']=$vv['oddt_proid'];
//                        $map3['ship_unitcode']=session('unitcode');
//                        $map3['ship_odid']=$vv['oddt_odid'];
//                        $map3['ship_oddtid']=$vv['oddt_id'];
//                        $map3['ship_dealer']=$data['od_oddlid']; //出货接收方
//                        $data3=$Shipment->where($map3)->sum('ship_proqty');
//                        if($data3){
//                            if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
//                                if($this->check_qypurview('13004',0)){
//                                    //完成订单不以完成出货为条件
//                                }else{
//                                    $this->error('该订单还没完成出货','',2);
//                                    exit;
//                                }
//                            }
//                            if( $oddt_totalqty<$data3){
//                                $this->error('该订单出货的数量大于订购数量','',2);
//                                exit;
//                            }
//                        }else{
//                            if($this->check_qypurview('13004',0)){
//                                //完成订单不以完成出货为条件
//                            }else{
//                                $this->error('该订单还没完成出货','',2);
//                                exit;
//                            }
//                        }
                    }
                } else {
//                    $this->error('该订单记录不存在','',2);
                    $msg = array('stat' => 0, 'msg' => '该订单记录不存在');
                    echo json_encode($msg);
                    exit;
                }


                //写入物流信息
                $map2 = array();
                $updata2 = array();
                $map2['od_unitcode'] =  $this->qy_unitcode;
                $map2['od_id'] = $od_id;

                $updata2['od_express'] = $od_express;
                $updata2['od_expressnum'] = $od_expressnum;
                $updata2['od_dealremark'] = $od_remark;
                if ($data['od_express'] <= 0) {
                    $updata2['od_expressdate'] = time();
                }
                $Orders->where($map2)->save($updata2);


                //修改原始订单状态
                $map2 = array();
                $updata2 = array();
                $map2['od_unitcode'] =  $this->qy_unitcode;
                $map2['od_id'] = $od_id;
                $updata2['od_state'] = 3;
                $Orders->where($map2)->save($updata2);

                if($data['od_express']<=0){
                    //订单返利 begin
                $fanli_dlid1 = 0; //返利给的代理商1
                $fanli_dlid2 = 0; //返利给的代理商2
                $fanli_dlid3 = 0; //返利给的代理商3
                $ismaiduan = 0;
                $fanli_dlname1 = '';
                $fanli_dlname2 = '';
                $fanli_dlname3 = '';
                $fanli_dlusername1 = '';
                $fanli_dlusername2 = '';
                $fanli_dlusername3 = '';
                $fanli_dllevel1 = 0;
                $fanli_dllevel2 = 0;
                $fanli_dllevel3 = 0;
                $Dealer = M('Dealer');
                //下单人
                $map3 = array();
                $orderdealer = array();
                $map3['dl_unitcode'] =  $this->qy_unitcode;
                $map3['dl_id'] = $data['od_oddlid'];  //下单的代理
                $orderdealer = $Dealer->where($map3)->find();
                if ($orderdealer) {

                    $Fanlidetail = M('Fanlidetail');
                    $odcount = 0; //是否首次下单

                    ////=========================================推荐返利 一次性返利
                    if ($orderdealer['dl_level'] == 1 || $orderdealer['dl_level'] == 2 || $orderdealer['dl_level'] == 3 || $orderdealer['dl_level'] == 4) {

                        //是不是首次下单
                        $map51 = array();
                        $map51['od_oddlid'] = $orderdealer['dl_id'];
                        $map51['od_unitcode'] =  $this->qy_unitcode;
                        $map51['od_state'] = 8;
                        $odcount51 = $Orders->where($map51)->count();
                        if ($odcount51 == 0) {
                            $map5 = array();
                            $map5['od_oddlid'] = $orderdealer['dl_id'];
                            $map5['od_unitcode'] =  $this->qy_unitcode;
                            $map5['od_state'] = 3;
                            $odcount52 = $Orders->where($map5)->count();
                            if ($odcount52 == 1) {
                                $oddata5 = $Orders->where($map5)->find();
                                if ($oddata5) {
                                    if ($oddata5['od_id'] == $data['od_id']) {
                                        $odcount = 1;
                                    } else {
                                        $odcount = 0;
                                    }
                                } else {
                                    $odcount = 0;
                                }
                            }
                        } else {
                            $odcount = 0;
                        }


                        //下单代理的推荐人
                        $map4 = array();
                        $data4 = array();
                        $map4['dl_unitcode'] =  $this->qy_unitcode;
                        $map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人

                        $data4 = $Dealer->where($map4)->find();
                        if ($data4) {
                            //推荐人级别对应返利
                            $Dltypefanli = M('Dltypefanli');
                            $map2 = array();
                            $map2['tfl_unitcode'] =  $this->qy_unitcode;
                            $map2['tfl_dltype'] = $data4['dl_type'];  //推荐人级别
                            $map2['tfl_tjdltype'] = $orderdealer['dl_type'];  //被推荐人级别
                            $dltflinfo = $Dltypefanli->where($map2)->find();
                            if ($dltflinfo) {
                                $dlt_fanli1 = $dltflinfo['tfl_fanli1'];
                            } else {
                                $dlt_fanli1 = 0;
                            }

                            $Dltype = M('Dltype');
                            $map2 = array();
                            $map2['dlt_unitcode'] =  $this->qy_unitcode;
                            $map2['dlt_id'] = $orderdealer['dl_type'];
                            $dltinfo = $Dltype->where($map2)->find();
                            if ($dltinfo) {
                            } else {
                                $dlt_fanli1 = 0;
                            }

                            //如果首次下单 推荐返利
                            if ($odcount == 1) {
                                //如果有直推返利
                                if ($dlt_fanli1 > 0 && $data4['dl_status'] == 1) {
                                    $shouxufei = $dlt_fanli1 * C('FANLI_SHOUXUFEI');
                                    $data5 = array();
                                    $data5['fl_unitcode'] =  $this->qy_unitcode;
                                    $data5['fl_dlid'] = $data4['dl_id']; //获得返利的代理
                                    $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                    $data5['fl_type'] = 1; // 返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                    $data5['fl_money'] = $dlt_fanli1;
                                    $data5['fl_shouxufei'] = $shouxufei;
                                    $data5['fl_refedlid'] = $orderdealer['dl_id']; //推荐返利中被推荐的代理
                                    $data5['fl_oddlid'] = 0; //订单返利中 下单的代理
                                    $data5['fl_odid'] = 0;  //订单返利中 订单流水id
                                    $data5['fl_orderid'] = ''; //订单返利中 订单id
                                    $data5['fl_proid'] = 0;  //订单返利中 产品id
                                    $data5['fl_odblid'] = 0;  //订单返利中 订单关系id
                                    $data5['fl_qty'] = 0;  //订单返利中 产品数量
                                    $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                    $data5['fl_addtime'] = time();
                                    $data5['fl_remark'] = '邀请代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 成为 ' . $dltinfo['dlt_name'];


                                    $map5 = array();
                                    $map5['fl_unitcode'] =  $this->qy_unitcode;
                                    $map5['fl_dlid'] = $data4['dl_id'];
                                    $map5['fl_type'] = 1;
                                    $map5['fl_level'] = 1;
                                    $map5['fl_refedlid'] = $orderdealer['dl_id'];
                                    $data6 = $Fanlidetail->where($map5)->find();
                                    if (!$data6) {
                                        $rs5 = $Fanlidetail->create($data5, 1);
                                        if ($rs5) {
                                            $Fanlidetail->add();
                                        }
                                    }
                                }

                                //推荐人2级 间推返利
                                if ($data4['dl_referee'] > 0) {
                                    $map6 = array();
                                    $data6 = array();
                                    $map6['dl_unitcode'] =  $this->qy_unitcode;
                                    $map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
                                    $map6['dl_status'] = 1;
                                    $data6 = $Dealer->where($map6)->find();
                                    if ($data6) {
                                        $map2 = array();
                                        $map2['tfl_unitcode'] =  $this->qy_unitcode;
                                        $map2['tfl_dltype'] = $data6['dl_type'];  //推荐人级别
                                        $map2['tfl_tjdltype'] = $orderdealer['dl_type'];  //被推荐人级别
                                        $dltflinfo2 = $Dltypefanli->where($map2)->find();
                                        if ($dltflinfo2) {
                                            $dlt_fanli2 = $dltflinfo2['tfl_fanli2'];
                                        } else {
                                            $dlt_fanli2 = 0;
                                        }

                                        if ($dlt_fanli2 > 0) {
                                            $shouxufei = $dlt_fanli2 * C('FANLI_SHOUXUFEI');
                                            $data5 = array();
                                            $data5['fl_unitcode'] =  $this->qy_unitcode;
                                            $data5['fl_dlid'] = $data6['dl_id']; //获得返利的代理
                                            $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                            $data5['fl_type'] = 1; // 返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                            $data5['fl_money'] = $dlt_fanli2;
                                            $data5['fl_shouxufei'] = $shouxufei;
                                            $data5['fl_refedlid'] = $orderdealer['dl_id']; //推荐返利中被推荐的代理
                                            $data5['fl_oddlid'] = 0; //订单返利中 下单的代理
                                            $data5['fl_odid'] = 0;  //订单返利中 订单流水id
                                            $data5['fl_orderid'] = ''; //订单返利中 订单id
                                            $data5['fl_proid'] = 0;  //订单返利中 产品id
                                            $data5['fl_odblid'] = 0;  //订单返利中 订单关系id
                                            $data5['fl_qty'] = 0;  //订单返利中 产品数量
                                            $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                            $data5['fl_addtime'] = time();
                                            $data5['fl_remark'] = '代理 ' . $data4['dl_name'] . '(' . $data4['dl_username'] . ') 邀请代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 成为 ' . $dltinfo['dlt_name'];


                                            $map5 = array();
                                            $map5['fl_unitcode'] =  $this->qy_unitcode;
                                            $map5['fl_dlid'] = $data6['dl_id'];
                                            $map5['fl_type'] = 1;
                                            $map5['fl_level'] = 2;
                                            $map5['fl_refedlid'] = $orderdealer['dl_id'];
                                            $data6 = $Fanlidetail->where($map5)->find();
                                            if (!$data6) {
                                                $rs5 = $Fanlidetail->create($data5, 1);
                                                if ($rs5) {
                                                    $Fanlidetail->add();
                                                }
                                            }
                                        }
                                    }

                                }

                            }
                        }
                    }

                    //=========================================订单返利
                    $Profanli = M('Profanli');
                    $map2 = array();
                    $map2['pfl_unitcode'] =$this->qy_unitcode;
                    $map2['pfl_tjdltype'] = $orderdealer['dl_type'];

                    if ($proids) {
                        $map2['pfl_proid'] = array('IN', $proids);
                    }
                    $data2 = $Profanli->where($map2)->find(); //是否有设置返利
//                    $msg=array('stat'=>$data2,'msg'=>$odcount);
//                    echo json_encode($msg);
//                    exit;
                    if ($odcount == 0) { //复销订单返利


                        //返利
                        if ($data2) {
                            if ($orderdealer['dl_referee'] > 0) {

                                //下单代理的推荐人
                                $map4 = array();
                                $data4 = array();
                                $map4['dl_unitcode'] =$this->qy_unitcode;
                                $map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人

                                $data4 = $Dealer->where($map4)->find();
                                if ($data4) {
                                    if ($data4['dl_status'] == 1) {
                                        $fanli_dlid1 = $data4['dl_id']; //返利给的代理商1
                                        $fanli_dlname1 = $data4['dl_name'];
                                        $fanli_dlusername1 = $data4['dl_username'];
                                        $fanli_dllevel1 = $data4['dl_level'];
                                        $dl_type1 = $data4['dl_type'];
                                    }


                                    //推荐人的推荐人
                                    if ($data4['dl_referee'] > 0) {
                                        $map6 = array();
                                        $data6 = array();
                                        $map6['dl_unitcode'] = $this->qy_unitcode;
                                        $map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
                                        $map6['dl_status'] = 1;
                                        $data6 = $Dealer->where($map6)->find();
                                        if ($data6) {

                                            $fanli_dlid2 = $data6['dl_id']; //返利给的代理商2
                                            $fanli_dlname2 = $data6['dl_name'];
                                            $fanli_dlusername2 = $data6['dl_username'];
                                            $fanli_dllevel2 = $data6['dl_level'];
                                            $dl_type2 = $data6['dl_type'];

                                        }
                                    }
                                }


                                //写入返利数据
                                if ($fanli_dlid1 > 0 || $fanli_dlid2 > 0) {
                                    $order_num=0;
                                    $order_num2=0;
                                    $map30['dl_unitcode'] = $this->qy_unitcode;
                                    $map30['dlt_id'] = $orderdealer['dl_type'];  //下单的代理
                                    $order_dltype = $Dltype->where($map30)->find();//下单的代理等级
                                    foreach($oddetail as $kk=>$vv) {
                                        //直推复销返利
                                        if ($fanli_dlid1 > 0) {
                                            $map2 = array();
                                            $data2 = array();
                                            $map2['pfl_unitcode'] = $this->qy_unitcode;
                                            $map2['pfl_proid'] = $vv['oddt_proid'];
                                            $map2['pfl_dltype'] = $dl_type1;
                                            $map2['pfl_tjdltype'] = $orderdealer['dl_type'];
                                            $data2 = $Profanli->where($map2)->find();
                                            if ($data2) {
                                                $pfl_fanli1 = $data2['pfl_fanli1'];
                                            } else {
                                                $pfl_fanli1 = 0;
                                            }


                                            if ($pfl_fanli1 > 0) {
                                                $map8 = array();
                                                $data8 = array();
                                                $map8['fl_unitcode'] = $this->qy_unitcode;
                                                $map8['fl_type'] = 2;
                                                $map8['fl_odid'] = $vv['oddt_odid'];
                                                $map8['fl_proid'] = $vv['oddt_proid'];
                                                $map8['fl_oddtid'] = $vv['oddt_id'];
                                                $map8['fl_oddlid'] = $orderdealer['dl_id'];
                                                $map8['fl_level'] = 1;
                                                $data8 = $Fanlidetail->where($map8)->find();
                                                if (!$data8) {

                                                    /*
                                                    //佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
                                                    if($pfl_fanli1>0 && $pfl_fanli1<1){
                                                        $pfl_fanli1sum=$pfl_fanli1*$vv['oddt_dlprice']*$vv['oddt_qty'];
                                                    }else{
                                                        $pfl_fanli1sum=$pfl_fanli1*$vv['oddt_qty'];
                                                    }
                                                    */

                                                    if ($orderdealer['dl_level'] == 1) {
                                                        //下单人为旗舰店，订单内超出补货订单最低金额的内容不返利

                                                        if ($order_dltype) {
                                                            if ($order_dltype['dlt_minnum'] != 0) {
                                                                $dlt_minnum = $order_dltype['dlt_minnum'];
                                                                if ($data['od_total'] <= $dlt_minnum) {
//                                                                      正常返利
                                                                    $pfl_fanli1sum = $pfl_fanli1 * $vv['oddt_qty'];
                                                                    $shouxufei = $pfl_fanli1sum * C('FANLI_SHOUXUFEI');

                                                                    $data5 = array();
                                                                    $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                    $data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
                                                                    $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                    $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                    $data5['fl_money'] = $pfl_fanli1sum;
                                                                    $data5['fl_shouxufei'] = $shouxufei;
                                                                    $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                    $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                    $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                    $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                    $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                    $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                    $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                    $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                    $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                                                    $data5['fl_addtime'] = time();
                                                                    $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                    $rs5 = $Fanlidetail->create($data5, 1);
                                                                    if ($rs5) {
                                                                        $Fanlidetail->add();
                                                                    }
                                                                } else {
                                                                    $order_num += $vv['oddt_dlprice'] * $vv['oddt_qty'];
                                                                    if ($order_num > $dlt_minnum) {//$order_num为每个明细
                                                                        $c_num = $order_num - $dlt_minnum;//超出的订单额
                                                                        $a = intval($c_num / $vv['oddt_dlprice']);
                                                                        $vv['oddt_qty'] = $vv['oddt_qty'] - $a;

                                                                        $pfl_fanli1sum = $pfl_fanli1 * $vv['oddt_qty'];
                                                                        $shouxufei = $pfl_fanli1sum * C('FANLI_SHOUXUFEI');

                                                                        $data5 = array();
                                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                        $data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
                                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                        $data5['fl_money'] = $pfl_fanli1sum;
                                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                        $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                                                        $data5['fl_addtime'] = time();
                                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                                        if ($rs5) {
                                                                            $Fanlidetail->add();
                                                                        }
                                                                        break;

                                                                    } else {
                                                                        $pfl_fanli1sum = $pfl_fanli1 * $vv['oddt_qty'];
                                                                        $shouxufei = $pfl_fanli1sum * C('FANLI_SHOUXUFEI');

                                                                        $data5 = array();
                                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                        $data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
                                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                        $data5['fl_money'] = $pfl_fanli1sum;
                                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                        $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                                                        $data5['fl_addtime'] = time();
                                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                                        if ($rs5) {
                                                                            $Fanlidetail->add();
                                                                        }

                                                                    }

                                                                }

                                                            } else {
                                                                $pfl_fanli1sum = $pfl_fanli1 * $vv['oddt_qty'];
                                                                $shouxufei = $pfl_fanli1sum * C('FANLI_SHOUXUFEI');

                                                                $data5 = array();
                                                                $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                $data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
                                                                $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                $data5['fl_money'] = $pfl_fanli1sum;
                                                                $data5['fl_shouxufei'] = $shouxufei;
                                                                $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                                                $data5['fl_addtime'] = time();
                                                                $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                $rs5 = $Fanlidetail->create($data5, 1);
                                                                if ($rs5) {
                                                                    $Fanlidetail->add();
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        //正常返利
                                                        $pfl_fanli1sum = $pfl_fanli1 * $vv['oddt_qty'];
                                                        $shouxufei = $pfl_fanli1sum * C('FANLI_SHOUXUFEI');

                                                        $data5 = array();
                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                        $data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                        $data5['fl_money'] = $pfl_fanli1sum;
                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                        $data5['fl_level'] = 1;  //返利的层次，1-第一层返利 2-第二层返利
                                                        $data5['fl_addtime'] = time();
                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                        if ($rs5) {
                                                            $Fanlidetail->add();
                                                        }
                                                    }

                                                }
                                            }

                                        }
                                    }
                                    foreach($oddetail as $kk=>$vv) {
                                        //间接返利
                                        if ($fanli_dlid2 > 0) {
                                            $map2 = array();
                                            $data2 = array();
                                            $map2['pfl_unitcode'] = $this->qy_unitcode;
                                            $map2['pfl_proid'] = $vv['oddt_proid'];
                                            $map2['pfl_dltype'] = $dl_type2;
                                            $map2['pfl_tjdltype'] = $orderdealer['dl_type'];
                                            $data2 = $Profanli->where($map2)->find();
                                            if ($data2) {
                                                $pfl_fanli2 = $data2['pfl_fanli2'];
                                            } else {
                                                $pfl_fanli2 = 0;
                                            }

                                            if ($pfl_fanli2 > 0) {
                                                $map8 = array();
                                                $data8 = array();
                                                $map8['fl_unitcode'] = $this->qy_unitcode;
                                                $map8['fl_type'] = 2;
                                                $map8['fl_odid'] = $vv['oddt_odid'];
                                                $map8['fl_proid'] = $vv['oddt_proid'];
                                                $map8['fl_oddtid'] = $vv['oddt_id'];
                                                $map8['fl_oddlid'] = $orderdealer['dl_id'];
                                                $map8['fl_level'] = 2;
                                                $data8 = $Fanlidetail->where($map8)->find();
                                                if (!$data8) {

                                                    /*
                                                    //佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
                                                    if($pfl_fanli2>0 && $pfl_fanli2<1){
                                                        $pfl_fanli2sum=$pfl_fanli2*$vv['oddt_dlprice']*$vv['oddt_qty'];
                                                    }else{
                                                        $pfl_fanli2sum=$pfl_fanli2*$vv['oddt_qty'];
                                                    }
                                                    */

                                                    if ($orderdealer['dl_level'] == 1) {
                                                        //下单人为旗舰店，订单内超出补货订单最低金额的内容不返利
                                                        $map30['dl_unitcode'] = $this->qy_unitcode;
                                                        $map30['dlt_id'] = $orderdealer['dl_type'];  //下单的代理
                                                        $order_dltype = $Dltype->where($map30)->find();
                                                        if ($order_dltype) {
                                                            if ($order_dltype['dlt_minnum'] != 0) {
                                                                $dlt_minnum = $order_dltype['dlt_minnum'];
                                                                if ($data['od_total'] <= $dlt_minnum) {
//                                                                        正常返利
                                                                    $pfl_fanli2sum = $pfl_fanli2 * $vv['oddt_qty'];
                                                                    $shouxufei = $pfl_fanli2sum * C('FANLI_SHOUXUFEI');

                                                                    $data5 = array();
                                                                    $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                    $data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
                                                                    $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                    $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                    $data5['fl_money'] = $pfl_fanli2sum;
                                                                    $data5['fl_shouxufei'] = $shouxufei;
                                                                    $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                    $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                    $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                    $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                    $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                    $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                    $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                    $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                    $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                                                    $data5['fl_addtime'] = time();
                                                                    $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                    $rs5 = $Fanlidetail->create($data5, 1);
                                                                    if ($rs5) {
                                                                        $Fanlidetail->add();
                                                                    }
                                                                } else {
                                                                    $order_num2 += $vv['oddt_dlprice'] * $vv['oddt_qty'];
                                                                    if ($order_num2 > $dlt_minnum) {
                                                                        $c_num = $order_num2 - $dlt_minnum;//超出的订单额
                                                                        $a = intval($c_num / $vv['oddt_dlprice']);
                                                                        $vv['oddt_qty'] = $vv['oddt_qty'] - $a;
                                                                        $pfl_fanli2sum = $pfl_fanli2 * $vv['oddt_qty'];
                                                                        $shouxufei = $pfl_fanli2sum * C('FANLI_SHOUXUFEI');

                                                                        $data5 = array();
                                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                        $data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
                                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                        $data5['fl_money'] = $pfl_fanli2sum;
                                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                        $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                                                        $data5['fl_addtime'] = time();
                                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                                        if ($rs5) {
                                                                            $Fanlidetail->add();
                                                                        }
                                                                        break;
                                                                    } else {
//                                                                            正常返利
                                                                        $pfl_fanli2sum = $pfl_fanli2 * $vv['oddt_qty'];
                                                                        $shouxufei = $pfl_fanli2sum * C('FANLI_SHOUXUFEI');

                                                                        $data5 = array();
                                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                        $data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
                                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                        $data5['fl_money'] = $pfl_fanli2sum;
                                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                        $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                                                        $data5['fl_addtime'] = time();
                                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                                        if ($rs5) {
                                                                            $Fanlidetail->add();
                                                                        }
                                                                    }

                                                                }

                                                            } else {
                                                                //正常返利
                                                                $pfl_fanli2sum = $pfl_fanli2 * $vv['oddt_qty'];
                                                                $shouxufei = $pfl_fanli2sum * C('FANLI_SHOUXUFEI');
                                                                $data5 = array();
                                                                $data5['fl_unitcode'] = $this->qy_unitcode;
                                                                $data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
                                                                $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                                $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                                $data5['fl_money'] = $pfl_fanli2sum;
                                                                $data5['fl_shouxufei'] = $shouxufei;
                                                                $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                                $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                                $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                                $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                                $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                                $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                                $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                                $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                                $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                                                $data5['fl_addtime'] = time();
                                                                $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                                $rs5 = $Fanlidetail->create($data5, 1);
                                                                if ($rs5) {
                                                                    $Fanlidetail->add();
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        //正常返利
                                                        $pfl_fanli2sum = $pfl_fanli2 * $vv['oddt_qty'];
                                                        $shouxufei = $pfl_fanli2sum * C('FANLI_SHOUXUFEI');

                                                        $data5 = array();
                                                        $data5['fl_unitcode'] = $this->qy_unitcode;
                                                        $data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
                                                        $data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
                                                        $data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
                                                        $data5['fl_money'] = $pfl_fanli2sum;
                                                        $data5['fl_shouxufei'] = $shouxufei;
                                                        $data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
                                                        $data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
                                                        $data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
                                                        $data5['fl_orderid'] = $vv['oddt_orderid']; //订单返利中 订单id
                                                        $data5['fl_proid'] = $vv['oddt_proid'];  //订单返利中 产品id
                                                        $data5['fl_oddtid'] = $vv['oddt_id'];  //订单详细id
                                                        $data5['fl_odblid'] = $vv['oddt_odblid'];  //订单返利中 订单关系id
                                                        $data5['fl_qty'] = $vv['oddt_qty'];  //订单返利中 产品数量
                                                        $data5['fl_level'] = 2;  //返利的层次，1-第一层返利 2-第二层返利
                                                        $data5['fl_addtime'] = time();
                                                        $data5['fl_remark'] = '代理 ' . $orderdealer['dl_name'] . '(' . $orderdealer['dl_username'] . ') 订购 ' . $vv['oddt_proname'] . ' 数量 ' . $vv['oddt_qty'];
                                                        $rs5 = $Fanlidetail->create($data5, 1);
                                                        if ($rs5) {
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
                }
                //返利 end


                //订单操作日志 begin
                $odlog_arr = array(
                    'odlg_unitcode' => $this->qy_unitcode,
                    'odlg_odid' => $od_id,
                    'odlg_orderid' => $data['od_orderid'],
                    'odlg_dlid' => session('qyid'),
                    'odlg_dlusername' => session('qyuser'),
                    'odlg_dlname' => session('qyuser'),
                    'odlg_action' => '完成发货',
                    'odlg_type' => 0, //0-企业 1-经销商
                    'odlg_addtime' => time(),
                    'odlg_ip' => real_ip(),
                    'odlg_link' => __SELF__
                );
                $Orderlogs = M('Orderlogs');
                $rs3 = $Orderlogs->create($odlog_arr, 1);
                if ($rs3) {
                    $Orderlogs->add();
                }
                //订单操作日志 end
            }

//                $this->error('物流信息提交成功',U('Mp/Orders/cporderdetail/od_id/'.$od_id.'/odbl_id/'.$od_id.'/back/1'),2);
                $msg=array('stat'=>1,'msg'=>'物流信息提交成功');
                echo json_encode($msg);
                exit;
            }else{
                $msg=array('stat'=>0,'msg'=>'该订单记录不存在');
                echo json_encode($msg);
                exit;
            }
        }else{
//             渲染界面
            $od_id=intval(I('get.od_id',0));
            $od_state=intval(I('get.od_state',0));

            if($od_id>0){
                $Orders=M('Orders');
                $map=array();
                $map['od_unitcode']=$this->qy_unitcode;
                $map['od_id']=$od_id;
//                $map['od_rcdlid']=session('jxuser_id');
                $data =$Orders->where($map)->find();
                if($data){
//                    //检测是否能发货 //订购数 发货数
//                    $Orderdetail = M('Orderdetail');
//                    $Shipment = M('Shipment');
//                    $map2=array();
//                    $data2=array();
//                    $map2['oddt_unitcode']=$this->qy_unitcode;
//                    $map2['oddt_odid']=$od_id;
//                    $data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();

//                    foreach($data2 as $kk=>$vv){
//                        //订购数
//                        $oddt_totalqty=0;
//                        $oddt_unitsqty=0;
//                        if($vv['oddt_prodbiao']>0){
//                            $oddt_unitsqty=$vv['oddt_prodbiao'];
//
//                            if($vv['oddt_prozbiao']>0){
//                                $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
//                            }
//
//                            if($vv['oddt_proxbiao']>0){
//                                $oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
//                            }
//
//                            $oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
//                        }else{
//                            $oddt_totalqty=$vv['oddt_qty'];
//                        }


//                        //发货数
//                        $map3=array();
//                        $data3=array();
//                        $map3['ship_pro']=$vv['oddt_proid'];
//                        $map3['ship_unitcode']=$this->qy_unitcode;
//                        $map3['ship_odid']=$vv['oddt_odid'];
//                        $map3['ship_oddtid']=$vv['oddt_id'];
//                        $map3['ship_dealer']=$data['od_oddlid']; //出货接收方
//                        $data3=$Shipment->where($map3)->sum('ship_proqty');
//                        if($data3){
//                            if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
//                                $this->error('该订单还没完成出货','',2);
//                                exit;
//                            }
//                            if( $oddt_totalqty<$data3){
//                                $this->error('该订单出货的数量大于订购数量','',2);
//                                exit;
//                            }
//                        }else{
//                            $this->error('该订单还没完成出货','',2);
//                            exit;
//                        }
//                    }

                    if($data['od_express']<=0){
                        $title='确认完成发货';
                    }else{
                        $title='确认修改物流';
                    }

                }else{
                    $this->error('没有该记录','',2);
                }
            }else{
                $this->error('没有该记录','',2);
            }

            //物流快递
            $Express = M('Express');
            $map=array();
            $expresslist = $Express->where($map)->order('exp_addtime DESC')->select();


            $this->assign('title', $title);
            $this->assign('expresslist', $expresslist);
            $this->assign('ordersinfo', $data);
            $this->assign('od_id', $od_id);
            $this->assign('od_state', $od_state);

            $this->display('quyodfinishship');
        }
    }
	
}