<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Collection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	Integer collection_id = Integer.parseInt(request.getParameter("collection_id")); 	
	DAOFactory dao = DAOFactory.getDao();
	  
	f = dao.deleteCollection(collection_id);
	
	if(f == true)
		response.sendRedirect("collectionlist.jsp");
	else
		out.print("Not Delete"); 
%>