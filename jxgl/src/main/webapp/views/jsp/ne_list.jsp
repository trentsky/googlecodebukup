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
<script type="text/javascript">
	function deleteRecord(){
		if(! confirm("确定要删除选中的数据吗？")){
			return;
		}
	}
</script>
</head>

<body>
<div class="history-item">
<div class="title">网元查询</div>
<div class="search">
<form action="#" name="fm" method="post">
<table class="table">
  <tr>
   <td width="4%" rowspan="3"><img src="../../css/table/search.gif" width="40" height="39"></td>
  	<td>网元名称</td>
	<td><input name="text" type="text" class="text"></td>
        <td>网元类别</td>
        <td><select name="select3" class="select">
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
	    <td>厂商</td>
	    <td><select name="select" class="select">
          <option>请选择厂商</option>
          <option value="1">西门子</option>
          <option value="2">BELL</option>
          <option value="3">华为</option>
          <option value="4">NOKIA</option>
          <option value="21">AIP厂家</option>
          <option value="6">彩铃厂商</option>
          <option value="42">思科</option>
        </select></td>
	    <td rowspan="3"><input type="button" class="button" value="查 询" onClick="location.reload()"></td>
  </tr>
  <tr>
    <td>信令点编码</td>
    <td ><input name="text2" type="text" class="text"></td>
    <td>所属机房</td>
    <td><select name="select4" class="select">
      <option>请选择</option>
      <option value="562">安阳市黄河路机房</option>
      <option value="46">许昌许扶路5502局3楼</option>
      <option value="45">开封宋城路1号生产楼5楼</option>
      <option value="44">李万机房</option>
      <option value="43">新乡平原路398号移动大楼10楼</option>
      <option value="42">东风路机房</option>
    </select></td>
    <td >设备型号</td>
    <td ><input name="text22" type="text" class="text"></td>
    </tr>
  <tr>
    <td>使用状态</td>
    <td ><select name="select2" class="select">
      <option>正常</option>
      <option>故障</option>
      <option>工程</option>
      <option>割接</option>
      <option>退网</option>
    </select></td>
    <td>网元编码</td>
    <td><input name="text23" type="text" class="text"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
   </table>
</form>
</div>

<div class="history-item-title">网元信息</div>
<div class="history-item-content">
<table class="listTable">
   <tr class="header">
	 <td class="xuhao">序号</td>
     <td class="xuhao">选择</td>
     <td>网元名称</td>
     <td>厂商</td>
     <td>信令编码</td>
     <td>所属机房</td>
     <td>网元类别</td>
     <td>使用状态</td>
     <td>网元编码</td>
   </tr>
   <tr>
     <td>1</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>2</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>3</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>4</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>5</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>6</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>7</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>8</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>9</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
   <tr>
     <td>10</td>
     <td><input type="checkbox" name="checkbox" value="checkbox" class="checkbox"></td>
     <td>ZZA1</td>
     <td>西门子 </td>
     <td>10FE01</td>
     <td>郑州北环生产楼7楼</td>
     <td>西门子汇接局</td>
     <td>正常<br></td>
     <td>&nbsp;</td>
   </tr>
</table>
<div class="page">
<<a href="#">[1]</a> <a href="#">[2]</a> <a href="#">[3]</a> <a href="#">[4]</a> <a href="#">[5]</a>  >
  当前页/总页数：1/1，每页记录10条，总记录数10&nbsp;&nbsp;
</div>
</div></div>

<br>
<div align="center">
<input type="button" value="添 加" class="button_tt" onClick="location.href('ne_add.jsp')">
<input type="button" value="修 改" class="button_tt" onClick="location.href('ne_edit.jsp')">
<input type="button" value="删 除" class="button_tt" onClick="deleteRecord()">
<input type="button" value="查 看" class="button_tt" onClick="location.href('ne_view.jsp')">
<input type="button" value="设置预警" class="button_tt" onClick="location.href('ne_setAlert.jsp')">
</div>

</body>
</html>
