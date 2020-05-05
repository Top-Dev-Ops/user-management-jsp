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

import bean.User;
import dao.DAOFactory;

/**
 * Servlet implementation class AddUserAction
 */
@WebServlet("/AddUserAction")
public class AddUserAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_name = null, pass_word = null, tel = null, email = null, name = null;
		Integer sex = null;
		User user;
		boolean result;
		request.setCharacterEncoding("UTF-8");
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload") + "users\\";

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest(new ServletRequestContext(request));
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						name = new File(item.getName()).getName();
						item.write(new File(filePath + name));
					} else {
						switch (item.getFieldName()) {
						case "username":
							user_name = item.getString("UTF-8");
							continue;
						case "pass_word":
							pass_word = item.getString("UTF-8");
							continue;
						case "sex":
							sex = Integer.parseInt(item.getString("UTF-8"));
							continue;
						case "tel":
							tel = item.getString("UTF-8");
							continue;
						case "email":
							email = item.getString("UTF-8");
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

		user = new User();
		user.setUserName(user_name);
		user.setPassword(pass_word);
		user.setSex(sex);
		user.setTel(tel);
		user.setEmail(email);
		user.setHeadPic(name);
		DAOFactory dao = DAOFactory.getDao();
		result = dao.addUser(user);
		if (result) {
			response.sendRedirect("userlist.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
