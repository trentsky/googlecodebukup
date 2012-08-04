<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="../css/all.css" rel="stylesheet" type="text/css">
<link href="../css/forms.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="history-item">
<div class="title">控制面板</div>
<div class="history-item-content">	
<table class="formTable">
<tr><td><img src="../images/welcome.gif" border="0" usemap="#Map"></td>
</tr>
</table>
</div>
</div>

<map name="Map">
<area shape="rect" coords="13,8,72,63" href="#"><area shape="rect" coords="14,134,71,191" href="#">
<area shape="rect" coords="12,262,72,319" href="#"><area shape="rect" coords="324,7,382,62" href="#">
<area shape="rect" coords="324,134,381,190" href="#"><area shape="rect" coords="96,37,170,50" href="../html/zyzs/jhzy/circuit/circuit_query.html">
<area shape="rect" coords="96,166,169,180" href="../html/zyzs/jhzy/coresite/core_site_frame.html"><area shape="rect" coords="96,298,169,310" href="../html/zyzs/jhzy/jifang/jifang_frame.html">
<area shape="rect" coords="396,36,492,48" href="#"><area shape="rect" coords="403,166,474,180" href="#">
</map></body>
</html>
