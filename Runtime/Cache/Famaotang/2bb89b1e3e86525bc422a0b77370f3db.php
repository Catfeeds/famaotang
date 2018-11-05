<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>
			代理申请</title>
		<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/iconfont.css"/>
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/sm.min.css">
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/swiper.min.css"/>
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/demo.css"/>


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
			
			input::-ms-input-placeholder {
				color: #AFAFAF;
				font-size: .7rem;
			}
			
			input::-webkit-input-placeholder {
				color: #AFAFAF;
				font-size: .7rem;
			}
			.picker-item{ padding:0 20px; font-size:0.9rem}
		</style>
	</head>

	<body ontouchstart="" style="background-color:#FAFAFA">
		<div class="page">
			<header class="bar bar-nav" style="background-color:#006db2;">
				<a href="<?php echo U('./'.C('MODULE_NAME').'/Index');?>" class="icon icon-left pull-left" style="color:#fff"></a>
				<h1 class="title" style="color:#fff">代理申请</h1>
			</header>
			<div class="content">
				
				<div class="kl-layout kl-layout-horizontally-vcenter" style="background:transparent;margin-left:0.9rem"><div class="item-title label">推荐人：<?php echo ($dlreferee["dl_name"]); ?> <?php if($dlreferee["dl_weixin"] != '' ): ?>(<?php echo ($dlreferee["dl_weixin"]); ?>)<?php endif; ?></div></div>
				<form action="<?php echo U('./'.C('MODULE_NAME').'/Dealer/apply');?>"  method="post" id="fmmm" name="fmmm">
					<input type="hidden" name="slid" id="slid" value="<?php echo ($slid); ?>">
					<input type="hidden" name="jxid" id="jxid" value="<?php echo ($jxid); ?>">
					<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">
					<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">
					<input type="hidden" name="action" id="action" value="save">
					<input type="hidden" name="diqustr" id="diqustr" value="">
					<input type="hidden" name="file_name" id="file_name"  value="" >
					<input type="hidden" name="file_name2" id="file_name2"  value="" >
					<div class="list-block" style="margin-top:0.25rem;margin-bottom:1rem;">
						<ul>
							<li style="display: none">
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>头像</h1></div>
										<div class="item-input">
											<input id="dl_head_icon" type="hidden">
										</div>
										<img src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/head_icon.png" style="height: 2.5rem;width: 2.5rem;line-height:3rem;">
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-email"></i></div>
									<div class="item-inner" id="dl_level22" >
										<div class="item-title label">
											<h1>代理级别</h1></div>
										<div class="item-input"><?php echo ($dltinfo["dlt_name"]); ?>
											<input type="hidden" name="dlt_id" id="dlt_id" value="">
											<input id="dl_level" type="text" value="" placeholder="请选择代理级别" readonly>
										</div>
										<i class="iconfont icon-down-copy" style="font-size:1rem;"></i>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>姓名</h1></div>
										<div class="item-input">
											<input id="dl_name" name="dl_name" type="text" placeholder="请填写姓名" >
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>微信号</h1></div>
										<div class="item-input">
											<input id="dl_weixin" name="dl_weixin" type="text" placeholder="请填写微信号" >
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>手机号</h1></div>
										<div class="item-input">
											<input id="dl_tel" name="dl_tel" type="text" placeholder="请填写手机号" maxlength="11" >
										</div>
									</div>
								</div>
							</li>

							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>身份证</h1></div>
										<div class="item-input">
											<input id="dl_idcard" name="dl_idcard" type="text" placeholder="请填写身份证" maxlength="18" >
										</div>
									</div>
								</div>
							</li>
