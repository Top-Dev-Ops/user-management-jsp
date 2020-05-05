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

import bean.Brand;
import dao.DAOFactory;

/**
 * Servlet implementation class AddBrandAction
 */
@WebServlet("/AddBrandAction")
public class AddBrandAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = null, fileName = null;
		int type = 0;
		Brand brand = new Brand();
		boolean result;
        request.setCharacterEncoding("UTF-8");
        
        ServletContext context = request.getServletContext();
        String filePath = context.getInitParameter("file-upload") + "brands\\";
        
        if (ServletFileUpload.isMultipartContent(request)) {
        	try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest(new ServletRequestContext(request));
				for (FileItem temp : multiparts) {
					if (!temp.isFormField()) {
						fileName = new File(temp.getName()).getName();
						temp.write(new File(filePath + fileName));
					} else {
						switch (temp.getFieldName()) {
							case "name":
								name = temp.getString("UTF-8");
								continue;
							case "type":
								type = Integer.parseInt(temp.getString("UTF-8"));
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
        
		brand.setName(name);
		brand.setType(type);
		brand.setPic(fileName);
		DAOFactory dao = DAOFactory.getDao();
		result = dao.addBrand(brand);
		if (result) { response.sendRedirect("brandlist.jsp"); }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
