package szu.hong.web.service;

import szu.hong.web.dao.TradeDao;

public class TradeService {
	private String dbname="javafinal";
	private TradeDao tradeDao=null;
	public TradeService(){
		tradeDao=new TradeDao(dbname);
	}
	public void free(){
		tradeDao.free();
	}
	public boolean addTrade(String tname,int price,int discount,int discount_one,int discount_two,int discount_three,int count,String img,String information){
		return tradeDao.insert(tname, price, discount, discount_one, discount_two, discount_three, count, img, information);
	}
	public boolean changeCount(int tid,int count){
		return tradeDao.changeCount(tid, count);
	}
}
