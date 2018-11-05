<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title> 下家的订单</title>
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
			
			.buttons-tab {
				margin: 0;
				background: #fff;
				position: relative;
			}
			
			.buttons-tab .button {
				font-size: .6rem;
			}
			
			.buttons-tab .button.active,
			.buttons-tab .button:active {
				font-size: .6rem;
				color: #f08519;
				border-color: #f08519;
			}
			
			.content-block {
				margin: 0rem 0;
				padding: 0rem;
				color: #6d6d72;
			}
			
			.badge {
				display: inline-block;
				padding: 0.1rem 0.25rem 0.1rem 0.25rem;
				font-size: .1rem;
				line-height: .6rem;
				color: #fff;
				background-color: rgba(0, 0, 0, .15);
				border-radius: 5rem;
			}
			
			.modal-button {
				font-size: .5rem;
			}
		</style>
	</head>

	<body ontouchstart="" style="background-color:#FAFAFA">
		<div class="page">
			<header class="bar bar-nav" style="background-color:#006db2;">
				<?php if($back == 1): ?><a href="<?php echo U('./'.C('MODULE_NAME').'/Mine');?>" class="icon icon-left pull-left" style="color:#fff"></a>
				<?php else: ?>
					<?php if($back == 2): ?><a href="<?php echo U('./'.C('MODULE_NAME').'/Index');?>" class="icon icon-left pull-left" style="color:#fff"></a>
					<?php else: ?>
						<a href="<?php echo U('./'.C('MODULE_NAME').'/Orders/home/od_type/1');?>" class="icon icon-left pull-left" style="color:#fff"></a><?php endif; endif; ?>
				<h1 class="title" style="color:#fff">下家的订单</h1>
			</header>
			<div class="content">
				
				<div class="content-block" style="min-height: 10rem; margin:0;">
					<div class="buttons-tab">
						<a href="#" id="od_sure" class="tab-link  button <?php if($od_state == 0 ): ?>active<?php endif; ?> ">待确认</a>
						<a href="#" id="od_send" class="tab-link button <?php if($od_state == 1 ): ?>active<?php endif; ?>">待发货</a>
						<a href="#" id="od_sended" class="tab-link button <?php if($od_state == 3 ): ?>active<?php endif; ?>">已发货</a>
						<a href="#" id="od_finish" class="tab-link button <?php if($od_state == 8 ): ?>active<?php endif; ?>">已完成</a>
						<a href="#" id="od_cancel" class="tab-link button <?php if($od_state == 9 ): ?>active<?php endif; ?>">已取消</a>
					</div>
					<div class="content-block">
						<div class="tabs" style="background: #FFF">
							<div id="tab2_1" class="tab active">
								<div class="content-block">
									<div class="list-block media-list" style="margin-top:0rem;">
										<ul>
											<?php if(is_array($list)): foreach($list as $key=>$item): ?><li>
													<div class="order-list all_odlist" style="border-bottom:.2rem solid #EFEFF4;">
														<div class="order-number">
															<span>订单号：<?php echo ($item["od_orderid"]); ?></span>
															<span style="color: #f08519"><?php echo ($item["od_state_str"]); ?></span>
														</div>
														<?php if(is_array($item['orderdetail'])): foreach($item['orderdetail'] as $key2=>$item2): ?><div class="order-content" style="padding-bottom: 0.5rem">
																<div class="item-media"><img src="/Public/uploads/product/<?php echo ($item2["oddt_propic"]); ?>" style="width:3.5rem;" onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/logo_icon.png'"></div>
																<div class="order-inner">
																	<div class="item-subtitle" style="font-size: 0.5rem">
																		<?php echo ($item2["oddt_proname"]); ?>(<?php echo ($item2["oddt_pronumber"]); ?>)<?php if($item2["oddt_color"] != '' ): echo ($item2["oddt_color"]); endif; ?>　<?php if($item2["oddt_size"] != '' ): echo ($item2["oddt_size"]); endif; ?>
																	</div>
																	<div class="order-remark">
																		<div class="kl-layout-horizontally-between">
																			<div>
																				<div class="pro_name" style="color: red;">￥<span style="font-size:.75rem"><?php echo (number_format($item2["oddt_dlprice"],2,'.','')); ?></span>
																					<?php if($item2["oddt_price"] > 0): ?><span style="padding-right:.2rem; text-decoration:line-through;color:#c1c1c1">￥<?php echo (number_format($item2["oddt_price"],2,'.','')); ?></span><?php endif; ?>
																				</div>
																				<div class="pro_name">订购：
																					<?php echo ($item2["oddt_qty"]); ?> <?php echo ($item2["oddt_prounits"]); echo ($item2["oddt_totalqty"]); ?>　已发：<?php echo ($item2["oddt_shipqty"]); ?>
																					<?php if($item2["oddt_shipqty"] > 0): ?><i class="iconfont icon-shenqing all_recode_icon" style="font-size:1rem; color: #7e7e7e;margin-left:0.25rem"></i><?php endif; ?>
																				</div>
																			</div>
                                                                            <?php if(($item["od_state"] == 1 or $item["od_state"] == 2 or $item["od_state"] == 3 ) and ($item2["oddt_canship"] == 1) ): ?><i class="iconfont icon-saoyisao all_odsaomian" style="font-size: 2rem;color: #167abe;"></i><?php endif; ?>
																		</div>
																	</div>
																	
																</div>
															</div><?php endforeach; endif; ?>
														<div class="order-number">
															<span><?php echo (date('Y-m-d h:i:s',$item["od_addtime"])); ?></span>
															<span style="color:#000">共<span style="color: red"> <?php echo ($item["odtotalqty"]); ?> </span>件商品，合计：<span style="color:#000">￥<?php echo (number_format($item["od_total"],2,'.','')); ?></span></span>
														</div>
														<div class="order-bottom">
															<div class="order-button-type">
																<?php if($item["od_state"] < 2): ?><a href="#" class="button button-light button-round order-button" id="all_odcancel" style="color:#ccc;margin-left:.5rem;font-size: 0.5rem;">取消</a><?php endif; ?>
															<?php if($item["od_state"] == 0): ?><a href="#" class="button button-warning button-round order-button" id="all_odqueren" style="margin-left:.5rem;font-size: 0.5rem;">确认</a><?php endif; ?>
															<?php if(($item["od_state"] > 0) and ($item["od_state"] < 3)): ?><a href="#" class="button button-warning button-round order-button" id="all_odfinish" style="margin-left:.5rem;font-size: 0.5rem;">完成发货</a><?php endif; ?>
																<a href="#" class="button button-warning button-round order-button" id="all_oddetail" style="font-size: 0.5rem;" >详情</a>
															</div>
														</div>
													</div>
												</li><?php endforeach; endif; ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="kl-page" style="margin:.5rem">
						<?php if($page != ''): echo ($page); endif; ?>
					</div>
				</div>
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

			var odArray = <?php echo json_encode($list);?>||[];
			if($.isArray(odArray)&&odArray.length>0){
				odArray.forEach(function(val,index) {
					var odObject=odArray[index];
				});
			}

			$('.order-list.all_odlist').each(function(index) {
				// console.log('li %d is:%o',index,this);
				if ($.isArray(odArray)&&odArray.length>index)
				{
					var odObject=odArray[index];
					//详情
					$(this).find("#all_oddetail").click(function(){
						if($.isPlainObject(odObject))
						{
							window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorderdetail/od_id');?>/"+odObject['od_id'];
						}
					});
					//确认
					$(this).find("#all_odqueren").click(function(){
						if ($.isPlainObject(odObject))
						{
							window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/canceldlorder/od_id');?>/"+odObject['od_id']+"/state/1";
						}
					});
					
					//取消
					$(this).find("#all_odcancel").click(function(){
						if ($.isPlainObject(odObject))
						{
							 $.confirm('是否确定取消该订单吗?',function () {
				               window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/canceldlorder/od_id');?>/"+odObject['od_id']+"/state/9";
				            });
						}
					});
					//扫码
					$(this).find(".all_odsaomian").each(function(pos,eml){
						var oddtObject=odObject['orderdetail'][pos];
						$(eml).click(function(){
							if ($.isPlainObject(odObject))
							{
								window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/odshipscan/od_id');?>/"+odObject['od_id']+"/oddt_id/"+oddtObject['oddt_id'];
							}
						});
					});
					//出货记录
					$(this).find(".all_recode_icon").each(function(pos,eml){
						// console.log('li %d is:%o',index,eml);
						var oddtObject=odObject['orderdetail'][pos];
						$(eml).click(function(){
							if ($.isPlainObject(odObject))
							{
								window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/odshiplist/od_id');?>/"+odObject['od_id']+"/oddt_id/"+oddtObject['oddt_id'];
							}
						});
					});
                    //完成发货
					$(this).find("#all_odfinish").click(function(){
						if ($.isPlainObject(odObject))
						{
								window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/odfinishship/od_id');?>/"+odObject['od_id'];
						}
					});

					$(this).find("#all_odpingzheng").click(function(){
						if($.isPlainObject(odObject))
						{
							window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/uploadpaypic/od_id');?>/"+odObject['od_id'];
						}
					});
				}
			});



			$('#od_sure').click(function(){
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/0');?>";
			});
			
			$('#od_send').click(function(){
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/1');?>";
			});
			
			$('#od_sended').click(function(){
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/3');?>";
			});
			
			$('#od_finish').click(function(){
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/8');?>";
			});
			
			$('#od_cancel').click(function(){
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/9');?>";
			});



	});
	</script>

</html>