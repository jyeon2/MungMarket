<%@page import="java.util.Vector"%>
<%@page import="my.shop.GoodsBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_order.jsp -->
<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>
<%
	System.out.println("mall_order.jsp");
	String gnum = request.getParameter("gnum");
	String oqty = request.getParameter("oqty");
	System.out.println(gnum+"/"+oqty);
	
	if(gnum!=null && oqty!=null){
		cbean.addGoods(gnum, oqty);
	}

	DecimalFormat df = new DecimalFormat("###,###");
%>
<%@include file="mall_top.jsp" %> 
<br>
<table class="table table-bordered" align="center" width="80%">
<tr>
	<td colspan="6" align="center">
		<h4 class="text-primary">Order List</h4>
	</td>
</tr>

<tr align="center">
	<th width="40%">상품명</th>
	<th width="20%">수량</th>
	<th width="40%">금액</th>
</tr>
	<% 
		Vector<GoodsBean> lists = cbean.getAllGoods();
		int totalPrice = 0;
			
			for(GoodsBean gb : lists){
				
		%>			
				<tr>
					<td align="center"><%=gb.getGname() %> </td>
					<td align="center"> <%=gb.getGqty() %></td>
					<td align="center"> <%=df.format(gb.getTotalPrice()) %>￦</td>
				</tr>
		<%				
				totalPrice += gb.getTotalPrice();
			}//for
		%>
		
		<tr>
			<td colspan="3" align="center">
				<b>결제할 총 금액은</b> : 
				<font color="green"> <%=df.format(totalPrice) %></font>
			</td>
		</tr>
	<tr>
		<td colspan="3" align="center" valign="middle">
		<form action="mall_calculate.jsp"><input type="submit" class="btn btn-outline-dark" value="결제하기"></form>
		</td>
	</tr>
	</table>
	
<%@include file="mall_bottom.jsp" %> 