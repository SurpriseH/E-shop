package szu.hong.web.service;
import szu.hong.web.dao.OrderDao;

public class OrderService {
	private String dbname="javafinal";
	private OrderDao orderDao=null;
	public OrderService() {
		// TODO Auto-generated constructor stub
		orderDao=new OrderDao(dbname);
	}
	public void free(){
		orderDao.free();
	}
	public String submit_order(int uid,String str){
		return orderDao.submit_order(uid, str);
	}
	public boolean cancel_order(int uid,String str){
		return orderDao.cancel_order(uid, str);
	}
	public boolean delete_order(String str){
		return orderDao.delete_order(str);
	}
}
