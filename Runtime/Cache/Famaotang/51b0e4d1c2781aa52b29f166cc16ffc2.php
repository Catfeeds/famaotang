<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>发茂堂</title>
		<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/weui.min.css" />
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

			
			.swiper-pagination-bullet-active {
				opacity: 1;
				background: #ee8416;
			}
			
			.content-padded-notice {
				margin: 0.1rem .3rem .3rem .3rem;
				background: #fff;
				padding: .3rem;
			}
			
			.swiper-container2 {
				width: auto;
				height: 1rem;
				overflow: hidden;
			}
			
			.swiper-slide {
				font-size: 0.5rem;
			}
			
			.weui-grid {
				width: 25%;
				background: #FFF;
				padding: 0.5rem;
			}
			
			.weui-grid__icon {
				width: auto;
				height: 2rem;
				text-align: center;
			}
			
			.card-content-inner {
				padding: .75rem;
				position: relative;
				margin: 0;
			}
			
			.list-block {
				margin: .15rem 0;
				font-size: .85rem;
			}
			
			.list-block.media-list {
				margin: 0;
				padding: 0;
			}
			
			.list-block .item-content1 {
				margin-top: .15rem;
				box-sizing: border-box;
				padding-left: 0rem;
				padding-right: .5rem;
				min-height: 4rem;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-pack: justify;
				-webkit-justify-content: space-between;
				justify-content: space-between;
				/*-webkit-box-align: center;*/
				/*-webkit-align-items: center;*/
				/*align-items: center;*/
			}
			
			.list-block.media-list .item-media1 {
				padding-top: 0rem;
				padding-bottom: 0rem;
			}
			
			.list-block.media-list .item-media2 {
				padding: .5rem;
			}
			
			.list-block.media-list .item-inner {
				padding: .5rem 0 .5rem 0;
			}
			
			.list-block .item-title {
				min-height: 2.2rem;
				color: #7e7e7e;
			}
			
			.card-footer2 {
				position: relative;
				box-sizing: border-box;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-pack: justify;
				-webkit-justify-content: space-between;
				justify-content: space-between;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
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
						<a class="tab-item active" href="#">
							<i class="iconfont active icon-shouye-copy-copy-copy-copy"></i>
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
						<a class="tab-item" href="<?php echo U('./'.C('MODULE_NAME').'/Orders/home');?>">
							<i class="iconfont icon-icon"></i>
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
				<!-- Slider -->
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<?php if($adlist|count > 0): if(is_array($adlist)): foreach($adlist as $key=>$item): if($item["ad_url"] == '' ): ?><div class="swiper-slide"><img style="width:100%;height:100%" src="/Public/uploads/mobi/<?php echo ($item["ad_pic"]); ?>" alt=""></div>
								<?php else: ?>
								<a href="<?php echo ($item["ad_url"]); ?>">
									<div class="swiper-slide"><img style="width:100%;height:100%" src="/Public/uploads/mobi/<?php echo ($item["ad_pic"]); ?>" alt=""></div>
								</a><?php endif; endforeach; endif; ?>
						<?php else: ?>
							<div class="swiper-slide"><img style="width:100%;height:100%" src="/Public/uploads/mobi/<?php echo ($item["ad_pic"]); ?>"  onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/default_pic.jpg'" alt=""></div><?php endif; ?>
					</div>
					<div class="swiper-pagination"></div>
				</div>
				<!-- searchbar -->
				<!--<div class="bar1 bar-header-secondary">
					<div class="searchbar">
						<a class="searchbar-cancel">搜索</a>
						<div class="search-input">
							<label class="icon icon-search" for="search"></label>
							<input type="search" id='search' placeholder='输入代理商微信号或手机号查询'/>
						</div>
					</div>
				</div>-->
				<!-- notice -->
				<div class="content-padded-notice">
					<span class="iconfont icon-gonggao" style="font-size:0.8rem;float:left;"></span>
					<div class="swiper-container2">
						<div class="swiper-wrapper">
							<?php if(is_array($gonggao)): foreach($gonggao as $key=>$item): ?><div class="swiper-slide" style="padding: 0.2rem;"><?php echo ($item["news_title"]); ?></div><?php endforeach; endif; ?>
						</div>
					</div>
				</div>
				<!-- grid -->
				<div class="weui-grids">
					<a href="<?php echo U('./'.C('MODULE_NAME').'/about');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-qiyejianjie" style="font-size:1.7rem; color:#006db8"></i>
						</div>
						<p class="weui-grid__label">公司简介</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/Zhengce');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-zuixinzhengce" style="font-size:1.7rem; color:#1295d9"></i>
						</div>
						<p class="weui-grid__label">代理政策</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/Wenda');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-yiwen-" style="font-size:1.7rem; color:#04d0c4"></i>
						</div>
						<p class="weui-grid__label">产品问答</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/Orders/dlorders?od_state=1');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-saoyisao1" style="font-size:1.7rem; color:#79d336"></i>
						</div>
						<p class="weui-grid__label">扫码发货</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/Product/index/back/1');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-chanpinzhongxin" style="font-size:1.7rem; color:#f08519"></i>
						</div>
						<p class="weui-grid__label">产品中心</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/News/huodong/news_type/9');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-peixun" style="font-size:1.5rem; color:#35b594"></i>
						</div>
						<p class="weui-grid__label">知识库</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/News/huodong/news_type/4');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-pyq" style="font-size:1.7rem; color:#79d336"></i>
						</div>
						<p class="weui-grid__label">传播素材</p>
					</a>
					<a href="<?php echo U('./'.C('MODULE_NAME').'/Agent');?>" class="weui-grid">
						<div class="weui-grid__icon">
							<i class="iconfont icon-beichaxun" style="font-size:1.7rem; color:#35b594"></i>
						</div>
						<p class="weui-grid__label">代理查询</p>
					</a>
				</div>
				<!-- sendshow -->
				<?php if(is_array($datamjx)): foreach($datamjx as $key=>$item): ?><div class="list-block media-list">
					<ul>
						<li>
							<div class="item-content1">
								<div class="item-media1"><img src="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/send_show.png" style="width:2.5rem;height:2.5rem;"></div>
								<div class="item-inner">
									<div class="item-subtitle"><?php echo ($item["news_title"]); ?></div>
									<div class="item-title-row">
										<div class="item-text" style="min-height:2rem;"><?php echo ($item["news_content_s"]); ?></div>
									</div>
									<div class="card-footer2">
										<span style="color: #f08519"></span>
										<span style="color:#c1c1c1;font-size:0.5rem;"><?php echo (date('Y-m-d',$item["news_addtime"])); ?></span>
									</div>
								</div>
								<div class="item-media2"><img src="<?php echo ($item["news_pic_str"]); ?>" style='width:4rem;height:3rem' onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/logo_icon.png'"></div>
							</div>
						</li>
					</ul>
				</div><?php endforeach; endif; ?>
				<!-- pie chart -->
				<div class="buttons-tab">
					<a href="#tab1" class="tab-link active button">
						<div style="color:#d91e06;padding: .2rem;font-size:.7rem;line-height:.7rem;"><?php echo ($dlallcount); ?>人</div>
						<div style="padding-bottom:.2rem;font-size: .3rem;line-height:.5rem;">全部代理（正常）</div>
					</a>
					<a href="#tab2" class="tab-link button">
						<div style="color:#d91e06;padding: .2rem;font-size:.7rem;line-height:.7rem;"><?php echo (count($prolist)); ?>单</div>
						<div style="padding-bottom:.2rem;font-size: .3rem;line-height:.5rem;">新订单</div>
					</a>
					<a href="#tab3" class="tab-link button">
						<div style="color:#d91e06;padding: .2rem;font-size:.7rem;line-height:.7rem;"><?php echo (count($dllist)); ?>人</div>
						<div style="padding-bottom:.2rem;font-size: .3rem;line-height:.5rem;">新代理</div>
					</a>
				</div>
				<div class="content-block">
					<div class="tabs">
						<div id="tab1" class="tab active">
							<div class="content-block" style="min-height: 10rem;">
								<div id="main_chart" style="width:100%;height:10rem;padding:1rem"></div>
							</div>
						</div>
						<div id="tab2" class="tab">
							<div class="content-block" style="min-height: 10rem;">
								<div class="list-block media-list">
									<ul>
										<?php if(is_array($prolist)): foreach($prolist as $key=>$item): ?><li>
													<div class="order-list all_odlist" style="border-bottom:.2rem solid #EFEFF4;">
														<div class="order-number">
															<span>订单号：<?php echo ($item["od_orderid"]); ?></span>
															<span style="color: #f08519"><?php echo ($item["od_state_str"]); ?></span>
														</div>
														<?php if(is_array($item['orderdetail'])): foreach($item['orderdetail'] as $key2=>$item2): ?><div class="order-content" style="padding-bottom: 0.5rem">
																<div class="item-media"><img src="/Public/uploads/mobi/<?php echo ($item2["oddt_propic"]); ?>" style="width:3.5rem;" onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/logo_icon.png'"></div>
																<div class="order-inner">
																	<div class="item-subtitle" style="font-size: 0.5rem">
																		<?php echo ($item2["oddt_proname"]); ?>
																	</div>
																	<div class="order-remark">
																		<div class="kl-layout-horizontally-between">
																			<div>
																				<div class="pro_name" style="color: red;">￥<span style="font-size:.75rem"><?php echo (number_format($item2["oddt_dlprice"],2,'.','')); ?></span>
																					<?php if($item2["oddt_price"] > 0): ?><span style="padding-right:.2rem; text-decoration:line-through;color:#c1c1c1">￥<?php echo (number_format($item2["oddt_price"],2,'.','')); ?></span><?php endif; ?>
																				</div>
																				<div class="pro_name">订购：
																					<?php echo ($item2["oddt_qty"]); ?>
																						<?php echo ($item2["oddt_prounits"]); ?>
																							<?php echo ($item2["oddt_totalqty"]); ?>　已发：
																								<?php echo ($item2["oddt_shipqty"]); ?>
																									<?php if($item2["oddt_shipqty"] > 0): ?><i class="iconfont icon-shenqing all_recode_icon" style="font-size:1rem; color: #7e7e7e;margin-left:0.25rem"></i><?php endif; ?>
																				</div>
																			</div>
																	<!-- 		<?php if(($item["od_state"] == 1 or $item["od_state"] == 2) and $item["od_shipall"] != 1): ?><i class="iconfont icon-saomiao all_odsaomian" style="font-size: 2rem;color: #167abe;"></i><?php endif; ?> -->
																		</div>
																	</div>
																	<div class="order-type">
																		<?php if($item2["oddt_color"] != '' ): ?>颜色：
																			<?php echo ($item2["oddt_color"]); ?>
																				<?php echo ($item2["oddt_size"]); endif; ?>
																	</div>
																</div>
															</div><?php endforeach; endif; ?>
														<div class="order-number">
															<span><?php echo (date('Y-m-d h:i:s',$item["od_addtime"])); ?></span>
															<span style="color:#000">共<span style="color: red"> <?php echo ($item["odtotalqty"]); ?> </span>件商品，合计：<span style="color:#000">￥<?php echo (number_format($item["od_total"],2,'.','')); ?></span></span>
														</div>
														<div class="order-bottom">
															<div class="order-button-type">
																<?php if($item["od_state"] < 2): ?><a href="#" class="button button-light button-round order-button" id="all_odcancel" style="color:#ccc;margin-left:.5rem;">取消</a><?php endif; ?>
																<?php if($item["od_state"] == 0): ?><a href="#" class="button button-warning button-round order-button" id="all_odqueren" style="margin-left:.5rem;">确认</a><?php endif; ?>
																<a href="#" class="button button-warning button-round order-button" id="all_oddetail">详情</a>
															</div>
														</div>
													</div>
												</li><?php endforeach; endif; ?>
									</ul>
								</div>
							</div>
						</div>
						<div id="tab3" class="tab">
							<div class="content-block" style="min-height: 10rem;">
								<div class="list-block media-list" style="line-height:1rem;">
									<ul>
										<?php if(is_array($dllist)): foreach($dllist as $key=>$item): ?><li>
												<a href="<?php echo U('./'.C('MODULE_NAME').'/Dealer/applylist/ls_status/0');?>" class="item-link item-content">
													<div class="item-media"><img class="kl-circle kl-img-thumbnail" src="/Public/uploads/mobi/<?php echo ($item["dl_wxheadimg"]); ?>" style="width:2rem; border-radius: 50%;" onerror="this.src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/head_icon.png'"></div>
													<div class="item-inner">
														<div class="item-subtitle between-horizontally">
															<span style="color:#7e7e7e"><h1><?php echo ($item["dl_name"]); ?></h1></span><span style="color:#c1c1c1"><?php echo (date('Y-m-d',$item["dl_addtime"])); ?></span></div>
														<div class="item-title" style="color:#c1c1c1">申请加入<span style="color:red"><?php echo ($item["dlt_name"]); ?></span>代理团队</div>
													</div>
												</a>
											</li><?php endforeach; endif; ?>
									</ul>
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


	<script type='text/javascript' src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/swiper.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/js/echarts.min.js' charset='utf-8'></script>
	<script type="text/javascript">
		$.init();
		$(function() {
			var swiper = new Swiper('.swiper-container', {
				spaceBetween: 0,
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
					type: 'bullets',
				},
				// autoplay: {
				// 	delay:3000,
				// },
			});

			var swiper2 = new Swiper('.swiper-container2', {
				spaceBetween: 10,
				direction: 'vertical',
				autoplay: {
					delay: 3000,
				},
			});

			var mjxArray = <?php echo json_encode($datamjx);?>;
            $('.item-content1').each(function(index) {
                // console.log('li %d is:%o',index,this);
                if ($.isArray(mjxArray)&&mjxArray.length>index)
                {
                    var mjxObject=mjxArray[index];
                    $(this).click(function(){
                        if($.isPlainObject(mjxObject))
                        {
                            window.location.href="<?php echo U('./'.C('MODULE_NAME').'/News/huodong');?>/"+"news_type/2";
                        }
                    }); 
                }
            });

            $('#fw_search').click(function()
			{
				window.location.href= "<?php echo U('./'.C('MODULE_NAME').'/Query');?>";
			});


			$('.swiper-container2').click(function()
			{
				location.href = "<?php echo U('./'.C('MODULE_NAME').'/News');?>";
			});

			$('.searchbar-cancel').click(function() {
				var keyword=$("#search").val();
				if (!isEmpty(keyword))
				{
					 // window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Product/index/keyword');?>/"+keyword;
					  window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Agent/index/keyword');?>/"+keyword;
				}
			});

			//回车提交事件
       	 	$("body").keydown(function() {
             if (event.keyCode == "13") {//keyCode=13是回车键
                 $('.searchbar-cancel').click();
            	}
        	});

       	 	var allDlArrs=<?php echo json_encode($dlalllist);?>;

       	 	// console.log(JSON.stringify(allDlArrs));
       	 	var dlnArrs=[];
       	 	if($.isArray(allDlArrs)&&allDlArrs.length>0){
				allDlArrs.forEach(function(val,index) {
					dlnArrs.push(allDlArrs[index]['name']);
				});
			}
			// console.log(JSON.stringify(dlnArrs));

			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main_chart'));

			// 指定图表的配置项和数据
			var option = {
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b}: {c} ({d}%)"
				},
				legend: {
					orient: 'vertical',
					x: 'left',
					data: dlnArrs,
					bottom: 10
				},
				series: [{
					name: '级别',
					type: 'pie',
					radius: ['40%', '70%'],
					avoidLabelOverlap: false,
					label: {
						normal: {
							show: false,
							position: 'center'
						},
						emphasis: {
							show: true,
							textStyle: {
								fontSize: '15',
								fontWeight: 'bold'
							}
						}
					},
					labelLine: {
						normal: {
							show: false
						}
					},
					data:allDlArrs
				}],
				itemStyle: {
					normal: {
						color: function(params) {
							// build a color map as your need.
							var colorList = [
								'#C1232B', '#B5C334', '#FCCE10', '#E87C25', '#27727B',
								'#FE8463', '#9BCA63', '#FAD860', '#F3A43B', '#60C0DD',
								'#D7504B', '#C6E579', '#F4E001', '#F0805A', '#26C0C0'
							];
							return colorList[params.dataIndex]
						}
					}
				}
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);


		});
	</script>

</html>