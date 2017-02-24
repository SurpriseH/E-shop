package szu.hong.web.factory;

/*
 * 保存着发送邮件的账户、密码
 * */
public class EmailAccount {
	private static String name="javaweb_final@163.com";
	private static String password="szu12345678";
	public static String getName() {
		return name;
	}
	public static String getPassword() {
		return password;
	}
}
