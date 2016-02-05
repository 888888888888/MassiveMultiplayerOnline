<%@page import="servlets.*"%>
<%@page import="dataBase.ClientDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=UTF-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache,no-store">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache,no-store,must-revalidate">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="refresh" content="30">

<LINK href="../css/gameTheme.css" type=text/css rel=stylesheet>

<link href="../css/walkaButton/jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet">
	<script  type="text/javascript" src="../js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script>
		
<script>
	$(function() {
		$( "#button").button();
	});
</script>

<script type="text/javascript">

function keyListenner(event,x,y,id) {
	
    var eventID = event.which;

    if(eventID == 119){

		wPress(x,y,id);
    } else if (eventID == 115){
       
		sPress(x,y,id);
    } else if (eventID == 97){
		
		aPress(x,y,id);
    } else if (eventID == 100){
		
		dPress(x,y,id);
    }
}

function wPress(x,y,id){
	
	tmpY = y - 1;	
	if (tmpY < 0){
		tmpY = 0;
	}
	
	window.location.replace("Game?id="+id+"&x="+x+"&y="+tmpY);
}

function sPress(x,y,id){
	
	tmpY = y + 1;
	if (tmpY > 100){
		
		tmpY = 100;
	}
	
	window.location.replace("Game?id="+id+"&x="+x+"&y="+tmpY);
}

function aPress(x,y,id){
	
	tmpX = x - 1;
	if (tmpX < 0){
		tmpX = 0;
	}
	
	window.location.replace("Game?id="+id+"&x="+tmpX+"&y="+y);
}

function dPress(x,y,id){
	
	tmpX = x + 1;
	if(tmpX > 100){
		tmpX = 100;
	}
	
	window.location.replace("Game?id="+id+"&x="+tmpX+"&y="+y);
}

function walcz(event, liczba1, liczba2) {

    if (event.shiftKey) {
    	if (liczba1 > liczba2){
        	document.getElementById("avatar").style.visibility = "hidden";
        	document.getElementById("log").innerHTML = "Przegrales";
        } else {
        	document.getElementById("potwor").style.visibility = "hidden";
        	document.getElementById("log").innerHTML = "Wygrales";
        }
    } 
}

</script>

<title>MASSIVE MULTIPLAYER ONLINE</title>
</head>
<body onkeydown="walcz(event,<%=request.getParameter("liczba1")%>,<%=request.getParameter("liczba2")%>)">
<% 
	String idString = request.getParameter("id");
	String x = request.getParameter("x");
	String y = request.getParameter("y");
%>
<!-- NIE WIEM CZEMU ROBI TE MARGINESY Z LEWEJ I Z GORY! -->
<div id ="poleGry" onkeypress="keyListenner(event,<%=x%>,<%=y%>,<%=idString %>);" style="height: 400px; width:400px; float:left; border-style:double; background-image: url(C:\\Users\\Crejzer\\Desktop\\eclipse\\mapa.png)">

 <!-- NIE WIEM CZEMU ZAPISUJE W C:\Users\Crejzer\Desktop\eclipse, A NORAMALNIE POWINNO W FOLDERZE PROJEKTU ! -->
 <% 
 	int id = Integer.valueOf(request.getParameter("id"));
 	ClientDb db = new ClientDb();
 	db.getAvatarById(id);
 	db.closeDataBase();
 	
 	boolean flaga = Boolean.valueOf(request.getParameter("flaga"));
 	
 	if(flaga == false){
 		response.sendRedirect("http://localhost:8080/MassiveMultiplaerOnline/massive/hades/do/Game?id="+String.valueOf(id)+"&x=40&y=40");
 	}
 %>
	<img id = "avatar" style="width: 100px; padding-top: 100px; padding-left: 100px" src="AvatarCurrent.png"/>
	<img id = "potwor" style = "padding-left: 10px; width: 100px"  src="https://t2.ftcdn.net/jpg/00/97/42/29/500_F_97422960_Cfy5YQaSs26hMHSmKyu6YklLFI54jFVl.jpg"/>
 
</div>

<div id="content" style="float: left; display: inline; width: 10px; padding-left: 10px;">
<div id="mainArea">
<div class="box type2">
	<div class="boxHeader">
		<h2>Logi Gry </h2>
	</div>
	<div class="boxBody">
		<div id="log" class="boxBodyContent" style="height: 365px;">

       	</div>
	</div>
</div>
</div>
</div>

<div id = "akcja" style="clear:both">
	<form style="margin-left: 150px" method="post" action="walcz">	
				<input type="hidden" id = "id" value=<%=request.getParameter("id")%>>
    			<input id="button" type="submit" value="Walcz">
    </form>
</div>

</body>
</html>