<%@page import="notice.NoticeDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- replyForm.jsp => replyPro.jsp<br> -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="nb" class="notice.NoticeBean"/>
<jsp:setProperty property="*" name="nb"/>
<%

System.out.println(nb.getWriter());
System.out.println(nb.getRef());
System.out.println(nb.getRe_step());
System.out.println(nb.getRe_level());

nb.setReg_date(new Timestamp(System.currentTimeMillis()));

NoticeDao ndao = NoticeDao.getInstance();
int cnt = ndao.replyArticle(nb);  

System.out.println("cnt:"+cnt);
	String url;
    String msg;
    
    if(cnt>0){
    	msg = "답글쓰기 성공";
    	url = "list.jsp";
    }
    else{
    	msg = "답글쓰기 실패";
    	url = "replyForm.jsp?ref="+nb.getRef()+"&re_step="+nb.getRe_step()+"&re_level="+nb.getRe_level();

    }
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>


