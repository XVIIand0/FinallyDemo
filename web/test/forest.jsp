<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" type="text/css" href="css/forest.css">
		
	</head>
	<body >
	<div style="width: 1890px;height:950px;">
	<img src="images/bg.png" >
		<div >
				<a href="product.jsp?gid=15"><img class="dead" href="" src="images/dead.png"></a>
				<img class="hat" src="images/hat.png">
				<a href="product.jsp?gid=13"><img class="snow" src="images/snow.png"></a>
				<a href="product.jsp?gid=19"><img class="txoic"  src="images/txoic.png"></a>
				<a href="product.jsp?gid=9"><img class="magic" src="images/magic.png"></a>
				<a href="product.jsp?gid=18"><img class="stick" src="images/stick.png"></a>
				<a href="product.jsp?gid=10"><img class="pink" src="images/pink.png"></a>
				<a href="product.jsp?gid=14"><img class="blood" src="images/blood.png"></a>
				<img class="gold" src="images/gold.png">
				<img class="mmagic" src="images/mmagic.png">
				<img class="bobble" src="images/bobble.png">
				<img class="laught" src="images/laught.png">
				<img class="snowsnow" src="images/snowsnow.png">
		</div>
        </div>
	</body>
</html>
<script type="text/javascript">
// <![CDATA[
var colours=new Array('paleturquoise', 'plum', 'pink', 'white', 'lightblue', 'bisque'); // colours of the stars
var minisize=12; // smallest size of stars in pixels
var maxisize=15; // biggest size of stars in pixels
var stars=66; // maximum number of stars on screen
var over_or_under="over"; // set to "over" for stars to always be on top, or "under" to allow them to float behind other objects

/*****************************
*JavaScript Love Heart Cursor*
*  (c)2013+ mf2fm web-design *
*   http://www.mf2fm.com/rv  *
*  DON'T EDIT BELOW THIS BOX *
*****************************/
var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var herz=new Array();
var herzx=new Array();
var herzy=new Array();
var herzs=new Array();
var kiss=false;

if (typeof('addRVLoadEvent')!='function') function addRVLoadEvent(funky) {
  var oldonload=window.onload;
  if (typeof(oldonload)!='function') window.onload=funky;
  else window.onload=function() {
    if (oldonload) oldonload();
    funky();
  }
}

addRVLoadEvent(mwah);

function mwah() { if (document.getElementById) {
  var i, heart;
  for (i=0; i<stars; i++) {
    heart=createDiv("auto", "auto");
    heart.style.visibility="hidden";
	heart.style.zIndex=(over_or_under=="over")?"1001":"0";
    heart.style.color=colours[i%colours.length];
	heart.style.pointerEvents="none";
    if (navigator.appName=="Microsoft Internet Explorer") heart.style.filter="alpha(opacity=75)";
    else heart.style.opacity=0.75;
    heart.appendChild(document.createTextNode(String.fromCharCode(9834)));
    document.body.appendChild(heart);
    herz[i]=heart;
	herzy[i]=false;
  }
  set_scroll();
  set_width();
  herzle();
}}

function herzle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<stars; c++) if (herzy[c]===false) {
	  herz[c].firstChild.nodeValue=String.fromCharCode(9834);
      herz[c].style.left=(herzx[c]=x-minisize/2)+"px";
      herz[c].style.top=(herzy[c]=y-minisize)+"px";
      herz[c].style.fontSize=minisize+"px";
	  herz[c].style.fontWeight='normal';
      herz[c].style.visibility='visible';
      herzs[c]=minisize;
      break;
    }
  }
  for (c=0; c<stars; c++) if (herzy[c]!==false) blow_me_a_kiss(c);
  setTimeout("herzle()", 40);
}

document.onmousedown=pucker;
document.onmouseup=function(){clearTimeout(kiss);};

function pucker() {
  ox=-1;
  oy=-1;
  kiss=setTimeout('pucker()', 100);
}

function blow_me_a_kiss(i) {
  herzy[i]-=herzs[i]/minisize+i%2;
  herzx[i]+=(i%5-2)/5;
  if (herzy[i]<sdown-herzs[i] || herzx[i]<sleft-herzs[i] || herzx[i]>sleft+swide-herzs[i]) {
    herz[i].style.visibility="hidden";
    herzy[i]=false;
  }
  else if (herzs[i]>minisize+2 && Math.random()<.5/stars) break_my_heart(i);
  else {
    if (Math.random()<maxisize/herzy[i] && herzs[i]<maxisize) herz[i].style.fontSize=(++herzs[i])+"px";
    herz[i].style.top=herzy[i]+"px";
    herz[i].style.left=herzx[i]+"px";
  }
}

function break_my_heart(i) {
  var t;
  herz[i].firstChild.nodeValue=String.fromCharCode(9676);
  herz[i].style.fontWeight='bold';
  herzy[i]=false;
  for (t=herzs[i]; t<=maxisize; t++) setTimeout('herz['+i+'].style.fontSize="'+t+'px"', 60*(t-herzs[i]));
  setTimeout('herz['+i+'].style.visibility="hidden";', 60*(t-herzs[i]));
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height;
  div.style.width=width;
  div.style.overflow="hidden";
  div.style.backgroundColor="transparent";
  return (div);
}
// ]]>
</script>