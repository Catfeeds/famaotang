<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <link rel="shortcut icon" href="/Public/<?php echo C('RESOURCE_ROOT_NAME');?>/static/icon_min.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no,email=no,adress=no">
        <title><?php echo ($title); ?></title>
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
                <a href="<?php echo U('./'.C('MODULE_NAME').'/Fanli');?>" class="icon icon-left pull-left" style="color:#fff"></a>
                <h1 class="title" style="color:#fff"><?php echo ($title); ?></h1>
            </header>
            <div class="content">
                <?php if($yj_type == 0): ?><div class="item-content" style="padding: .5rem;">
					     <p>当月业绩</p>
                         <p>个人业绩：<?php echo (number_format($odsum,2,'.','')); ?>元</p>
                         <p>团队业绩：<?php echo (number_format($nteamsum,2,'.','')); ?>元</p>
                    </div><?php endif; ?>
                <div class="list-block media-list" style="margin: 0.3rem 0;">
                    <ul style="background: transparent;">
                    <?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="paylist_item">
                            <div class="kl-layout-horizontally-between" style="width: 100%;margin-bottom: 0.2rem; background: #fff">
                                <div class="kl-layout-horizontally-between" style="width: 100%;">
                                    <div class="item-content item-inner">
                                        <div class="item-subtitle" style="margin: .3rem 0"><?php echo ($item["sm_rewardstr"]); ?> <span style="font-size:0.7em; font-style:normal; color:#666666">元　　<?php echo (date('Y-m-d h:i:s',$item["sm_date"])); ?></span></div>
                                        <div class="item-title"><?php echo ($item["sm_remark"]); ?></div>
                                    </div>
                                </div>
                                <span class="icon icon-right" style="margin: .3rem;"></span>
                            </div>
                      </li><?php endforeach; endif; ?>
                    </ul>
                </div>
                 <div class="kl-page" style="margin:.5rem">
                    <?php if($page != ''): echo ($page); endif; ?>
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
         var yj_type="<?php echo ($yj_type); ?>"
         var yjArray = <?php echo json_encode($list);?>;
            $('.paylist_item').each(function(index) {
                // console.log('li %d is:%o',index,this);
                if ($.isArray(yjArray)&&yjArray.length>index)
                {
                    var yjObject=yjArray[index];
                    $(this).click(function(){
                        if($.isPlainObject(yjObject))
                        {
                            window.location.href="<?php echo U('./'.C('MODULE_NAME').'/Fanli/salemonthlydetail');?>/"+"sm_id/"+yjObject['sm_id']+"/yj_type/"+yj_type;
                        }
                    }); 
                }
            });
    });
    </script>   
</html>