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
<link href="../css/frame.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
//隐藏上部视图区
function changeTop() {
    window.parent.document.all('bigFrame').rows = "0,10,*";
    var imageId = document.getElementById("img");
    var imgSrc = "<a href=" + "javascript:changeDown();" + "><img src='../" + "images/down.gif' width='50' height='7' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}

//显示上部视图区
function changeDown() {
    window.parent.document.all('bigFrame').rows = "96,10,*";
    var imageId = document.getElementById("img");
    var imgSrc = "<a href=" + "javascript:changeTop();" + "><img src='../" + "images/up.gif' width='50' height='7' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}
</script>
</head>
<body>
<table style="border:1px solid #8facf8; border-right:1px solid #8facf8"  width="100%" cellpadding="0" cellspacing="0">
    <tr>
	  <td bgcolor="#d0ddff"  align="center" height="7"><div id="img"><A 
      href="javascript:changeTop();" onclick=""><IMG src="../images/up.gif" 
      width=50 height=7 border=0 ></A></div></td>
	</tr>
</table>
</body>
</html>
