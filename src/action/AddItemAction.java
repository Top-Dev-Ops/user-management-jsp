package action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import bean.Items;
import dao.DAOFactory;

/**
 * Servlet implementation class AddItemAction
 */
@WebServlet("/AddItemAction")
public class AddItemAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String product_num = null, name = null, all_pic = "", pic = "";
		int status = 0, category = 0, sub_category = 0;
		String style = "";
		String fileName = null;
		
		Items item = new Items();
		boolean result;
        request.setCharacterEncoding("UTF-8");
        
        ServletContext context = request.getServletContext();
        String filePath = context.getInitParameter("file-upload") + "products\\";
        
        if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest(new ServletRequestContext(request));
				for (FileItem temp : multiparts) {
					if (!temp.isFormField()) {
						fileName = new File(temp.getName()).getName();
						if(!fileName.equals("") ) {
							temp.write(new File(filePath + fileName));
						}
						if(temp.getFieldName().equals("file_upload") && !fileName.equals("")) {
							pic = fileName;
						}
						if(temp.getFieldName().equals("file_upload_small_1") && !fileName.equals("")) {
							all_pic = fileName + ",";
						}
						if(temp.getFieldName().equals("file_upload_small_2") && !fileName.equals("")) {
							all_pic = all_pic + fileName + ",";
						}
						if(temp.getFieldName().equals("file_upload_small_3") && !fileName.equals("")) {
							all_pic = all_pic + fileName + ",";
						}
						if(temp.getFieldName().equals("file_upload_small_4") && !fileName.equals("")) {
							all_pic = all_pic + fileName + ",";
						}
						if(temp.getFieldName().equals("file_upload_small_5") && !fileName.equals("")) {
							all_pic = all_pic + fileName + ",";
						}
						if(temp.getFieldName().equals("file_upload_small_6") && !fileName.equals("")) {
							all_pic = all_pic + fileName + ",";
						}
						
					} else {
						switch (temp.getFieldName()) {
							case "product_num":
								product_num = temp.getString("UTF-8");
								continue;
							case "name":
								name = temp.getString("UTF-8");
								continue;
							case "status":
								status = Integer.parseInt(temp.getString("UTF-8"));
								continue;
							case "category":
								category = Integer.parseInt(temp.getString("UTF-8"));
								continue;
							case "sub_category":
								sub_category = Integer.parseInt(temp.getString("UTF-8"));
								continue;
							case "styles":
								style = style + temp.getString() + ",";
								continue;
						}

					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        
        style = style.substring(0, style.length()-1);
		if(!all_pic.equals("")) {
			all_pic = all_pic.substring(0, all_pic.length()-1);
		}
        
		item.setPic(pic);
		item.setProductNum(product_num);
		item.setName(name);
		item.setStatus(status);
		item.setCategory(category);
		item.setSubCategory(sub_category);
		item.setStyle(style);
		item.setAllPic(all_pic);

		DAOFactory dao = DAOFactory.getDao();
		result = dao.addItem(item);
		if(result) { response.sendRedirect("itemlist.jsp"); }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
