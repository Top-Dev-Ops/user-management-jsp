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
 * Servlet implementation class EditCollectionAction
 */
@WebServlet("/EditCollectionAction")
public class EditCollectionAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = 0, type = 0, on_use = 0;
		String title = null, author = null, intro = null, product_id = "";
		ServletContext context = request.getServletContext();
        String filePath = context.getInitParameter("file-upload") + "collections\\";
		String fileName = null;
        
		Collection collection;
		boolean result;
        request.setCharacterEncoding("UTF-8");
        
        
        if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
						.parseRequest(new ServletRequestContext(request));
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						fileName = new File(item.getName()).getName();
						if(!fileName.equals("")) {
							item.write(new File(filePath + fileName));
						}
					} else {
						switch (item.getFieldName()) {
						case "intro":
							intro = item.getString("UTF-8");
							continue;
						case "author":
							author = item.getString("UTF-8");
							continue;
						case "id":
							id = Integer.parseInt(item.getString("UTF-8"));
							continue;
						case "title":
							title = item.getString("UTF-8");
							continue;
						case "on_use":
							on_use = Integer.parseInt(item.getString("UTF-8"));
							continue;
						case "type":
							type = Integer.parseInt(item.getString("UTF-8"));
							continue;
						case "product_id":
							product_id = product_id + item.getString("UTF-8") + ",";
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
		
		collection = new Collection();
		collection.setId(id);
		collection.setType(type);
		collection.setOnUse(on_use);
		collection.setTitle(title);
		collection.setAuthor(author);
		collection.setProductId(product_id);
		collection.setIntro(intro);
		if(!fileName.equals("") ) {
			collection.setUrl(fileName);
		}
		
		DAOFactory dao = DAOFactory.getDao();
		result = dao.updateCollection(collection);

		if (result) {
			response.sendRedirect("collectionlist.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
