package com.forms;
import java.sql.*;
public class logIn {
	public static boolean validate(LoginBean bean) {
		boolean isuser = false;
		
		try {
			Connection con = ConnectionProvider.getCon();
			String search = "select * from users where username='"+bean.getuname()+"' and password='"+bean.getpass()+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(search);
			if(rs.next()) {
				isuser = true;
			}
			else
				isuser = false;
			}catch(Exception e) {
				System.out.println(e);
				isuser = false;
		}
		
		return isuser;
	}
}
