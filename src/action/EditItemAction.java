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
 * Servlet implementation class EditItemAction
 */
@WebServlet("/EditItemAction")
public class EditItemAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse
	  response) throws ServletException, IOException {
	  
	  
		  int id = 0, status = 0, count = 0, category = 0; 
		  Double price = null; 
		  String product_num = null, name = null, brand = null, intro = null, fileName = null, all_pic = "", temp_url;
		  
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
							temp_url = new File(temp.getName()).getName();
							if(!temp.getFieldName().contains("file_upload_small_")) {
								fileName = temp_url;
							}
							if(!temp_url.equals("")) {
								temp.write(new File(filePath + temp_url));
							}
						} else {
							switch (temp.getFieldName()) {
								case "product_num":
									product_num = temp.getString("UTF-8");
									continue;
								case "name":
									name = temp.getString("UTF-8");
									continue;
								case "brand":
									brand = temp.getString("UTF-8");
									continue;
								case "intro":
									intro = temp.getString("UTF-8");
									continue;
								case "item_id":
									id = Integer.parseInt(temp.getString("UTF-8"));
									continue;
								case "status":
									status = Integer.parseInt(temp.getString("UTF-8"));
									continue;
								case "count":
									count = Integer.parseInt(temp.getString("UTF-8"));
									continue;
								case "category":
									category = Integer.parseInt(temp.getString("UTF-8"));
									continue;
								case "price":
									price = Double.parseDouble(temp.getString("UTF-8"));
									continue;
								case "all_pic_url_1":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
								case "all_pic_url_2":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
								case "all_pic_url_3":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
								case "all_pic_url_4":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
								case "all_pic_url_5":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
								case "all_pic_url_6":
									all_pic = all_pic + temp.getString("UTF-8") + ",";
									break;
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
		  
		  
		  item.setId(id);
		  item.setStatus(status);
		  item.setCount(count);
		  item.setCategory(category);
		  item.SetPrice(price);
		  item.setName(name);
		  item.setProductNum(product_num);
		  item.setBrand(brand);
		  item.setIntro(intro);
		  if(!fileName.equals("")) {
			  item.setPic(fileName);
		  }
		  all_pic = all_pic.substring(0, all_pic.length()-1);
		  item.setAllPic(all_pic);
		  DAOFactory dao = DAOFactory.getDao();
		  result = dao.updateItem(item);
		  
		  if (result) { response.sendRedirect("itemlist.jsp"); }
	  
	  }
	 

	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  doGet(request, response);
	  }

}
