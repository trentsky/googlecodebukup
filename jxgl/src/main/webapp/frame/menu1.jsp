<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>菜单</title>
    <link href="../css/all.css" rel="stylesheet" type="text/css">
    <link href="../css/dtree.css" rel="stylesheet" type="text/css">
    <script src="../js/dtree.js" type="text/javascript"></script>
</head>
<script language="JavaScript">
<!--

/*
*demo
*/
/**
 *写出带有链接的子菜单
 */
function showitem(id, name)
{
    return ("<span><a href='" + id + "' target=_blank>" + name + "</a></span><br>")
}

/**
 *选择菜单项
 */
function switchoutlookBar(number) {
    var i = outlookbar.opentitle;
    outlookbar.opentitle = number;
    var id1,id2,id1b,id2b
    if (number != i && outlooksmoothstat == 0) {
        if (number != -1) {
            if (i == -1) {
                id2 = "blankdiv";
                id2b = "blankdiv";
            } else {
                id2 = "outlookdiv" + i;
                id2b = "outlookdivin" + i;
                //		document.all("outlooktitle"+i).style.border="1px none navy";
                document.all("outlooktitle" + i).style.background = outlookbar.maincolor;
                document.all("outlooktitle" + i).style.color = "#013368";
                document.all("outlooktitle" + i).style.textalign = "center";
            }
            id1 = "outlookdiv" + number
            id1b = "outlookdivin" + number
            //	document.all("outlooktitle"+number).style.border="1px none white";
            document.all("outlooktitle" + number).style.background = outlookbar.maincolor;
            //title
            document.all("outlooktitle" + number).style.color = "#013368";
            document.all("outlooktitle" + number).style.textalign = "center";
            smoothout(id1, id2, id1b, id2b, 0);
        } else {
            document.all("blankdiv").style.display = "";
            document.all("blankdiv").sryle.height = "100%";
            document.all("outlookdiv" + i).style.display = "none";
            document.all("outlookdiv" + i).style.height = "0%";
            //	document.all("outlooktitle"+i).style.border="1px none navy";
            document.all("outlooktitle" + i).style.background = outlookbar.maincolor;
            document.all("outlooktitle" + i).style.color = "#013368";
            document.all("outlooktitle" + i).style.textalign = "center";
        }
    }
}
function smoothout(id1, id2, id1b, id2b, stat) {
    if (stat == 0) {
        tempinnertext1 = document.all(id1b).innerHTML;
        tempinnertext2 = document.all(id2b).innerHTML;
        document.all(id1b).innerHTML = "";
        document.all(id2b).innerHTML = "";
        outlooksmoothstat = 1;
        document.all(id1b).style.overflow = "hidden";
        document.all(id2b).style.overflow = "hidden";
        document.all(id1).style.height = "0%";
        document.all(id1).style.display = "";
        setTimeout("smoothout('" + id1 + "','" + id2 + "','" + id1b + "','" + id2b + "'," + outlookbar.inc + ")", outlookbar.timedalay);
    } else {
        stat += outlookbar.inc;
        if (stat > 100) {
            stat = 100;
        }
        document.all(id1).style.height = stat + "%";
        document.all(id2).style.height = (100 - stat) + "%";
        if (stat < 100) {
            setTimeout("smoothout('" + id1 + "','" + id2 + "','" + id1b + "','" + id2b + "'," + stat + ")", outlookbar.timedalay);
        } else {
            document.all(id1b).innerHTML = tempinnertext1;
            document.all(id2b).innerHTML = tempinnertext2;
            outlooksmoothstat = 0;
            document.all(id1b).style.overflow = "auto";
            document.all(id2).style.display = "none";
        }
    }
}

function getOutLine() {
    outline = "<table " + outlookbar.otherclass + ">";
    for (i = 0; i < (outlookbar.titlelist.length); i++) {
        outline += "<tr><td name=outlooktitle" + i + " id=outlooktitle" + i + " ";
        if (i != outlookbar.opentitle) //当栏目没有打开时字体
            outline += " nowrap align=center style='cursor:hand;background-image:url(../images/title_bg.gif);color:#033266;height:26' ";
        else
            outline += " nowrap align=center style='cursor:hand;background-image:url(../images/title_bg.gif);color:#033266;height:26;' ";
        outline += outlookbar.titlelist[i].otherclass
        outline += " onclick='switchoutlookBar(" + i + ")'><span class=smallFont>";
        outline += outlookbar.titlelist[i].title + "</span></td></tr>";
        outline += "<tr><td name=outlookdiv" + i + " valign=top align=left id=outlookdiv" + i + " style='width:100%;padding-left:10px;"
        if (i != outlookbar.opentitle) //判断是否书写内容
            outline += ";display:none;height:0%;";
        else
            outline += ";display:;height:100%;";
        outline += "'><div name=outlookdivin" + i + " id=outlookdivin" + i + " style='overflow:auto;width:100%;height:100%'>";
        //展开项内容
        //outline+=tt();
        outline += menuScript(i);
        //for (j=0;j<outlookbar.itemlist[i].length;j++)
        //outline+=showitem(outlookbar.itemlist[i][j].key,outlookbar.itemlist[i][j].title);
        //key为链接title为名字
        outline += "</div></td></tr>";
    }
    outline += "</table>";
    return outline;
}

