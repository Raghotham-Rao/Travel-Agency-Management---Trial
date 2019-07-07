package com.forms;
import java.sql.*;  
public class signUp {  
  
public static boolean validate(SignupBean bean){  
boolean status=false;  
try{  
Connection con=ConnectionProvider.getCon();  
              
PreparedStatement ps=con.prepareStatement( "insert into users values(?,?,?,?,?,?,?)");  
  
ps.setString(1,bean.getUname());
ps.setString(2, bean.getPass());  
ps.setString(3,bean.getname());
int x = Integer.parseInt(bean.getage());
ps.setInt(4, x);
ps.setString(5,bean.getphone());
ps.setString(6,bean.getemail());
ps.setString(7,bean.getaddress());

if(ps.executeUpdate()!=0)
	return true;
return false;
              
}catch(Exception e){System.out.println(e);}  
  

return status;  
  
}  
}  