package com.forms;
import java.sql.*;  
import static com.forms.Provider.*;  
  
public class ConnectionProvider {  
static Connection con=null;  
static{  
try{  
Class.forName(DRIVER);  
con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
}catch(Exception e){
	System.out.println(e);
}  
}  
  
public static Connection getCon(){  
    return con;  
}  
  
}  