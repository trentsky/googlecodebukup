//隐藏整个视图区
function changeLeft() {
    top.main.cols = "10,*";
    top.leftFrame.viewArea.cols = "0,10";
    var imageId = top.leftFrame.SizeControl.document.getElementById("image");
    var imgSrc = "<a href=" + "javascript:showRight();" + "><img src='../" + "images/open.gif' width='7' height='50' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;
}

//显示整个视图区
function showRight() {
    top.main.cols = "180,*";
    top.leftFrame.viewArea.cols = "170,10";
    var imageId = top.leftFrame.SizeControl.document.getElementById("image");
    var imgSrc = "<a href=" + "javascript:changeLeft();" + "><img src='../" + "images/close.gif' width='7' height='50' border='0'" + "></a>";
    imageId.innerHTML = imgSrc;

}
