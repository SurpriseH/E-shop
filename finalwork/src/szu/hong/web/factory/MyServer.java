package szu.hong.web.factory;

/*
 * �ṩ��������Ϣ���࣬ʵ�����ṩ��������ip��ַ�ķ���
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
