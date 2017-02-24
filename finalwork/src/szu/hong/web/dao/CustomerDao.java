package szu.hong.web.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import szu.hong.web.domain.Customer;
/*
 * 提供底层操作Customer表的操作，如根据用户名查询
 * */
public class CustomerDao {
	private Connection connection;
	private Statement statement;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	public CustomerDao(String dbname)
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
	public Customer select_by_name(String name)
	{
		Customer customer = null;
		try{
			String sql="select * from customer where uname='"+name+"'";
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				int id=resultSet.getInt(1);
				String hisname=resultSet.getString(2);
				String password=resultSet.getString(3);
				String sex=resultSet.getString(4);
				String phone=resultSet.getString(5);
				String email=resultSet.getString(6);
				int spending=resultSet.getInt(7);
				int activate=resultSet.getInt(8);
				int admin=resultSet.getInt(9);
				customer=new Customer(id,hisname,password,sex, phone, email,spending,activate,admin);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return customer;
	}
	public boolean isname_exist(String name)
	{
		int id=-1;
		try {
			String sql="select * from customer where uname='"+name+"'";
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
	public boolean insert_Customer(String name,String password,String sex,String phone,String email)
	{
		int i=-1;
		try {
			String sql="insert into customer(uname,password,sex,phone,email) values('"+name+"','"+password+"','"+sex+"','"+phone+"','"+email+"')";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
	public boolean set_Activate(int id){
		int i=-1;
		try {
			String sql="update customer set activate=1 where uid='"+id+"'";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(i!=-1) return true;
		else return false;
	}
}
