package com.sise.OnlineBookStore;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.persistence.Id;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet(name = "InfoUploadServlet", urlPatterns = { "/InfoUploadServlet" })
public class InfoUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		HashMap<String, String> h=new HashMap<String, String>();
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("dd");
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset = utf-8"); 
		
		if (!ServletFileUpload.isMultipartContent(request)) { 
			return; 
		} 
		

		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory(); 
		
		diskFileItemFactory.setRepository(new File("f://")); 

		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory); 

		try { 
			
		List<FileItem> list = servletFileUpload.parseRequest(request); 
		
		for (FileItem fileItem : list) { 
			
		if (fileItem.isFormField()) { 
		// 普通表单 
		String name = fileItem.getFieldName(); 
		String value = fileItem.getString("utf-8");
		System.out.println(name+":"+value);
		h.put(name, value);
		
		
		} else { 
		// 上传表单 写文件 调用封装好的方法 
			
				File file = new File("D:/img/bookimg/"); 
				if (!file.exists()) { 
					// 文件夹不存在 创建文件夹 
					file.mkdirs(); 
				} 
				// 在img文件夹中创建文件 
				String name = fileItem.getName(); 
				h.put("imgurl", name);
				String filename = name.substring(name.lastIndexOf("\\") + 1); 
				System.out.println(name.lastIndexOf("//"));
				System.out.println(filename);
				h.put("imgurl",filename);
				File file2 = new File(file, filename); 
				try { 
					if(!filename.equals(""))
						fileItem.write(file2);
					System.out.println(h.get("operate")+"ss123");
				
				} catch (Exception e) { 
					e.printStackTrace(); 
				} 
		} 
		} 
		if (h.get("operate").equals("insert")) {
			insertProduct(h);
		}
		else if(h.get("operate").equals("edit")){
			editProduct(h);
		}
		response.sendRedirect("adminPage.jsp");
		} catch (FileUploadException e) { 
		// TODO Auto-generated catch block 
		e.printStackTrace(); 
		} 

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void insertProduct(HashMap<String, String> h) {
		//fengzhuangcjavaBean
		System.out.println(h.get("price"));
		products p=new products();
		p.setName(h.get("name"));
		p.setPrice(Double.parseDouble(h.get("price")));
		p.setCategory(h.get("category"));
		p.setPnum(Integer.parseInt(h.get("pnum")));
		p.setImgurl(h.get("imgurl"));
		p.setDescription(h.get("description"));
		JDBCUtils.insertProduct(p);
		
		
	}
	public void editProduct(HashMap<String, String> h) {
		products p=new products();
		p.setId(Integer.parseInt(h.get("id")));
		p.setName(h.get("name"));
		p.setPrice(Double.parseDouble(h.get("price")));
		p.setCategory(h.get("category"));
		p.setPnum(Integer.parseInt(h.get("pnum")));
		p.setImgurl(h.get("imgurl"));
		p.setDescription(h.get("description"));
		JDBCUtils.EditProduct(p);
	}
	public void delProduct(int id) {
		
	}

}
