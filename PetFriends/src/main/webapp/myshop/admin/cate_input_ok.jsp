
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cate_input.jsp(2가지=code,cname) => cate_input_ok.jsp -->
<%
request.setCharacterEncoding("UTF-8");
String code = request.getParameter("code");
String cname = request.getParameter("cname");
System.out.println(code+","+cname);

CategoryDao cdao=CategoryDao.getInstance();
int cnt = cdao.insertCategory(code,cname);

String msg,url;
if(cnt>0){
	msg = "카테고리 삽입 성공";
	url = "cate_list.jsp";
}
else{
	msg = "카테고리 삽입 실패";
	url = "cate_input.jsp";
}
%>

<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>