function show() {
    var outline;
    outline = "<div id=outLookBarDiv name=outLookBarDiv style='width=100%;height:100%'>";
    //整体的框架格局背景
    outline += outlookbar.getOutLine();
    outline += "</div>";
    document.write(outline);
}
function theitem(intitle, instate, inkey) {
    this.state = instate;
    this.otherclass = " nowrap ";
    this.key = inkey;
    this.title = intitle;
}
function addtitle(intitle) {
    outlookbar.itemlist[outlookbar.titlelist.length] = new Array();
    outlookbar.titlelist[outlookbar.titlelist.length] = new theitem(intitle, 1, 0);
    return(outlookbar.titlelist.length - 1);
}
/*
function additem(intitle,parentid,inkey)
{
	if (parentid>=0 && parentid<=outlookbar.titlelist.length)
	{
		outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length]=new theitem(intitle,2,inkey);
		outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length-1].otherclass=" nowrap align=left style='height:5' ";
		return(outlookbar.itemlist[parentid].length-1);
	}
	else
		additem=-1;
}
*/
function outlook() {
    this.titlelist = new Array();
    this.itemlist = new Array();
    this.divstyle = "style='height:100%;width:100%;overflow:auto' align=center";
    this.otherclass = "border=0 cellspacing='0' cellpadding='0' style='height:100%;width:100%'valign=middle align=center ";
    this.addtitle = addtitle;
    //this.additem=additem;
    this.starttitle = -1;
    this.show = show;
    this.getOutLine = getOutLine;
    this.opentitle = this.starttitle;
    this.reflesh = outreflesh;
    this.timedelay = 50;
    this.inc = 10;
    this.maincolor = "url(../images/title_bg.gif) repeat-x";
}

function outreflesh() {
    document.all("outLookBarDiv").innerHTML = outlookbar.getOutLine();
}

