<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartEdit.jsp -->
<%
 	String gnum = request.getParameter("gnum");
 	String oqty = request.getParameter("oqty");
 	System.out.println(gnum+"/"+oqty);
%>

<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>

 <%
 cbean.setEdit(gnum,oqty); 
 
 %>
 <script>
 	alert('주문 수량 변경되었습니다.');
 	location.href = "mall_cartList.jsp";
 </script>