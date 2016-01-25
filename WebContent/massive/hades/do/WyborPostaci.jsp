<%@page import="dataBase.ClientDb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Mirrored from aliorbank.pl/hades/do/Login by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 13 Aug 2015 07:40:17 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache,no-store">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache,no-store,must-revalidate">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="refresh" content="30">

<LINK href="../css/loginb9db.css" type=text/css rel=stylesheet>

<link href="../css/jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet">
	<script  type="text/javascript" src="../js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script>
	
	<!-- Scripty przypisujace wygląd do danych elementow strony oraz ich zachowanie -->
		<script>
	$(function() {

		$( "input[type=submit], #button").button();
			
		$( "#dialog, #dialog2" ).dialog({
			autoOpen: false,
			width: 250,
		});

		// Link to open the dialog
		$( "#dialog-link" ).click(function( event ) {
			$( "#dialog" ).dialog( "open" );
			event.preventDefault();
		});
		
		$( "#dialog-link2" ).click(function( event ) {
			$( "#dialog2" ).dialog( "open" );
			event.preventDefault();
		});
	});
	</script>
	
	<!-- Style definiujące wyglad strony  -->
	<style>	
	
	input[type=text]{
			border: solid 1px #E5E5E5;
	background: #FFFFFF;
	margin: 5px 30px 0px 0px;
	padding: 7px;
	display:block;
	font-size:16px;
	width:82%;

	-moz-box-shadow: 0px 0px 8px #f0f0f0;
	-webkit-box-shadow: 0px 0px 8px #f0f0f0;
	box-shadow: 0px 0px 8px #f0f0f0;
	}
	
		.logowanie{
			margin-top: 1em;
			font-size: 15px;
		}
			#dialog-link {
		padding: .0em 0em .0em 10px;
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
	
	.logowanie{
			margin-top: 1em;
			font-size: 15px;
			float: center;
		}
		
	#button{
		font-size: 15px;
	}
	
	.demoHeaders {
		margin-top: 2em;
		font-size: 12px;
	}
	
	#dialog-link {
		padding: .2em 1em .2em 5px;
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
	
	#dialog-link2 {
		padding: .2em 1em .2em 5px;
		text-decoration: none;
		font-size:15px;
		color:#fffff;
		position: relative;
	}
	
	#dialog-link2 span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -5px;
	}
	</style>
<title>MassiveMultiplaerOnline</title>

<script>
//script wysylajacy przekierwanie do gry z informacja jaka postac zostala wybrana
function sendAdres(j){
	   window.location.replace("Game.jsp?id="+j);
};
	
