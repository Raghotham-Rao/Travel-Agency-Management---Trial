<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.forms.signUp" %>
<%@ page import="com.forms.sendMail" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<jsp:useBean id="bean1" class="com.forms.SignupBean" scope = "page" />
<jsp:setProperty name="bean1" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% bean1.setUname(request.getParameter("uname"));
	bean1.setPass(request.getParameter("pass"));
	bean1.setname(request.getParameter("name"));
	bean1.setaddress(request.getParameter("address"));
	bean1.setage(request.getParameter("age"));
	bean1.setemail(request.getParameter("email"));
	bean1.setphone(request.getParameter("phno"));
	%>
<% if(signUp.validate(bean1)){
	sendMail.send(bean1.getemail());
	response.sendRedirect("Thankyou.html");
}
else
	out.print("<script> alert(\"couldn't register you. Please cheack all fields before submission.\")</script>");
%>
</body>
</html>