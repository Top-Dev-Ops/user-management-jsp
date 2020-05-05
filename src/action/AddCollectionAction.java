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

import bean.Collection;
import dao.DAOFactory;

/**
 * Servlet implementation class AddCollectionAction
 */
@WebServlet("/AddCollectionAction")
public class AddCollectionAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int type = 0, on_use = 0;
		String title = null, author = null, intro = null, product_id = "";
		String fileName = null;

		Collection collection = new Collection();
		boolean result;
		request.setCharacterEncoding("UTF-8");
		
		ServletContext context = request.getServletContext();
		String filePath = context.getInitParameter("file-upload") + "collections\\";		
		
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
							case "type":
								type = Integer.parseInt(temp.getString("UTF-8"));
								continue;
							case "title":
								title = temp.getString("UTF-8");
								continue;
							case "author":
								author = temp.getString("UTF-8");
								continue;
							case "on_use":
								on_use = Integer.parseInt(temp.getString("UTF-8"));
								continue;
							case "intro":
								intro = temp.getString("UTF-8");
								continue;
							case "product_id":
								product_id = product_id + temp.getString() + ",";
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
		
		product_id = product_id.substring(0, product_id.length() - 1);

		collection.setType(type);
		collection.setOnUse(on_use);
		collection.setTitle(title);
		collection.setAuthor(author);
		collection.setIntro(intro);
		collection.setProductId(product_id);
		collection.setUrl(fileName);

		DAOFactory dao = DAOFactory.getDao();
		result = dao.addCollection(collection);
		if (result) {
			response.sendRedirect("collectionlist.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
