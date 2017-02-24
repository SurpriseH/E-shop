package szu.hong.web.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TradeDao {
	private Connection connection;
	private Statement statement;
	public TradeDao(String dbname)
	{
		try {
			connection=JDBC.connect(dbname);
			statement=connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void free()
	{
		JDBC.free(statement, connection);
	}
	public boolean insert(String tname,int price,int discount,int discount_one,int discount_two,int discount_three,int count,String img,String information){
		int i=-1;
		try {
			String sql="insert into trade(tname,price,discount,discount_one,discount_two,discount_three,count,img,information) values('"+tname+"','"+price+"','"+discount+"','"+discount_one+"','"+discount_two+"','"+discount_three+"','"+count+"','"+img+"','"+information+"')";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
	public boolean changeCount(int tid,int count){
		int i=-1;
		try {
			String sql="update trade set count='"+count+"' where tid='"+tid+"'";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
}
