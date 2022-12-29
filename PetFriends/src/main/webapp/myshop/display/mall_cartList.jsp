<%@page import="my.shop.GoodsBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cartList.jsp -->
<jsp:useBean id="cbean" class="my.shop.mall.CartBean" scope="session"/>

<%
	Vector<GoodsBean> lists = cbean.getAllGoods();
	DecimalFormat df = new DecimalFormat("###,###");
	int cartTotalPrice=0;
	int cartTotalPoint=0;
%>

<%@include file="mall_top.jsp" %> 
<br>
<table class="table table-bordered" align="center" width="80%">
<tr>
	<td colspan="6" align="center">
		<h4 class="text-primary">Cart</h4>
	</td>
</tr>

<tr align="center">
	<th width="10%">번호</th>
	<th width="20%">상품명</th>
	<th width="20%">수량</th>
	<th width="20%">금액</th>
	<th width="20%">합계</th>
</tr>
<%
	if(lists.size()==0){
		out.println("<tr><td colspan='6'>선택된 상품이 없습니다.</td></tr>");
	}
	else{
		for(GoodsBean gb : lists){
			
			String imgPath = request.getContextPath()+"/myshop/images/"+gb.getGimage();
	%>			
			<tr align="center" valign="middle">
				<td> <%=gb.getGnum() %> </td>
				<td> 
					<img src="<%= imgPath%>" width="40" height="40"> <br>
					<%=gb.getGname() %> 
				</td>
				<td> 
					<form name="f" method="post" action="mall_cartEdit.jsp">
						<input type="hidden" name="gnum" value="<%=gb.getGnum() %>">
						<input name="oqty" value="<%=gb.getGqty()%>" size="2">
						<input type="submit" value="수정">					
					</form>
				 </td>
				<td align="right">
					 <%=df.format(gb.getPrice()) %>￦ <br> 
					 [point]<%=df.format(gb.getPoint()) %><br> 
				 </td>
				<td align="right"> 
						<%=df.format(gb.getTotalPrice()) %>￦<br>
						 [point]<%=df.format(gb.getTotalPoint()) %><br>
				</td>
				<td> 
					<a class="btn btn-outline-dark" href="mall_cartDel.jsp?gnum=<%=gb.getGnum() %>">삭제</a> 
				</td>
			</tr>
	<%		
			cartTotalPrice += gb.getTotalPrice();
			cartTotalPoint += gb.getTotalPoint();
		}//for
	%>
	
			<tr align="center" valign="bottom">
				<td colspan="4">
					<b>총 금액</b> <%=df.format(cartTotalPrice) %>￦ | <b>총 포인트</b> <%=df.format(cartTotalPoint) %> <br>
				</td>
				<td colspan="2">
					<form action="mall_order.jsp"><input type="submit" class="btn btn-outline-dark" value="주문하기"></form>
					<form action="mall.jsp"><input type="submit" class="btn btn-outline-dark" value="계속 쇼핑"></form>
				</td>
			</tr>		
<%		
	}//else
%>

</table>	
	

<%@include file="mall_bottom.jsp" %>
     