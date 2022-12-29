<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- updateForm.jsp(5+1+1=>7가지) => updatePro.jsp -->
 
<%
request.setCharacterEncoding("UTF-8");
 String pageNum=request.getParameter("pageNum");

%>

<!-- 6가지 -->
<jsp:useBean id="nb" class="notice.NoticeBean"/>
<jsp:setProperty property="*" name="nb"/>

<%
NoticeDao ndao = NoticeDao.getInstance();
int cnt = ndao.updateArticle(nb); 

System.out.println("cnt:"+cnt);
String url;
String msg;

if(cnt>0){
	msg = "수정 성공";
	url = "list.jsp?pageNum="+pageNum;
}
else{
	msg = "비번일치x/수정실패";
	url = "updateForm.jsp?num="+nb.getNum()+"&pageNum="+pageNum;
}
%>

<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
 


