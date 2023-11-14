package project;
import java.sql.*;
public class ConnectionProvider {
	private static final String url= "jdbc:mysql://localhost:3306/wmsjsp";
	private static final String userName="root";
	private static final String password ="jeni";
	
		public static Connection getCon()
		{
			try {
				   Class.forName("com.mysql.cj.jdbc.Driver");
				   Connection con= DriverManager.getConnection(url,userName,password);
				   
				   return con;
				}
				catch(Exception e) {
				   System.out.println(e);
				   return null;
				}
		}
			
		}
	

		

