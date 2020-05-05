<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Items"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	Integer user_id = Integer.parseInt(request.getParameter("user_id"));
	DAOFactory dao = DAOFactory.getDao();
	  
	f = dao.deleteUser(user_id);
	
	if(f == true)
		response.sendRedirect("userlist.jsp");
	else
		response.sendRedirect("userlist.jsp");
		/* System.out.print("Not Delete");  */
%>