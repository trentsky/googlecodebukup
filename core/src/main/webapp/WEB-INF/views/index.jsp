<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.min.js"></script>
<script type="text/javascript">
	function continueBet() {
		$.ajax({
			url:"<%=request.getContextPath() %>/bet/continuebet",
			type:"POST",
			data:"flowno=" + $("#flowno").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function merge() {
		$.ajax({
			url:"<%=request.getContextPath() %>/tuserinfoes/mac",
			type:"POST",
			data:"userno=" + $("#userno").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function getTwininfo() {
		$.ajax({
			url:"<%=request.getContextPath() %>/bet/twininfo",
			type:"POST",
			data:"lotno=" + $("#lotno").val() + "&batchcode=" + $("#batchcode").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function prizeorder() {
		$.ajax({
			url:"<%=request.getContextPath() %>/bet/prizeorder",
			type:"POST",
			data:"lotno=" + $("#lotno1").val() + "&batchcode=" + $("#batchcode1").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function getTlotctrl() {
		$.ajax({
			url:"<%=request.getContextPath() %>/bet/tlotctrl",
			type:"POST",
			data:"lotno=" + $("#lotno2").val() + "&lotid=" + $("#lotid").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function addnum() {
		$.ajax({
			url:"<%=request.getContextPath() %>/bet/addnum",
			type:"POST",
			data:"flowno=" + $("#flowno1").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function check() {
		window.location.href = "http://localhost:8888/nmcerror/cerror.jsp?lotno=" + $("#lotno3").val() + "&batchcode=" + $("#batchcode3").val();
	}
	function addnum() {
		$.ajax({
			url:"<%=request.getContextPath() %>/system/updateStatistic",
			type:"POST",
			data:"key=" + $("#statisticKey").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
	function undeduct() {
		$.ajax({
			url:"<%=request.getContextPath() %>/system/undeduct",
			type:"POST",
			data:"flowno=" + $("#errorflowno").val(),
			success:function(data){
				alert("errorcode:" + data.errorCode + ", value:" + data.value);
			}
		});
	}
</script>
</head>
<body>
<p>
继续投注, flowno: <input type="text" id="flowno" size="30"></input>&nbsp;&nbsp;<input type="button" value="continueBet" onclick="continueBet()"></input><br/>
<p>
修改账户mac值, userno: <input type="text" id="userno" size="15"></input>&nbsp;&nbsp;<input type="button" value="merge" onclick="merge()"></input><br/>
<p>
大赢家新期, lotno: <input type="text" id="lotno2" size="7">&nbsp;lotid: <input type="text" id="lotid" size="8">&nbsp;&nbsp;<input type="button" value="getTlotctrl" onclick="getTlotctrl()"></input><br/>
<p>
大赢家开奖, lotno: <input type="text" id="lotno" size="7">&nbsp;batchcode: <input type="text" id="batchcode" size="8">&nbsp;&nbsp;<input type="button" value="getTwininfo" onclick="getTwininfo()"></input><br/>
<p>
大赢家兑奖, lotno: <input type="text" id="lotno1" size="7">&nbsp;batchcode: <input type="text" id="batchcode1" size="8">&nbsp;&nbsp;<input type="button" value="prizeorder" onclick="prizeorder()"></input><br/>
<p>
追号, flowno: <input type="text" id="flowno1" size="30"></input>&nbsp;&nbsp;<input type="button" value="addnum" onclick="addnum()"></input><br/>
<p>
校验内蒙某期兑奖是否正确, lotno: <input type="text" id="lotno3" size="7"/>&nbsp;&nbsp;batchcode: <input type="text" id="batchcode3" size="8">&nbsp;&nbsp;<input type="button" value="check" onclick="check()"/><br/>
<p>
刷新统计信息, key: <input type="text" id="statisticKey" size="7"/>&nbsp;&nbsp;
</p>
<p>
投注失败冲正, flowno: <input type="text" id="errorflowno" size="30"/>&nbsp;&nbsp;<input type="button" value="undeduct" onclick="undeduct()"></input><br/>
</body>
</html>