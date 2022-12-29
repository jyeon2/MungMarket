<%@page import="my.user.UserBean"%>
<%@page import="my.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- loginPro.jsp -->
<!--loginPro.jsp로 id,password 가지고 넘어옴 -->

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	System.out.println(id+","+password);
	
	UserDao udao = UserDao.getInstance();
	UserBean ubean = udao.getUserByInfo(id,password);
	
	String viewPage ="";
	
	if(ubean != null){ // 회원이면 
		String uid = ubean.getId();
		int uno = ubean.getNo(); 
		
		session.setAttribute("uid", uid); 
		session.setAttribute("uno", uno);
		
		if(uid.equals("admin")){ // 관리자
			viewPage = request.getContextPath() + "/myshop/admin/main.jsp";
		}
		else{ //사용자 
			viewPage = request.getContextPath() + "/myshop/display/mall.jsp";
		}
	}
	else{ // 비회원이면
		viewPage = request.getContextPath() + "/login.jsp"; // 로그인 화면
		%>
			<script type="text/javascript">
				alert('가입하지 않은 회원입니다.');
			</script>		
		<%
	}
%>
<script type="text/javascript">
	location.href="<%=viewPage%>";
</script>	
