<%@page import="odArtura.GameServlet"%>
<%@page import="dataBase.ClientDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MASSIVE MULTIPLAYER ONLINE</title>

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
	tmpY = y - 40
	window.location.replace("Game?id="+id+"&x="+x+"&y="+tmpY);
}

function sPress(x,y,id){
	tmpY = y + 40;
	window.location.replace("Game?id="+id+"&x="+x+"&y="+tmpY);
}

function aPress(x,y,id){
	tmpX = x - 40;
	window.location.replace("Game?id="+id+"&x="+tmpX+"&y="+y);
}

function dPress(x,y,id){
	tmpX = x + 40;
	window.location.replace("Game?id="+id+"&x="+tmpX+"&y="+y);
}

</script>

</head>
<body>
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
 		response.sendRedirect("http://localhost:8080/MassiveMultiplaerOnline/massive/hades/do/Game?id="+String.valueOf(id)+"&x=20&y=20");
 	}
 %>
 	
	<img hspace=150% vspace=150% style="width: 20%;" src="C:\\Users\\Crejzer\\Desktop\\eclipse\\AvatarCurrent.png"/>
 
</div>

<div id ="log" style=" float:left; padding:10px;">
 LOGI GRY:
</div>

<div id = "akcja" style="clear:both; padding:5px;">
AKCJA 
</div>

</body>
</html>