<!--							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>开户银行</h1></div>
										<div class="item-input">
											<input type="hidden" name="dl_bank" id="dl_bank">
											<input id="dl_bankname" name="dl_bankname" type="text" value="" placeholder="请选择开户银行" readonly style="font-size: 0.5rem">
										</div> 
										<i class="iconfont icon-down-copy" style="font-size:1rem;"></i>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>帐号/卡号</h1></div>
										<div class="item-input">
											<input id="dl_bankcard" name="dl_bankcard" type="text" placeholder="帐号/卡号必须与填写的代理人对应" maxlength="19" style="font-size: 0.5rem">
										</div>
									</div>
								</div>
							</li>-->
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner"  id="dl_area_all22" >
										<div class="item-title label">
											<h1>所在地区</h1></div>
										<div class="item-input">
											<input id="dl_prov" name="dl_prov" type="hidden">
											<input id="dl_city" name="dl_city" type="hidden">
											<input id="dl_area" name="dl_area" type="hidden">
											<input id="dl_area_all" name="dl_area_all" type="text" value="" placeholder="请选择地区" readonly >
										</div>
										<i class="iconfont icon-down-copy" style="font-size:1rem;"></i>
									</div>
								</div>
							</li>
							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>收货地址</h1></div>
										<div class="item-input">
											<input id="dl_address" name="dl_address" type="text" placeholder="请填写收货的详细地址" >
										</div>
									</div>
								</div>
							</li>
