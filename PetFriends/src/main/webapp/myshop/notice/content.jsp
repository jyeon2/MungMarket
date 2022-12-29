<%@page import="java.text.SimpleDateFormat"%>
<%@page import="notice.NoticeDao"%>
<%@page import="notice.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>    
<!-- list.jsp =>content.jsp-->
<%
String num=request.getParameter("num");
String x=request.getParameter("pageNum"); 

System.out.println("content.jsp num:" + num+", pageNum:" +x);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

NoticeDao ndao = NoticeDao.getInstance();

NoticeBean article = ndao.getArticle(Integer.parseInt(num)); 

System.out.println(article.getRef());
System.out.println(article.getRe_step());
System.out.println(article.getRe_level());
 %>
 
<table width="500" border="1" cellspacing="0" cellpadding="0"  
		bgcolor="<%=bodyback_c%>" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
    <td align="center" width="125"> <%=article.getNum()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
    <td align="center" width="125"> <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
    <td align="center" width="125"> <%=article.getWriter()%></td>
    <td align="center" width="125" bgcolor="<%=value_c%>" >작성일</td>
    <td align="center" width="125"> <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
    <td align="center" width="375" colspan="3"> <%=article.getSubject()%></td>
  </tr>
  <tr height="40">
    <td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre>  </td>
  </tr> 
  <tr height="40">
  	<td colspan="4" align="center" >
  		<input type="button" value="글수정" onClick="location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=x%>'">
  		<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=x%>'">
  		<input type="button" value="답글쓰기" onClick="location.href='replyForm.jsp?ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level() %>'">
  		<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=x%>'"> 
  	</td>
  </tr>
</table>  




