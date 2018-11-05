<?php
namespace Famaotang\Controller;
use Think\Controller;
class FanliController extends CommController {
    //返利首页
    public function index(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		
		$state=intval(I('get.state',0));
		$ly_status=intval(I('get.ly_status',0));
		
        $Dealer= M('Dealer');
        $Dltype= M('Dltype');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=wxuserTextDecode2($data['dl_name']);
			$dl_weixin=$data['dl_weixin'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
			$dl_level=$data['dl_level'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		
		$Fanlidetail= M('Fanlidetail');

		//返利总余额
		$balance_total=0;
		//应收返利求和-待收款
		$map3=array();
		$map3['fl_dlid']=session('jxuser_id');
		$map3['fl_unitcode']=$this->qy_unitcode;
		//$map3['fl_type'] = array('in','1,2,3,4,5,6,7,8,9,10'); //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
		$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消

		$flsum1 = $Fanlidetail->where($map3)->sum('fl_money');
		$flsum2 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
        if($flsum1){
		}else{
			$flsum1=0;
		}
		
		if($flsum2){
		}else{
			$flsum2=0;
		}
		
		$balance_total=$flsum1-$flsum2;


		$mapls=array();
		$parameter=array();
		$parameter['state']=$state;
        $mapls['fl_unitcode']=$this->qy_unitcode;
		if($state==1){  //已收款
			$mapls['fl_dlid']=session('jxuser_id');
			$mapls['fl_state']=1;
		}else if($state==2){ //待付款 付款中
			$mapls['fl_senddlid']=session('jxuser_id');
			$mapls['fl_state']=array('in','0,2');
		}else if($state==3){  //已付款
			$mapls['fl_senddlid']=session('jxuser_id');
			$mapls['fl_state']=1;
		}else if($state==9){
			$where=array();
			$where['fl_dlid']=session('jxuser_id');
			$where['fl_senddlid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$mapls['_complex'] = $where;
			$mapls['fl_state']=9;
		}else{              //待收款 收款中
			$mapls['fl_dlid']=session('jxuser_id');
			$mapls['fl_state']=array('in','0,2');
		}

        $count = $Fanlidetail->where($mapls)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Fanlidetail->where($mapls)->order('fl_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		foreach($list as $k=>$v){ 
		    //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
		    if($v['fl_type']>=1 && $v['fl_type']<=10){
				$list[$k]['fl_moneystr']='<span style="color:#000000; font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else if($v['fl_type']>=11 && $v['fl_type']<=20){
				$list[$k]['fl_moneystr']='<span style="color:#009900;font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else{
				$list[$k]['fl_moneystr']='<span font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}

		}

		$this->assign('dl_level', $dl_level);
		$this->assign('balance_total', $balance_total);
        $this->assign('list', $list);
        $this->assign('state', $state);
        $this->assign('ly_status', $ly_status);
		$this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->display('index');
    }
	
	//返利明细
    public function fanlilist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$state=intval(I('get.state',0));

		
		$Fanlidetail= M('Fanlidetail');

        $map=array();
		$parameter=array();
		$parameter['state']=$state;
        $map['fl_unitcode']=$this->qy_unitcode;
		   
		if($state==1){  //已收款
			$map['fl_dlid']=session('jxuser_id');
			$map['fl_state']=1;
		}else if($state==2){ //待付款 付款中
			$map['fl_senddlid']=session('jxuser_id');
			$map['fl_state']=array('in','0,2');
		}else if($state==3){  //已付款
			$map['fl_senddlid']=session('jxuser_id');
			$map['fl_state']=1;
		}else if($state==9){
			$where=array();
			$where['fl_dlid']=session('jxuser_id');
			$where['fl_senddlid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['fl_state']=9;
		}else{              //待收款 收款中
			$map['fl_dlid']=session('jxuser_id');
			$map['fl_state']=array('in','0,2');
		}

        $count = $Fanlidetail->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Fanlidetail->where($map)->order('fl_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

		foreach($list as $k=>$v){ 
		    //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
		    if($v['fl_type']>=1 && $v['fl_type']<=10){
				$list[$k]['fl_moneystr']='<span style="color:#000000; font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else if($v['fl_type']>=11 && $v['fl_type']<=20){
				$list[$k]['fl_moneystr']='<span style="color:#009900;font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else{
				$list[$k]['fl_moneystr']='<span font-size:1rem;">'.number_format($v['fl_money'], 2,'.','').'</span>';
			}

		}
        $this->assign('list', $list);
        $this->assign('state', $state);
		$this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->display('fanlilist');
		
	}	
    
	//返利详细
    public function fanlidetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $fl_id=intval(I('get.fl_id',0));
		$state=intval(I('get.state',0));
		$ly_status=intval(I('get.ly_status',0));
		$map=array();
		$map['fl_id']=$fl_id;
		$map['fl_unitcode']=$this->qy_unitcode;
		$map['fl_dlid']=session('jxuser_id');
		$Fanlidetail= M('Fanlidetail');
		$data=$Fanlidetail->where($map)->find();
		if($data){
		    //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
		    if($data['fl_type']>=1 && $data['fl_type']<=10){
				$data['fl_moneystr']='<span style="color:#000000">'.number_format($data['fl_money'], 2,'.','').'</span>';
			}else if($data['fl_type']>=11 && $data['fl_type']<=20){
				$data['fl_moneystr']='<span style="color:#009900">'.number_format($data['fl_money'], 2,'.','').'</span>';
			}else{
				$data['fl_moneystr']=number_format($data['fl_money'], 2,'.','');
			}
			if(isset(C('FANLI_TYPE')[$data['fl_type']])){
			    $data['fl_typestr']=C('FANLI_TYPE')[$data['fl_type']];
			}else{
				$data['fl_typestr']='其他';
			}
			
			$data['fl_shouxufeistr']=number_format($data['fl_shouxufei'], 2,'.','');
			
			$data['fl_shijimoneystr']=number_format(($data['fl_money']-$data['fl_shouxufei']), 2,'.','');
			
			
			$Dealer= M('Dealer');
			//收款代理
			$map3=array();
			$data3=array();
			$map3['dl_id']=$data['fl_dlid'];
			$map3['dl_unitcode']=$this->qy_unitcode;
			$data3=$Dealer->where($map3)->find();
			if($data3){
				$data['fl_rdl_name']=$data3['dl_name'];
				$data['fl_rdl_username']=$data3['dl_username'];
			}else{
				$data['fl_rdl_name']='';
				$data['fl_rdl_username']='';
			}
			//付款代理
			if($data['fl_senddlid']==0){
				$data['fl_sdl_name']='总公司';
				$data['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['fl_senddlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['fl_sdl_name']=$data3['dl_name'];
					$data['fl_sdl_username']=$data3['dl_username'];
				}else{
					$data['fl_sdl_name']='';
					$data['fl_sdl_username']='';
				}
			}
			//状态
			if($state==1 && $data['fl_state']==1){  
				$data['fl_state_str']='已收款';
			}else if($state==2 && $data['fl_state']==0){ 
				$data['fl_state_str']='待付款';
			}else if($state==2 && $data['fl_state']==2){ 
			    $data['fl_state_str']='付款中';
			}else if($state==3 && $data['fl_state']==1){  
				$data['fl_state_str']='已付款';
			}else if($state==9 && $data['fl_state']==9){
				$data['fl_state_str']='已取消';
			}else if($state==0 && $data['fl_state']==0){
				$data['fl_state_str']='待收款';
			}else if($state==0 && $data['fl_state']==2){
				$data['fl_state_str']='收款中';
			}else{                                    
				$data['fl_state_str']='';
			}
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('state', $state);
        $this->assign('ly_status', $ly_status);
        $this->assign('fanliinfo', $data);

        $this->display('fanlidetail');
	}	
	
	//我应付返利
    public function paylist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$Recash= M('Recash');

        $map=array();
		$parameter=array();
        $map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_sdlid']=session('jxuser_id');   

        $count = $Recash->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Recash->where($map)->order('rc_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Dealer= M('Dealer');
		foreach($list as $k=>$v){ 
            $list[$k]['rc_moneystr']='<span style="color:#009900">'.number_format($v['rc_money'], 2,'.','').'</span>';
			if(isset(C('FANLI_BANKS')[$v['rc_bank']])){
				$list[$k]['rc_str']='申请提现到 '.C('FANLI_BANKS')[$v['rc_bank']];
			}else{
				$list[$k]['rc_str']='申请提现';
			}

			if(MD5($v['rc_unitcode'].$v['rc_dlid'].number_format($v['rc_money'],2,'.','').$v['rc_bankcard'].$v['rc_addtime'])==$v['rc_verify']){
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='新提交';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
            }else{
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='新提交[异常]';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功[异常]';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败[异常]';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
			}
			
            //收款代理
			$map3=array();
			$data3=array();
			$map3['dl_id']=$v['rc_dlid'];
			$map3['dl_unitcode']=$this->qy_unitcode;
			$data3=$Dealer->where($map3)->find();
			if($data3){
				$list[$k]['fl_rdl_name']=$data3['dl_name'];
				$list[$k]['fl_rdl_username']=$data3['dl_username'];
			}else{
				$list[$k]['fl_rdl_name']='';
				$list[$k]['fl_rdl_username']='';
			}
		}
		

        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('paylist');
	}
	
	//我应付返利详细
    public function paydetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $rc_id=intval(I('get.rc_id',0));
		$map=array();
		$map['rc_id']=$rc_id;
		$map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_sdlid']=session('jxuser_id');
		
		$Recash= M('Recash');
		$data=$Recash->where($map)->find();
		if($data){
            $data['rc_moneystr']=number_format($data['rc_money'],2,'.','');
			
			if(isset(C('FANLI_BANKS')[$data['rc_bank']])){
				$data['rc_bankstr']=C('FANLI_BANKS')[$data['rc_bank']];
			}else{
				$data['rc_bankstr']='';
			}

			$data['rc_bankcardstr']=\Org\Util\Funcrypt::authcode($data['rc_bankcard'],'DECODE',C('WWW_AUTHKEY'),0);
			
            if(MD5($data['rc_unitcode'].$data['rc_dlid'].number_format($data['rc_money'],2,'.','').$data['rc_bankcard'].$data['rc_addtime'])==$data['rc_verify']){
				if($data['rc_state']==0){
					$data['rc_statestr']='处理中';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败';
				}else{
					$data['rc_statestr']='异常';
				}
            }else{
				if($data['rc_state']==0){
					$data['rc_statestr']='新提交[异常]';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='付款成功[异常]';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='付款失败[异常]';
				}else{
					$data['rc_statestr']='异常';
				}
			}
			
			//提现代理信息
			if($data['rc_dlid']>0){
				$map2=array();
				$Dealer= M('Dealer');
				$map2['dl_id']=$data['rc_dlid'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					if($data2['dl_status']==1){
						$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					}else{
					    $data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')[已禁用]';
					}
				}else{
					$data['dl_name_str']='未知';
				}
			}else{
				$data['dl_name_str']='未知';
			}
			
			//付款代理
			if($data['rc_sdlid']>0){
				$map2=array();
				$map2['dl_id']=$data['rc_sdlid'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_sendname_str']='未知';
				}
			}else{
				$data['dl_sendname_str']='总公司';
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/orders/';
			//图片
            if(is_not_null($data['rc_pic']) && file_exists($imgpath.$data['rc_pic'])){
                $data['rc_pic_str']='<a href="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  border="0" style="vertical-align:middle;width;10%"  ></a>';
            }else{
                $data['rc_pic_str']='';
            }
			
		}else{
			$this->error('没有该记录','',2);
		}
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);

        $this->assign('recashinfo', $data);
        $this->display('paydetail');
	}	
	
    //处理保存
    public function paydeal_save(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$rc_id=intval(I('post.rc_id',0));

		if($rc_id>0){
			
			//提交是否失效
			$ttamp=trim(I('post.ttamp',''));
			$sture=trim(I('post.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
                $this->error('提交异常',U(C('MODULE_NAME').'/Fanli/paydetail/rc_id/'.$rc_id.''),2);
			}
			if(($nowtime - $ttamp) > 1200) {
				$this->error('提交异常',U(C('MODULE_NAME').'/Fanli/paydetail/rc_id/'.$rc_id.''),2);
			}
			
			$rc_state=intval(I('post.rc_state',0));
			$rc_remark=trim(I('post.rc_remark',''));
			$rc_remark2=trim(I('post.rc_remark2',''));
			if($rc_state<=0){
				$this->error('请选择处理状态','',2);
			}
			if($rc_remark==''){
				$this->error('请填写处理备注','',2);
			}
			
			$map=array();
			$Recash= M('Recash');
		    $map['rc_id']=$rc_id;
			$map['rc_sdlid']=session('jxuser_id');
		    $map['rc_unitcode']=$this->qy_unitcode;
			$data=$Recash->where($map)->find();
			if($data){
				$data2=array();
				if($data['rc_dealtime']<=0){
				   $data2['rc_dealtime']=time();
				}
				
				//保存文件 begin 
				$file_name=I('post.file_name','');
				$rc_pic='';
				if($file_name==''){
					$this->error('请上传图片','',2);
				}else{
					$imgpath=BASE_PATH.'/Public/uploads/orders/'.$this->qy_unitcode;
					$temppath=BASE_PATH.'/Public/uploads/temp/';
					if (!file_exists($imgpath)) {
						mkdir($imgpath);
					}
					
					if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
					    $rc_pic=$this->qy_unitcode.'/'.$file_name;
						@unlink($temppath.$file_name); 
					}else{
                        $this->error('上传图片失败','',2);
					}
				}
				//保存文件 end
				
				if($rc_pic==''){
					$this->error('请上传图片','',2);
				}else{
					$data2['rc_pic']=$rc_pic;
				}
				
                $data2['rc_state']=$rc_state;
				$data2['rc_remark']=$rc_remark;
				$data2['rc_remark2']=$rc_remark2;
				
                $rs=$Recash->where($map)->data($data2)->save();
				if($rs){
					//更改返利明细状态
					$Fanlidetail= M('Fanlidetail');
					$map3=array();
					$map3['fl_dlid']=$data['rc_dlid']; //返利收方
					$map3['fl_senddlid']=$data['rc_sdlid']; //返利发方
					$map3['fl_unitcode']=$this->qy_unitcode;
					$map3['fl_rcid']=$data['rc_id'];
					$map3['fl_state']=2;  //0-待收款 1-已收款 2-收款中  9-已取消

					$data3=array();
					if($rc_state==1){
						$data3['fl_state'] = 1;
					}else if($rc_state==2){
						$data3['fl_state'] = 0;
						$data3['fl_rcid'] = 0;
					}
					$Fanlidetail->where($map3)->data($data3)->save();
					
					
	                //记录日志 begin
					$log_arr=array();
					$log_arr=array(
								'log_qyid'=>session('jxuser_id'),
								'log_user'=>session('jxuser_username'),
								'log_qycode'=>$this->qy_unitcode,
								'log_action'=>'处理提现',
								'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
								'log_addtime'=>time(),
								'log_ip'=>real_ip(),
								'log_link'=>__SELF__,
								'log_remark'=>json_encode(array_merge($data,$data2))
								);
					save_log($log_arr);
					//记录日志 end
					
					$this->success('提交成功',U(C('MODULE_NAME').'/Fanli/paydetail/rc_id/'.$rc_id.''),1);
					
					
				}else if($rs==0){
					$this->error('提交数据没改变','',2);
				}else{
					$this->error('提交失败','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
	}
	
	
	//我应收返利
    public function receivelist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$Fanlidetail= M('Fanlidetail');
		$Dealer= M('Dealer');
		
        $map=array();
        $map['fl_unitcode']=$this->qy_unitcode;
		$map['fl_dlid']=session('jxuser_id');   
		$list = $Fanlidetail->field('fl_senddlid')->where($map)->group('fl_senddlid')->select();

        foreach($list as $k=>$v){ 
		    //付款方
		    if($v['fl_senddlid']==0){
				$list[$k]['fl_sdl_name']='总公司';
				$list[$k]['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$v['fl_senddlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$list[$k]['fl_sdl_name']=$data3['dl_name'];
					$list[$k]['fl_sdl_username']=$data3['dl_username'];
				}else{
					$list[$k]['fl_sdl_name']='';
					$list[$k]['fl_sdl_username']='';
				}
			}
			
		    //统计累计返利
			$map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$v['fl_senddlid']; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=array('neq',9);;  //0-待收款 1-已收款 2-收款中  9-已取消
			
			$flsum1 = $Fanlidetail->where($map3)->sum('fl_money');
			$flsum12 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
			if($flsum1){
			}else{
				$flsum1=0;
			}
			if($flsum12){
			}else{
				$flsum12=0;
			}
            $list[$k]['fltotail']=$flsum1-$flsum12;
			
			//统计已收返利
            $map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$v['fl_senddlid']; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=1;  //0-待收款 1-已收款 2-收款中  9-已取消

			$flsum2 = $Fanlidetail->where($map3)->sum('fl_money');
			$flsum22 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
			if($flsum2){
			}else{
				$flsum2=0;
			}
			if($flsum22){
			}else{
				$flsum22=0;
			}
            $list[$k]['flreceived']=$flsum2-$flsum22;
			
			//统计待收返利
            $map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$v['fl_senddlid']; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消

			$flsum3 = $Fanlidetail->where($map3)->sum('fl_money');
			$flsum32 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
			if($flsum3){
			}else{
				$flsum3=0;
			}
			if($flsum32){
			}else{
				$flsum32=0;
			}
            $list[$k]['flready']=$flsum3-$flsum32;
			
			//统计收款中
            $map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$v['fl_senddlid']; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=2;  //0-待收款 1-已收款 2-收款中  9-已取消

			$flsum4 = $Fanlidetail->where($map3)->sum('fl_money');
			$flsum42 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
			if($flsum4){
			}else{
				$flsum4=0;
			}
			if($flsum42){
			}else{
				$flsum42=0;
			}
            $list[$k]['flreceiving']=$flsum4-$flsum42;
			
			//统计可提现金额  每月1-15号提现上个月16号前，16-30号提现上个月30号前
			$nday=date('d',time());  //当天
			if($nday<=15){
				$nyearmonth=date('Y-m-16 00:00:00',strtotime("-1 month"));
//                $begin_time = date('Y-m',strtotime('-1 month')).'-19 00:00:00';
//				dump($nyearmonth);die();
				$endtime=strtotime($nyearmonth); 
			}else{
				$nyearmonth=date('Y-m',time()).'-1 00:00:00'; //当前年月
				$endtime=strtotime($nyearmonth); 
			}
			
			$map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$v['fl_senddlid']; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
			$map3['fl_addtime']=array('lt',$endtime);

			$flsum5 = $Fanlidetail->where($map3)->sum('fl_money');
			$flsum52 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
			if($flsum5){
			}else{
				$flsum5=0;
			}
			if($flsum52){
			}else{
				$flsum52=0;
			}
			$list[$k]['flcanrecash']=$flsum5-$flsum52;
			
			$canrecash=1;
			
			if($flsum5<C('FANLI_RECASH')){
				$canrecash=0;
			}
			
			$list[$k]['canrecash']=$canrecash;
			
		}
        		


		$this->assign('fljiangetime', C('FANLI_JIANGETIME'));	
		$this->assign('flrecash', C('FANLI_RECASH'));	
		
        $this->assign('list', $list);	
        $this->display('receivelist');
		
	}
	
	//返利提现
    public function recash(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

		$nday=date('d',time());  //当天
		/*
		if($nday<C('FANLI_JIANGETIME')){ //当月N号后才允许生成	
			 $this->error('当月'.C('FANLI_JIANGETIME').'号才能提现','',2);
		}	
		*/
		
		$fl_senddlid=intval(I('get.dlid',0));

		//收款代理
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
		//连续60天没个人业绩 不允许提现
		
		$Orders=M('Orders');
		$dl_hasorder=0;
		$datam=array();
		$datam['od_unitcode']=$this->qy_unitcode;
		$datam['od_oddlid']=session('jxuser_id');
		$datam['od_state']=array('in','3,8');
		$datam['od_virtualstock']=0;

		$start=strtotime(date('Y-m-d 00:00:00',time()-3600*24*60));
		$end = time();		
		$datam['od_expressdate'] = array('between',array($start,$end));

		$ddata=$Orders->where($datam)->find();
		if ($ddata){
		    $dl_hasorder=1;
		}
		
		
		//连续30天没推荐新代理 不允许提现
		$dl_hasreferee=0;
		$dmap=array();
		$dmap['dl_referee']=session('jxuser_id');
		$dmap['dl_unitcode']=$this->qy_unitcode;
		$dmap['dl_status']=1;
		$start2=strtotime(date('Y-m-d 00:00:00',time()-3600*24*30));
		$end2 = time();	
		$dmap['dl_startdate'] = array('between',array($start2,$end2));
		$ddata2=$Dealer->where($dmap)->find();
		if($ddata2){
			$dl_hasreferee=1;
		}
		
		if($dl_hasorder==0 && $dl_hasreferee==0){
			$this->error('对不起，连续2个月没业绩且1个月内没推荐新代理，不允许提现','',2);
			exit;
		}
		
		
		//付款代理
		if($fl_senddlid==0){
			$fl_sdl_name='总公司';
			$fl_sdl_username='';
		}else{
			$map3=array();
			$data3=array();
			$map3['dl_id']=$fl_senddlid;
			$map3['dl_unitcode']=$this->qy_unitcode;
			$data3=$Dealer->where($map3)->find();
			if($data3){
				$fl_sdl_name=$data3['dl_name'];
				$fl_sdl_username=$data3['dl_username'];
			}else{
				$this->error('付款代理不存在','',2);
			}
		}
		$Fanlidetail= M('Fanlidetail');
		//统计待收返利 
		$map3=array();
		$map3['fl_dlid']=session('jxuser_id'); //返利收方
		$map3['fl_senddlid']=$fl_senddlid; //返利发方
		$map3['fl_unitcode']=$this->qy_unitcode;
		$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
		
		$dl_fanli = $Fanlidetail->where($map3)->sum('fl_money');
		$dl_fanli12 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
		if($dl_fanli){
		}else{
			$dl_fanli=0;
		}
		if($dl_fanli12){
		}else{
			$dl_fanli12=0;
		}
		$dl_fanli=$dl_fanli-$dl_fanli12;
		if($dl_fanli<=0){
			$this->error('待收返利为0','',2);
		}
		


		//统计可提现金额  每月1-15号提现上个月16号前，16-30号提现上个月30号前

		if($nday<=15){
			$nyearmonth=date('Y-m',strtotime("-1 month")).'-16 00:00:00'; 
			$endtime=strtotime($nyearmonth); 
		}else{
			$nyearmonth=date('Y-m',time()).'-1 00:00:00'; //当前年月
			$endtime=strtotime($nyearmonth); 
		}	
			
		
		$map3=array();
		$map3['fl_dlid']=session('jxuser_id'); //返利收方
		$map3['fl_senddlid']=$fl_senddlid; //返利发方
		$map3['fl_unitcode']=$this->qy_unitcode;
		$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
		$map3['fl_addtime']=array('lt',$endtime);
		
		$dl_fanli2 = $Fanlidetail->where($map3)->sum('fl_money');
		$dl_fanli22 = $Fanlidetail->where($map3)->sum('fl_shouxufei');
		if($dl_fanli2){
		}else{
			$dl_fanli2=0;
		}
		if($dl_fanli22){
		}else{
			$dl_fanli22=0;
		}
		$dl_fanli2=$dl_fanli2-$dl_fanli22;
		if($dl_fanli2<=0){
			$this->error('可提现金额为0','',2);
		}
		
		
		$bankarr=C('FANLI_BANKS');
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		
		$this->assign('edurecash', C('FANLI_RECASH'));
		$this->assign('jiangetime', C('FANLI_JIANGETIME'));
		$this->assign('fl_senddlid', $fl_senddlid);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_username', $dl_username);
		$this->assign('fl_sdl_name', $fl_sdl_name);
		$this->assign('fl_sdl_username', $fl_sdl_username);
		$this->assign('dl_fanli', $dl_fanli);
		$this->assign('dl_fanli2', $dl_fanli2);
		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);
		$this->assign('bankarr', $bankarr);
		$this->display('recash');
		
	}
	
	//返利提现 保存
    public function recash_save(){	
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$nday=date('d',time());  //当天
		/*
		if($nday<C('FANLI_JIANGETIME')){ //当月N号后才允许生成	
            $this->error('当月'.C('FANLI_JIANGETIME').'号后才能提现','',2);
		}
		*/
	
		
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
			$dl_pwd=$data['dl_pwd'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
		//连续60天没个人业绩 不允许提现
		
		$Orders=M('Orders');
		$dl_hasorder=0;
		$datam=array();
		$datam['od_unitcode']=$this->qy_unitcode;
		$datam['od_oddlid']=session('jxuser_id');
		$datam['od_state']=array('in','3,8');
		$datam['od_virtualstock']=0;

		$start=strtotime(date('Y-m-d 00:00:00',time()-3600*24*60));
		$end = time();		
		$datam['od_expressdate'] = array('between',array($start,$end));

		$ddata=$Orders->where($datam)->find();
		if ($ddata){
		    $dl_hasorder=1;
		}
		
		
		//连续30天没推荐新代理 不允许提现
		$dl_hasreferee=0;
		$dmap=array();
		$dmap['dl_referee']=session('jxuser_id');
		$dmap['dl_unitcode']=$this->qy_unitcode;
		$dmap['dl_status']=1;
		$start2=strtotime(date('Y-m-d 00:00:00',time()-3600*24*30));
		$end2 = time();	
		$dmap['dl_startdate'] = array('between',array($start2,$end2));
		$ddata2=$Dealer->where($dmap)->find();
		if($ddata2){
			$dl_hasreferee=1;
		}
		
		if($dl_hasorder==0 && $dl_hasreferee==0){
			$this->error('对不起，连续2个月没业绩且1个月内没推荐新代理，不允许提现','',2);
			exit;
		}
		
		
		
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Fanli/index'),2);
		}
		if(($nowtime - $ttamp) > 1200) {
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Fanli/index'),2);
		}
		
		$fl_senddlid=intval(I('post.fl_senddlid',0));  //付款代理
		
		$rc_bank=intval(I('post.rc_bank',0));
		$rc_bankcard=trim(I('post.rc_bankcard',''));
		$rc_pwd=trim(I('post.rc_pwd',''));
		$rc_banknamezh=trim(I('post.rc_banknamezh',''));
		$rc_name=$dl_name;
		
		if($rc_bank<=0){
			$this->error('请选择开户银行','',2);
		}
		if($rc_bank<7){
			if($rc_banknamezh==''){
				$this->error('请填写开户支行','',2);
			}
		}
		
		if($rc_bankcard==''){
			$this->error('请填写卡号或支付宝账号','',2);
		}
		//$rc_bankcard=unicode_decode($rc_bankcard);

        if(!preg_match("/^[a-zA-Z0-9_\-\.\@]{4,40}$/",$rc_bankcard)){
			$this->error('填写卡号或支付宝账号不正确，中间不能留空格,不能有特殊字符','',2);
		}

			
		if($rc_name==''){
			$this->error('请填写卡号/账号对应的姓名','',2);
		}
		if($rc_pwd==''){
			$this->error('请填写密码','',2);
		}

		if($dl_pwd!=MD5(MD5(MD5($rc_pwd)))){
			$this->error('填写密码不正确','',2);
		}
		
		$Fanlidetail= M('Fanlidetail');
		
		//统计可提现金额  每月1-15号提现上个月16号前，16-30号提现上个月30号前
		if($nday<=15){
			$nyearmonth=date('Y-m',strtotime("-1 month")).'-16 00:00:00'; 
			$endtime=strtotime($nyearmonth); 
		}else{
			$nyearmonth=date('Y-m',time()).'-1 00:00:00'; //当前年月
			$endtime=strtotime($nyearmonth); 
		}
	

		$map3=array();
		$map3['fl_dlid']=session('jxuser_id'); //返利收方
		$map3['fl_senddlid']=$fl_senddlid; //返利发方
		$map3['fl_unitcode']=$this->qy_unitcode;
		$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
		$map3['fl_addtime']=array('lt',$endtime);
		
		$rc_money = $Fanlidetail->where($map3)->sum('fl_money');
		$rc_shouxufei = $Fanlidetail->where($map3)->sum('fl_shouxufei');
		if($rc_money){
		}else{
			$rc_money=0;
		}
		if($rc_shouxufei){
		}else{
			$rc_shouxufei=0;
		}
		$rc_money=$rc_money-$rc_shouxufei;
		if($rc_money<=0){
			$this->error('可提现金额为0',U(C('MODULE_NAME').'/Fanli/receivelist'),2);
		}
		
        if(null !== C('FANLI_RECASH')){
			if($rc_money<C('FANLI_RECASH')){
			    $this->error('提取金额必须'.C('FANLI_RECASH').'以上',U(C('MODULE_NAME').'/Fanli/receivelist'),2);
		    }
		}else{
			if($rc_money<100){
			    $this->error('提取金额必须100以上',U(C('MODULE_NAME').'/Fanli/receivelist'),2);
		    }
		}
		$rc_money=number_format($rc_money,2,'.','');
		
		//$rc_shouxufei=$rc_money*0.1; //10%手续费
		$rc_shouxufei=0;
        $rc_bankcard_encode=\Org\Util\Funcrypt::authcode($rc_bankcard,'ENCODE',C('WWW_AUTHKEY'),0);

		
		$data2=array();
		$data2['rc_unitcode']=$this->qy_unitcode;
		$data2['rc_dlid']=session('jxuser_id');  //提现的代理id
		$data2['rc_sdlid']=$fl_senddlid;    //发放提现的代理id 0-公司
		$data2['rc_money']=$rc_money;
		$data2['rc_shouxufei']=$rc_shouxufei; 
		$data2['rc_bank']=$rc_bank;
		$data2['rc_bankcard']=$rc_bankcard_encode;
		$data2['rc_name']=$rc_name;
		$data2['rc_bankname']=$rc_banknamezh;
		$data2['rc_addtime']=time();
		$data2['rc_dealtime']=0;
		$data2['rc_state']=0;
		$data2['rc_remark']='';
		$data2['rc_ip']=real_ip();
		$rc_verify=MD5($data2['rc_unitcode'].$data2['rc_dlid'].$data2['rc_money'].$data2['rc_bankcard'].$data2['rc_addtime']); //验证串
		$data2['rc_verify']=$rc_verify;
		
		$Recash= M('Recash');
		$rs=$Recash->create($data2,1);
		$result = $Recash->add();  
		if($result){
			$map3=array();
			$map3['fl_dlid']=session('jxuser_id'); //返利收方
			$map3['fl_senddlid']=$fl_senddlid; //返利发方
			$map3['fl_unitcode']=$this->qy_unitcode;
			$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
			$map3['fl_addtime']=array('lt',$endtime);

			$data3=array();
			$data3['fl_state'] = 2;
			$data3['fl_rcid'] = $result;
			$Fanlidetail->where($map3)->data($data3)->save();
			
			//代理操作日志 begin
			$odlog_arr=array(
						'dlg_unitcode'=>$this->qy_unitcode,  
						'dlg_dlid'=>session('jxuser_id'),
						'dlg_operatid'=>session('jxuser_id'),
						'dlg_dlusername'=>session('jxuser_username'),
						'dlg_dlname'=>session('jxuser_dlname'),
						'dlg_action'=>'代理商申请提现',
						'dlg_type'=>1, //0-企业 1-经销商
						'dlg_addtime'=>time(),
						'dlg_ip'=>real_ip(),
						'dlg_link'=>__SELF__
						);
			$Dealerlogs = M('Dealerlogs');
			$rs3=$Dealerlogs->create($odlog_arr,1);
			if($rs3){
				$Dealerlogs->add();
			}
			//代理操作日志 end
			
			$this->success('提现提交成功，请等待处理',U(C('MODULE_NAME').'/Fanli/receivelist'),2);
		}else{
			$this->error('提现提交失败',U(C('MODULE_NAME').'/Fanli/receivelist'),2);
		}
	}
	
	//提现记录
    public function recashlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$Recash= M('Recash');

        $map=array();
		$parameter=array();
        $map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_dlid']=session('jxuser_id');   

        $count = $Recash->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Recash->where($map)->order('rc_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Dealer= M('Dealer');
		foreach($list as $k=>$v){ 
            $list[$k]['rc_moneystr']='<span style="color:#009900">'.number_format($v['rc_money'],2,'.','').'</span>';
			if(isset(C('FANLI_BANKS')[$v['rc_bank']])){
				$list[$k]['rc_str']='申请提现到 '.C('FANLI_BANKS')[$v['rc_bank']];
			}else{
				$list[$k]['rc_str']='申请提现';
			}

			if(MD5($v['rc_unitcode'].$v['rc_dlid'].number_format($v['rc_money'],2,'.','').$v['rc_bankcard'].$v['rc_addtime'])==$v['rc_verify']){
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='处理中';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
            }else{
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='处理中[异常]';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功[异常]';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败[异常]';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
			}
			
            //付款方
		    if($v['rc_sdlid']==0){
				$list[$k]['fl_sdl_name']='总公司';
				$list[$k]['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$v['rc_sdlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$list[$k]['fl_sdl_name']=$data3['dl_name'];
					$list[$k]['fl_sdl_username']=$data3['dl_username'];
				}else{
					$list[$k]['fl_sdl_name']='';
					$list[$k]['fl_sdl_username']='';
				}
			}
		}
		
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('recashlist');
		
	}	
	
	//返利提现详细
    public function recashdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $rc_id=intval(I('get.rc_id',0));
		$map=array();
		$map['rc_id']=$rc_id;
		$map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_dlid']=session('jxuser_id');
		
		$Recash= M('Recash');
		$Dealer= M('Dealer');
		$data=$Recash->where($map)->find();
		if($data){
            $data['rc_moneystr']=number_format($data['rc_money'],2,'.','');
			$data['rc_shouxufeistr']=number_format($data['rc_shouxufei'],2,'.','');
			$data['rc_shishoumoneystr']=number_format($data['rc_money']-$data['rc_shouxufei'],2,'.','');
			
			
			
			if(isset(C('FANLI_BANKS')[$data['rc_bank']])){
				$data['rc_bankstr']=C('FANLI_BANKS')[$data['rc_bank']];
			}else{
				$data['rc_bankstr']='';
			}

			$data['rc_bankcardstr']=\Org\Util\Funcrypt::authcode($data['rc_bankcard'],'DECODE',C('WWW_AUTHKEY'),0);
			
            if(MD5($data['rc_unitcode'].$data['rc_dlid'].number_format($data['rc_money'],2,'.','').$data['rc_bankcard'].$data['rc_addtime'])==$data['rc_verify']){
				if($data['rc_state']==0){
					$data['rc_statestr']='处理中';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败';
				}else{
					$data['rc_statestr']='异常';
				}
            }else{
				if($data['rc_state']==0){
					$data['rc_statestr']='处理中[异常]';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功[异常]';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败[异常]';
				}else{
					$data['rc_statestr']='异常';
				}
			}
			
			//付款代理
			if($data['rc_sdlid']==0){
				$data['fl_sdl_name']='总公司';
				$data['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['rc_sdlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;

				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['fl_sdl_name']=$data3['dl_name'];
					$data['fl_sdl_username']=$data3['dl_username'];
				}else{
					$data['fl_sdl_name']='';
					$data['fl_sdl_username']='';
				}
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/orders/';
			//图片
            if(is_not_null($data['rc_pic']) && file_exists($imgpath.$data['rc_pic'])){
                $data['rc_pic_str']='<a href="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  border="0" style="vertical-align:middle;width;10%"  ></a>';
            }else{
                $data['rc_pic_str']='';
            }
			
			
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('recashinfo', $data);
        $this->display('recashdetail');
	}	
	
	
	//按月业绩返利
    public function salemonthly(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		exit;
		$yj_type=intval(I('get.yj_type',0)); //0、每月业绩1、年度业绩2、总业绩
		
		$Salemonthly= M('Salemonthly');
		$Dealer= M('Dealer');
		
		
        $map3=array();
		$data3=array();
		$map3['dl_id']=session('jxuser_id');
		$map3['dl_unitcode']=$this->qy_unitcode;

		$data3=$Dealer->where($map3)->find();
		if($data3){
			$Dltype= M('Dltype');
			$map2=array();
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$data3['dl_type'];
			$data2 = $Dltype->where($map2)->find();
			if($data2){
				$dlt_level=$data2['dlt_level'];
				$dl_type=$data2['dl_type'];
			}else{
				$dlt_level=0;
				$dl_type=0;
			}
			$dl_belong=$data3['dl_belong'];
			
		}else{
            $this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
		}
		
		//只有前1级才有 按月业绩奖金
	    if($dlt_level==1){
			//当月业绩
			$yearmonth=date('Y-m',time());
			$ndays=date("t",strtotime($yearmonth)); //天数
			$nbegintime=strtotime($yearmonth);
			$nendtime=$nbegintime+3600*24*$ndays;
			
			//自己的业绩
			//下单的金额(只统计已发货、已完成) 
			$Orders= M('Orders');
			$nodsum=0;
			$map2=array();
			$map2['od_oddlid']=session('jxuser_id');
			$map2['od_unitcode']=$this->qy_unitcode;
			$map2['od_state']=array('IN','3,8');
			$map2['od_expressdate']=array('between',array($nbegintime,$nendtime));
			$nodsum = $Orders->where($map2)->sum('od_total'); 
			if($nodsum){
			}else{
				$nodsum=0;
			}
			
			//个人+团队业绩
			$nteamsum=0;
		    
			$myteam=array();
			$myteam=$this->teamlist(session('jxuser_id'));
 
            if($myteam){
				$map2=array();
				$map2['od_unitcode']=$this->qy_unitcode;
				$map2['od_expressdate']=array('between',array($nbegintime,$nendtime));
				$map2['od_oddlid']=array('in',$myteam);
				$map2['od_state']=array('in','3,8');
				$nteamsum=$Orders->where($map2)->sum('od_total');
				if($nteamsum){
				}else{
				   $nteamsum=0;
				}
            }
			
			//列表
			$map=array();
			$parameter=array();
			$map['sm_unitcode']=$this->qy_unitcode;
			$map['sm_dlid']=session('jxuser_id');   

			$count = $Salemonthly->where($map)->count();
			$Page = new \Think\Page($count,50,$parameter);
			$show = $Page->show();
			if($show=='<div>    </div>'){
				$show='';
			}
			$list = $Salemonthly->where($map)->order('sm_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
			
			$Dealer= M('Dealer');
			foreach($list as $k=>$v){ 
				$list[$k]['sm_rewardstr']='<span style="color:#009900">'.number_format($v['sm_reward'],2,'.','').'</span>';
			}
		}else{
			$this->error('对不起,没有该权限',U(C('MODULE_NAME').'/Fanli/index'),1);
		}

		$this->assign('nodsum', $nodsum);
		$this->assign('nteamsum', $nteamsum);
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('salemonthly');
	}	
	
	
	//按月业绩返利-详细
    public function salemonthlydetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		$yj_type=intval(I('get.yj_type',0)); //0、每月业绩1、年度业绩2、总业绩
		$map=array();
		$map['sm_id']=intval(I('get.sm_id',0));
		if($map['sm_id']>0){
			$Salemonthly= M('Salemonthly');
		    $Dealer= M('Dealer');
			
			$map['sm_unitcode']=$this->qy_unitcode;
			$map['sm_dlid']=session('jxuser_id');  
			$data = $Salemonthly->where($map)->find();
			if($data){
				//收款代理信息
				if($data['sm_dlid']>0){
					$map2=array();
					$map2['dl_id']=$data['sm_dlid'];
					$map2['dl_unitcode']=$this->qy_unitcode;
					$data2=$Dealer->where($map2)->find();
					if($data2){
						$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					}else{
						$data['dl_name_str']='未知';
					}
				}else{
					$data['dl_name_str']='未知';
				}
				
				//付款代理信息
				if($data['sm_senddlid']>0){
					$map2=array();
					$map2['dl_id']=$data['sm_senddlid'];
					$map2['dl_unitcode']=$this->qy_unitcode;
					$data2=$Dealer->where($map2)->find();
					if($data2){
						$data['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					}else{
						$data['dl_sendname_str']='未知';
					}
				}else{
					$data['dl_sendname_str']='总公司';
				}
			
			
			
			
			}else{
				$this->error('没有该记录','',1);
			}

		}else{
			$this->error('没有该记录','',1);
		}
		
		$this->assign('sminfo', $data);
		$this->assign('yj_type', $yj_type);
		$this->display('salemonthlydetail');
		
	}
	
	
    //统计某个经销商的团队，返回团队所有经销商id(等级小于等于自己)
    public function teamlist($id){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('/'.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $Dealer = M('Dealer');
        $map=array();
        $map['dl_id']=$id;
        $map['dl_unitcode']=$this->qy_unitcode;
        $data=$Dealer->field('dl_level')->where($map)->find();

        $list[]=array('dl_id'=>$id,'dl_level'=>$data['dl_level']);//团队列表

        $listtemp=array();//团队列表模板
        $map=array();
        $map['dl_referee']=$id;
        $map['dl_unitcode']=$this->qy_unitcode;
        $listtemp=$Dealer->field('dl_id,dl_level')->where($map)->select();
        //层层遍历 直到没有下级推荐人
        while($listtemp!=null){
            $dl_list=array();
            foreach ($listtemp as $k => $v) {
                $dl_list[]=$v['dl_id'];
            }
            foreach ($listtemp as $k => $v) {
                $list[]=array('dl_id'=>$v['dl_id'],'dl_level'=>$v['dl_level']);
            }
            $map2=array();
            $map2['dl_referee']=array('in',$dl_list);
            $map2['dl_unitcode']=$this->qy_unitcode;
            $listtemp=array();
            $listtemp=$Dealer->field('dl_id,dl_level')->where($map2)->select();
        }
        foreach ($list as $k => $v) {
            if($v['dl_level']==1){
				$list[$k]=$v['dl_id'];
            }else{
                 unset($list[$k]);
            }
        }
        return $list;
    }
	
	
   //==============================================================================

	//我的资金
	public function capital(){
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
			$dl_name=wxuserTextDecode2($data['dl_name']);
			$dl_weixin=$data['dl_weixin'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
			$dl_level=$data['dl_level'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		if($dl_level>3){
			$this->error('对不起，你没有权限',U(C('MODULE_NAME').'/Index/index'),1);
		}
		
	
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
		
		//余额 增加(冻结)
		$yuefreezesum=0;
		$map2=array();
		$map2['bl_receiveid']=session('jxuser_id');
		$map2['bl_unitcode']=$this->qy_unitcode;
		$map2['bl_type']=array('IN','1,2,3');  
		$map2['bl_state']=2;  //状态 1-有效 0-无效 2-冻结
		$yuefreezesum = $Balance->where($map2)->sum('bl_money'); 
		if($yuefreezesum){
		}else{
			$yuefreezesum=0;
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

		
		$this->assign('yuesurplus', $yuesurplus);
		$this->assign('yuefreezeminussum', $yuefreezeminussum);
		
		
		$this->display('capital');
	}
	
	//余额明细
    public function yuelist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$state=intval(I('get.state',1));
		
		$Balance= M('Balance');

        $map=array();
		$parameter=array();
		$parameter['state']=$state;
        $map['bl_unitcode']=$this->qy_unitcode;
		   
		if($state==1){  //有效
			$where=array();
			$where['bl_sendid']=session('jxuser_id');
			$where['bl_receiveid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['bl_state']=1;
		}else if($state==2){ //冻结
			$where=array();
			$where['bl_sendid']=session('jxuser_id');
			$where['bl_receiveid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['bl_state']=2;
		}else if($state==0){  //无效
			$where=array();
			$where['bl_sendid']=session('jxuser_id');
			$where['bl_receiveid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['bl_state']=0;
		}else{              //有效
			$where=array();
			$where['bl_sendid']=session('jxuser_id');
			$where['bl_receiveid']=session('jxuser_id');
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
			$map['bl_state']=1;
			$state=1;
			$parameter['state']=$state;
		}

        $count = $Balance->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Balance->where($map)->order('bl_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

		foreach($list as $k=>$v){ 
		    //减少
            if($v['bl_sendid']==session('jxuser_id')){
				$list[$k]['bl_moneystr']='<span style="color:#009900">-'.number_format($v['bl_money'], 2,'.','').'</span>';
			}
			
		    if($v['bl_receiveid']==session('jxuser_id')){
				    $list[$k]['bl_moneystr']='<span style="color:#000000">+'.number_format($v['bl_money'], 2,'.','').'</span>';
			}
			if($v['bl_state']==1){
				$list[$k]['bl_statestr']='有效';
			}else if($v['bl_state']==2){
				$list[$k]['bl_statestr']='冻结';
			}else if($v['bl_state']==0){
				$list[$k]['bl_statestr']='无效';
			}
		}
		
        $this->assign('list', $list);
        $this->assign('state', $state);
		$this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('yuelist');
		
	}	
    
	//余额明细详细
    public function yuedetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $bl_id=intval(I('get.bl_id',0));
		$state=intval(I('get.state',0));
		$map=array();
		$map['bl_id']=$bl_id;
		$map['bl_unitcode']=$this->qy_unitcode;
		$where=array();
		$where['bl_sendid']=session('jxuser_id');
		$where['bl_receiveid']=session('jxuser_id');
		$where['_logic'] = 'or';
		$map['_complex'] = $where;
		
		$Balance= M('Balance');
		$data=$Balance->where($map)->find();
		if($data){
              //余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 
			if($data['bl_type']==1){
				if($data['bl_sendid']==session('jxuser_id')){
				    $data['bl_typestr']='手动减少';
				}
				if($data['bl_receiveid']==session('jxuser_id')){
				    $data['bl_typestr']='手动增加';
				}
			}else if($data['bl_type']==2){
                if($data['bl_sendid']==session('jxuser_id')){
				    $data['bl_typestr']='订单款项减少';
				}
				if($data['bl_receiveid']==session('jxuser_id')){
				    $data['bl_typestr']='订单款项增加';
				}
			}else if($data['bl_type']==3){

                if($data['bl_sendid']==session('jxuser_id')){
				    $data['bl_typestr']='提现款项减少';
				}
				if($data['bl_receiveid']==session('jxuser_id')){
				    $data['bl_typestr']='提现款项增加';
				}
			}else{
				$data['bl_typestr']='未知';
			}
			
			$data['bl_moneystr']=number_format($data['bl_money'], 2,'.','');
			
			$Dealer= M('Dealer');
			//收款代理
			if($data['bl_receiveid']>0){
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['bl_receiveid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['dl_name_str']=$data3['dl_name'].'('.$data3['dl_username'].')';
				}else{
					$data['dl_name_str']='-';
				}
			}else{
				$data['dl_name_str']='-';
			}
			
			//付款代理
			if($data['bl_sendid']==0){
				$data['dl_sendname_str']='-';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['bl_sendid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['dl_sendname_str']=$data3['dl_name'].'('.$data3['dl_username'].')';
				}else{
					$data['dl_sendname_str']='-';
				}
			}
			
			//状态
			if($data['bl_state']==0){
				$data['bl_state_str']='无效';
			}else if($data['bl_state']==1){
				$data['bl_state_str']='有效';
			}else if($data['bl_state']==2){
				$data['bl_state_str']='冻结';
			}else{
				$data['bl_state_str']='未知';
			}
			
			if($data['bl_isyfk']==1){
				$data['bl_isyfk_str']='由预付款支付';
			}else{
				$data['bl_isyfk_str']='';
			}
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('yueinfo', $data);

        $this->display('yuedetail');
	}	
	
	//余额充值
    public function payin(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

	
		//收款代理
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_username', $dl_username);

		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);

		$this->display('payin');
		
	}
	
	
	//余额充值 保存
    public function payin_save(){	
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
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Fanli/index'),2);
		}
		if(($nowtime - $ttamp) > 1200) {
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Fanli/index'),2);
		}
		

		$pi_remark=trim(I('post.pi_remark',''));
		$pi_money=trim(I('post.pi_money',''));
		
		if($pi_money==''){
			$this->error('请填写提充值金额','',2);
		}
		if(!preg_match("/^[0-9.]{1,8}$/",$pi_money)){
				$this->error('填写金额必须为数字');
		}
		
        //保存文件 begin 
		$file_name=I('post.file_name','');
		$file_name2=I('post.file_name2','');
		$pi_pic='';
		$pi_pic2='';
		if($file_name==''){
			
		}else{
			$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
			$temppath=BASE_PATH.'/Public/uploads/temp/';
			if (!file_exists($imgpath)){
				mkdir($imgpath);
			}
			if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
				$pi_pic=$this->qy_unitcode.'/'.$file_name;
				@unlink($temppath.$file_name); 
			}else{
				$this->error('上传凭证失败','',2);
			}
		}
		
		if($file_name2==''){
			
		}else{
			$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
			$temppath=BASE_PATH.'/Public/uploads/temp/';
			if (!file_exists($imgpath)){
				mkdir($imgpath);
			}
			if(copy($temppath.$file_name2,$imgpath.'/'.$file_name2)) {
				$pi_pic2=$this->qy_unitcode.'/'.$file_name2;
				@unlink($temppath.$file_name2); 
			}else{
				$this->error('上传凭证失败','',2);
			}
		}
		//保存文件 end
		
		//写入库
		$data2=array();
		$data2['pi_unitcode']=$this->qy_unitcode;
		$data2['pi_dlid']=session('jxuser_id');  //充值代理id
		$data2['pi_money']=$pi_money;
		$data2['pi_addtime']=$nowtime;
		$data2['pi_remark']=$pi_remark;
		$data2['pi_pic']=$pi_pic;
		$data2['pi_pic2']=$pi_pic2;
		$data2['pi_dealtime']=0;
		$data2['pi_dealremark']='';
		$data2['pi_state']=0; // 0-处理中 1-充值成功  2-充值失败

		
		$Payin= M('Payin');
		$rs=$Payin->create($data2,1);
		$result = $Payin->add();  
		if($result){
			//代理操作日志 begin
			$odlog_arr=array(
						'dlg_unitcode'=>$this->qy_unitcode,  
						'dlg_dlid'=>session('jxuser_id'),
						'dlg_operatid'=>session('jxuser_id'),
						'dlg_dlusername'=>session('jxuser_username'),
						'dlg_dlname'=>session('jxuser_dlname'),
						'dlg_action'=>'代理商充值申请',
						'dlg_type'=>1, //0-企业 1-经销商
						'dlg_addtime'=>$nowtime,
						'dlg_ip'=>real_ip(),
						'dlg_link'=>__SELF__
						);
			$Dealerlogs = M('Dealerlogs');
			$rs3=$Dealerlogs->create($odlog_arr,1);
			if($rs3){
				$Dealerlogs->add();
			}
			//代理操作日志 end
			
			$this->success('充值申请提交成功，请等待处理',U(C('MODULE_NAME').'/Fanli/payinlist'),2);
		}else{
			$this->error('充值申请提交失败',U(C('MODULE_NAME').'/Fanli/payinlist'),2);
		}
	}
	
	
	//余额充值记录
    public function payinlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
		$Payin= M('Payin');

        $map=array();
		$parameter=array();
        $map['pi_unitcode']=$this->qy_unitcode;
		$map['pi_dlid']=session('jxuser_id');   

        $count = $Payin->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Payin->where($map)->order('pi_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Dealer= M('Dealer');
		foreach($list as $k=>$v){ 
            $list[$k]['pi_moneystr']='<span style="color:#000000">'.number_format($v['pi_money'], 2,'.','').'</span>';
			if($v['pi_state']==0){
				$list[$k]['pi_statestr']='处理中';
			}else if($v['pi_state']==1){
				$list[$k]['pi_statestr']='充值成功';
			}else if($v['pi_state']==2){
				$list[$k]['pi_statestr']='充值失败';
			}else{
				$list[$k]['pi_statestr']='未知';
			}
		}
		
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('payinlist');
		
	}	
	
	//余额充值记录详细
    public function payindetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------
		
        $pi_id=intval(I('get.pi_id',0));
		$map=array();
		$map['pi_id']=$pi_id;
		$map['pi_unitcode']=$this->qy_unitcode;
		$map['pi_dlid']=session('jxuser_id');
		
		$Payin= M('Payin');
		$Dealer= M('Dealer');
		$data=$Payin->where($map)->find();
		if($data){
            $data['pi_moneystr']=number_format($data['pi_money'],2,'.','');
			

			if($data['pi_state']==0){
				$data['pi_statestr']='处理中';
			}else if($data['pi_state']==1){
				$data['pi_statestr']='充值成功';
			}else if($data['pi_state']==2){
				$data['pi_statestr']='充值失败';
			}else{
				$data['pi_statestr']='未知';
			}
			
			//充值代理

			$map3=array();
			$data3=array();
			$map3['dl_id']=$data['pi_dlid'];
			$map3['dl_unitcode']=$this->qy_unitcode;

			$data3=$Dealer->where($map3)->find();
			if($data3){
				$data['pi_dl_name']=$data3['dl_name'];
				$data['pi_dl_username']=$data3['dl_username'];
			}else{
				$data['pi_dl_name']='';
				$data['pi_dl_username']='';
			}

			
			$imgpath = BASE_PATH.'/Public/uploads/dealer/';
			//图片
            if(is_not_null($data['pi_pic']) && file_exists($imgpath.$data['pi_pic'])){
                $data['pi_pic_str']='<a href="'.__ROOT__.'/Public/uploads/dealer/'.$data['pi_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['pi_pic'].'"  border="0" style="vertical-align:middle;width:50%"  ></a>';
            }else{
                $data['pi_pic_str']='';
            }
			
			 if(is_not_null($data['pi_pic2']) && file_exists($imgpath.$data['pi_pic2'])){
                $data['pi_pic2_str']='<a href="'.__ROOT__.'/Public/uploads/dealer/'.$data['pi_pic2'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['pi_pic2'].'"  border="0" style="vertical-align:middle;width:50%"  ></a>';
            }else{
                $data['pi_pic2_str']='';
            }

		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('payininfo', $data);
        $this->display('payindetail');
	}	
	
	//保证金 凭证
    public function baozhengjin(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }
		//--------------------------------

	
		//收款代理
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
        //保证金图片
        $imgpath = BASE_PATH.'/Public/uploads/dealer/';
        if(is_not_null($data['dl_depositpic']) && file_exists($imgpath.$data['dl_depositpic'])){
            $dl_depositpic_str='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_depositpic'].'"   border="0" style="vertical-align:middle;width:70%;" >';
        }else{
            $dl_depositpic_str='';
        }
		if($data['dl_deposit']>0){
			$dl_deposit=number_format($data['dl_deposit'],2).' 元';
		}else{
			$dl_deposit='';
		}
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		
		$this->assign('dl_depositpic_str', $dl_depositpic_str);
		$this->assign('dl_deposit', $dl_deposit);

		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);

		$this->display('baozhengjin');
		
	}
	
	
	//保证金 凭证 保存
    public function baozhengjin_save(){	
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
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U(C('MODULE_NAME').'/Index/index'),1);
			exit;
		}
		//-------------
		
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Mine/index'),2);
		}
		if(($nowtime - $ttamp) > 1200) {
			$this->error('操作超时,请重试',U(C('MODULE_NAME').'/Mine/index'),2);
		}
		
		
        //保存文件 begin 
		$file_name=I('post.file_name','');
		$pi_pic='';
		if($file_name==''){
			$this->error('请上传凭证','',2);
		}else{
			$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
			$temppath=BASE_PATH.'/Public/uploads/temp/';
			if (!file_exists($imgpath)){
				mkdir($imgpath);
			}
			if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
				$pi_pic=$this->qy_unitcode.'/'.$file_name;
				@unlink($temppath.$file_name); 
			}else{
				$this->error('上传凭证失败','',2);
			}
		}
		//保存文件 end
		if($pi_pic==''){
			$this->error('请上传凭证','',2);
		}
        $data2=array();
		$data2['dl_depositpic'] = $pi_pic;
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$Dealer->where($map)->save($data2);

		$this->success('凭证提交成功，请等待处理',U(C('MODULE_NAME').'/Fanli/baozhengjin'),2);

	}
	
}