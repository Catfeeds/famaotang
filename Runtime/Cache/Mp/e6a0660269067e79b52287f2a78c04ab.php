<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>余额明细</title>
<link rel="stylesheet" type="text/css" href="/Public/mp/css/style.css" />
<script type="text/javascript" src="/Public/mp/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Public/mp/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="/Public/mp/js/themes/icon.css">
<script type="text/javascript" src="/Public/mp/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Public/mp/js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" >
$(document).ready(function() {
   $("#begintime").datebox("setValue", "<?php echo ($begintime); ?>"); 
   $("#endtime").datebox("setValue", "<?php echo ($endtime); ?>"); 
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
<div class="nav_l"><a href="<?php echo U('Mp/Index/index');?>">首页</a>　&gt;　<A href="#">余额明细</A></div>
<div class="nav_r"><?php if($back == '1' ): ?><a href="<?php echo U('Mp/Fanli/index');?>" >&lt;&lt; 返 回</a><?php else: ?><a href="javascript:window.history.go(-1);" >&lt;&lt; 返 回</a><?php endif; ?></div>
</div>
<div class="height10"></div>
<div>
<div style="float:left; width:30%">
</div>
<div style="float:right; width:69%; text-align:right">
<form action="<?php echo U('Mp/Capital/dlbalance');?>"   method="post" name="fmmm"  >
日期：<input    type="text" size="15" maxlength="15"  name="begintime"  class="easyui-datebox"  value=""   id="begintime"    >　到　<input    type="text" size="15" maxlength="15"  name="endtime"  class="easyui-datebox"  value=""   id="endtime"    >　　
<input    type="text" size="20" maxlength="20"  name="dlusername"  class="input"   onfocus="this.value=''"   value="<?php echo ($dlusername); ?>"   style="color:#999999"  >　
<select name="bl_type"   class="select" style="width:140px"  >
<option value="0" >资金类别</option>
<option value="1"  <?php if($bl_type == 1 ): ?>selected<?php endif; ?> >公司手动增加</option>
<option value="2"  <?php if($bl_type == 2 ): ?>selected<?php endif; ?> >公司手动减少</option>
<option value="3"  <?php if($bl_type == 3 ): ?>selected<?php endif; ?> >订单款项增减</option>
<option value="4"  <?php if($bl_type == 4 ): ?>selected<?php endif; ?> >提现款项增减</option>

</select>　

<input type="submit" name="Submit" value="查 询"  >
</form>
</div>
</div>
<div class="height10"></div>
<div class="content">
<table class="table_results" >
<thead><tr>
<th  width="13%" style="text-align:left"><span>收款代理</span></th>
<th  width="13%"  style="text-align:left" ><span>付款代理</span></th>
<th  width="10%" ><span>资金类别</span></th>
<th  width="8%" ><span>金额</span></th>
<th  width="10%" ><span>时间</span></th>
<th  width="15%"  ><span>相关订单</span></th>
<th  width="19%"  ><span>说明</span></th>
<th  width="6%"  ><span>状态</span></th>
<th  width="6%"  ><span>操作</span></th>
</tr></thead>
<tbody>
<?php if(is_array($list)): foreach($list as $key=>$item): ?><tr class="<?php echo ($key%2 == 0?'odd':'even'); ?>" >
<td class="data" style="text-align:left"  ><span><?php echo ($item["dl_name_str"]); ?></span></td>
<td class="data" style="text-align:left" ><span><?php echo ($item["dl_sendname_str"]); ?></span></td>
<td class="data"><span><?php echo ($item["bl_typestr"]); ?></span></td>
<td class="data"><span><?php echo ($item["bl_moneystr"]); ?></span></td>
<td class="data"><span><?php echo (date('Y-m-d H:i:s',$item["bl_addtime"])); ?></span></td>
<td class="data"><span><?php if(($item["bl_orderid"] != '') AND ($item["bl_orderid"] != '0') ): ?><a href="<?php echo U('Mp/Orders/orderdetail?od_id='.$item['bl_odid'].'&odbl_id='.$item['bl_odblid'].'');?>"  ><?php echo ($item["bl_orderid"]); ?></a><?php endif; ?></span></td>
<td class="data"><span><?php echo ($item["bl_remark"]); echo ($item["bl_isyfk_str"]); ?></span></td>
<td class="data"><span><?php echo ($item["bl_state_str"]); ?></span></td>
<td class="data"><span><a href="<?php echo U('Mp/Capital/balancedetail?bl_id='.$item['bl_id'].'');?>">详细</a></span></td>
</tr><?php endforeach; endif; ?>
</tbody>
</table>
<div class="height10"></div>
<table class="page" cellpadding="0" cellspacing="0"><tbody>
<tr>
<td><?php echo ($page); ?></td>
</tr></tbody></table>
<div style="float:right; line-height:4em">共 <?php echo ($pagecount); ?> 条记录　</div>
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
</body>
</html>