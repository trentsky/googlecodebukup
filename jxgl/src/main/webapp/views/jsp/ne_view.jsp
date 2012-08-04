<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="../../css/all.css" rel="stylesheet" type="text/css">
<link href="../../css/forms.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="history-item">
<div class="title">查看</div>
<div class="history-item-content">	
<form action="#" name="addForm" method="post">
<table class="listTable">
  <tr>
  	<td class="label">网元名称</td>
	<td>ZZA1</td>
        <td class="label">网元类别</td>
	<td>西门子汇接局</td>
  </tr>
  <tr>
    <td class="label">厂商</td>
    <td>西门子</td>
    <td class="label">所属机房</td>
    <td>郑州北环生产楼7楼</td>
  </tr>
  <tr>
    <td class="label">信令点编码</td>
    <td>10FE01</td>
    <td class="label">设备型号</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td class="label">使用状态</td>
    <td>正常</td>
    <td class="label">网管网元名称</td>
    <td>&nbsp;</td>
    </tr>    
   <tr>
    <td class="label">网元编码</td>
    <td >&nbsp;</td>
    <td class="label">软件版本信息</td>
    <td>&nbsp;</td>
   </tr>    
   <tr>
    <td class="label">工程期数</td>
    <td>&nbsp;</td>
    <td class="label">所属运营商</td>
    <td>中国移动</td>
    </tr>    
    <tr>
    <td class="label">是否内部网元</td>
    <td>是</td>
    <td class="label">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    <td class="label">备注</td>
    <td colspan="3" >&nbsp;</td>
    </tr>
</table>

<br><br>
<div align="center"><input type="button" value="返 回" class="button_tt" onClick="history.go(-1);">
  </div>
</form>
</div></div>
</body>
</html>