<!-- 							<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-name"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>邀请人ID</h1></div>
										<div class="item-input">
											<input id="dl_referee" name="dl_referee" type="text" placeholder="请填写邀请人ID" style="font-size: 0.5rem">
										</div>
									</div>
								</div>
							</li> -->
						</ul>
					</div>
					<!--<div class="kl-layout-center"><span class="icon icon-clock" style="color: red;margin-bottom: .3rem; font-size: 1rem;"></span> <span id="timingtxt" >链接有效倒计时：</span><span id="timing"><?php echo ($timing); ?></span></div>-->
				</form>
				<div class="content-block" style="margin-top:0.5rem;margin-bottom:0.5rem;">
					<p>
						<a href="#" id="dealer_sumbit" class="button button-fill" style="color: #fff; height:2rem;padding:.4rem;background-color:#006db2;">提交</a>
					</p>
				</div>
			</div>
		</div>
	</body>
	 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/app.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/swiper.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/zepto.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm.min.js" charset="utf-8"></script>


	<script type='text/javascript' src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm-city-picker.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/AreaData_min.js' charset='utf-8'></script>
	<script type="text/javascript">
		$.init();
		$(function() {

			 //计时
		    var timing = $("#timing");
		    function startTime() {
				var count = parseInt(timing.text());
				if(count > 0){
					  count--;
					  timing.text(count);
				}else{
					stopTime();
					mpoptips("该邀请链接已过期","warn",2000);
					$("#timing").hide();
					$("#timingtxt").text('该邀请链接已过期');
					return false; 
				}
			}
			
		    var monitorInterval = null;
			monitorInterval = setInterval(startTime, 1000);
			
			//删除计时
			function stopTime() {
			  if (monitorInterval) {
				  clearInterval(monitorInterval);
				  monitorInterval = null;
			  }
			}
	

			var listArray = <?php echo json_encode($dltypelist);?>; //注意，这里不要用双引号或单引号；
			var nTypeArry=[];
			var idTypeArry=[];
				if($.isArray(listArray)&&listArray.length>0){
					// console.log(JSON.stringify(listArray));
					listArray.forEach(function(val,index) {
						nTypeArry.push(val.dlt_name);
						idTypeArry.push(val.dlt_id);
					});
				}
			$('#dl_level').val('');
			$('#dl_level22').picker({
				toolbarTemplate: '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择代理级别</h1>\</header>',
				formatValue:function (p,values,displayValues) {
					$("#dlt_id").val(values[0]);
        			// return displayValues[0] +' '+values[0];
					$('#dl_level').val(displayValues[0]);
        			//return displayValues[0];
    			},
				cols: [{
					textAlign: 'center',
					values: idTypeArry,
					displayValues:nTypeArry
				}]
			});
/*
			var bankObject=<?php echo json_encode($bankarr);?>; //注意，这里不要用双引号或单引号；
			var nBankArry=[];
			var idBankArry=[];
			// if (!isEmpty(bankObject)){
				// $.toast('银行');
				// console.log(JSON.stringify(bankObject));
				// if($.isArray(bankArray)&&bankArray.length>0){
				// 	bankArray.forEach(function(val,index) {
				// 		nBankArry.push(val);
				// 		idBankArry.push(index+1);
				// 	});
				// }
				for(var name in bankObject) {
						nBankArry.push(bankObject[name]);
						idBankArry.push(name);
					}
			// }


			$('#dl_bankname').val('');	
			$('#dl_bankname').picker({
				toolbarTemplate: '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择开户银行</h1>\</header>',
				formatValue:function (p,values,displayValues) {
					$("#dl_bank").val(values[0]);
        			// return displayValues[0] +' '+values[0];
        			return displayValues[0];
    			},
				cols: [{
					textAlign: 'center',
					values: idBankArry,
					displayValues:nBankArry
				}]
			});
			*/
			$('#dl_area_all').val('');	
			$("#dl_area_all22").cityPicker({
    			toolbarTemplate: '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择所在地区</h1>\</header>',
    			formatValue:function (p,values,displayValues) {
    				var provID=0;
    				var cityID=0;
    				var areaID=0;
    				// console.log(values[0]+""+values[1]+""+values[2]);
    				if($.isArray(area_array)&&area_array.length>0){
						area_array.forEach(function(val,index) {
							if (val.indexOf(values[0])>=0)
							{
								provID=index;
								// console.log(values[0]+'=='+index);
							}
						});
					}

					var cityArray=sub_array[provID];
					if($.isArray(cityArray)&&cityArray.length>0){
						cityArray.forEach(function(val,index) {
						if (val.indexOf(values[1])>=0)
							{
								cityID=index;
								// console.log(values[1]+'=='+index);
							}
						});
					}
					var areaArray=sub_arr[cityID];
					if($.isArray(areaArray)&&areaArray.length>0){
						areaArray.forEach(function(val,index) {
						if (val.indexOf(values[2])>=0)
							{
								// console.log(values[2]+'=='+index);
								areaID=index;
							}
						});
					}
					
					$("#dl_prov").val(provID);
					$("#dl_city").val(cityID);
					$("#dl_area").val(areaID);
					$("#dl_address").val(values[0] +''+values[1] +''+values[2]);
					$('#dl_area_all').val(values[0] +''+values[1] +''+values[2]);	
        			//return values[0] +' '+values[1] +' '+values[2];
    			},
  				});



	 		//点击提交
   	 		$("#dealer_sumbit").click(function(){
			if($("#dlt_id").val() == "") {
				$.toast("请选择代理级别"); 
				return false; 
			}
			
            if($("#dl_name").val() == "") { 
            	$.toast("请填写姓名"); 
				return false; 
			} 
			 
			if($("#dl_weixin").val() == "") {
				$.toast("请填写微信号");  
				return false; 
			}
			
			
			var filter=/^\s*[a-zA-Z0-9_-]{6,20}\s*$/; 
			if  (!filter.test($("#dl_weixin").val())) { 
				$.toast("请正确填写微信号,支持6-20个字母、数字、下划线和减号");  
				return false; 
			}
		
			
			if($("#dl_tel").val() == "") {
			 	$.toast("请填写手机号");  
				return false; 
			}
			var filter2=/^\s*[0-9]{10,15}\s*$/; 
			if  (!filter2.test($("#dl_tel").val())) {
				$.toast("请正确填写手机号,手机号由11位数字组成");   
				return false; 
			}

			
			
			if($("#dl_idcard").val() == "") {
				$.toast("请填写身份证号");    
				return false; 
			}
			
            var filter=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/; 
			if  (!filter.test($("#dl_idcard").val())) {
				$.toast("请正确填写第二代18位身份证号");     
				return false; 
			}

			if($("#dl_bank").val() == "") {
				$.toast("请选择开户银行");   
				return false; 
			}
/*
			if($("#dl_bankcard").val() == "") {
			 	$.toast("请填写与姓名对应的卡号/账号");
				return false; 
			}else if ($("#dl_bankcard").val().length<11||$("#dl_bankcard").val().length>20)
			{
				$.toast("请填写正确的卡号/账号");
				return false; 
			}
*/
			if($("#dl_area_all").val() == "" || $("#dl_area_all").val() == 0) {
				$.toast("请选择所在地区");    
				return false; 
			}
			
			if($("#dl_address").val() == "") {
				$.toast("请填写收货地址");     
				return false; 
			}
			
			// if($("#dl_referee").val() == "") {
			// 	$.toast("请填写推荐人编号");   
			// 	return false; 
			// }
			
			$("#fmmm").submit(); 
		});

// 			//如果是undefined， null， ''， NaN，false，0，[]，{} ，空白字符串，都返回true，否则返回false
// function isEmpty(v) {
// 	switch(typeof v) {
// 		case 'undefined':
// 			return true;
// 			break;
// 		case 'string':
// 			if(v.replace(/(^[ \t\n\r]*)|([ \t\n\r]*$)/g, '').length == 0) {
// 				return true;
// 			}
// 			if(v == "{}" || v == "[]" || v == "null") {
// 				return true;
// 			}
// 			break;
// 		case 'boolean':
// 			if(!v) return true;
// 			break;
// 		case 'number':
// 			if(0 === v || isNaN(v)) return true;
// 			break;
// 		case 'object':
// 			if(null === v || v.length === 0) {
// 				return true;
// 			}
// 			for(var i in v) {
// 				if(v.hasOwnProperty(i)) {
// 					return false;
// 				}
// 			}
// 			return true;
// 			break;
// 	}
// 	return false;
// }
		});
		


	</script>
