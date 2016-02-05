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

<title>MassiveMultiplayerOnline</title>

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
	<div class="box type2">
		<div class="boxHeader">
		<h2>BŁĄD</h2>
		</div>
		<div class="boxBody">
			<div class="boxBodyContent" style="height: 160px;">
				
       			<div class="ui-widget">
       				<div class="center">
						<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
							<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
							<strong>Błąd:</strong> Podano niepoprawne dane</p>
						</div>
					</div>
					</div>
				</br>	
					
				<div id="contentTableDiv" style="float: left; display: inline; width: 280px; padding-left: 47%;">
				<table id="contentTable" class="tbl output" cellspacing="0" style="width: 400px; border-bottom: none;">
				<tbody>
					<%@ page import = "javax.servlet.RequestDispatcher" %>
   
    			<form method="post" action="Logowanie.jsp">
    					<input type="submit" value="Wroc">
    					
    				</form>
    			
        		</tbody>
        		</table>	
        		</div>
	
        	</div>
		</div>
	</div>
</div>		
</div>

</body>

</html>
