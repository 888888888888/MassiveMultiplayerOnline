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

<LINK href="../css/loginb9db.css?v=fa2264593e70e00982a67d73d1d86a3173bab741" type=text/css rel=stylesheet>

<link href="../css/jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet">
	<script  type="text/javascript" src="../js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script>
	
	<script>
		$(function() {
			$( "input[type=submit], #button").button();
			$( "#dialog").dialog({
				autoOpen: false,
				width: 260,
			});

			// Link to open the dialog
			$( "#dialog-link" ).click(function( event ) {
				$( "#dialog" ).dialog( "open" );
				event.preventDefault();
			});
		});
	</script>
	<style>
		input[type=text]{
			border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 0px;
	padding: 9px;
	display:block;
	font-size:16px;
	width:76%;

	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;
	}
	
		.logowanie{
			margin-top: 2em;
			font-size: 15px;
		}
			#dialog-link {
		padding: .2em 1em .2em 10px;
		text-decoration: none;
		font-size:15px;
		color:#fffff;
		position: relative;
	}
	
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -5px;
	}
	</style>

<title>Logowanie</title>


</head>
<body>

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



<div id="content" style="padding-top: 30px">
<div id="mainArea">
	<div class="box type2">
		<div class="boxHeader">
		<h2>Logowanie do gry</h2>
		</div>
		<div class="boxBody">
			<div class="boxBodyContent" style="height: 400px;">
				
				<div id="contentTableDiv" style="float: left; display: inline; width: 280px; padding-left: 317px;">
				
				<jsp:useBean id="user"
                    class = "model.User" scope = "session"></jsp:useBean>

                <jsp:setProperty name="user" property="login" value="" />
                <jsp:setProperty name="user" property="password" value="" />
                
				<h2 class="logowanie">
					<form method="post" action="Zaloguj.jsp">
						Podaj swoj login:<br/>
        				<input type="text" name="login" /></br>
        				Podaj swoje haslo:<br/>
        				<input type="text" name="password" /></br>
        				 <div style="float:left;display:inline-block;">
               			<input type="submit" value="Zaloguj" style="color:#000000; font-size: 15px; margin-top: -5px"/>
                   		</div>
        			</form> 
        			
        			<p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all" style="color:#000000; font-size: 15px"><span class="ui-icon ui-icon-newwin"></span><b>Dodaj Użytkownika</b></a></p>
					<div id="dialog" title="Dodaj Użytkownika">
						<form method="post" action="DodajUzytkownika.jsp">
							<div>
								Login: <br />
        						<input type="text" name="login" /><br />
							</div>
							<div>
								Haslo: <br />
        						<input type="text" name="password" /><br />
        						<input type="submit" value="Dodaj">
							</div>
						</form>
					</div>
        		</h2>
        		</div>
	
        	</div>
		</div>
	</div>
</div>		
</div>
 
</body>

</html>
