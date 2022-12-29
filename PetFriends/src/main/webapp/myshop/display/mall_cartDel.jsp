<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartDel.jsp -->

<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>
<%
	String gnum = request.getParameter("gnum");
	
	cbean.removeGoods(gnum); 
	
	response.sendRedirect("mall_cartList.jsp");
%>
