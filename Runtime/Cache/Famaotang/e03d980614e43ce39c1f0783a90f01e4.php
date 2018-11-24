<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>购物车</title>
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
				<a href="<?php echo U('./'.C('MODULE_NAME').'/Product/index');?>" class="icon icon-left pull-left" style="color:#fff"></a>
				<h1 class="title" style="color:#fff">购物车</h1>
			</header>
			<div class="content">
					<div class="list-block media-list" style="line-height:1rem; margin-top:.25rem;margin-bottom: 0rem; background: #fff;">
						<ul>
							<?php if(is_array($shopcartlist)): foreach($shopcartlist as $key=>$item): if($item["pro_dlprice"] != '' ): ?><li>
								<div class="kl-layout-horizontally-vcenter">
									<?php if($item["sc_status"] != 0): ?><i class="iconfont icon-xuanze1 checkbtn" style="font-size:1rem;margin:.5rem;color: #7e7e7e"></i>
									<?php else: ?>
										<i class="iconfont icon-xuanze checkbtn" style="font-size:1rem;margin:.5rem;color: #7e7e7e"></i><?php endif; ?>
									
									<div class="kl-layout-horizontally-vcenter" style="width: 100%;border-bottom:0.05rem solid #d5d5d5;margin-right:0.3rem;padding:.3rem 0;">
										<img src="/Public/uploads/product/<?php echo ($item["pro_pic"]); ?>" style="width:3rem;margin:.5rem .5rem .5rem 0" onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/logo_icon.png'">
										<div style="margin: 0 .3rem 0 0;width:100%">
											<div class="kl-layout-horizontally-between">
												 <div class="pro_name"><?php echo ($item["pro_name"]); ?></div>
											</div>
											<div class="kl-layout-horizontally-between">
												    <div style="color: #f00;">
												    	￥<?php echo (number_format($item["pro_dlprice"],2,'.','')); ?>
												    </div>
													<div class="kl-numbox">
														<button class="kl-btn kl-btn-numbox-minus" type="button">-</button>
														<input class="kl-input-numbox" style="height:100%;font-size: 0.6rem" value="<?php echo ($item["sc_qty"]); ?>" name="num" type="text"/>
														<button class="kl-btn kl-btn-numbox-plus" type="button">+</button>
													</div>
											</div>
											<div class="kl-layout-horizontally-between">
											<div style="color: #c1c1c1;"><?php if($item["sc_color"] != '' ): ?>颜色：<?php echo ($item["sc_color"]); endif; ?></div>
											<div class="order-price"  style="margin-top:0.2rem"><i class="iconfont icon-shanchu" style="font-size:1rem;"></i></div>
											</div>
										</div>
									</div>
								</div>
							</li><?php endif; endforeach; endif; ?>
						</ul>
						<div class="kl-layout-horizontally-right">
							<div style="padding: 0.3rem">
								<div style="color: #7e7e7e">共<span style="color: red"> <?php echo ($totalqty); ?> </span>件商品，合计：<span style="color:#000">￥<?php echo (number_format($total,2,'.','')); ?></span></div></div>
							</div>
						</div>
			</div>
			<footer class="kl-foot-fixed" style="background: #fff;width: 100%;height:3rem; overflow: hidden;">
			<div class="kl-layout-horizontally" style="margin: 0rem;">
				<div class="kl-layout-center" id="checkAllbtn" style="width:20%;height:3rem;">
						<?php if($allcheck == true): ?><i class="iconfont icon-xuanze" style="font-size:1rem;padding: .3rem;color: #7e7e7e;"></i>
						<?php else: ?>
							<i class="iconfont icon-xuanze1" style="font-size:1rem;padding: .3rem;color: #7e7e7e;"></i><?php endif; ?>
						<div style="color:#c1c1c1;font-size:0.2rem;">全选</div>
				</div>
				<div class="kl-layout-horizontally-right" id="shopcar_add" style="width:55%;height:3rem;font-size:0.75rem;">
					<div style="padding: 0.5rem">
							<div style="font-size:0.75rem;">
								合计：<span style="color: red; font-size:0.3rem;">￥<span style="font-size:1rem;"><?php echo (number_format($total,2,'.','')); ?></span></span>
							</div>
							<div style="display: none;">
								<span style="color:#c1c1c1;">物流：￥<?php echo (number_format($total,2,'.','')); ?></span>
							</div>
					</div>
				</div>
				<div class="kl-layout-center" id="orderlist_add" style="width:25%;height:3rem;background:#f08519;font-size:0.75rem;color: #fff;margin:0rem;">结算(<?php echo ($totalqty); ?>)</div>
			</div>
		</footer>
		</div>
	</body>
	 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/app.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/swiper.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/zepto.min.js" charset="utf-8"></script>
 <script type="text/javascript" src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/sm.min.js" charset="utf-8"></script>


	<script type="text/javascript">
	$.init();
	$(function() {
		var scArray=<?php echo json_encode($shopcartlist);?>||[];
		$('.checkbtn').each(function(index) {
			// console.log('li %d is:%o',index,this);
			if ($.isArray(scArray)&&scArray.length>index)
			{
				var scObject=scArray[index];
				$(this).click(function(){
					if ($.isPlainObject(scObject))
					{
						window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/checkcart/sc_id');?>/"+scObject['sc_id']+"";
					}
				});
			}
		});

		$('.kl-btn.kl-btn-numbox-minus').each(function(index) {
			// console.log('li %d is:%o',index,this);
		
			if ($.isArray(scArray)&&scArray.length>index)
			{
				var minusObject=scArray[index];
				$(this).click(function(){
					if ($.isPlainObject(minusObject))
					{		
						    var sc_qty=parseInt($(".kl-input-numbox").eq(index).val());
							var sc_id=parseInt(minusObject['sc_id']);
							if(sc_qty<=1){
	    						sc_qty=1;
							}else{
	    						sc_qty=sc_qty-1;
							}
						window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/modifycart/sc_id');?>/"+sc_id+'/sc_qty/'+sc_qty+"";
					}
				});
			}
		});

		$('.kl-btn.kl-btn-numbox-plus').each(function(index) {	
			if ($.isArray(scArray)&&scArray.length>index)
			{
				var plusObject=scArray[index];
				$(this).click(function(){
					if ($.isPlainObject(plusObject))
					{

 						var sc_qty=parseInt($(".kl-input-numbox").eq(index).val());
						var sc_id=parseInt(plusObject['sc_id']);

						sc_qty=sc_qty+1;
						window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/modifycart/sc_id');?>/"+sc_id+'/sc_qty/'+sc_qty+"";
					}
				});
			}
		});

		$('.kl-input-numbox').each(function(index) {
			if ($.isArray(scArray)&&scArray.length>index)
			{
				var numObject=scArray[index];
				$(this).change(function(){
					if ($.isPlainObject(numObject))
					{
 						var sc_qty=parseInt($(this).val());
						var sc_id=parseInt(numObject['sc_id']);

    					if(sc_qty<=1){
	    					sc_qty=1;
						}
						window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/modifycart/sc_id');?>/"+sc_id+'/sc_qty/'+sc_qty+"";
					}
				});
			}
		});
		
		$('.icon-shanchu').each(function(index) {
			if ($.isArray(scArray)&&scArray.length>index)
			{
				var numObject=scArray[index];
				$(this).click(function(){
					if ($.isPlainObject(numObject))
					{
						var sc_id=parseInt(numObject['sc_id']);

						window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/removecart/sc_id');?>/"+sc_id+"";
					}
				});
			}
		});

		$("#checkAllbtn").click(function(){
				var checkall=0;
				var allcheck="<?php echo ($allcheck); ?>";
				if (allcheck)
					checkall=1; //1为取消全选
				window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/checkcart/checkall');?>/"+checkall+"";
		});

		$("#orderlist_add").click(function(){
			$.confirm('是否确认提交？',function () {
               	window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/checkshopcart');?>"+"";
            });
		});

	});
	</script>	
</html>