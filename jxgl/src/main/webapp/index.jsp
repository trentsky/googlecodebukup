<%@ page contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>综合资源管理系统</title>
</head>
<frameset rows="96,10,*" cols="*" frameborder="no" border="0" framespacing="0" name="bigFrame">
  <frame src="frame/top.jsp" name="topFrame" scrolling="no" noresize="noresize" />
  <frame src="frame/control.jsp" name="SizeControl" scrolling="no"  noresize="noresize" id="SizeControl" />
  <frameset name="main" rows="*" cols="180,*" framespacing="0" frameborder="no" border="0">
    <frame src="frame/left.jsp" name="leftFrame" scrolling="no" noresize="noresize"  />
    <frame src="frame/main.jsp" name="mainFrame" />
  </frameset>
</frameset>
<noframes><body>
</body>
</noframes></html>
  <body>
  </body>
</html>
