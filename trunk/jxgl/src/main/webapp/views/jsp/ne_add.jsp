<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../css/all.css" rel="stylesheet" type="text/css">
<link href="../../css/forms.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="history-item">
<div class="title">添加</div>
<div class="history-item-content">	
<form action="#" name="addForm" method="post">
<table class="formTable">
  <tr>
  	<td class="label">网元名称<span class="red">*</span></td>
	<td><input name="text" type="text" class="text required"></td>
        <td class="label">网元类别<span class="red">*</span></td>
	<td>
	    <select class="select">
	      <option>请选择</option>
	      <option>BELL LSTP</option>
          <option>端局华为软交换</option>
	      <option>G9关口局</option>
          <option>智能网</option>
          <option>彩铃</option>
          <option>端局</option>
          <option>G6关口局</option>
          <option>华为软交换</option>
          <option>华为STP</option>
          <option>BELL HSTP</option>
          <option>西门子汇接局</option>
	    </select></td>
  </tr>
  <tr>
    <td class="label">厂商<span class="red">*</span></td>
    <td ><select name="select" class="select">
		<option>请选择厂商</option>
		<option value="1">西门子</option>
		<option value="2">BELL</option>
		<option value="3">华为</option>
		<option value="4">NOKIA</option>
		<option value="21">AIP厂家</option>
		<option value="6">彩铃厂商</option>
		<option value="42">思科</option>
    </select></td>
    <td class="label">所属机房<span class="red">*</span></td>
    <td ><select name="select2" class="select">
        <option>请选择</option>
        <option value="562">安阳市黄河路机房</option>
		<option value="46">许昌许扶路5502局3楼</option>
		<option value="45">开封宋城路1号生产楼5楼</option>
		<option value="44">李万机房</option>
		<option value="43">新乡平原路398号移动大楼10楼</option>
		<option value="42">东风路机房</option>
      </select>
    </td>
  </tr>
  <tr>
    <td class="label">信令点编码</td>
    <td ><input name="text2" type="text" class="text" title="多个信令点编码中间请用斜杠'/'隔开"></td>
    <td class="label">设备型号</td>
    <td><input name="text2" type="text" class="text"></td>
    </tr>
  <tr>
    <td class="label">使用状态<span class="red">*</span></td>
    <td ><select name="select2" class="select">
        <option>正常</option>
        <option>故障</option>
        <option>工程</option>
        <option>割接</option>
        <option>退网</option>
      </select></td>
    <td class="label">网管网元名称</td>
    <td><input name="text2" type="text" class="text"></td>
    </tr>    
   <tr>
    <td class="label">网元编码</td>
    <td ><input type="text" class="text"/></td>
    <td class="label">软件版本信息</td>
    <td><input name="text2" type="text" class="text"></td>
    </tr>    
   <tr>
    <td class="label">工程期数</td>
    <td><select class="select">
    <option>请选择</option>
	</select></td>
    <td class="label">所属运营商</td>
    <td><select class="select">
    	<option>中国移动</option>
    </select></td>
    </tr>    
    <tr>
    <td class="label">是否内部网元<span class="red">*</span></td>
    <td><select class="select">
    <option>是</option>
    <option>否</option>
	</select></td>
    <td class="label">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>   
    <tr>
    <td class="label">备注</td>
    <td colspan="3" ><textarea class="textarea max"></textarea></td>
    </tr>
</table>

<br><br>
<div align="center">
<input type="submit" value="提 交" class="button_tt">
<input type="reset" value="重 置" class="button_tt">
<input type="button" value="返 回" class="button_tt" onClick="history.go(-1);">
  </div>
</form>
</div></div>
</body>
</html>

