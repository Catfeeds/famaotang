<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>邀请代理</title>
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
		</style>
	</head>

	<body ontouchstart="" style="background-color:#FAFAFA">
		<div class="page">
			<header class="bar bar-nav" style="background-color:#006db2;">
				<!-- <a href="javascript:;" onClick="javascript :history.back(-1);" class="icon icon-left pull-left" style="color:#fff"></a> -->
				<a href="<?php echo U('./'.C('MODULE_NAME').'/Dealer');?>" class="icon icon-left pull-left" style="color:#fff"></a>
				<h1 class="title" style="color:#fff">邀请代理</h1>
			</header>
			<div class="content">
				<div class="list-block media-list" style="margin: 0.3rem 0;">
				    <ul style="background: transparent;">
					<?php if(is_array($sharelinkslist)): foreach($sharelinkslist as $key=>$item): ?><li class="sharelinks_item">
				            <div class="kl-layout-horizontally-between" style="width: 100%;margin-bottom: 0.2rem; background: #fff">
				            	<div class="kl-layout-horizontally-between" style="width: 93%;">
	              				    <div class="item-content item-inner">
	              						<div class="item-subtitle" style="margin: .3rem 0">邀请链接</div>
	            						<div class="item-title timeList" >打开:<?php echo ($item['sl_views']); ?> / 已申请:<?php echo ($item['sl_applynum']); ?>  </div>
	          						</div>
					 				<p><a href="#" class="button button-fill button-round" style="padding:0 0.5rem;font-size: .3rem;">分 享</a></p>
				           		</div>
				           		<span class="icon icon-right" style="margin: .3rem;"></span>
				            </div>
				      </li><?php endforeach; endif; ?>
				    </ul>
			    </div>

				<form action="<?php echo U('./'.C('MODULE_NAME').'/Dealer/marklinks');?>" action="" enctype="multipart/form-data" method="get" id="fmmm" name="fmmm">
					<div class="list-block" style="margin-top:0.25rem;margin-bottom:1rem;">
						<ul>
							<!--<li>
								<div class="item-content">
									<div class="item-media"><i class="icon icon-form-email"></i></div>
									<div class="item-inner">
										<div class="item-title label">
											<h1>代理级别</h1></div>
										<div class="item-input">
											<input type="hidden" name="dltype" id="dltype" value="">
											<input id="dlt_type" type="text" value="" placeholder="请选择代理级别" style="font-size: 0.5rem" readonly>
										</div>
										<i class="iconfont icon-down-copy" style="font-size:1rem;"></i>
									</div>
								</div>
							</li>-->
						</ul>
					</div>
				</form>
				<?php if($incount < 6 ): ?><div class="content-block" style="margin-top:0.5rem;margin-bottom:0.5rem;">
					<p>
						<a href="#" id="invite_sumbit" class="button button-fill" style="color: #fff; height:2rem;padding:.4rem;background-color:#006db2;">生成邀请链接</a>
					</p>
				</div><?php endif; ?>
			</div>
		</div>
	</body>
	 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/app.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/swiper.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/zepto.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm.min.js" charset="utf-8"></script>


	<script type="text/javascript">
	$.init();
	$(function() {
			var dl_level="<?php echo ($dl_level); ?>";
			// console.log(dl_level);
			var listArray = <?php echo json_encode($dltypelist);?>||[]; //注意，这里不要用双引号或单引号；
			var nTypeArry=[];
			var idTypeArry=[];
				if($.isArray(listArray)&&listArray.length>0){
					// console.log(JSON.stringify(listArray));
					listArray.forEach(function(val,index) {

							nTypeArry.push(val.dlt_name);
							idTypeArry.push(val.dlt_id);

					});
				}
			$('#dlt_type').val('');
			$('#dlt_type').picker({
				toolbarTemplate: '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择代理级别</h1>\</header>',
				formatValue:function (p,values,displayValues) {
					$("#dltype").val(values[0]);
        			// return displayValues[0] +' '+values[0];
        			return displayValues[0];
    			},
				cols: [{
					textAlign: 'center',
					values: idTypeArry,
					displayValues:nTypeArry
				}]
			});




			 //计时
			var timeList = $(".timeList");
			function startTime() {
			    var hasCount = 0;
			    timeList.each(function(index){  
				    var self = this;
					var count = parseInt($(self).find('span').text());
					if(count > 0){
						  count--;
						  $(self).find('span').text(count);
						  hasCount++;
					}else{
					    $(self).find('span').remove();
						$(self).find('p').html('已过期');
					}
				});

				if (hasCount == 0) {
					stopTime();
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

			var sharelinksArray = <?php echo json_encode($sharelinkslist);?>;
            $('.sharelinks_item').each(function(index) {
                // console.log('li %d is:%o',index,this);
                if ($.isArray(sharelinksArray)&&sharelinksArray.length>index)
                {
                    var sharelinksObject=sharelinksArray[index];
                    $(this).click(function(){
                        if($.isPlainObject(sharelinksObject))
                        {
                            window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Dealer/marklinks');?>/"+"slid/"+sharelinksObject['sl_id'];
                        }
                    }); 
                }
            });

			//点击提交
   	 		$("#invite_sumbit").click(function(){
   	 			//if($("#dltype").val() == "") {
				//	$.toast("请选择代理级别"); 
				//	return false; 
				//}
   	 			$("#fmmm").submit();
   	 		});
	

	});
	</script>	
</html>