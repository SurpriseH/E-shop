package szu.hong.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;

import szu.hong.web.service.TradeService;
public class AddTradeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
    // �ϴ��ļ��洢Ŀ¼
    private static final String UPLOAD_DIRECTORY = "finalwork/WebRoot/img";
 
    // �ϴ�����
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8;");
		request.setCharacterEncoding("utf8");
		 // �����ϴ�����
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // ������ʱ�洢Ŀ¼
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // ��������ļ��ϴ�ֵ
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // �����������ֵ (�����ļ��ͱ�����)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // ������ʱ·�����洢�ϴ����ļ�
        // ���·����Ե�ǰӦ�õ�Ŀ¼
        String uploadPath = getServletContext().getRealPath("./");
        uploadPath=uploadPath.substring(0, uploadPath.indexOf(".metadata"))+UPLOAD_DIRECTORY;
        // ���Ŀ¼�������򴴽�
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String img=null;
        HashMap<String,String> hashMap=new HashMap<String, String>();
        try {
            // ���������������ȡ�ļ�����
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                // ����������
                for (FileItem item : formItems) {
                    // �����ڱ��е��ֶ�
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        img="img/"+fileName;
                        File storeFile = new File(filePath);
                        // �ڿ���̨����ļ����ϴ�·��
                        System.out.println(filePath);
                        // �����ļ���Ӳ��
                        item.write(storeFile);
                        request.setAttribute("message",
                            "�ļ��ϴ��ɹ�!");
                    }
                    else{
                    	String name = item.getFieldName();  
                        String value = item.getString("utf-8");
                       hashMap.put(name, value);
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "������Ϣ: " + ex.getMessage());
        }
        String tname=hashMap.get("tname");
        int price=Integer.parseInt(hashMap.get("price"));
        int discount=Integer.parseInt(hashMap.get("discount"));
        int discount_one=10,discount_two=10,discount_three=10;
        if(discount==1){
        	discount_one=Integer.parseInt(hashMap.get("discount_one"));
        	discount_two=Integer.parseInt(hashMap.get("discount_two"));
        	discount_three=Integer.parseInt(hashMap.get("discount_three"));
        }
        int count=Integer.parseInt(hashMap.get("count"));
        String information=hashMap.get("information");
        TradeService tradeService=new TradeService();
        boolean result=tradeService.addTrade(tname, price, discount, discount_one, discount_two, discount_three, count, img, information);
        tradeService.free();
        PrintWriter out = response.getWriter();
        if(result){
        	out.print("<script>alert('��ӳɹ�');<script>");
        }else{
        	out.print("<script>alert('���ʧ��');<script>");
        }
        out.print("<script>window.location.href='/page/admin/add_trade.jsp';</script>");
        out.flush();
        out.close();
	}
}
