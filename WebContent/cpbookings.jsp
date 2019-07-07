<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="bean2" class = "com.forms.LoginBean" scope = "session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	try{
		Connection con = ConnectionProvider.getCon();
		String insert = "insert into bookings_custom values('"+bean2.getuname()+"','"+request.getParameter("bid")+"','"+request.getParameter("srccity")+"','"+request.getParameter("dstcity")+"',"+request.getParameter("duration")+","+request.getParameter("passengers")+",'"+request.getParameter("ddate")+"','"+request.getParameter("price")+"')";
		Statement st = con.createStatement();
		String getemail = "select email,srccity,destcity,depdate,price,bid,agency from users,bookings_custom,buses where username = '"+request.getParameter("uname")+"' and users.username = bookings_custom.uname and bookings_custom.bid = buses.bno";
		Statement st2 = con.createStatement();
		if(st.executeUpdate(insert)==1){
			ResultSet rs = st2.executeQuery(getemail);
			rs.next();
			sendMail.sendreceipt(rs.getString("email"));
			String tag = "<div id = \"receipt\">";
			tag += "<h3> itsnametoursandtravels.com </h3> <p>";
			tag += "User Name: "+ bean2.getuname()+"<br>Source: "+request.getParameter("srccity")+"<br>Destination: "+request.getParameter("dstcity")+"<br>";
			tag += "Agency: "+ rs.getString("agency")+"<br>Date : "+rs.getString("depdate")+"<br>";
			tag += "Due amount: Rs."+ rs.getInt("price");
			tag += "</br><b bgcolor=\"yellow\"> Please pay the amount within 3 working days at the respective agency </b>";
			out.println(tag);
		}
	}catch(Exception e){
		System.out.println(e);
	}
%>

</body>
</html>