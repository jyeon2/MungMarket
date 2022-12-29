<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<!-- prod_input.jsp<br> -->
<br>
<form name="f" method="post" action="prod_input_ok.jsp" enctype="multipart/form-data">
<h5 class="text-primary" align="center">상품 등록</h5><br>
	<table class="table">
			<tr>
				<th>카테고리</th>
				<td><select name="gcategory_fk">
						<%
						CategoryDao cdao = CategoryDao.getInstance();
						ArrayList<CategoryBean> lists = cdao.getAllCategory();
							if(lists.size()==0){
								out.println("<option value=''>카테고리 없음</option>");
							}
							else{
								for(CategoryBean cb : lists) {
							%>
						<option value="<%=cb.getCode()%>">
									<%=cb.getCname() %>[<%=cb.getCode() %>]
						</option>
						<%
								}//for
							}//else
						%>
				</select></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="gname" value="이름"></td>
			</tr>
			
			<tr>
				<th>상품이미지</th>
				<td><input type="file" name="gimage"></td>
			</tr>
			
			<tr>
				<th>상품 상세이미지</th>
				<td><input type="file" name="gviewimage"></td>
			</tr>

			<tr>
				<th>상품 재고</th>
				<td align=left><input type=text name="gqty" maxlength=8
					value="3"></td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td align=left><input type=text name="price" maxlength=8
					value="100"></td>
			</tr>
			<tr>
				<th>상품 스펙</th>
				<td align=left><select name="gspec">
						<option value="NORMAL">NORMAL</option>
						<option value="NEW">NEW</option>
						<option value="BEST">BEST</option>
						<option value="추천">추천</option>
				</select></td>
			</tr>
			<tr>
				<th>상품 소개</th>
				<td align=left><textarea name="gcontents" rows=5 cols=50
						style="resize: none;">설명</textarea></td>
			</tr>

			<tr>
				<th>상품 포인트</th>
				<td align=left><input type=text name="point" value="100">
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type=submit class="btn btn-outline-dark" value="상품 등록">
				<input type=reset class="btn btn-outline-dark" value="취소"></td>
			</tr>

		</table>
</form>

<%@ include file="bottom.jsp"%>
