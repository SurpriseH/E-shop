package szu.hong.web.service;

/*
 * 封装CustomerDao类操作底层数据包Custoemr的各种操作，为上层提供方法
 * */
import szu.hong.web.dao.CustomerDao;
import szu.hong.web.domain.Customer;

public class CustomerService {
	
	private String dbname="javafinal";
	private CustomerDao customerDao=null;
	public CustomerService(){
		customerDao=new CustomerDao(dbname);
	}
	public Customer select_by_name(String name){
		return customerDao.select_by_name(name);
	}
	public boolean isname_exist(String name){
		return customerDao.isname_exist(name);
	}
	public int insert_Customer(String name,String password,String sex,String phone,String email){
		if(!isname_exist(name))
		{
			if(customerDao.insert_Customer(name, password,sex, phone, email)) return 1;//添加成功
			else return 0;//添加失败
		}
		return -1;//用户名已存在
	}
	public void free(){
		customerDao.free();
	}
	public boolean set_Activate(int id){
		return customerDao.set_Activate(id);
	}
	public static void main(String[] args) {
		
	}
}
