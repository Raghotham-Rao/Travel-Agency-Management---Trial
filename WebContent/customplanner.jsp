<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.forms.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="bean2" class="com.forms.LoginBean"></jsp:useBean>
<!doctype html>
<html>
	
	<head>
		<title> Custom Planner</title>
		<link rel = "stylesheet" type="text/css" href="customstyle.css">
	</head>
	
	<body>
		<div id="header">
			<h1> CUSTOM PLANNER </h1>
		</div>

		<div id = "planner">
			<form action="customplanner.jsp">
				Source:<input type="text" placeholder="Enter the source city" required="true" name="src">
				</br>
				Destination:<input type="text" placeholder="Enter the Destination city" required="true" name="dest">
				</br>
				Duration:&nbsp <input type = "number" min = "1" max = "5" required="true" name="durn">
				</br>
				Date of Departure: <input type = "date" required="true" name="depdate">
				</br>
				No of Passengers:&nbsp <input type = "number" min = "1" max = "25" required="true" name="nopass">
				</br>
				Bus Type:<select id = "category" required="true" name="btype">
					<option> AC </option>
					<option> Non AC </option>
					<option> Sleeper Coach </option>
					<option> Mini Bus </option>
				</select>
				<br>
				<input type = "submit" value = "Done">
			</form>
		</div>
		
		<%
			try{
				Connection con = ConnectionProvider.getCon();
				String olddate = request.getParameter("depdate");
				String date = olddate.substring(6, 10)+"-"+olddate.substring(3, 5)+"-"+olddate.substring(0, 2);
				String search = "select * from buses where freedate>='"+date+"' and type='"+request.getParameter("btype")+"' and noofseats>="+(request.getParameter("nopass"));
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(search);
				if(rs.first()){
					int price = Integer.parseInt(request.getParameter("durn")) * 800 + Integer.parseInt(request.getParameter("nopass"))*100;
					String tag = "";
					tag += "<div id=\"details\">";
					tag += "<p>From: "+request.getParameter("src")+" <br>To: "+request.getParameter("dest")+" <br>Duration: "+request.getParameter("durn")+" <br>Date of Departure: "+request.getParameter("depdate")+" <br>No of Passengers: "+request.getParameter("nopass")+" <br>Bus no: "+rs.getString("bno")+" <br>Bus type: "+rs.getString("type")+" <br>Travel Agency: "+rs.getString("agency")+" <br>Price: Rs."+price+" <br></p>";
					tag += "<form action=\"cpbookings.jsp\">";
					tag += "<input type=\"hidden\" value=\""+request.getParameter("src")+"\" name=\"srccity\">";
					tag += "<input type=\"hidden\" value=\""+request.getParameter("dest")+"\" name=\"dstcity\">";
					tag += "<input type=\"hidden\" value=\""+request.getParameter("durn")+"\" name=\"duration\">";
					tag += "<input type=\"hidden\" value=\""+request.getParameter("nopass")+"\" name=\"passengers\">";
					tag += "<input type=\"hidden\" value=\""+request.getParameter("depdate")+"\" name=\"ddate\">";
					tag += "<input type=\"hidden\" value=\""+price+"\" name=\"price\">";
					tag += "<input type=\"hidden\" value=\""+rs.getString("bno")+"\" name=\"bid\">";
					tag +="<input type=\"submit\" value=\"Confirm\"></form></div>";
					out.println(tag);
				}
				else{
					out.println("No results found");
				}
			}catch(Exception e){
				System.out.println(e);
			}
		%>
	</body>
	
</html>