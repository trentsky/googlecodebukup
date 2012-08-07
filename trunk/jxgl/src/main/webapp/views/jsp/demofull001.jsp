<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.ecside.org" prefix="ec" %>
<html>
<head>
<jsp:include page="common_head.jsp" flush="true" />
</head>
<body style="margin:10px;" >
<ec:table items="records" var="record" retrieveRowsCallback="limit" 
action="${pageContext.request.contextPath}/teacher/getPageTeacher"
title="用户列表" 

xlsFileName="用户列表.xls" 
csvFileName="用户列表.csv"

width="100%" 
listWidth="100%" 
height="280px" 
>
<ec:row>
	<ec:column width="50" property="_0" title="序号" value="${GLOBALROWCOUNT}" />
</ec:row>
</ec:table>
</body>
</html>