function wyswietlAvatar(i){
	
	 var li_element = document.createElement('li');
	 var image = document.createElement("IMG");
	    
	    if(i == 1){
	    image.src = "C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar1.png"
	   }
	   if(i == 2){
	   image.src = "C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar2.png"
	   }
	   
	   if(i == 3){
		   image.src = "C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar3.png"
	   }
	   
	   var att = document.createAttribute("width");
	   att.value = "50px";

	   image.setAttributeNode(att);

	   att = document.createAttribute("height");
	   att.value = "50px";

	   image.setAttributeNode(att);

	   li_element.appendChild(image);
	   document.getElementById(i).appendChild(li_element);
}
</script>
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
	<div class="box type1">
		<div class="boxHeader">
		<h2>Wybor Postaci </h2>
		</div>
	<div class="boxBody">
	
		<!-- tworzenie polaczenia z baza danych -->
		<sql:setDataSource var="baza" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://127.0.0.1/massive" user="root" password=""/>

		<sql:query dataSource="${baza}" var="postac">
			SELECT * from champ where User_id = (SELECT User_ID FROM Users WHERE Login = '<c:out value="${sessionScope.user.login}"/>');
		</sql:query>
		<!-- pobieranie liczby rekordow znajdujacych sie w danym oddziale aby rozszerzac szare tlo  -->			
		<sql:query dataSource="${baza}" var="lenght">
			SELECT COUNT(*) from champ where (SELECT User_id FROM Users WHERE Login = '<c:out value="${sessionScope.user.login}"/>');
		</sql:query>
							
	<div id="table" class="boxBodyContent">
		<script>
			// roszerzanie tla w zalerznosci od liczby rekrodow
			document.getElementById("table").style.height = '<c:out value="${lenght.rowsByIndex[0][0]*30 +350}" />px';
		</script>
		<div id="contentTableDiv" style="float: left; display: inline; width: 600px; padding-left: 250px;">
					<!-- tworzenie tabeli z lista podysvi znajdujacych sie w bazie danych -->
					<table class="CSSTableGenerator" border="1">
						<tr bgcolor="#808080" style="color:#ffffff;">
							<th style="padding: 5px; width: 150px; text-align:center;">Avatar</th>
					   		<th style="padding: 5px; width: 150px; text-align:center;">IMIE</th>
					   		<th style="padding: 5px; width: 80px; text-align:center;">KLASA</th>
						</tr>
						<c:forEach var="row" items="${postac.rows}">
							<tr onclick="sendAdres(${row.champ_id})">
								<td><ul id="<c:out value="${row.Avatar_Id}"/>"></ul>
									<script>
										wyswietlAvatar(<c:out value="${row.Avatar_Id}"/>)
									</script>
								</td>
								<td><c:out value="${row.Name}"/></td>
								<td style="text-align:center;"><c:out value="${row.Class}"/></td>
							</tr>
						</c:forEach>
					</table>
					
					<form style="margin-top: 15px" method="post" action="odbierzKredyt">
					
    					<input id="button" type="submit" value="Odbierz Kredyt">
    				</form>
					
    				<div style="float:left;display:inline-block; margin-top: 12.5px">
					<p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all" style="color:#000000"><span class="ui-icon ui-icon-newwin"></span><b>UTWORZ NAWA POSTAC</b></a></p>
					
					<div id="dialog" title="Stworz nowa postac">
						<form action="DodajPostac" method="POST">
							<div style="margin-left: 20px">
								Avatar:<br/>
								
								<div id="ramka1" style = "padding-top: 35px; display: inline">
								<img id="avatar1"src="C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar1.png"
									width="50px" height="50px" /> </div>
		
								<div id="ramka2" style = "padding-top: 35px; display: inline">
								<img id="avatar2" src="C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar2.png"
									width="50px" height="50px"/>
								</div>
										
								<div id="ramka3" style = "padding-top: 35px; display: inline">			
								<img id="avatar3" src="C:\\Users\\Crejzer\\workspace\\MassiveMultiplaerOnline\\Avatar3.png"
									width="50px" height="50px" /> 
								</div><br />
								
								<script>	
									document.getElementById("avatar1").addEventListener("click", function(){
										
										var color = document.getElementById("ramka1").style.backgroundColor;
									
										if(color != "lightblue"){
										  document.getElementById("ramka1").style.backgroundColor = "lightblue";;
										} 
										
										if(color == "lightblue"){
											document.getElementById("ramka1").style.backgroundColor = ""; 
											document.getElementById("wybranyAvatar").value = "";
										}
										 
										document.getElementById("wybranyAvatar").value = "1"
									});
									
									document.getElementById("avatar2").addEventListener("click", function(){
										
										var color = document.getElementById("ramka2").style.backgroundColor;
										
										if(color != "lightblue"){
										  document.getElementById("ramka2").style.backgroundColor = "lightblue";;
										} 
										
										if(color == "lightblue"){
											document.getElementById("ramka2").style.backgroundColor = ""; 
										}
										 
										document.getElementById("wybranyAvatar").value = "2"
									});
									
									document.getElementById("avatar3").addEventListener("click", function(){
										
										var color = document.getElementById("ramka3").style.backgroundColor;
										
										if(color != "lightblue"){
										  document.getElementById("ramka3").style.backgroundColor = "lightblue";;
										} 
										
										if(color == "lightblue"){
											document.getElementById("ramka3").style.backgroundColor = ""; 
										}
										 
										document.getElementById("wybranyAvatar").value = "3"
									});
								</script>	
								Imie:
								<input type="text" name="imie" />
								
								Klasa:
								<select name="klasa" class="logowanie">
						
  									<option value="mag">Mag</option>
  									<option value="wojownik">Wojownik</option>
  									<option value="zlodziej">Zlodziej</option>
  									 		
								</select>
								<input type="hidden" id="wybranyAvatar" name="avatar">
								<input type="hidden" value="<c:out value="${sessionScope.user.login}"/>" name="login">
							</div>
							<input class="logowanie" type="submit" value="OK"/>  
						</form>
					</div>
			
					<form style="margin-top: 15px" method="post" action="Logowanie.jsp">
    					<input id="button" type="submit" value="Wyjdz">
    				</form>
    				</div>
        		</div>
	
        	</div>
		</div>
	</div>
		
</div>		
</div>
</body>

</html>