<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="bean2" class="com.forms.LoginBean" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
	
	<head>
		
		<title> Trip Details </title>
		
		<link rel = "stylesheet" type = "text/css" href="tripplannerstyle.css"></link>
		<link rel = "stylesheet" type = "text/css" href="tripdetailsstyle.css"></link>
		
	</head>
	
	<body>
		
		<div id = "header">
			Trip Details
		</div>
		
		<%try {
			Connection con = ConnectionProvider.getCon();
			String search = "select packagetours.*,guides.gname from packagetours,guides where guides.gid = packagetours.guideid and tourid='"+request.getParameter("tourid")+"'";
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
				
				String tag = "<div id = \"details\"><p> "+rs.getString("tourname")+" </p><p>Places:</p><ul>";
				Iterator itr = places.iterator();
				while(itr.hasNext())
					tag += "<li>"+itr.next()+"</li>";
				tag += "</ul>";
				tag += "<p> Duration: "+rs.getInt("duration")+" days</p>";
				tag += "<p> Date of Departure: "+rs.getDate("datedeparture")+"</p>";
				tag += "<p> Host Agency: "+rs.getString(6)+"</p>";
				tag += "<p> Guide : "+rs.getString(12)+"</p>";
				tag += "<p> Bus No.: "+rs.getString("busno")+"</p>";
				tag += "<p id = \"desc\">Description description description Description description descriptionDescription description description</p></div>";
				String checkqry = "select * from bookings_package where username='"+bean2.getuname()+"' and tourid='"+rs.getString(1)+"'";
				ResultSet rs2 = st.executeQuery(checkqry);
				
				if(!(rs2.first())){
					String tag2 = "<div id = \"amount\"><p> Amount </p><h4>Rs."+rs.getInt(5)+"</h4><form action=\"booktrip.jsp\"><input type = \"hidden\" value = \""+rs.getString(1)+"\" name=\"tourid\"><input type = \"hidden\" value = \""+bean2.getuname()+"\" name=\"uname\"><input type= \"submit\" value = \"Book Trip\" /></div>";				
					out.print(tag+tag2);
				}
				else{
					String tag2 = "<div id = \"amount\"><p> Amount </p><h4>Rs."+rs.getInt(5)+"</h4><br> Already Booked by you!";				
					out.print(tag+tag2);
				}
			}
			}catch(Exception e) {
				System.out.println(e);
				
		} %>
	</body>
	
</html>