<!-- <script>
(function(){
        $("#pic_file").change(function(){
             lrz(this.files[0], {width: 800})
                .then(function (rst) {
                    //console.log(rst);
					 var el=$.loading({
							content:'上传中...',
					 });
                    $.ajax({
                        url: '<?php echo U('./'.C('MODULE_NAME').'/Dealer/uploadpic');?>',
                        type: 'post',
                        data: {"pic_file":rst.base64,"ttamp":"<?php echo ($ttamp); ?>","sture":"<?php echo ($sture); ?>"},
                        dataType: 'json',
                        timeout: 200000,
                        success: function (response) {
						    el.loading("hide");
                            if (response.stat == '0') {
								$("#file_name").val(response.filename);
								$("#img_file").attr('src',"/Public/uploads/temp/"+response.filename); 
								$("#img_div").show();
                                 return true;
                            } else {
								alert('图片提交失败');
								return false;
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            el.loading("hide");
                            if (textStatus == 'timeout') {
                                a_info_alert('请求超时');
                                return false;
                            }

                            alert(jqXHR.responseText);
                        }
                    });
                        
                })
                .catch(function (err) {
                   el.loading("hide");
                })
                .always(function () {
                   el.loading("hide");
                });
        });
		
		
        $("#pic_file2").change(function(){
             lrz(this.files[0], {width: 800})
                .then(function (rst) {
                    //console.log(rst);
					 var el=$.loading({
							content:'上传中...',
					 });
                    $.ajax({
                        url: '<?php echo U('./'.C('MODULE_NAME').'/Dealer/uploadpic');?>',
                        type: 'post',
                        data: {"pic_file":rst.base64,"ttamp":"<?php echo ($ttamp); ?>","sture":"<?php echo ($sture); ?>"},
                        dataType: 'json',
                        timeout: 200000,
                        success: function (response) {
						    el.loading("hide");
                            if (response.stat == '0') {
								$("#file_name2").val(response.filename);
								$("#img_file2").attr('src',"/Public/uploads/temp/"+response.filename); 
								$("#img_div2").show();
                                 return true;
                            } else {
								alert('图片提交失败');
								return false;
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            el.loading("hide");
                            if (textStatus == 'timeout') {
                                a_info_alert('请求超时');
                                return false;
                            }

                            alert(jqXHR.responseText);
                        }
                    });
                        
                })
                .catch(function (err) {
                   el.loading("hide");
                })
                .always(function () {
                   el.loading("hide");
                });
        });
		
		
})();
</script> -->
</html>