<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_calculate.jsp -->
<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="odao" class="my.shop.mall.OrderDao" scope="session"/>

<%
	int uno = (Integer)session.getAttribute("uno");
	int cnt = odao.insertOrders(uno,cbean);
	System.out.println(uno+","+cbean);
	
	cbean.removeAllGoods();
	response.sendRedirect("mall.jsp");	
%>
<script type="text/javascript">
 	alert('주문이 완료됐습니다.');
 </script>