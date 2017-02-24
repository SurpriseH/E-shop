package szu.hong.web.factory;

/*
 * 提供服务器信息的类，实现了提供服务器的ip地址的方法
 * */
import java.net.InetAddress;

public class MyServer {
	public static String getLocalIp(){
		String ip=null;
		try {
			InetAddress ia=null;
			ia=ia.getLocalHost();
			ip=ia.getHostAddress();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ip;
	}
}
