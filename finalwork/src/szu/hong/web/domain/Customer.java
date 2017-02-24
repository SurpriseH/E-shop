package szu.hong.web.domain;
/*
 * 封装客户信息的类
 * */
public class Customer {
	private int id;
	private String name;
	private String sex;
	private String phone;
	private String email;
	private int spending;
	private int activate;
	private int admin;
	private String password;
	public Customer(String name,String password,String sex,String phone,String email){
		this.name=name;
		this.sex=sex;
		this.phone=phone;
		this.email=email;
		this.password=password;
	}
	public Customer(int id,String name,String password,String sex,String phone,String email,int spending,int activate,int admin){
		this.id=id;
		this.name=name;
		this.sex=sex;
		this.phone=phone;
		this.email=email;
		this.spending=spending;
		this.activate=activate;
		this.admin=admin;
		this.password=password;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getSex() {
		return sex;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public int getSpending() {
		return spending;
	}
	public int getActivate() {
		return activate;
	}
	public int getAdmin() {
		return admin;
	}
	public String getPassword() {
		return password;
	}
}