function locatefold(foldname) {
    if (foldname == "" && outlookbar.titlelist.length > 0)
        foldname = outlookbar.titlelist[0].title
    for (var i = 0; i < outlookbar.titlelist.length; i++)
    {
        if (foldname == outlookbar.titlelist[i].title)
        {
            outlookbar.starttitle = i;
            outlookbar.opentitle = i;
        }
    }
}
var outlookbar = new outlook();
var tempinnertext1,tempinnertext2,outlooksmoothstat;
outlooksmoothstat = 0;
var tree;
tree = outlookbar.addtitle('交换资源');
tree = outlookbar.addtitle('传输资源');
tree = outlookbar.addtitle('数据资源');
tree = outlookbar.addtitle('无线资源');
tree = outlookbar.addtitle('公共资源');        
function menuScript(index) {
    if (index == 0) {
        dTree0001 = new dTree('dTree0001');
        dTree0001.add(0001, -1, '');
        dTree0001.add(0101, 0001, '设备管理');
        dTree0001.add(9000, 0001, '连接架管理');
		dTree0001.add(9001,0001,'物理电路管理','../html/zygl/jhzy/wulidlgl/add_circuit_list.html','','mainFrame');
		dTree0001.add(9002,0001,'信令链路管理','../html/zygl/jhzy/signal/signal_list.html','','mainFrame');

        dTree0001.add(0201, 0001, '*物理电路管理');
        dTree0001.add(0401, 0001, '*信令链路管理');
        dTree0001.add(0301, 0001, '*2M中继管理');
        dTree0001.add(0501, 0001, '导入导出');
        
        
        dTree0001.add(020101, 0101, '网元管理', '../views/jsp/ne_list.jsp', '', 'mainFrame');
        dTree0001.add(030101, 0101, '机柜管理', '../html/zygl/jhzy/wygl/bay_list.html', '', 'mainFrame');
        dTree0001.add(040101, 0101, '机框管理', '../html/zygl/jhzy/wygl/shelf_list.html', '', 'mainFrame');
        dTree0001.add(050101, 0101, '板卡管理', '../html/zygl/jhzy/wygl/card_list.html', '', 'mainFrame');
        dTree0001.add(060101, 0101, '端口管理', '../html/zygl/jhzy/wygl/port_list.html', '', 'mainFrame');
        dTree0001.add(070101, 9000, 'ODF架管理', '../html/zygl/jhzy/wygl/odf_bay_list.html', '', 'mainFrame');
        dTree0001.add(080101, 9000, 'ODF框管理', '../html/zygl/jhzy/wygl/odf_shelf_list.html', '', 'mainFrame');
        dTree0001.add(090101, 9000, 'ODF端口管理', '../html/zygl/jhzy/wygl/odf_port_list.html', '', 'mainFrame');
        dTree0001.add(011101, 9000, 'DDF架管理', '../html/zygl/jhzy/wygl/ddf_shelf_list.html', '', 'mainFrame');
        dTree0001.add(012101, 9000, 'DDF端口管理', '../html/zygl/jhzy/wygl/ddf_port_list.html', '', 'mainFrame');
        dTree0001.add(010302, 0301, '中继群管理', '../html/zygl/jhzy/zjgl/trunkgroup_list.html', '', 'mainFrame');
        dTree0001.add(010301, 0301, '中继管理', '../html/zygl/jhzy/zjgl/trunk_list.html', '', 'mainFrame');


        dTree0001.add(010201, 0201, '新增物理电路', '../html/zygl/jhzy/zjdlgl/add_circuit_list.html', '', 'mainFrame');
        dTree0001.add(010202, 0201, '调整物理电路', '../html/zygl/jhzy/zjdlgl/adjust_circuit_list.html', '', 'mainFrame');
        dTree0001.add(010203, 0201, '停闭物理电路', '../html/zygl/jhzy/zjdlgl/stop_circuit_list.html', '', 'mainFrame');
        dTree0001.add(010204, 0201, '修改物理电路', '../html/zygl/jhzy/zjdlgl/stop_circuit_list.html', '', 'mainFrame');


		dTree0001.add(010401, 0401, '信令链路组管理', '../html/zygl/jhzy/xlgl/linkchain_list.html', '', 'mainFrame');
		dTree0001.add(010402, 0401, '信令管理', '../html/zygl/jhzy/xlgl/link_list.html', '', 'mainFrame');
		
        dTree0001.add(010501, 0501, '网元导入导出', '../html/drdc/jhzy/ne_import.html', '', 'mainFrame');
        dTree0001.add(010502, 0501, '电路导入导出', '../html/drdc/jhzy/circuit_import.html', '', 'mainFrame');
        dTree0001.add(010503, 0501, '信令导入导出', '../html/drdc/jhzy/link_import.html', '', 'mainFrame');
        dTree0001.add(010504, 0501, '板卡导入导出', '../html/drdc/jhzy/port_import.html', '', 'mainFrame');
        dTree0001.add(010505, 0501, '信令端口导入导出', '../html/drdc/jhzy/link_port_import.html', '', 'mainFrame');
        dTree0001.add(010507, 0501, 'DDF架标签导出', '../html/drdc/jhzy/ddf_export.html', '', 'mainFrame');
        

        return ("<span>" + dTree0001 + "</span>");
    }
    if (index == 1) {
        dTree608 = new dTree('dTree608');
        return ("<span>" + dTree608 + "</span>");
    }
     if (index == 2) {
        dTree608 = new dTree('dTree608');
        return ("<span>" + dTree608 + "</span>");
    }
     if (index == 3) {
        dTree608 = new dTree('dTree608');
        return ("<span>" + dTree608 + "</span>");
    }
     if (index == 4) {
        dTree608 = new dTree('dTree608');
        return ("<span>" + dTree608 + "</span>");
    }
}
/*
var t;
t=outlookbar.addtitle('技术文档');
t=outlookbar.addtitle('计算机技术');
t=outlookbar.addtitle('文摘');
t=outlookbar.addtitle('技术文档2');
t=outlookbar.addtitle('计算机技术2');
t=outlookbar.addtitle('文摘2');
*/
//-->
</script>
<body>
<table id=mnuList style="WIDTH:170px;HEIGHT: 100%" cellspacing=0 cellpadding=0 align=center border=0>
    <tr>
        <td bgcolor=#f1f5ff id=outLookBarShow style="HEIGHT: 100%" valign=top align=center name="outLookBarShow">
            <script language="JavaScript">
                <!--
                locatefold("")
                outlookbar.show()
                //-->
            </script>
        </td>
    </tr>
</table>
</body>
</html>
