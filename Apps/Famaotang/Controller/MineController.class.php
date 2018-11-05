<?php
namespace Famaotang\Controller;
use Think\Controller;
class MineController extends CommController {
    //首页
    public function index(){
		
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }

        
        $Dealer=M("Dealer");
        $Dltype=M("Dltype");
        $Fanlidetail= M('Fanlidetail');
        $Orders=M('Orders');
        $map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$Dealer= M('Dealer');
		$data=$Dealer->where($map)->find();

		if($data){
			//上级代理
			if (intval($data['dl_belong'])>0){
				$mapbl=array();
				$mapbl['dl_unitcode']=$this->qy_unitcode;
				$mapbl['dl_id']=$data['dl_belong'];
				$databl=$Dealer->where($mapbl)->field('dl_id,dl_username,dl_name,dl_belong')->find();
				if($databl){
					$data['dl_belong_name']=$databl['dl_name'];
				}
			}else
			{
				$data['dl_belong_name']='总公司';
			}	

			//代理级别
			$mapt=array();
			$mapt['dl_unitcode']=$this->qy_unitcode;
			$mapt['dlt_id']=$data['dl_type'];
			$datat=$Dltype->where($mapt)->field('dlt_id,dlt_name,dlt_level')->find();
			if($datat){
				$data['dl_level_name']=$datat['dlt_name'];
				$dlt_level=$datat['dlt_level'];
			}else{
				$this->error('代理级别不存在','',1);
			    exit;
			}
			
			//个人总销售业绩
			$dl_totalmoney_z=0;
			$dataz=array();
			$dataz['od_unitcode']=$this->qy_unitcode;
			$dataz['od_oddlid']=session('jxuser_id');
			$dataz['od_state']=array('in','3,8');
			$dataz['od_virtualstock']=0;
			$dl_totalmoney_z=$Orders->where($dataz)->sum('od_total');
			if($dl_totalmoney_z){
			}else{
				$dl_totalmoney_z=0;
			}
			$data['dl_totalmoney_z']=$dl_totalmoney_z;
			
	
			
			//应收返利求和-待收款
			$mapfl=array();
			$mapfl['fl_dlid']=session('jxuser_id');
			$mapfl['fl_unitcode']=$this->qy_unitcode;
			//$map3['fl_type'] = array('in','1,2,3,4,5,6,7,8,9,10'); //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)
			$mapfl['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消

			$flsum1 = $Fanlidetail->where($mapfl)->sum('fl_money');
			$flsum2 = $Fanlidetail->where($mapfl)->sum('fl_shouxufei');
			
			if($flsum1){
				
			}else{
				$flsum1=0;
			}
			
			if($flsum2){
				
			}else{
				$flsum2=0;
			}

			$data['dl_fanlitotal']=$flsum1-$flsum2;
	
			

			//个人当月业绩
			$dl_totalmoney=0;
			$datam=array();
			$datam['od_unitcode']=$this->qy_unitcode;
			$datam['od_oddlid']=session('jxuser_id');
			$datam['od_state']=array('in','3,8');
			$datam['od_virtualstock']=0;

			$start=strtotime(date('Y-m-01 00:00:00',time()));
			$end = strtotime(date('Y-m-d H:i:s',time()));		
			$datam['od_expressdate'] = array('between',array($start,$end));

			$dl_totalmoney=$Orders->where($datam)->sum('od_total');
			if ($dl_totalmoney){
			}else{
				$dl_totalmoney=0;
			}
			$data['dl_totalmoney']=$dl_totalmoney;
			
			//个人团队业绩  仅前4级有
			if($dlt_level==1 || $dlt_level==2 || $dlt_level==3 || $dlt_level==4 ){
				$dl_totalmoney_team=0;//当月团队
				
				$myteam=$this->teamlist(session('jxuser_id')); //个人的团队 我推荐的（体验店和合伙人）前2级
//                dump($myteam);

				if(count($myteam)>0){
					
                    $map2=array();
					$map2['od_unitcode']=$this->qy_unitcode;
					$map2['od_expressdate']=array('between',array($start,$end));
					$map2['od_oddlid']=array('in',$myteam);
					$map2['od_state']=array('in','3,8');
					$dl_totalmoney_team=$Orders->where($map2)->sum('od_total');
					if($dl_totalmoney_team){
					}else{
					   $dl_totalmoney_team=0;
					}
				    $data['dl_totalmoney_team']=$dl_totalmoney_team;
					
					
					
				}else{
					$data['dl_totalmoney_team']=0;
				}	
				
				$dl_totalmoney_team_y=0; //年度团队
				
				if(count($myteam)>0){
					
					$start_y=strtotime(date('Y-05-01 00:00:00',time())); //从2018-5-1号开始算 到下年2019-5-1
					if(time()>=$start_y){
						$end_y = time();	
					}else{
						$start_y=strtotime(date('Y-05-01 00:00:00', strtotime('-1 year')));  
						$end_y = time();
					}
					
                    $map2=array();
					$map2['od_unitcode']=$this->qy_unitcode;
					$map2['od_expressdate']=array('between',array($start_y,$end_y));
					$map2['od_oddlid']=array('in',$myteam);
					$map2['od_state']=array('in','3,8');
					$dl_totalmoney_team_y=$Orders->where($map2)->sum('od_total');
					if($dl_totalmoney_team_y){
					}else{
					   $dl_totalmoney_team_y=0;
					}
				    $data['dl_totalmoney_team_y']=$dl_totalmoney_team_y;
				}else{
					$data['dl_totalmoney_team_y']=0;
				}
				
			}else{
				$data['dl_totalmoney_team']=0;
				$data['dl_totalmoney_team_y']=0;
			}
			
			//我的订单 代审核
	        $dlsodcount=0;//待确认0
			$mapdls=array();
			$mapdls['od_unitcode']=$this->qy_unitcode;
			$mapdls['od_oddlid']=session('jxuser_id');
			$mapdls['od_virtualstock']=0;
			$mapdls['od_state']=0;
			$dlsodcount= $Orders->where($mapdls)->count();
			if($dlsodcount){
				$data['dl_dlsodcount']=$dlsodcount;
			}else{
				$data['dl_dlsodcount']=0;
			}

			//我的订单 待发货
			$dlmodcount=0;//待发货1，2
			$mapdlm=array();
			$mapdlm['od_unitcode']=$this->qy_unitcode;
			$mapdlm['od_oddlid']=session('jxuser_id');
			$mapdlm['od_state']=array('in','1,2');
			$mapdlm['od_virtualstock']=0;
			$dlmodcount= $Orders->where($mapdlm)->count();
			if($dlsodcount){
				$data['dl_dlmodcount']=$dlmodcount;
			}else{
				$data['dl_dlmodcount']=0;
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
			
		}else{
			$this->error('代理不存在','',1);
			exit;
		}

		$this->assign('dlt_level',$dlt_level);
		$this->assign('userinfo',$data);
		$this->assign('yuesurplus',$yuesurplus);
        $this->display('index');
    }

    //设置
	public function setting(){
		$this->display('setting');
	}

	 //修改密码
	public function forgot(){
		$etype=intval(I('get.etype',''));		//etype:0 忘记密码 1 修改密码；
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		    $tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			header('location:'.WWW_WEBROOT.C('MODULE_NAME').'/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'/tagpage/'.base64_encode($tagpage).'');
        }

        //--------------------------------
        $action=trim(I('post.action',''));		
		if($action=='save'){
			$oldpwd=trim(I('post.oldpwd',''));
			$newpwd=trim(I('post.newpwd',''));
			$newpwd2=trim(I('post.newpwd2',''));		
			if($oldpwd=='' || $newpwd=='' || $newpwd2==''){
				$msg=array('stat'=>'0','msg'=>'请输入密码');
				echo json_encode($msg);
				exit;
			}
			if($newpwd!=$newpwd2){
				$msg=array('stat'=>'0','msg'=>'输入两新密码不一致');
				echo json_encode($msg);
				exit;
			}

			$md5_oldpwd=MD5(MD5(MD5($oldpwd)));
			$md5_newpwd=MD5(MD5(MD5($newpwd)));
			$map=array();
			$map['dl_id']=session('jxuser_id');
			$map['dl_unitcode']=$this->qy_unitcode;
			$Dealer= M('Dealer');
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_pwd']==$md5_oldpwd){
					
					$data2['dl_pwd']=$md5_newpwd;
				    $rs=$Dealer->where($map)->data($data2)->save();
					
					if($rs){
						$msg=array('stat'=>'1','msg'=>'修改密码成功');
						echo json_encode($msg);
						exit;
					}else{
						$msg=array('stat'=>'0','msg'=>'修改密码失败');
						echo json_encode($msg);
						exit;
					}
				}else{
					$msg=array('stat'=>'0','msg'=>'输入旧密码有误');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>'0','msg'=>'输入旧密码有误');
				echo json_encode($msg);
				exit;
			}	
		}

