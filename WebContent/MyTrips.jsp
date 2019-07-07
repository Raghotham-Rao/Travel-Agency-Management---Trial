<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="bean2" class="com.forms.LoginBean" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
	
	<head>
		
		<title> Your Trips </title>
		
		<link rel = "stylesheet" type = "text/css" href="tripplannerstyle.css"></link>
		<link rel = "stylesheet" type = "text/css" href="tripdetailsstyle.css"></link>
		<link rel="stylesheet" type="text/css" href="homebuttonstyle.css">
		
	</head>
	
	<body>
		
		<div id = "header">
			My Trips
		</div>
		
		<%try {
			Connection con = ConnectionProvider.getCon();
			String search = "select * from packagetours p where tourid in (select tourid from bookings_package where username = '"+bean2.getuname()+"')";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(search);
			boolean check = false;
			while(rs.next()) {
				ArrayList<String> places = new ArrayList<String>(); 
				String placelist = rs.getString(2);
				int i = 0;
				String place = "";
				String chkString = rs.getString(2);
				while(i<chkString.length()){
					if(placelist.charAt(i)!='-'){
						place+=placelist.charAt(i);
					}
					else{
						places.add(place);
						place = "";
					}
					i++;
				}
				
				String tag = "<div class = \"placecard\"><p> "+rs.getString(10)+" </p><ul>";
				Iterator itr = places.iterator();
				while(itr.hasNext())
					tag += "<li>"+itr.next()+"</li>";
				tag += "</ul><br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp on: "+rs.getDate("datedeparture")+"<br>";
				tag += "<br><form action=\"canceltrip.jsp\" method=\"post\">";
				tag += "<input type = \"hidden\" value = \""+rs.getString(1)+"\" name=\"tourid\"/>";
				tag += "<input type = \"submit\" value = \"Cancel Trip\"/>";
				tag += "</form></div>"; 
				
				out.println(tag);
				check = true;
			}
			String search2 = "select * from bookings_custom where uname = '"+bean2.getuname()+"'";
			st = con.createStatement();
			rs = st.executeQuery(search2);
			while(rs.next()){
				String tag = "<div class = \"placecard\"><p> "+rs.getString(3)+"to"+rs.getString(4)+" </p><ul>";
				tag += "<li>From:"+rs.getString(3)+"</li>";
				tag += "<li>To:"+rs.getString(4)+"</li>";
				tag += "<li>Bus no:"+rs.getString(2)+"</li>";
				tag += "<li>Passengers:"+rs.getString(6)+"</li>";
				tag += "<li>Duration:"+rs.getString(5)+"</li>";
				tag += "<li>Date of Departure:"+rs.getString(7)+"</li>";
				tag += "</ul><br><form action=\"custcancel.jsp\" method=\"post\">";
				tag += "<input type = \"hidden\" value = \""+rs.getString(2)+"\" name=\"bid\"/>";
				tag += "<input type = \"submit\" value = \"Cancel Trip\"/>";
				tag += "</form></div>";
				out.println(tag);
				check = true;
			}
			if(!check){
				out.print("<div class = \"placecard\"><p> None Booked </p> </div>");
			}
		}catch(Exception e) {
			System.out.println(e);	
		}
		%>
		<a href="loginHandle.jsp"><img src="/images/60817.png" alt="Home" height="40" width="40" id="home" style="position: fixed;top: 20px;left: 20px;background-color: none;font-size:20px;color:white;font-family:"Tahoma";></a>
	</body>
	
</html>