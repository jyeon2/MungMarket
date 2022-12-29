<%@page import="my.shop.CategoryBean"%>
<%@page import="my.shop.CategoryDao"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	table{
		margin : 0px auto;
	}
</style> 
<%@ include file="top.jsp" %>
<!-- cate_list.jsp<br> -->
	<br>
	<h5 class="text-primary" align="center">카테고리 목록</h5><br>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>카테고리 코드</th>
				<th>카테고리명</th>
				<th>삭제</th>
			</tr>

				
				<%
					CategoryDao cdao = CategoryDao.getInstance();
					
					ArrayList<CategoryBean>lists =  cdao.getAllCategory(); 
					if(lists.size() == 0){
						%>
						<tr>
							<td colspan="5" align="center">조회할 카테고리가 없습니다.</td>
						</tr>
					<%
					}
					else{
	
					for(CategoryBean cb : lists){
				%>
				<tr>
					<td><%=cb.getCnum() %></td>
					<td><%=cb.getCode() %></td>
					<td><%=cb.getCname() %></td>
					<td><a href="cate_delete.jsp?cnum=<%=cb.getCnum()%>">삭제</a></td>
				</tr>
				<%	
					}
					
				}
				%>
			
			</table>

 
<%@ include file="bottom.jsp" %>