		$dl_username='';		
		$Dealer=M("Dealer");
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$Dealer= M('Dealer');
		$data=$Dealer->where($map)->field('dl_username')->find();
		if($data){
			$dl_username=$data['dl_username'];
		}

		if ($etype==1)
		{
			$this->assign('title','修改密码');
		}else
		{
			$this->assign('title','忘记密码');
		}
		$this->assign('dl_username',$dl_username);
		$this->display('forgot');
	}


    //统计某个经销商的团队，返回团队所有经销商id(我推荐的及我推荐的推荐)
    public function teamlist($id){
        $Dealer = M('Dealer');
        $map=array();
        $map['dl_id']=$id;
        $map['dl_unitcode']=$this->qy_unitcode;
        $data=$Dealer->field('dl_level')->where($map)->find();
        $list[]=array('dl_id'=>$id,'dl_level'=>$data['dl_level']);//团队列表
//        return  $list;
		$dl_level=$data['dl_level'];
		
		
        $listtemp=array();//团队列表模板
        $map=array();
        $map['dl_referee']=$id;
        $map['dl_unitcode']=$this->qy_unitcode;
        $listtemp=$Dealer->field('dl_id,dl_level')->where($map)->select();
		$ii=0;
        //层层遍历 直到没有下级推荐人
        while($listtemp!=null && $ii<100 ){
            $dl_list=array();
            foreach ($listtemp as $k => $v) {
                $dl_list[]=$v['dl_id'];//
            }
            foreach ($listtemp as $k => $v) {
                $list[]=array('dl_id'=>$v['dl_id'],'dl_level'=>$v['dl_level']);
            }
            $map2=array();
            $map2['dl_referee']=array('in',$dl_list);
            $map2['dl_unitcode']=$this->qy_unitcode;
            $listtemp=array();
            $listtemp=$Dealer->field('dl_id,dl_level')->where($map2)->select();
			$ii=$ii+1;
        }
		$list2=array();
        foreach ($list as $k => $v) {
            if($v['dl_level']==1 || $v['dl_level']==2 || $v['dl_level']==3 || $v['dl_level']==4){
				$list2[]=$v['dl_id'];
            }else{
                unset($list[$k]);
            }
        }
		
        return $list2;
    }
	
	//退出
	public function quit(){
		echo "退出";
		session('jxuser_time','');
		session('jxuser_id','');
		session('jxuser_unitcode','');	
		cookie('jxuser_check','');
		session(null);
		cookie(null); 	
		$this->redirect('Index/index'.'','' , 0, '');
	}
}