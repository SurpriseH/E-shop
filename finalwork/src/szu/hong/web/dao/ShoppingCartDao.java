package szu.hong.web.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ShoppingCartDao {
	private Connection connection;
	private Statement statement;
	public ShoppingCartDao(String dbname)
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
	public boolean is_exist(int uid,int tid){
		int id=-1;
		try {
			String sql="select * from shopping_cart where uid='"+uid+"'and tid='"+tid+"'";
			//System.out.println("exist:"+sql);
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				id=resultSet.getInt(1);
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(id!=-1) return true;
		else return false;
	}
	public boolean insert(int uid,int tid,String tname,int hisdiscount,int price,int tcount)
	{
		int i=-1;
		try {
			String sql="insert into shopping_cart(uid,tid,tname,hisdiscount,price,tcount) values('"+uid+"','"+tid+"','"+tname+"','"+hisdiscount+"','"+price+"','"+tcount+"')";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
	public boolean delete(int uid,int tid){
		int i=-1;
		try {
			String sql="delete from shopping_cart where uid='"+uid+"' and tid='"+tid+"'";
			//System.out.println("update2:"+sql);
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
	public boolean update_tcount(int uid,int tid,String tname,int hisdiscount,int price,int tcount){
		int lasttcount=-1;
		try {
			String sql="select * from shopping_cart where uid='"+uid+"'and tid='"+tid+"'";
			//System.out.println("update:"+sql);
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				lasttcount=resultSet.getInt("tcount");
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i=-1;
		if(lasttcount>=0)
		{
			lasttcount+=tcount;
			try {
				String sql="update shopping_cart set tcount="+lasttcount+" where uid='"+uid+"'and tid='"+tid+"'";
				//System.out.println("update2:"+sql);
				i=statement.executeUpdate(sql);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(i!=-1) return true;
		else return false;
	}
	public boolean changeTCount(int uid,int tid,int tcount){
		int i=-1;
		try {
			String sql="update shopping_cart set tcount="+tcount+" where uid='"+uid+"'and tid='"+tid+"'";
			//System.out.println("update2:"+sql);
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
}
