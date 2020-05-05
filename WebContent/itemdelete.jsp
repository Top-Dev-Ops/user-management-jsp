<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Items"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	Integer items_id = Integer.parseInt(request.getParameter("items_id")); 	
	DAOFactory dao = DAOFactory.getDao();
	  
	f = dao.deleteItems(items_id);
	
	if(f == true)
		response.sendRedirect("itemlist.jsp");
	else
		out.print("Not Delete"); 
%>