<%@page import="my.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="my.user.UserBean"/>
<jsp:setProperty property="*" name="ub"/>

<%
UserDao udao = UserDao.getInstance();

int cnt = udao.insertUser(ub);
System.out.println("cnt:"+cnt);

String msg;
String url;
if(cnt>0){
	msg="성공.";
	url=request.getContextPath()+"/login.jsp";

}
else{
	msg="실패";
	url="register.jsp";
}
%>
<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>
    