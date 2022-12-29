<%@page import="notice.NoticeDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- writeForm.jsp(입력한 5가지 넘어옴) => writePro.jsp -->

<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="nb" class="notice.NoticeBean"/>
<jsp:setProperty property="*" name="nb"/>
<!-- setter 5가지 호출 bb.setWriter(입력한 작성자)-->

<%
	nb.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	NoticeDao ndao=NoticeDao.getInstance();
	int result = ndao.insertArticle(nb);
	String url;
    String msg;
    
    if(result>0){
    	msg = "글쓰기 성공";
    	url = "list.jsp";
    }
    else{
    	msg = "글쓰기 실패";
    	url = "writeForm.jsp";
    }
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>


