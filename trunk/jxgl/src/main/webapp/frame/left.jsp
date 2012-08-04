<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link href="../css/frame.css" rel="stylesheet" type="text/css">
</head>

<frameset cols="*,10" frameborder="no" border="0"  name="viewArea"  framespacing="0">
  <frame src="menu1.jsp" name="menuFrame" id="mainFrame" />
  <frame src="side.jsp" name="SizeControl" scrolling="No"  noresize="noresize" id="SizeControl" />
</frameset>
<noframes>  
<body>
</body>
</noframes></html>
