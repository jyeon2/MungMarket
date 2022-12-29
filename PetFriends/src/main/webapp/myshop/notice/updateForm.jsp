<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>    
<!-- ontent.jsp(num) => updateForm.jsp -->

<%
String num=request.getParameter("num");
String pageNum=request.getParameter("pageNum");

System.out.println("updateForm.jsp num:" + num);

NoticeDao ndao = NoticeDao.getInstance();
NoticeBean nb = ndao.updateGetArticle(num); 
%> 



<body bgcolor="<%=bodyback_c%>">
	<!-- <center> -->
		<b>글쓰기 수정</b> <br>
		<form method="post" name="writeform" action="updatePro.jsp" onsubmit="return writeSave()">
			<input type="hidden" name="num" value="<%=nb.getNum()%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			
		 
			<table width="430" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>">
						<a href="list.jsp"> 글목록</a>
					</td>
				</tr>
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td width="330" align="left">
					<input type="text" size="30" maxlength="10"	name="writer" 
							value="<%=nb.getWriter()%>"></td>
				</tr>
				
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330" align="left">					
						<input type="text" size="50" maxlength="50" name="subject" 
								value="<%=nb.getSubject()%>">
					</td>
				</tr>
				
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330" align="left"> 
						<textarea name="content" id="abc" rows="13" cols="50"><%=nb.getContent()%></textarea>
					</td>
				</tr>
				<tr> 
					<td width="100" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd"  
								value="">
					</td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center" height="30">
						<input	type="submit" value="글수정" >
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기"	
								OnClick="window.location='list.jsp'">
					</td>
				</tr>
			</table>	
		</form>
</body>