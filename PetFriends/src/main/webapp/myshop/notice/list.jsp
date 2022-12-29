<%@page import="java.text.SimpleDateFormat"%>
<%@page import="notice.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>
<%@include file="./../display/mall_top.jsp" %> 
<style>
	body{
		text-align: center;
	}
	table{
		margin : auto;
	}
</style>
<!-- list.jsp -->

<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int startRow = (currentPage-1) * pageSize + 1;
	int endRow = currentPage * pageSize;
		
	NoticeDao ndao = NoticeDao.getInstance();
	System.out.println("ndao:" + ndao);
	
	int count = ndao.getArticleCount();
	System.out.println("list.jsp count:"+count);
	ArrayList<NoticeBean> lists = null;
	
	if(count>0){
		lists = ndao.getArticles(startRow,endRow); 
	}//if
	
	int number = count - (currentPage-1) * pageSize;
%>
	<br>
	<b>글목록</b>
	
<table border="1" width="700">
	<tr>
		<td align="right" bgcolor="gray">
			(전체 글:<%=count %>)
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<%
	if(count == 0){
%>
	<table border="1" width="700">
	<tr>
		<td align="center" bgcolor="<%=value_c%>">
			게시글이 없습니다.
		</td>
	</tr>
</table>
<%		
	}//if
	else{
%>
	<table border="1" width="700">
	<tr bgcolor="pink">
		<td align="center">번호</td>
		<td align="center">제목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">조회</td>
	</tr>
<%

	for(int i=0;i<lists.size();i++){
		NoticeBean nb = lists.get(i);
		
%>
		<tr>
			<td align="center"><%=number-- %></td>
			<td align="left">
				<%
				if(nb.getRe_level()>0 ){
					int width = nb.getRe_level()*20;
				%>
					<img src="./../../images/level.gif" width="<%=width %>" height="15">
					<b>ㄴRe: </b>
				<%					
				}//if					
						
					%>
			<a href="content.jsp?num=<%=nb.getNum()%>&pageNum=<%=currentPage%>">
				<%=nb.getSubject() %>
			</a>
			
			</td>
			<td align="center"><%=nb.getWriter() %></td>
			<td align="center"><%=sdf.format(nb.getReg_date())%></td>
			<td align="center"><%=nb.getReadcount() %></td>
		</tr>

<%		
	}//for
%>
		
</table>
<%		
		
	}//else
		
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize==0 ? 0 : 1);
		int pageBlock = 10;
		
		int startPage = ((currentPage - 1)/pageBlock*pageBlock) + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount)
			endPage = pageCount;
		
		if(startPage > 10){
	%>
			<a href="list.jsp?pageNum=<%=startPage-10%>">[이전]</a>
	<%			
		}//if
		
		for(int i=startPage;i<=endPage;i++){
	%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<%			
		}//for
		
		if(endPage < pageCount){
	%>
			<a href="list.jsp?pageNum=<%=startPage+10%>">[다음]</a>
	<%			
		}//if
		
	}// if(count>0)
%>


