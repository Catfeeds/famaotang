<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>返利提现</title>
		<link rel="stylesheet" type="text/css" href="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/iconfont.css"/>
<link rel="stylesheet" type="text/css" href="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/sm.min.css">
<link rel="stylesheet" type="text/css" href="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/swiper.min.css"/>
<link rel="stylesheet" type="text/css" href="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/demo.css"/>


		<style type="text/css">
			.icon_lists {
				width: 100% !important;
			}
			
			.icon_lists li {
				float: left;
				width: 20%;
				height: 180px;
				text-align: center;
				list-style: none !important;
			}
			
			.icon_lists li img {
				width: 2rem;
				margin: 0.3rem;
			}
			
			.icon_lists li a {
				text-decoration: none;
			}
			
			.icon_lists .iconfont {
				font-size: 25px;
				line-height: 30px;
				margin: 10px 0;
				color: #7e7e7e;
				-webkit-transition: font-size 0.25s ease-out 0s;
				-moz-transition: font-size 0.25s ease-out 0s;
				transition: font-size 0.25s ease-out 0s;
			}
			
			.icon_lists .iconfont.active,
			.icon_lists .iconfont:active {
				font-size: 25px;
				color: #f08519;
			}
			
			.icon_lists .name {
				font-size: 12px;
			}
			
			.bar-tab .tab-item.active,
			.bar-tab .tab-item:active {
				color: #f08519;
			}
			.list-block .item-title.label {
				width: 25%;
			}
			.modal-button {
				font-size: .5rem;
			}
			.picker-item{ padding:0 20px; font-size:0.9rem}
		</style>
	</head>

	<body ontouchstart="" style="background-color:#FAFAFA">
		<div class="page">
			<header class="bar bar-nav" style="background-color:#006db2;">
				<!-- <a href="javascript:;" onClick="javascript :history.back(-1);" class="icon icon-left pull-left" style="color:#fff"></a> -->
				<a href="<?php echo U('./'.C('MODULE_NAME').'/Fanli/receivelist');?>" class="icon icon-left pull-left" style="color:#fff"></a>
				<h1 class="title" style="color:#fff">返利提现</h1>
			</header>
			<div class="content">
				<form action="<?php echo U('./'.C('MODULE_NAME').'/Fanli/recash_save');?>"  method="post" id="fmmm" name="fmmm" >
				<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">	
				<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">	
				<input type="hidden" name="fl_senddlid" id="fl_senddlid" value="<?php echo ($fl_senddlid); ?>" >	
				<input type="hidden" name="rc_money" id="rc_money" value="<?php echo ($dl_fanli2); ?>" >	
				 <div class="list-block" style="margin: 0.3rem 0;">
				    <ul>
				      <!-- Text inputs -->
				      <li>
				        <div class="item-content">
				          <div class="item-inner">
				            <div class="item-title">付款代理：<?php if(!empty($fl_sdl_name)): echo ($fl_sdl_name); endif; ?> <?php if(!empty($fl_sdl_username)): ?>(<?php echo ($fl_sdl_username); ?>)<?php endif; ?></div>
				          </div>
				        </div>
				      </li>
				      <li>
				        <div class="item-content">
				          <div class="item-inner">
				            <div class="item-title">收款代理：<?php echo ($dl_name); ?> (<?php echo ($dl_username); ?>)</span></div>
				          </div>
				        </div>
				      </li>
				      <li>
				         <div class="item-content">
				          <div class="item-inner">
				           		<div class="item-title label">待收金额</div>
								<div class="item-input">
									<input type="text" value="<?php echo (number_format($dl_fanli,2,'.','')); ?> 元"  readonly style="font-size: 0.5rem">
								</div>
				          </div>
				        </div>
				      </li>
				      <li>
				         <div class="item-content">
				          <div class="item-inner">
				           		<div class="item-title label">可提金额</div>
								<div class="item-input">
									<input type="text" value="<?php echo (number_format($dl_fanli2,2,'.','')); ?> 元"  readonly style="font-size: 0.5rem">
								</div>
				          </div>
				        </div>
				      </li>
				      <li>
				         <div class="item-content">
				          <div class="item-inner" id="dl_bankname22" >
				            <div class="item-title label">开户银行</div>
								<div class="item-input">
									<input type="hidden" name="rc_bank"  id="rc_bank" value="0">
									<input id="dl_bankname" name="dl_bankname" type="text" value="" placeholder="请选择开户银行" readonly style="font-size: 0.5rem">
								</div> 
								<i class="iconfont icon-down-copy" style="font-size:1rem;"></i>
				          </div>
				        </div>
				      </li>
					  
					   <li  id="kaihuzhihang" >
							<div class="item-content">
					          <div class="item-inner">
					          		<div class="item-title label">开户支行</div>
									<div class="item-input">
										<input value="" id="rc_banknamezh" name="rc_banknamezh" type="text" style="font-size: 0.5rem"  placeholder="请填写开户的支行"  >
									</div>
					          </div>
					        </div>
					   </li>
					   
				      <li>
				         <div class="item-content">
				          <div class="item-inner">
				           		<div class="item-title label">帐号/卡号</div>
								<div class="item-input">
									<input type="text" value=""  placeholder="卡号/账号必须与卡号姓名对应"  id="rc_bankcard" name="rc_bankcard" style="font-size: 0.5rem">
								</div>
				          </div>
				        </div>
				      </li>
					  
					   <li>
							<div class="item-content">
					          <div class="item-inner">
					          		<div class="item-title label">卡号姓名</div>
									<div class="item-input">
										<input value="<?php echo ($dl_name); ?>" id="rc_name" name="rc_name" type="text" style="font-size: 0.5rem" readonly>
									</div>
					          </div>
					        </div>
					   </li>
					   
				  	  <li>
				         <div class="item-content">
				          <div class="item-inner">
				           		<div class="item-title label">账号登录密码</div>
								<div class="item-input">
									<input type="password" value=""  placeholder="填写该账号的登录密码" id="rc_pwd" name="rc_pwd" style="font-size: 0.5rem">
								</div>
				          </div>
				        </div>
				      </li>
				      <li class="align-top">
				        <div class="item-content">
				          <div class="item-inner">
				            <div class="item-input" style="padding: .3rem; color: #c1c1c1;"><h4 class="ui-nowrap">温馨提示</h4>
								<p class="ui-nowrap">1、务必核对填写信息是否正确</p>
					            <p class="ui-nowrap">2、卡号和姓名必须一致</p>
								<p class="ui-nowrap">3、只能提现到与收款代理姓名一致的卡号或账号</p>
								<p class="ui-nowrap">4、最低提现额度<?php echo ($edurecash); ?>元</p> <!--<p>提现自动扣除10%手续费</p>-->
				            </div>
				          </div>
				        </div>
				      </li>
				    </ul>
				</div>
				</form>
				<div class="content-block" style="margin-top:0.5rem;margin-bottom:0.5rem;">
					<p>
						<a href="#" id="dealer_sumbit" class="button button-fill" style="color: #fff; height:2rem;padding:.4rem;background-color:#006db2;">提交</a>
					</p>
				</div>
			</div>
		</div>
	</body>
	 <script type="text/javascript" src="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/app.js" charset="utf-8"></script>
 <script type="text/javascript" src="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/swiper.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/zepto.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm.min.js" charset="utf-8"></script>


	<script type='text/javascript' src='/famaotang/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm-city-picker.min.js' charset='utf-8'></script>
	<script type="text/javascript">
	$.init();
	$(function() {
			var bankObject=<?php echo json_encode($bankarr);?>; //注意，这里不要用双引号或单引号；
			var nBankArry=[];
			var idBankArry=[];

				for(var name in bankObject) {
						nBankArry.push(bankObject[name]);
						idBankArry.push(name);
						
				}

		

			$('#dl_bankname').val('');	
			$('#dl_bankname22').picker({
				toolbarTemplate: '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择开户银行</h1>\</header>',
				formatValue:function (p,values,displayValues) {
					$("#rc_bank").val(values[0]);
					$('#dl_bankname').val(displayValues[0]);
					if(values[0]>=7){
					    $('#kaihuzhihang').hide();
					}else{
					    $('#kaihuzhihang').show();
					}
    			},
				cols: [{
					textAlign: 'center',
					values: idBankArry,
					displayValues:nBankArry
				}]
			});

			//点击提交
   	 		$("#dealer_sumbit").click(function(){
			
				if($("#dl_bankname").val() == ""  || parseInt($("#rc_bank").val())<=0) {
            		$.toast("请选择开户银行"); 
					return false; 
				} 
				
				if(parseInt($("#rc_bank").val())<7){
				    if($("#rc_banknamezh").val() == ""){
					    $.toast("请填写开户支行"); 
					    return false; 
					}
				}
			 
			
            	if($("#rc_bankcard").val() == "") {
            		$.toast("请填写卡号或支付宝账号"); 
					return false; 
				} 
			 
				if($("#rc_pwd").val() == "") { 
					$.toast("请填写密码"); 
					return false; 
				}
				
				if($("#rc_money").val() == "") {
					$.toast("可提现金额为0");  
					return false; 
				}
				if(parseInt($("#rc_money").val())<=0){
					$.toast("可提现金额为0");  
					return false; 
				}
				$.confirm('请核实填写信息无误后确认提交!',function () {
					$("#fmmm").submit(); 
				});
			});	
	});
	</script>	
</html>