package szu.hong.web.service;

import szu.hong.web.dao.ShoppingCartDao;

public class ShoppingCartService {
	private String dbname="javafinal";
	private ShoppingCartDao shoppingCartDao=null;
	public ShoppingCartService(){
		shoppingCartDao=new ShoppingCartDao(dbname);
	}
	public void free(){
		shoppingCartDao.free();
	}
	public boolean insert(int uid,int tid,String tname,int hisdiscount,int price,int tcount){
		
		if(shoppingCartDao.is_exist(uid, tid))
		{
			return shoppingCartDao.update_tcount(uid,tid,tname,hisdiscount,price,tcount);
		}
		else
		{
			return shoppingCartDao.insert(uid, tid, tname, hisdiscount, price, tcount);
		}
	}
	public boolean delete(int uid,int tid){
		return shoppingCartDao.delete(uid, tid);
	}
	public boolean change(int uid,int tid,int tcount){
		return shoppingCartDao.changeTCount(uid, tid, tcount);
	}
}
