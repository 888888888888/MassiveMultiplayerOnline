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

<LINK href="../css/loginb9db.css?v=fa2264593e70e00982a67d73d1d86a3173bab741" type=text/css rel=stylesheet>

<link href="../css/aliorTheme/jquery-ui-1.10.4.custom.css" rel="stylesheet">
	<script  type="text/javascript" src="../js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="../js/jquery-ui-1.10.4.custom.js"></script>
	
		<script>
	$(function() {
		
		$( "input[type=submit], #button").button();
	});
	</script>

<title>Bankowość internetowa</title>

</head>
<body>
<div id="headerArea" style="height: 119px; width: 100%; margin: 0 auto; text-align: center;">
			<div style="margin: 0 auto; padding-top: 40px; width: 1000px;">
				<a id="logo" href="http://www.aliorbank.pl/pl/" target="_blank" title="" style="float: left"><img src="../img/logo.png" alt="" title="" /></a>
				<span style="font-size:26px; color:#737272; margin-top: 5px; float: right;">
				
					Witaj w systemie bankowości internetowej <b>Alior Banku</b>
				
				
				</span>
				<div class="clear"></div>
			</div>

</div>

<div id="content" style="padding-top: 30px">
<div id="mainArea">
	<div class="box type2">
		<div class="boxHeader">
		<h2>Logowanie do systemu bankowości Alior Bank</h2>
		</div>
		<div class="boxBody">
			<div class="boxBodyContent" style="height: 160px;">
				
    	<jsp:useBean id="user" class="model.User"
        	scope="session"></jsp:useBean>
        
        <jsp:setProperty property="*" name="user"/>

    	<jsp:useBean id="dataSource"
        	class="model.DataSource" scope="session"></jsp:useBean>
       				
				<div id="contentTableDiv" style="float: left; display: inline; width: 280px; padding-left: 317px;">
				<table id="contentTable" class="tbl output" cellspacing="0" style="width: 330px; border-bottom: none;">
				<tbody>
					<%@ page import = "javax.servlet.RequestDispatcher" %>
    				<%  
    				String result = "";
    				
    				ClientDb db = new ClientDb();
    
    				if(user.getLogin() != "" && user.getPassword() != ""){
						dataSource = db.fromDB(user.getLogin());
						result = "Bledna nazwa uzytkownika";
						
						if(dataSource.getLogin() != "nul"){
							//myTime = totp.getEpochTime();
						   
							if(dataSource.checkUser(user.getPassword())) {
								
								RequestDispatcher rd = request.getRequestDispatcher("WyborPostaci.jsp");
		    					rd.forward(request, response);
							}else {
								db.closeDataBase();
								RequestDispatcher rd = request.getRequestDispatcher("ZleDane.jsp");
		    					rd.forward(request, response);
							}
						}else {
							db.closeDataBase();
							RequestDispatcher rd = request.getRequestDispatcher("ZleDane.jsp");
	    					rd.forward(request, response);
						}
    				} else {
    					/*
    					db.closeDataBase();
    					RequestDispatcher rd = request.getRequestDispatcher("Oddzialy.jsp");
    					rd.forward(request, response);
    					*/
    					db.closeDataBase();
    					RequestDispatcher rd = request.getRequestDispatcher("NiePodanoDanych.jsp");
    					rd.forward(request, response);
    				}
   	 				%>
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
