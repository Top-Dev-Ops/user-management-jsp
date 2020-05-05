<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.Brand"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    boolean f = false;
    
	Integer brand_id = Integer.parseInt(request.getParameter("brand_id")); 	
	DAOFactory dao = DAOFactory.getDao();
	System.out.println(brand_id);
	  
	f = dao.deleteBrand(brand_id);
	
	if(f == true)
		response.sendRedirect("brandlist.jsp");
	else
		out.print("Not Delete"); 
%>