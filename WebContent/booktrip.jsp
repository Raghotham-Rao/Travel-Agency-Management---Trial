<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.forms.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="bean2" class="com.forms.LoginBean" scope = "session"></jsp:useBean>
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
		String insert = "call bookpack('"+request.getParameter("tourid")+"','"+bean2.getuname()+"')";
		Statement st = con.createStatement();
		String getemail = "select email,datedeparture,price,agency from users,packagetours where username = '"+request.getParameter("uname")+"' and tourid = '"+request.getParameter("tourid")+"'";
		Statement st2 = con.createStatement();
		if(st.executeUpdate(insert)==1){
			ResultSet rs = st2.executeQuery(getemail);
			rs.next();
			sendMail.sendreceipt(rs.getString("email"));
			String tag = "<div id = \"receipt\">";
			tag += "<h3> itsnametoursandtravels.com </h3> <p>";
			tag += "User Name: "+ bean2.getuname()+"<br>tour id : "+request.getParameter("tourid")+"<br>";
			tag += "Agency: "+ rs.getString("agency")+"<br>Date : "+rs.getString("datedeparture")+"<br>";
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