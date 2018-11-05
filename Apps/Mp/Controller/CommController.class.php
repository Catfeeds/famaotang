<?php
namespace Mp\Controller;
use Think\Controller;
     
    class CommController extends Controller
    {
        
        public function _initialize()
        {
            if(!$this->is_qiye_login())
            {
                $this->redirect('Mp/Login/index','' , 0, '');
            }
            $this->assign('qyuser', session('qyuser'));
            $this->assign('qypurview', session('qy_purview'));
			$this->assign('qyname', session('qyname'));
			$this->assign('qypic', session('qypic'));

        }
        //判断登录
        public function is_qiye_login(){
            $cookie_check=cookie('qiye_check');
            $session_check=session('qiye_check');

            if(session('qyid')=='' || session('qyuser')=='' || session('qyname')=='' || session('unitcode')==''){
                return false;
            }
            if($cookie_check=='' || $session_check==''){
                return false;
            }else{
              if($cookie_check==$session_check){
                  return true;
              }else{
                  return false;
              }
            }
        }

        //验证管理员权限  '10001' 
        public function check_qypurview($ac='',$re=0)
        {
            $qy_purview=session('qy_purview');

            if(is_array($qy_purview) && count($qy_purview)>0 && is_not_null($ac)){
                if(isset($qy_purview[$ac])){
                    if($re==0){
                        return true;
                    }else{
                    }
                }else{
                    if($re==0){
                        return false;
                    }else{
                        $this->error('对不起，没有该权限！','',1);
                    }
                }
            }else{
                if($re==0){
                    return false;
                }else{
                    $this->error('对不起，没有该权限！','',1);
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
			$map['dl_unitcode']=session('unitcode');
			$data=$Dealer->where($map)->find();

			if($data){
				if($data['dl_status']==1){
					//上家的级别-1
					$map2=array();
					$data2=array();
					$map2['dlt_id']=$data['dl_type'];
					$map2['dlt_unitcode']=session('unitcode');
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
		
        //返回有效上家arr
		public function get_dlbelongarr($jxid,$dl_level){
			$Dealer = M('Dealer');
			//上家信息-1
			$map=array();
			$data=array();
			$map['dl_id']=intval($jxid);
			$map['dl_unitcode']=session('unitcode');
			$data=$Dealer->where($map)->find();

			if($data){
				if($data['dl_status']==1){
					if($dl_level>$data['dl_level']){ 
						$this->belong_arrs[]=array('id'=>$data['dl_id'],'name'=>$data['dl_name']);
						if($data['dl_belong']>0){
						   $this->get_dlbelongarr($data['dl_belong'],$dl_level);
						}
					}else if($dl_level==$data['dl_level']){
						if($data['dl_belong']>0){
						   $this->get_dlbelongarr($data['dl_belong'],$dl_level);
						}
					}
				}else{
					if($data['dl_belong']>0){
						$this->get_dlbelongarr($data['dl_belong'],$dl_level);
					}
				}
			}
		}

        //返回所有的上家
		public function get_alldlbelongarr($jxid){
			$Dealer = M('Dealer');
			//上家信息-1
			$map=array();
			$data=array();
			$map['dl_id']=intval($jxid);
			$map['dl_unitcode']=session('unitcode');
			$data=$Dealer->where($map)->find();

			if($data){
				$this->belong_arrs[]=array('id'=>$data['dl_id'],'name'=>$data['dl_name'],'username'=>$data['dl_username'],'type'=>$data['dl_type'],'status'=>$data['dl_status']);
				if($data['dl_belong']>0){
				   $this->get_alldlbelongarr($data['dl_belong']);
				}
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
				// 	$this->dltj_arrs[]=array('id'=>'0','name'=>'总公司','level'=>'0');
				// }
			}
		}
		
		
		//递归返回推荐人路线 $dlid--推荐人的id
		public function get_dlrefereelines($dlid){
			$Dltype = M('Dltype');
			$Dealer = M('Dealer');
					
			$map=array();
			$data=array();
			$map['dl_id']=intval($dlid);
			$map['dl_unitcode']=session('unitcode');
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_referee']>0){
					$map2=array();
					$data2=array();
					$map2['dl_id'] =  $data['dl_referee'];
					$map2['dl_unitcode']=session('unitcode');
					$data2 = $Dealer->where($map2)->find();
					if($data2){
						//推荐人状态
						$dl_referee_status='';
						if($data2['dl_status']==0){
							$dl_referee_status='新';
						}else if($data2['dl_status']==1){
							$dl_referee_status='正常';
						}else if($data2['dl_status']==9){
							$dl_referee_status='禁用';
						}else{
							$dl_referee_status='未知';
						}
						
						//推荐人级别
						$map3=array();
						$map3['dlt_unitcode']=session('unitcode');
						$map3['dlt_id'] = $data2['dl_type'];
						$data3 = $Dltype->where($map3)->find();
						if($data3){
							$dl_referee_type=$data3['dlt_name'];
						}else{
							$dl_referee_type='-';
						}
						
					    $this->referee_lines.=' <- '.$data2['dl_name'].' ('.$data2['dl_username'].')('.$dl_referee_type.')['.$dl_referee_status.']';
					    
						if($data2['dl_referee']!=$data['dl_id']){
						    $this->referee_lines.=$this->get_dlrefereelines($data2['dl_id']);	
						}
					}
				}else{
					$this->referee_lines.=' <- 总公司';
				}
			}
		}
		
        public function _empty()
        {
          header('HTTP/1.0 404 Not Found');
          echo'error:404';
          exit;
        }

}