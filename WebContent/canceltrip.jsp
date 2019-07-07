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
		String delete = "delete from bookings_package where tourid="+request.getParameter("tourid")+" and username='"+bean2.getuname()+"'";                   
		Statement st = con.createStatement();
		st.execute(delete);
		out.print("<script> window.location.href = \"MyTrips.jsp\"; </script>");
	}catch(Exception e){
		System.out.println(bean2.getuname());
	}
%>

</body>
</html>