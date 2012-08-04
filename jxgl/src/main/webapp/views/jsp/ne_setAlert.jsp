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
<div class="title">设置预警</div>
<div class="history-item-title">&nbsp;</div>
<div class="history-item-content">	
<form action="#" name="fm" method="post">
<table class="formTable">
  <tr>
  	<td class="label">网元名称</td>
	<td>ZZA1<br></td>
    <td class="label">端口占有率<br></td>
    <td><input type="text" name="text" class="text" value="80.0"></td>
  </tr>
</table>

<br><br>
<div align="center">
	<input type="submit" value="提 交" class="button_tt">
	<input type="reset" value="重 置" class="button_tt">
	<input type="button" value="返 回" class="button_tt" onClick="history.go(-1);">
</div>

</div></div>
</form>
</body>
</html>
