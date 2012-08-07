<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.ecside.org" prefix="ec" %>
<html>

<head>
<jsp:include page="common_head.jsp" flush="true" />
<script type="text/javascript">
	function init(){
		top.document.title=top.document.title+" how long : "+(new Date().getTime()-startTime);
	}
	var startTime=new Date().getTime();
</script>
</head>

<body style="margin:15px;" onload="init()">

<ec:table items="records" var="record" 
useAjax="true"
doPreload="false"
action="${pageContext.request.contextPath}/demofull001.jsp"
shadowRowAction="${pageContext.request.contextPath}/ecside/ajaxtemplate/getMemo.jsp?easyDataAccess=myEasyDA.getUserMemo"

showPrint="true"
xlsFileName="用户列表.xls" 
csvFileName="用户列表.csv"
pdfFileName="用户列表.pdf"
minColWidth="80" 
maxRowsExported="10000000" 
pageSizeList="10,20,50,100,500,1000" 
rowsDisplayed="10" 



retrieveRowsCallback="process" 
sortable="true" 

rowsDisplayed="10" 

generateScript="true" 

resizeColWidth="true" 

classic="true" 

filterable="true" 

width="100%" 

listWidth="100%" 

height="277px" 

minHeight="200"  


>
<ec:row  recordKey="${record.USERID}" rowId="rowid_${GLOBALROWCOUNT}" >
		<ec:attribute>title="${record.USERNAME}"</ec:attribute>
<ec:column width="50" property="_0" title="序号"  editable="false" resizeColWidth="false" sortable="false">${GLOBALROWCOUNT}</ec:column>
<ec:column width="26" title="&#160;"  property="_1" viewsAllowed="html" resizeColWidth="false" sortable="false"
cell="shadowRow" tipTitle="点击查看个人简介" 
 />
	<ec:column width="80" property="USERROLE" title="角色" editTemplate="ecs_t_role" mappingItem="USERROLE_MAP" />
	<ec:column width="120" property="USERNAME" title="用户名" editable="false"  cellValue="${record.USERNAME}"
		style=" #_EX:VAR.USERID>5 && VAR.USERID<15?'color:red':'' " />
	<ec:column width="100" property="PASSWD" title="密码"  />
	<ec:column width="120" property="EMAIL" title="电子信箱" />
	<ec:column width="70" property="GENDER" title="性别"  editTemplate="ecs_t_gender" mappingItem="GENDER_MAP"   />
	<ec:column  width="70"  property="USERID" title="编号" editable="false" resizeColWidth="false" format="0.00" calc="average,total" calcTitle= "平均,合计" calcSpan="2" >
#_EX:
// 新特性,支持动态脚本语言(js):
// USERID大于 5 小于 15的 使用红色显示
// VAR是关键字,代表迭代中的当前记录.
// 您可以和 property="USERNAME" 列的 style做下对比,两种方式都可以实现类似的效果,您可以自由选择.
// 动态脚本语言的加入,可以帮助用户非常方便的实现横向统计.
// 例如 想在当前列显示 其他某几列的和 可以使用 return VAR.某列1的名字+VAR.某列2的名字+VAR.某列1的名字.....
if ( VAR.USERID>5 && VAR.USERID<15) {
	return '<font color=red>'+VAR.USERID+'</font>'
} else {
	return VAR.USERID;
}
	</ec:column>
</ec:row>
</ec:table>
	
<!-- 编辑和过滤所使用的 通用的文本框模板 -->
<textarea id="ecs_t_input" rows="" cols="" style="display:none">
	<input type="text" class="inputtext" value="" onblur="ECSideUtil.updateEditCell(this)" 
	 style="width:100%;" name="" />
</textarea>
</body>
</html>