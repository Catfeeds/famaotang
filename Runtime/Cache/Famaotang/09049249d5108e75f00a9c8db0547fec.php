<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no,email=no,adress=no">
		<title>
			<?php echo ($title); ?></title>
		<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/iconfont.css"/>
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/sm.min.css">
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/swiper.min.css"/>
<link rel="stylesheet" type="text/css" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/css/demo.css"/>


		<style type="text/css">
		iframe{ width:100%}
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
				<a href="#" onClick="self.location=document.referrer;" class="icon icon-left pull-left" style="color:#fff"></a>
				<h1 class="title" style="color:#fff"><?php echo ($title); ?></h1>
			</header>
			<div class="content">
				<div class="card demo-card-header-pic" style="padding:0; margin:0">
                    <?php if($newsinfo["news_pic_str"] != ''): ?><div valign="bottom" class="card-header color-white no-border no-padding">
						<?php echo ($newsinfo["news_pic_str"]); ?>
					</div><?php endif; ?>
					<div class="card-content">
						<div class="card-content-inner"  id="ndesc" style="padding:0.3rem"  >
						    <p  style="font-weight:bold"><?php echo ($newsinfo["news_title"]); ?></p>
							<p class="color-gray" style="font-size:0.6rem; padding-bottom:0.6rem" >发表于<?php echo (date('Y-m-d H:i:s',$newsinfo["news_addtime"])); ?></p>
							<p><?php echo ($newsinfo["news_content"]); ?></p>
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

		});
		
		
	window.onload = window.onresize = function () {
		resizeIframe();
	}
	var resizeIframe=function(){
		var bodyw=document.body.clientWidth;
		for(var ilength=0;ilength<=document.getElementsByTagName("iframe").length;ilength++){
	
			document.getElementsByTagName("iframe")[ilength].height = bodyw*3/4;//设定高度
	
		}
	}
	</script>

</html>