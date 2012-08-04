<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<head>
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/frame.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/all.css" rel="stylesheet" type="text/css" />
<script>
 function showPage()
 {
  parent.frames["leftFrame"].frames["menuFrame"].location.href="menu5.html";
  parent.frames["mainFrame"].location.href="main.html";
   //parent.leftFrame.menuFrame.location="menu5.html";
   //parent.mainFrame.location="main.html";
 }
 function showPage2()
 {
  parent.frames["leftFrame"].frames["menuFrame"].location.href="menu2.html";
  parent.frames["mainFrame"].location.href="zydd_main.html";
 }
</script>
</head>

<body>
<div class="head">
   <table width="100%" cellpadding="0" cellspacing="0">
     <tr>
	   <td width="276"></td>
       <td>
	    <table width="100%" cellpadding="0" cellspacing="0">
	      <tr>
             <td align="center"><a href="#" onClick="showPage()"><img src="../images/02.gif" border="0"></a></td>
             <td align="center"><a href="#" onClick="showPage2()"><img src="../images/05.gif" border="0"></a></td>
	         <td align="center"><a href="menu1.html" target="menuFrame"><img src="../images/06.gif" border="0"></td>

	         <td align="center"><a href="menu3.html" target="menuFrame"><img src="../images/03.gif" width="31" height="35" border="0"></td>
	         <td align="center"><a href="menu4.html" target="menuFrame"><img src="../images/01.gif" border="0"></td>

	         <td align="center"><a href="menu6.html" target="menuFrame"><img src="../images/100.gif" border="0"></td>
	         <td align="center"><a href="menu7.html" target="menuFrame"><img src="../images/07.gif" border="0"></td>
	         <td align="center"><a href="menu8.html" target="menuFrame"><img src="../images/04.gif" border="0"></td>
          </tr>
	      <tr>
            <!-- <td align="center"><a href="menu5.html" target="menuFrame">资源综合展示</a></td> -->
            <td align="center"><a href="#" onClick="showPage()">资源展示</a></td>
            <td align="center"><a href="#" onClick="showPage2()">资源调度</a></td>
			<td align="center"><a href="menu1.html" target="menuFrame">数据管理</a></td>
	        <!--<td align="center"><a href="menu3.html" target="menuFrame">导入导出</a></td>-->
	        <td align="center"><a href="menu4.html" target="menuFrame">查询统计</a></td>

            <td align="center"><a href="menu6.html" target="menuFrame">核查比对</a></td>
            <td align="center"><a href="menu7.html" target="menuFrame">系统管理</a></td>
	        <td align="center"><a href="menu8.html" target="menuFrame">系统帮助</a></td>

          </tr>
	    </table>	   </td>
       <td height="68" width="91" background="../images/huxian.gif">
	       <table width="100%">
		     <tr>
			  <td style="padding-left:20px;"><img src="../images/icon1.gif"></td>
			 </tr>
		     <tr>
		       <td style="padding-left:35px; padding-top:3px;"><img src="../images/icon2.gif"></td>
	         </tr>
		     <tr>
		       <td style="padding-left:60px;"><img src="../images/icon3.gif"></td>
	         </tr>
	       </table>	   </td>
     </tr>
   </table>
<table width="100%">
    <tr valign="bottom">
      <td height="20">&nbsp;欢迎 <span class="orange">张三</span> 登录本系统 当前在线 <span class="orange">2</span> 人</td>
      <td align="right"><span class="orange">技术服务电话</span>：154222222222 &nbsp;</td>
    </tr>
</table>
</div>
</body>
</html>
