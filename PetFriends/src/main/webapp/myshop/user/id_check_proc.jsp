<%@page import="my.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
UserDao udao=UserDao.getInstance();
String userid = request.getParameter("userid");
boolean isCheck = udao.searchId(userid);       

System.out.println("isCheck:" + isCheck);
	String str;
	if(isCheck == true){
		str = "NO";
		out.print(str);
	}
	else{
		str = "YES";
		out.print(str);
	}
%>