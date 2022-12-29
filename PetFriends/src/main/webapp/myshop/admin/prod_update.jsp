
<%@page import="my.shop.CategoryDao"%>
<%@page import="my.shop.GoodsBean"%>
<%@page import="my.shop.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_list.jsp(1) => prod_update.jsp -->
<%
	String gnum = request.getParameter("gnum");
	GoodsDao gdao = GoodsDao.getInstance();
	GoodsBean gb = gdao.selectByGnum(gnum); 
%> 

<%@ include file="top.jsp" %>
<br>
<form name="f" method="post" action="prod_update_ok.jsp" enctype="multipart/form-data">
<h5 class="text-primary" align="center">상품 수정</h5><br>
	<table class="table">
			<tr>
				<th>카테고리</th>
				<td><input type="text" name="gcategory_fk" value="<%=gb.getGcategory_fk() %>" readonly></td>
			</tr>
			<tr>
    				<th  class="m2">상품번호</th>
    				<td>
    					<%=gb.getGnum() %>
    					<input type="hidden" name="gnum" value="<%=gb.getGnum()%>">
    				</td>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="gname" value="<%=gb.getGname()%>"></td>
			</tr>

			<tr>
				<th>상품이미지</th>
				<td>
				<%
					String gimage = 
						request.getContextPath()+"/myshop/images/"+gb.getGimage();
				%>
					<img src="<%=gimage%>" width="100" height="100"> <!-- 기존 이미지 -->
					<input type="file" name="gimage"> <!-- 새 이미지 -->
					<input type="text" name="gimage2" value="<%=gb.getGimage()%>">
				</td>
			</tr>
			
			<tr>
				<th>상품 상세이미지</th>
				<td>
				<%
					String gviewimage = 
						request.getContextPath()+"/myshop/images/"+gb.getGviewimage();
				%>
					<img src="<%=gviewimage%>" width="100" height="100"> <!-- 기존 이미지 -->
					<input type="file" name="gviewimage"> <!-- 새 이미지 -->
					<input type="text" name="gviewimage2" value="<%=gb.getGviewimage()%>">
				</td>
			</tr>

			<tr>
				<th>상품 재고</th>
				<td align=left>
				<input type=text name="gqty" maxlength=8 value="<%=gb.getGqty()%>">
				</td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td align=left>
				<input type=text name="price" maxlength=8 value="<%=gb.getPrice()%>"></td>
			</tr>
			<tr>
				<th>상품 스펙</th>
				<td align=left><select name="gspec">
						<option value="NORMAL" <%if(gb.getGspec().equals("NORMAL")) { %> selected <% } %> >NORMAL</option>
						<option value="NEW" <%if(gb.getGspec().equals("NEW")) { %> selected <%} %>>NEW</option>
						<option value="BEST" <%if(gb.getGspec().equals("BEST")) { %> selected <%} %>>BEST</option>
						<option value="추천" <%if(gb.getGspec().equals("추천")) { %> selected <%} %>>추천</option>
				</select></td>
			</tr>
			<tr>
				<th>상품 소개</th>
				<td align=left>
				<textarea name="gcontents" rows=5 cols=50 style="resize: none;"><%=gb.getGcontents() %></textarea></td>
			</tr>

			<tr>
				<th>상품 포인트</th>
				<td align=left><input type=text name="point" value="<%=gb.getPoint()%>">
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type=submit class="btn btn-outline-dark" value="상품 수정">
				<input type=reset class="btn btn-outline-dark" value="취소"></td>
			</tr>

		</table>
</form>

<%@ include file="bottom.jsp"%>

