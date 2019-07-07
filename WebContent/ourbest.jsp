<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<html>
	<head>
		<title> Plan your Trip</title>
		<link rel = "stylesheet" type = "text/css" href = "tripplannerstyle.css"></link>
	</head>
	
	<body>
	
		<div id = "header">
			Pilgrimages
		</div>
		
		<%try {
			Connection con = ConnectionProvider.getCon();
			String search = "select * from packagetours order by ratings desc";
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
				
				String tag = "<div class = \"placecard\"><p> "+rs.getString(13)+" </p><ul>";
				Iterator itr = places.iterator();
				while(itr.hasNext())
					tag += "<li>"+itr.next()+"</li>";
				tag += "</ul><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRatings: "+rs.getInt(8)+"<p class = \"detailsbutton\"><form action=\"tripdetails.jsp\" method=\"post\"><input type = \"hidden\" value = \""+rs.getString(1)+"\" name=\"tourid\"/><input type = \"submit\" value = \"View Details\"/></form></p></div>";
				
				out.println(tag);
				System.out.println(places.get(0));
				check = true;
			}
			if(!check){
				out.print("No Results found");
				System.out.println("No bruv!");
			}
			}catch(Exception e) {
				System.out.println(e);
				
		} %>
	</body>
</html>