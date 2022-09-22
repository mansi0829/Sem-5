package a8;

import java.sql.*;
public class a8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://10.10.12.108/t31231db","t31231","t31231");  
			
			Statement stmt=con.createStatement();  
			System.out.println("To add an entry in Employee: ");
			String Query = "insert into `Employee` values (`18`, `14`, `Atharva`, `Patil`, `SDE`,`40`, `1 April 2021`)";
			ResultSet rs=stmt.executeQuery("select * from Employee");  
			while(rs.next())  
			System.out.println(rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getString(4)
			);  
			con.close();  
			}catch(Exception e){ System.out.println(e);}  
		
	}

}
