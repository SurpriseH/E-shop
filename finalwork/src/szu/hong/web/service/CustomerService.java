package szu.hong.web.service;

/*
 * ��װCustomerDao������ײ����ݰ�Custoemr�ĸ��ֲ�����Ϊ�ϲ��ṩ����
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
			if(customerDao.insert_Customer(name, password,sex, phone, email)) return 1;//��ӳɹ�
			else return 0;//���ʧ��
		}
		return -1;//�û����Ѵ���
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
