<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartAdd.jsp -->
<%
 	String oqty = request.getParameter("oqty");
 	String gnum = request.getParameter("gnum");
 	System.out.println(gnum+"/"+oqty);
 %>

<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>

<%
System.out.println("mall_cartAdd.jsp cb:" + cbean);

cbean.addGoods(gnum,oqty);
response.sendRedirect("mall_cartList.jsp");
%>
   