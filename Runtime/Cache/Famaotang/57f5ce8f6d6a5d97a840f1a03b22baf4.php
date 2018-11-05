<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>订单</title>
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
				font-size: .3rem;
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

	<body ontouchstart="" style="background-color:#fafafa">
		<div class="page">
			<nav class="bar bar-tab clear">
				<ul class="icon_lists clear">
					<li>
						<a class="tab-item" href="<?php echo U('./'.C('MODULE_NAME').'/Index');?>">
							<i class="iconfont icon-shouye-copy-copy-copy-copy"></i>
							<div class="name">首页</div>
						</a>
					</li>
					<li>
						<a class="tab-item" href="<?php echo U('./'.C('MODULE_NAME').'/Dealer');?>">
							<i class="iconfont icon-tuandui3"></i>
							<div class="name">团队</div>
						</a>
					</li>
					<li>
						<a class="tab-item" id="fw_search" href="#">
							<img src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/fangwei_icon.png">
						</a>
					</li>
					<li>
						<a class="tab-item active" href="#">
							<i class="iconfont active icon-icon"></i>
							<div class="name">订单</div>
						</a>
					</li>
					<li>
						<a class="tab-item" href="<?php echo U('./'.C('MODULE_NAME').'/Mine');?>">
							<i class="iconfont icon-user2"></i>
							<div class="name">我</div>
						</a>
					</li>
				</ul>
			</nav>
			<div class="content">
				<!-- pie chart -->
				<div class="buttons-tab">
					<a href="#tab1" id="send_order" class="tab-link active button">
						<div>
							<h1>我的订单</h1></div>
					</a>
					<a href="#tab2" id="my_order" class="tab-link button">
						<div>
							<h1>下家订单</h1></div>
					</a>
				</div>
				<div class="content-block">
					<div class="tabs">
						<div id="tab1" class="tab active">
							<div class="content-block" style="min-height: 10rem;">
								<!-- dreanlist -->
								<div class="list-block" style="margin-top:.25rem;margin-bottom: 0rem;">
									<ul>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-daiqueren" style="font-size:1rem; color: #006db8;line-height:1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>待确认订单</h1></div>
												<?php if($mysodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($mysodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($mysodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-daifahuo" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>待发货订单</h1></div>
												<?php if($mymodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($mymodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($mymodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-che1" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已发货订单</h1>
												</div>
												<?php if($myfodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($myfodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($myfodcount); ?></span></div><?php endif; ?>
											
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-zuixinzhengce" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已完成订单</h1>
												</div>
												<?php if($mywodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($mywodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($mywodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link" >
											<div class="item-media"><i class="iconfont icon-shanchu" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已取消订单</h1>
												</div>
												<?php if($myyodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($myyodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($myyodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
									</ul>
								</div>
								<!-- dreanlist -->
								<div class="searchbar" style="margin:0 0.5rem;">
					<a class="searchbar-cancel" href="#" id="searchorder1">搜索</a>
					<div class="search-input">
						<label class="icon icon-search" for="search"></label>
						<input type="search" id='search' placeholder='输入订单号查询' />
					</div>
				</div>
								
							</div>
						</div>
						<div id="tab2" class="tab" >
							<div class="content-block" style="min-height: 10rem;">
								<!-- dreanlist -->
								<div class="list-block" style="margin-top:.25rem;margin-bottom: 0rem;">
									<ul>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-daiqueren" style="font-size:1rem; color: #006db8;line-height:1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>待确认订单</h1></div>
												<?php if($dlsodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($dlsodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($dlsodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-daifahuo" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>待发货订单(扫码出货)</h1></div>
												<?php if($dlmodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($dlmodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($dlmodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-che1" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已发货订单</h1>
												</div>
												<?php if($dlfodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($dlfodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($dlfodcount); ?></span></div><?php endif; ?>
											</div>
										</li>
										<li class="item-content item-link">
											<div class="item-media"><i class="iconfont icon-zuixinzhengce" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已完成订单</h1>
												</div>
												<?php if($dlwodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($dlwodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($dlwodcount); ?></span></div><?php endif; ?>

											</div>
										</li>
										<li class="item-content item-link" >
											<div class="item-media"><i class="iconfont icon-shanchu" style="font-size:1rem; color: #006db8;line-height: 1rem;"></i></div>
											<div class="item-inner">
												<div class="item-title">
													<h1>已取消订单</h1>
												</div>
												<?php if($dlyodcount > 0): ?><div class="item-after"><span class="kl-badge" style="background-color:red;"><?php echo ($dlyodcount); ?></span></div>
													<?php else: ?>
													<div class="item-after"><span class="kl-badge"><?php echo ($dlyodcount); ?></span></div><?php endif; ?>
		
											</div>
										</li>
									</ul>
								</div>
								<!-- dreanlist -->
								<div class="searchbar" style="margin:0 0.5rem;">
									<a class="searchbar-cancel" href="#" id="searchorder2">搜索</a>
									<div class="search-input">
										<label class="icon icon-search" for="search"></label>
										<input type="search" id='search2' placeholder='输入订单号查询' />
									</div>
								</div>
								
							</div>
						</div>
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
					var od_type = "<?php echo ($od_type); ?>";
					if(od_type == 1){
						$("#my_order").click();
					}

					$(".item-content.item-link").each(function(index) {
						// console.log('input %d is:%o',index,this);

						$(this).click(function() {
							switch(index) {
								case 0:
									window.location.href = "<?php echo U('./'.C('MODULE_NAME').'/Orders/index/od_state/0');?>";
									break;
								case 1:
									window.location.href = "<?php echo U('./'.C('MODULE_NAME').'/Orders/index/od_state/1');?>";
									break;
								case 2:
									window.location.href = "<?php echo U('./'.C('MODULE_NAME').'/Orders/index/od_state/3');?>";
									break;
								case 3:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/index/od_state/8');?>";
									break;
								case 4:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/index/od_state/9');?>";
									break;
								case 5:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/0');?>";
									break;
								case 6:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/1');?>";
									break;
								case 7:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/3');?>";
									break;
								case 8:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/8');?>";
									break;
								case 9:
									window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/od_state/9');?>";
									break;
								default:

									break;

							}
						});
					});


			$('#fw_search').click(function()
			{
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Query');?>";
			});
			
		    $('#searchorder1').click(function() {
				var keyword=$("#search").val();
				
				if (keyword =="" || undefined || null){
				}else{
					window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/index/keyword');?>/"+keyword;
				}
			});
			
			$('#searchorder2').click(function() {
				var keyword=$("#search2").val();
				
				if (keyword =="" ||undefined || null){
				}else{
					window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders/keyword');?>/"+keyword;
				}
			});

		});
	</script>

</html>