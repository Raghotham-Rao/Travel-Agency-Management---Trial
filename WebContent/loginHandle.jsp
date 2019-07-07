<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.forms.logIn" %>
<jsp:useBean id="bean2" class="com.forms.LoginBean" scope = "session"></jsp:useBean>
<jsp:setProperty property="*" name="bean2"/>
<!DOCTYPE html>
<html>
	
	<head>
		
		<link rel = "stylesheet" type = "text/css" href = "style.css">
		<title> Successfully logged in </title>
		
	</head>
	
	<body>
	
		<% bean2.setuname(request.getParameter("username"));
		bean2.setpass(request.getParameter("password"));%>
		
		<% if(!logIn.validate(bean2)){
			out.print("<script>alert(\"SORRY!!! Please enter valid name and password! \")</script>");
			out.print("<script> window.location.href = \"index.html\"; </script>");
		}
		%>
	
		<div id = "header">
		
			<div id ="navbar">
			<ul>
				<li><a href = "tripplanner.jsp"> Trip Planner </a></li>
				<li onmouseover = "fun1(1)" onmouseout = "fun1(2)" id = "cat"><a href = ""> Categories
						<ul id = "categorylist" >
							<li><form action = "categories.jsp"><input type = "hidden" value = "Pilgrimage" name="cat"><input type = "submit" value = "Pilgrimage"></form></li>
							<li><form action = "categories.jsp"><input type = "hidden" value = "Holidayspot" name="cat"><input type = "submit" value = "Holiday-Spots"></form></li>
							<li><form action = "categories.jsp"><input type = "hidden" value = "Onedaytours" name="cat"><input type = "submit" value = "One-Day Tours"></form></li>
							<li><form action = "categories.jsp"><input type = "hidden" value = "Informative" name="cat"><input type = "submit" value = "Informative"></form></li>
						</ul>
				</a></li>
				<li><a href = "customplanner.jsp"> Custom Trip </a></li>
				<li><a href = ""><% out.print(bean2.getuname()); %></a></li>
				<li><a href = "MyTrips.jsp"> My Trips </a></li>
				<li><a href="index.html">Log Out</a></li>
			</ul>
		</div>
		
			<p>ItsNameToursAndTravels.com</p>
			<p id = "intro">
				Maybe you do want a break!</br>
				Check out all the destinations we have to offer to you.</br>
			</p>
		</div>
	
		<script src = "mainscript.js"></script>
	</body>
	
</html>