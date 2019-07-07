<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title> Plan your Trip</title>
		<link rel = "stylesheet" type = "text/css" href = "tripplannerstyle.css"></link>
	</head>
	
	<body>
	
		<div id = "header">
			Package tours
		</div>
	
		<div id = "planner">
			<form action = "tripplanner.jsp">
				UserName: &nbsp <input type  = "text" name = "userid" placeholder = "Enter your username" required="true">
				Name: &nbsp <input type = "text" name = "uname" placeholder = "Enter your name" required="true"></br>
				Select State:<select id = "state" name = "state">
					<option> Karnataka </option>
					<option> Tamil Nadu </option>
					<option> Kerala </option>
					<option> Andhra Pradesh </option>
				</select>
				</br>
				Select Category:<select id = "category" name = "category">
					<option> Pilgrimage </option>
					<option> One Day Tours </option>
					<option> Informative </option>
				</select>
				</br>
				Duration:&nbsp <input type = "number" min = "1" max = "5" name = "duration">
				</br>
				<input type = "submit" value = "Done">
			</form>
		</div>
		<div id="cards">
		<%try {
			Connection con = ConnectionProvider.getCon();
			String search = "select * from packagetours where state='"+request.getParameter("state")+"' and category='"+request.getParameter("category")+"' and duration="+request.getParameter("duration");
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
				tag += "</ul>";
				tag += "<form action=\"tripdetails.jsp\" method=\"post\">";
				tag += "<input type = \"hidden\" value = \""+rs.getString(1)+"\" name=\"tourid\"/>";
				tag += "<input type = \"submit\" value = \"View Details\"/>";
				tag += "</form></div>";
				out.println(tag);
				System.out.println(places.get(0));
				check = true;
			}
			if(!check){
				out.print("<div class = \"placecard\"><p>No Results found</p></div>");
			}
			}catch(Exception e) {
				System.out.println(e);
		} %>
		</div>
	</body>
</html>