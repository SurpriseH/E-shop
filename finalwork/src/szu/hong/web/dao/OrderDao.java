package szu.hong.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class OrderDao {
	private Connection connection;
	private Statement statement;
	public OrderDao(String dbname) {
		// TODO Auto-generated constructor stub
		try {
			connection=JDBC.connect(dbname);
			statement=connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void free(){
		JDBC.free(statement, connection);
	}
	private double getSpending(int uid){ //获取会员的消费额度
		double spending=0;
		try {
			String sql="select * from customer where uid='"+uid+"'";
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				spending=resultSet.getDouble("spending");
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return spending;
	}
	private int getCount(int tid){ //获取商品的剩余数量
		int count=0;
		try {
			String sql="select * from trade where tid='"+tid+"'";
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				count=resultSet.getInt("count");
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	private int getBuyCount(int tid){
		int count=0;
		try {
			String sql="select * from trade where tid='"+tid+"'";
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				count=resultSet.getInt("buy_count");
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	private boolean insert_one_order(int uid,int tid,String date,int tcount,int hisdiscount,int price){
		int i1=-1,i2=-1,i3=-1,i4=-1,i5=-1;
		try {
			String sql="insert into order_history(uid,tid,date,tcount,hisdiscount,price) values('"+uid+"','"+tid+"','"+date+"','"+tcount+"','"+hisdiscount+"','"+price+"')";
			i1=statement.executeUpdate(sql);
			sql="update trade set count="+(getCount(tid)-tcount)+" where tid='"+tid+"'";
			i2=statement.executeUpdate(sql);
			sql="delete from shopping_cart where uid='"+uid+"' and tid='"+tid+"'";
			i3=statement.executeUpdate(sql);
			double spending=tcount*hisdiscount*price/10.0;
			sql="update customer set spending="+(getSpending(uid)+spending)+" where uid='"+uid+"'";
			i4=statement.executeUpdate(sql);
			sql="update trade set buy_count="+(getBuyCount(tid)+tcount)+" where tid='"+tid+"'";
			i5=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i1!=-1&&i2!=-1&&i3!=-1&&i4!=-1&&i5!=-1) return true;
		else return false;
	}
	private boolean cancel_one_order(int uid,int tid,String date,int tcount,int hisdiscount,int price){
		int i1=-1,i2=-1,i3=-1,i4=-1;
		try {
			String sql="delete from order_history where uid='"+uid+"' and tid='"+tid+"' and date='"+date+"'";
			i1=statement.executeUpdate(sql);
			sql="update trade set count="+(getCount(tid)+tcount)+" where tid='"+tid+"'";
			i2=statement.executeUpdate(sql);
			double spending=tcount*hisdiscount*price/10.0;
			sql="update customer set spending="+(getSpending(uid)-spending)+" where uid='"+uid+"'";
			i3=statement.executeUpdate(sql);
			sql="update trade set buy_count="+(getBuyCount(tid)-tcount)+" where tid='"+tid+"'";
			i4=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i1!=-1&&i2!=-1&&i3!=-1&&i4!=-1) return true;
		else return false;
	}
	private boolean delete_one_order(int uid,int tid,String date){
		int i1=-1;
		try {
			String sql="delete from order_history where uid='"+uid+"' and tid='"+tid+"' and date='"+date+"'";
			i1=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i1!=-1) return true;
		else return false;
	}
	private boolean haveMore(int tid,int tcount){//判断当前订单的购买数量是否超过库存
		int count=getCount(tid);
		if(count>=tcount) return true;
		else return false;
	}
	private void setCustomerType(int uid,int type){
		int i=-1;
		try {
			String sql="update customer set type='"+type+"' where uid='"+uid+"'";
			i=statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	private String getTradeNameById(int tid){
		String name=null;
		int count=0;
		try {
			String sql="select * from trade where tid='"+tid+"'";
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
				name=resultSet.getString("tname");
				count=resultSet.getInt("count");
				break;
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name+"数量为"+count;
	}
	public String submit_order(int uid,String str){
		String strArray[]=str.split(";");
		for(int i=0;i<strArray.length;i++)
		{
			String array[]=strArray[i].split(",");
			int tid=Integer.parseInt(array[0]);
			int tcount=Integer.parseInt(array[1]);
			if(!haveMore(tid,tcount)) return getTradeNameById(tid);
		}
		Date date=new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String current = sdf.format(date);
	    //System.out.println(current);
		for(int i=0;i<strArray.length;i++)
		{
			String array[]=strArray[i].split(",");
			int tid=Integer.parseInt(array[0]);
			int tcount=Integer.parseInt(array[1]);
			int hiscount=Integer.parseInt(array[2]);
			int price=Integer.parseInt(array[3]);
			insert_one_order(uid,tid,current,tcount,hiscount,price);
		}
		double spending=getSpending(uid);
		if(spending>1000)
			setCustomerType(uid,1);
		else if(spending>2000)
			setCustomerType(uid, 2);
		else if(spending>3000)
			setCustomerType(uid, 3);
		return null;
	}
	public boolean cancel_order(int uid,String str){
		String strArray[]=str.split(";");
		for(int i=0;i<strArray.length;i++)
		{
			String array[]=strArray[i].split(",");
			int tid=Integer.parseInt(array[0]);
			int tcount=Integer.parseInt(array[1]);
			int hiscount=Integer.parseInt(array[2]);
			int price=Integer.parseInt(array[3]);
			String date=array[4];
			if(!cancel_one_order(uid,tid,date,tcount,hiscount,price)) return false;
		}
		return true;
	}
	public boolean delete_order(String str){
		String strArray[]=str.split(";");
		for(int i=0;i<strArray.length;i++)
		{
			String array[]=strArray[i].split(",");
			int uid=Integer.parseInt(array[0]);
			int tid=Integer.parseInt(array[1]);
			String date=array[2];
			if(!delete_one_order(uid,tid,date)) return false;
		}
		return true;
	}
}
