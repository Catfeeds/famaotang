<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经销商管理</title>
<link rel="stylesheet" type="text/css" href="/Public/mp/css/style.css" />
<script type="text/javascript" src="/Public/mp/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Public/mp/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/Public/mp/js/themes/icon.css">
<script type="text/javascript" src="/Public/mp/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Public/mp/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" >
$(document).ready(function() {
   $("#begintime").datebox("setValue", "<?php echo ($begintime); ?>"); 
  });
</script>

</head>
<body>
<div class="header">
<div class="bound">
<div class="logo">
<?php if(!empty($qypic)): ?><img src="/Public/uploads/product/<?php echo ($qypic); ?>"  height="40" style="vertical-align:middle" />
<?php else: ?> 
<!--<img src="/Public/mp/static/logo0.png"  height="40" style="vertical-align:middle" />-->
    <div style="font-size: 18px;padding-top: 10px">代理商管理系统</div><?php endif; ?>
</div>
<div class="topright">您好,<?php echo ($qyuser); ?>　<a href="<?php echo U('Mp/Login/quit');?>" style="color:#fff;" >退出系统</a> </div>
</div>
</div>
<div class="main" >
<div class="bound" >
<div class="leftmenu">
<div class="menu_list">
<div class="menu_top">
<div  style="line-height:51px; height:51px;"><img src="/Public/mp/static/home2.png"   style="vertical-align:middle; width:20px; height:20px; margin:0 3px 4px 10px" /> <A href="<?php echo U('Mp/Index/index');?>" style="color:#06c; font-size:14px" >首页</A></div>
</div>  
<?php if(($qypurview["10000"]) == "10000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu01"  onClick="nemuclose('#zi01',this)" >基本资料</ul>
	<ul class="menu_son" id="zi01" >
	<?php if(($qypurview["10001"]) == "10001"): ?><li><A href="<?php echo U('Mp/Dealer/index');?>"   class="<?php echo ($curr =='dealer_list' ?'curr':''); ?>" >经销商管理</A></li><?php endif; ?>
	<?php if(($qypurview["20001"]) == "20001"): ?><li><A href="<?php echo U('Mp/Product/index');?>"  class="<?php echo ($curr =='pro_list' ?'curr':''); ?>" >产品管理</A></li><?php endif; ?>	
	<?php if(($qypurview["20005"]) == "20005"): ?><li><A href="<?php echo U('Mp/Product/proprice');?>"  class="<?php echo ($curr =='pro_price' ?'curr':''); ?>" >价格体系</A></li><?php endif; ?>
	<?php if(($qypurview["11001"]) == "11001"): ?><li><A href="<?php echo U('Mp/Warehouse/index');?>"  class="<?php echo ($curr =='warehouse_list' ?'curr':''); ?>" >仓库管理</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>

<?php if(($qypurview["30000"]) == "30000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu07" onClick="nemuclose('#zi07',this)" >出货管理</ul>
	<ul class="menu_son" id="zi07">
	<?php if(($qypurview["30001"]) == "30001"): ?><li><A href="<?php echo U('Mp/Shipment/index');?>" class="<?php echo ($curr =='shipment_list' ?'curr':''); ?>">总公司出货</A></li><?php endif; ?>	
	<?php if(($qypurview["90004"]) == "90004"): ?><li><A href="<?php echo U('Mp/Shipment/dlshiplist');?>" class="<?php echo ($curr =='dealer_shiplist' ?'curr':''); ?>">经销商出货</A></li><?php endif; ?>	
	<?php if(($qypurview["30007"]) == "30007"): ?><li><A href="<?php echo U('Mp/Tongji/index');?>" class="<?php echo ($curr =='tongji_list' ?'curr':''); ?>">出货统计</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>  

<?php if(($qypurview["13000"]) == "13000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu13" onClick="nemuclose('#zi13',this)" >订单管理</ul>
	<ul class="menu_son" id="zi13">
	<?php if(($qypurview["13001"]) == "13001"): ?><li><A href="<?php echo U('Mp/Orders/cporders');?>" class="<?php echo ($curr =='cporders' ?'curr':''); ?>" >公司订单</A></li><?php endif; ?>
	<?php if(($qypurview["13002"]) == "13002"): ?><li><A href="<?php echo U('Mp/Orders/index');?>" class="<?php echo ($curr =='orders_list' ?'curr':''); ?>" >所有订单</A></li><?php endif; ?>
	<?php if(($qypurview["13005"]) == "13005"): ?><li><A href="<?php echo U('Mp/Orders/dlordersum');?>" class="<?php echo ($curr =='dlordersum' ?'curr':''); ?>" >代理业绩</A></li><?php endif; ?>
	<?php if(($qypurview["13003"]) == "13003"): ?><li><A href="<?php echo U('Mp/Orders/addresslist');?>" class="<?php echo ($curr =='address' ?'curr':''); ?>" >发货地址</A></li><?php endif; ?>
	<?php if(($qypurview["13006"]) == "13006"): ?><li><A href="<?php echo U('Mp/Returnable/index');?>" class="<?php echo ($curr =='returnable' ?'curr':''); ?>" >公司退换货</A></li><?php endif; ?>
	<?php if(($qypurview["13006"]) == "13006"): ?><li><A href="<?php echo U('Mp/Returnable/dlreturn');?>" class="<?php echo ($curr =='dlreturn' ?'curr':''); ?>" >代理退换货</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>  

<?php if(($qypurview["14000"]) == "14000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu14" onClick="nemuclose('#zi14',this)" >返利管理</ul>
	<ul class="menu_son" id="zi14">
	<?php if(($qypurview["14001"]) == "14001"): ?><li><A href="<?php echo U('Mp/Fanli/index');?>" class="<?php echo ($curr =='fanlidllist' ?'curr':''); ?>" >代理返利</A></li><?php endif; ?>
	<?php if(($qypurview["14002"]) == "14002"): ?><li><A href="<?php echo U('Mp/Fanli/fanlilist');?>" class="<?php echo ($curr =='fanlilist' ?'curr':''); ?>" >返利明细</A></li><?php endif; ?>
	<?php if(($qypurview["14003"]) == "14003"): ?><li><A href="<?php echo U('Mp/Fanli/paylist');?>" class="<?php echo ($curr =='paylist' ?'curr':''); ?>" >我应付返利</A></li><?php endif; ?>
	<?php if(($qypurview["14003"]) == "14003"): ?><li><A href="<?php echo U('Mp/Fanli/recashlist');?>" class="<?php echo ($curr =='recashlist' ?'curr':''); ?>" >提现记录</A></li><?php endif; ?>
	<?php if(($qypurview["14005"]) == "14005"): ?><li><A href="<?php echo U('Mp/Fanli/salemonthly');?>" class="<?php echo ($curr =='salemonthly' ?'curr':''); ?>" >月度销售奖</A></li><?php endif; ?>
	<?php if(($qypurview["14006"]) == "14006"): ?><li><A href="<?php echo U('Mp/Fanli/saleyear');?>" class="<?php echo ($curr =='saleyear' ?'curr':''); ?>" >年度销售奖</A></li><?php endif; ?>
	<?php if(($qypurview["14004"]) == "14004"): ?><li><A href="<?php echo U('Mp/Fanli/salesreward');?>" class="<?php echo ($curr =='salesreward' ?'curr':''); ?>" >销售累计奖</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>

<?php if(($qypurview["18000"]) == "18000"): ?><div class="menu_parent">

	<ul class="menu_sontitle" id="fu18" onClick="nemuclose('#zi18',this)" >资金管理</ul>
	<ul class="menu_son" id="zi18">

	<?php if(($qypurview["18001"]) == "18001"): ?><li><A href="<?php echo U('Mp/Capital/index');?>" class="<?php echo ($curr =='capital' ?'curr':''); ?>" >代理资金</A></li><?php endif; ?>
	<?php if(($qypurview["18002"]) == "18002"): ?><li><A href="<?php echo U('Mp/Capital/yufukuan');?>" class="<?php echo ($curr =='yufukuan' ?'curr':''); ?>" >预付款明细</A></li>

	<eq name="qypurview.18004" value="18004">	
	    <li><A href="<?php echo U('Mp/Capital/dlbalance');?>" class="<?php echo ($curr =='dlbalance' ?'curr':''); ?>" >余额明细</A></li><?php endif; ?>
	
<!--	<?php if(($qypurview["18006"]) == "18006"): ?><li><A href="<?php echo U('Mp/Capital/recashlist');?>" class="<?php echo ($curr =='recashlist2' ?'curr':''); ?>" >提现记录</A></li><?php endif; ?>-->
	
	<?php if(($qypurview["18007"]) == "18007"): ?><li><A href="<?php echo U('Mp/Capital/payinlist');?>" class="<?php echo ($curr =='payinlist' ?'curr':''); ?>" >充值记录</A></li><?php endif; ?>
	</ul>
	
</div><?php endif; ?>

<?php if(($qypurview["15000"]) == "15000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu15" onClick="nemuclose('#zi15',this)" >积分管理</ul>
	<ul class="menu_son" id="zi15">
	<?php if(($qypurview["15001"]) == "15001"): ?><li><A href="<?php echo U('Mp/Dljf/index');?>" class="<?php echo ($curr =='dljflist' ?'curr':''); ?>" >代理积分</A></li><?php endif; ?>
	<?php if(($qypurview["15001"]) == "15001"): ?><li><A href="<?php echo U('Mp/Dljf/dljflist');?>" class="<?php echo ($curr =='dljdetail' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>
	<?php if(($qypurview["15002"]) == "15002"): ?><li><A href="<?php echo U('Mp/Dljf/dljfexch');?>" class="<?php echo ($curr =='dljfexch' ?'curr':''); ?>" >兑换管理</A></li><?php endif; ?>
	<?php if(($qypurview["15003"]) == "15003"): ?><li><A href="<?php echo U('Mp/Dljf/dljfgift');?>" class="<?php echo ($curr =='dljfgift' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>

<?php if(($qypurview["40000"]) == "40000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu02" onClick="nemuclose('#zi02',this)" >会员积分管理</ul>
	<ul class="menu_son" id="zi02">
	<?php if(($qypurview["40001"]) == "40001"): ?><li><A href="<?php echo U('Mp/Jfuser/index');?>" class="<?php echo ($curr =='jfuser_list' ?'curr':''); ?>" >会员管理</A></li><?php endif; ?>
	<?php if(($qypurview["50001"]) == "50001"): ?><li><A href="<?php echo U('Mp/Jfdetail/index');?>"  class="<?php echo ($curr =='jfdetail_list' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>	
	<?php if(($qypurview["50002"]) == "50002"): ?><li><A href="<?php echo U('Mp/Jfexchange/index');?>" class="<?php echo ($curr =='jfexchange_list' ?'curr':''); ?>">礼品兑换</A></li><?php endif; ?>	
	<?php if(($qypurview["50003"]) == "50003"): ?><li><A href="<?php echo U('Mp/Jfgift/index');?>" class="<?php echo ($curr =='jfgift_list' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>	
	</ul>
</div><?php endif; ?>	
<?php if(($qypurview["12000"]) == "12000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu12" onClick="nemuclose('#zi12',this)" >导购管理</ul>
	<ul class="menu_son" id="zi12">
	<?php if(($qypurview["12001"]) == "12001"): ?><li><A href="<?php echo U('Mp/Dguser/index');?>" class="<?php echo ($curr =='dguser_list' ?'curr':''); ?>" >导购员列表</A></li><?php endif; ?>
	<?php if(($qypurview["12006"]) == "12006"): ?><li><A href="<?php echo U('Mp/Dgjfdetail/index');?>"  class="<?php echo ($curr =='dgjfdetail_list' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>	
	<?php if(($qypurview["12007"]) == "12007"): ?><li><A href="<?php echo U('Mp/Dgjfexchange/index');?>" class="<?php echo ($curr =='dgjfexchange_list' ?'curr':''); ?>">礼品兑换</A></li><?php endif; ?>	
	<?php if(($qypurview["12008"]) == "12008"): ?><li><A href="<?php echo U('Mp/Dgjfgift/index');?>" class="<?php echo ($curr =='dgjfgift_list' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>	
	</ul>
</div><?php endif; ?>
<?php if(($qypurview["70000"]) == "70000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu04" onClick="nemuclose('#zi04',this)" >前台设置</ul>
	<ul class="menu_son" id="zi04" >
	<?php if(($qypurview["70011"]) == "70011"): ?><li><A href="<?php echo U('Mp/Jfmobi/basic/action/profile');?>" class="<?php echo ($curr =='jfmo_profile' ?'curr':''); ?>" >公司简介</A></li><?php endif; ?>
	<?php if(($qypurview["70011"]) == "70011"): ?><li><A href="<?php echo U('Mp/Jfmobi/basic/action/zhengce');?>" class="<?php echo ($curr =='jfmo_zhengce' ?'curr':''); ?>" >代理政策</A></li><?php endif; ?>
	<?php if(($qypurview["70011"]) == "70011"): ?><li><A href="<?php echo U('Mp/Jfmobi/basic/action/help');?>" class="<?php echo ($curr =='jfmo_wenda' ?'curr':''); ?>" >产品问答</A></li><?php endif; ?>
	<?php if(($qypurview["70017"]) == "70017"): ?><li><A href="<?php echo U('Mp/Jfmobi/setlogo');?>" class="<?php echo ($curr =='jfmo_logo' ?'curr':''); ?>" >Logo设置</A></li><?php endif; ?>
	<?php if(($qypurview["70019"]) == "70019"): ?><li><A href="<?php echo U('Mp/Jfmobi/setfoot');?>" class="<?php echo ($curr =='jfmo_foot' ?'curr':''); ?>" >底部图片</A></li><?php endif; ?>
	<?php if(($qypurview["70018"]) == "70018"): ?><li><A href="<?php echo U('Mp/Jfmobi/haibaolist');?>" class="<?php echo ($curr =='jfmo_haibao' ?'curr':''); ?>" >海报设置</A></li><?php endif; ?>
	<?php if(($qypurview["70006"]) == "70006"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=1');?>" class="<?php echo ($curr =='jfmo_news' ?'curr':''); ?>" >企业动态</A></li><?php endif; ?>	
	<?php if(($qypurview["70015"]) == "70015"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=4');?>" class="<?php echo ($curr =='jfmo_sucai' ?'curr':''); ?>" >传播素材</A></li><?php endif; ?>
	<?php if(($qypurview["70022"]) == "70022"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=8');?>" class="<?php echo ($curr =='jfmo_shiti' ?'curr':''); ?>" >线下实体店</A></li><?php endif; ?>
	<?php if(($qypurview["70023"]) == "70023"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=6');?>" class="<?php echo ($curr =='jfmo_peixun' ?'curr':''); ?>" >培训机构</A></li><?php endif; ?>
	<?php if(($qypurview["70013"]) == "70013"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=2');?>" class="<?php echo ($curr =='jfmo_buyer' ?'curr':''); ?>" >买家秀</A></li><?php endif; ?>
	<?php if(($qypurview["70021"]) == "70021"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=7');?>" class="<?php echo ($curr =='jfmo_huodong' ?'curr':''); ?>" >线下活动</A></li><?php endif; ?>		
	<?php if(($qypurview["70006"]) == "70006"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=9');?>" class="<?php echo ($curr =='jfmo_jingjin' ?'curr':''); ?>" >知识库</A></li><?php endif; ?>	
	
	<?php if(($qypurview["70005"]) == "70005"): ?><li><A href="<?php echo U('Mp/Jfmobi/product');?>" class="<?php echo ($curr =='jfmo_pro' ?'curr':''); ?>">产品展示</A></li><?php endif; ?>
	<?php if(($qypurview["70007"]) == "70007"): ?><li><A href="<?php echo U('Mp/Jfmobi/piclist');?>" class="<?php echo ($curr =='jfmo_pics' ?'curr':''); ?>">图片管理</A></li><?php endif; ?>	
	<?php if(($qypurview["70007"]) == "70007"): ?><li><A href="<?php echo U('Mp/Jfmobi/feedback');?>" class="<?php echo ($curr =='jfmo_feedback' ?'curr':''); ?>">留言反馈</A></li><?php endif; ?>
	<?php if(($qypurview["70014"]) == "70014"): ?><li><A href="<?php echo U('Mp/Jfmobi/feedback');?>" class="<?php echo ($curr =='jfmo_survey' ?'curr':''); ?>">调查问卷</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>
<?php if(($qypurview["80000"]) == "80000"): ?><div class="menu_parent">
	<ul class="menu_sontitle2"  id="fu05"  onClick="nemuclose('#zi05',this)" >查询</ul>
	<ul class="menu_son" id="zi05"  style="display:none"  >
	<?php if(($qypurview["80001"]) == "80001"): ?><li><A href="<?php echo U('Mp/Chaxun/fangcuan');?>" class="<?php echo ($curr =='fangcuan' ?'curr':''); ?>" >防窜货查询</A></li><?php endif; ?>
	<?php if(($qypurview["80002"]) == "80002"): ?><li><A href="<?php echo U('Mp/Chaxun/fwlist');?>"  class="<?php echo ($curr =='fwlist' ?'curr':''); ?>" >防伪码查询记录</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>
<div class="menu_parent">
	<ul class="menu_sontitle2" id="fu06" onClick="nemuclose('#zi06',this)" >系统管理</ul>
	<ul class="menu_son" id="zi06"  style="display:none" >
	<?php if(($qypurview["17001"]) == "17001"): ?><li><A href="<?php echo U('Mp/Subuser/index');?>" class="<?php echo ($curr =='subuser' ?'curr':''); ?>" >子用户管理</A></li><?php endif; ?>
		<li><A href="<?php echo U('Mp/Index/updatepwd');?>" class="<?php echo ($curr =='updatepwd' ?'curr':''); ?>">修改密码</A></li>
		<li><A href="<?php echo U('Mp/Login/quit');?>"  >退出系统</A></li>
	</ul>
</div>
</div>
<script type="text/javascript" >
function nemuclose(z,obj){
  $(z).toggle();
  if($(z).css("display")=="none"){
      $(obj).removeClass();
      $(obj).addClass("menu_sontitle2");
  }else{
      $(obj).removeClass();
      $(obj).addClass("menu_sontitle");
  }
}
</script>
</div>
<div class="rightcontent">
<div class="content_nav" >
<div class="nav_l"><a href="<?php echo U('Mp/Index/index');?>">首页</a>　&gt;　<A href="<?php echo U('Mp/Dealer/index');?>">经销商管理</A>　&gt;　<A href="#">审核/设置</A></div>
<div class="nav_r"><A href="<?php echo U('Mp/Dealer/index?dl_type='.$dl_type.'&dl_status='.$dl_status.'');?>"  ><< 返 回</A></div>
</div>
<div class="height20"></div>
<div class="content">
<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">审核/禁用经销商：</div>
<form action="<?php echo U('Mp/Dealer/active');?>"   method="post" name="fmmm" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="20"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" ></td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>)</td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前状态：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_status_str"]); ?></td>
			  </tr>
			    <tr>     
                  <td height="40"   class="txtright" >修改状态为：</td>
				  <td class="txtleft" >
				  <select name="dl_status"   class="select"  >
				  <option  value="0"  >新申请　</option>
				  <option  value="1"  >正常　</option>
				  <option  value="9"  >禁用　</option>

				  </select>  </td>
			  </tr>

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >
            </td>
			  </tr>
			</table>
</form>


<!--<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">保证金：</div>
<form action="<?php echo U('Mp/Dealer/deposit_save');?>"   method="post" name="fmmm"  enctype="multipart/form-data" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="20"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" ></td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>)</td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前保证金：</td>
				  <td class="txtleft" ><?php echo (number_format($dealerinfo["dl_deposit"],2,'.','')); ?> 元</td>
			  </tr>
			    <tr>     
                  <td height="40"   class="txtright" >修改为：</td>
				  <td class="txtleft" >
				  <input type="text" size="6" maxlength="8"  name="dl_deposit" class="input" value="" >
				  </td>
			    </tr>
				<tr>     
                  <td height="40"   class="txtright" >支付凭证：</td>
				  <td class="txtleft" >
				<?php if(($dealerinfo["dl_depositpic_str"]) != ""): ?><a href="/Public/uploads/dealer/<?php echo ($dealerinfo["dl_depositpic"]); ?>" target="_blank" ><?php echo ($dealerinfo["dl_depositpic_str"]); ?></a><?php endif; ?> <input name="pic_file" type="file" /> (建议图片大小不要超500k)  <input type="hidden"  value="<?php echo ($dealerinfo["dl_depositpic"]); ?>" name="old_depositpic" />
                  </td>
			    </tr>
			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >
            </td>
			  </tr>
			</table>
</form>-->


<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">修改经销商级别：</div>
<form action="<?php echo U('Mp/Dealer/update_dltype');?>"   method="post" name="fmmm" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="40"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" >注：修改级别时，系统会同时调整该经销商的上家，谨慎修改</td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>)</td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前级别：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_type_str"]); ?></td>
			  </tr>
			    <tr>     
                  <td height="40"   class="txtright" >修改级别为：</td>
				  <td class="txtleft" >
				  <select name="dl_type"   class="select"  >
				  <?php if(is_array($dltypelist)): foreach($dltypelist as $key=>$item): ?><option  value="<?php echo ($item["dlt_id"]); ?>"  ><?php echo ($item["dlt_name"]); ?>　</option><?php endforeach; endif; ?>
				  </select>  </td>
			  </tr>

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >
            </td>
			  </tr>
			</table>
</form>

<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">修改经销商上家：</div>
<form action="<?php echo U('Mp/Dealer/update_belong');?>"   method="post" name="fmmm" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="40"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" >注：修改上家时，请注意参考该经销商的推荐人路线,谨慎修改</td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>) </td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前上家：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_belong_name"]); ?> </td>
			  </tr>
			   <tr>     
                  <td height="40"   class="txtright" >当前推荐人：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_referee_name"]); ?></td>
			  </tr>
			    <tr>     
                  <td height="40"   class="txtright" >上家修改为：</td>
				  <td class="txtleft" >
				  <select name="belong"   class="select"  >
				  <?php if(is_array($belong_arrs)): foreach($belong_arrs as $key=>$item): ?><option   value="<?php echo ($item["id"]); ?>"  ><?php echo ($item["name"]); ?>　</option><?php endforeach; endif; ?>
				  </select>  </td>
			  </tr>
			  
			  
			   <tr>     
                  <td height="40"   class="txtright" >推荐人路线：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["referee_lines"]); ?></td>
			  </tr>

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >
            </td>
			  </tr>
			</table>
</form>


<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">修改经销商推荐人：</div>
<form action="<?php echo U('Mp/Dealer/update_referee');?>"   method="post" name="fmmm" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="40"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" >注：只允许上家为总公司的代理修改推荐人，修改推荐人后再根据该推荐路线修改上家</td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>) </td>
			  </tr>
			   <tr>     
                  <td height="40"   class="txtright" >当前上家：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_belong_name"]); ?> </td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前推荐人：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_referee_name"]); ?> </td>
			  </tr>
			    <tr>     
                  <td height="40"   class="txtright" >推荐人修改为：</td>
				  <td class="txtleft" >
				  <input type="text" size="15" maxlength="20"  name="dl_referee" class="input" value="" > 请填写推荐人的账号，0为总公司 </td>
			  </tr>
			  

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >
            </td>
			  </tr>
			</table>
</form>


<div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">修改经销商有效时间：</div>
<form action="<?php echo U('Mp/Dealer/update_date');?>"   method="post" name="fmmm" >
<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="20"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" ></td>
			  </tr>

			  <tr>     
                  <td height="40"   class="txtright" >经销商：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>) </td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >当前有效时间：</td>
				  <td class="txtleft" ><?php echo ($dealerinfo["dl_date_str"]); ?> </td>
			  </tr>
			   <tr>     
                  <td height="40"   class="txtright" >起始时间：</td>
				  <td class="txtleft" ><input   type="text" size="15" maxlength="15"   name="begintime"  class="easyui-datebox"  value=""   id="begintime"  ></td>
			  </tr>
			  
			  <tr>     
                  <td height="40"   class="txtright" >有效期：</td>
				  <td class="txtleft" >
				  <select name="addyear"   class="select"  >
				  <option  value="0" <?php if(($dltinfo["dlt_level"]) == "0"): ?>selected<?php endif; ?> >请选择年数　</option>
				  <option  value="1" <?php if(($dltinfo["dlt_level"]) == "1"): ?>selected<?php endif; ?> >1年　</option>
				  <option  value="2" <?php if(($dltinfo["dlt_level"]) == "2"): ?>selected<?php endif; ?> >2年　</option>
				  <option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >3年　</option>
				  <option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >4年　</option>
				  <option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >5年　</option>
				  <option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >99年　</option>
				  </select>  </td>
			  </tr>

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="确认修改" class="botton" >　　　
            </td>
			  </tr>
			</table>
</form>
	<?php if(($dealerinfo['dl_level20'] == 1) OR ($dealerinfo['dl_level20'] == 2) ): ?><div  style="padding:20px 0 0 0; border-bottom:solid 1px #e2e9ee;font-weight:bold; width:70%; margin:0 auto; font-size:14px">经销商区域管理设置</div>
	<form action="<?php echo U('Mp/Dealer/update_region?dl_type='.$dealerinfo['dl_type1'].'&dl_status='.$dealerinfo['dl_status'].'&dl_id='.$dealerinfo['dl_id'].'');?>"   method="post" name="fmmm" >
		<input type="hidden" value="<?php echo ($dealerinfo["dl_id"]); ?>" name="dl_id" />
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td height="20"   width="25%" class="txtright" ></td>
				<td width="75%" class="txtleft" ></td>
			</tr>

			<tr>
				<td height="40"   class="txtright" >经销商：</td>
				<td class="txtleft" ><?php echo ($dealerinfo["dl_name"]); ?> (<?php echo ($dealerinfo["dl_username"]); ?>) </td>
			</tr>
			<tr>
				<td height="40"   class="txtright" >当前级别：</td>
				<td class="txtleft" ><?php echo ($dealerinfo["dl_type_str"]); ?></td>
			</tr>
			<tr>
				<td class="txtleft" >
			<tr>
				<td height="40"  class="txtright" >地区：</td>
				<td  class="txtleft" >
					<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');" class="select"  ><select>&nbsp;&nbsp;
						<select id="seachcity" name="seachcity"  class="select" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" ><option value="0">请选择</option><select>&nbsp;&nbsp;
							<select id="seachdistrict"  class="select"  name="seachdistrict"><option value="0">请选择</option></select>
				</td>
			</tr>




			</td>
			</tr>
			<!--<tr>-->
				<!--<td height="40"   class="txtright" >当前有效时间：</td>-->
				<!--<td class="txtleft" ><?php echo ($dealerinfo["dl_date_str"]); ?> </td>-->
			<!--</tr>-->
			<!--<tr>-->
				<!--<td height="40"   class="txtright" >起始时间：</td>-->
				<!--<td class="txtleft" ><input   type="text" size="15" maxlength="15"   name="begintime"  class="easyui-datebox"  value=""   id="begintime"  ></td>-->
			<!--</tr>-->

			<!--<tr>-->
				<!--<td height="40"   class="txtright" >有效期：</td>-->
				<!--<td class="txtleft" >-->
					<!--<select name="addyear"   class="select"  >-->
						<!--<option  value="0" <?php if(($dltinfo["dlt_level"]) == "0"): ?>selected<?php endif; ?> >请选择年数　</option>-->
						<!--<option  value="1" <?php if(($dltinfo["dlt_level"]) == "1"): ?>selected<?php endif; ?> >1年　</option>-->
						<!--<option  value="2" <?php if(($dltinfo["dlt_level"]) == "2"): ?>selected<?php endif; ?> >2年　</option>-->
						<!--<option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >3年　</option>-->
						<!--<option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >4年　</option>-->
						<!--<option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >5年　</option>-->
						<!--<option  value="2" <?php if(($dltinfo["dlt_level"]) == "3"): ?>selected<?php endif; ?> >99年　</option>-->
					<!--</select>  </td>-->
			<!--</tr>-->

			<tr>  <td height="60" ></td>
				<td  class="txtleft"  >
					<input type="submit" name="Submit" value="确认修改" class="botton" ><a href="<?php echo U('Mp/Dealer/index?dl_type='.$dl_type.'&dl_status='.$dl_status.'');?>" class="botton"><< 返 回</a>
				</td>
			</tr>
		</table>
	</form><?php endif; ?>
		<div class="height20"></div>
<div class="height20"></div>
<div class="height20"></div>
</div>
<div class="height20"></div>
</div>
</div>
</div>
<div class="clear"></div>
<div class="footer">
<div class="bound">
<div class="f1"> &copy; <span id="cyear" ></span></div>
<script>var myDate = new Date();$("#cyear").html(myDate.getFullYear());</script>
</div>
</div>
<!--<script type='text/javascript' src='/Public/mp/js/sm-city-picker.min.js' charset='utf-8'></script>-->
<script type='text/javascript' src='/Public/mp/js/AreaData_min.js' charset='utf-8'></script>
<script type='text/javascript' src='/Public/mp/js/Area.js' charset='utf-8'></script>
<script type="text/javascript">
    $(function (){
        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, sub_arr, '<?php echo ($dealerinfo["dl_sheng_str"]); ?>', '<?php echo ($dealerinfo["dl_shi_str"]); ?>', '<?php echo ($dealerinfo["dl_qu_str"]); ?>');
    });



</script>
</body>
</html>