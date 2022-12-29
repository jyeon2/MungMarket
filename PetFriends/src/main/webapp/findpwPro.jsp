<%@page import="my.user.UserBean"%>
<%@page import="my.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	System.out.println(id+","+name+","+hp1+","+hp2+","+hp3);


UserDao udao=UserDao.getInstance();
UserBean ub = udao.getUserById(id,name,hp1,hp2,hp3);

String msg,url;
if(ub != null){
	msg = ub.getPassword();
}
else{
	msg = "없는 회원";
}
	url = "login.jsp";
%>
<script>
alert("<%=msg%>"+"입니다.");
location.href="<%=url%>";
</script>
    