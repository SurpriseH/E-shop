package szu.hong.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
/*
 * 提供连接数据库的方法
 * */
public class JDBC{


	public static Connection connect(String dbname){
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/"+dbname+"?"
	                + "user=root&password=&useUnicode=true&characterEncoding=UTF8";
			connection=DriverManager.getConnection(url);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public static void free(Statement sta,Connection con){
		try {
			if(sta!=null)
			{
				sta.close();
				sta=null;
			}
			if(con!=null)
			{
				con.close();
				con=null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
