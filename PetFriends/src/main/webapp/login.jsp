<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/main_top.jsp"%> 
<br>
 <h5 class="text-primary" align="center">로그인</h5>
 <br>
		<form action="loginPro.jsp" method="post" class="form-inline" align="center">
			<div class="form-group" align="center">
				<label for="Name"><input type="text" name="id" class="form-control" placeholder="아이디"></label>
			</div>
			<div class="form-group" align="center">
				<label for="Name"><input type="password" name="password" class="form-control" placeholder="비밀번호"></label>
			</div><br>
				<input type="submit" class="btn btn-outline-dark" value="로그인">
				<br><br>
				<input type="button" class="btn btn-default" value="회원 가입" onClick="location.href='<%=request.getContextPath()%>/myshop/user/register.jsp'"> |
				<input type="button" class="btn btn-default" value="아이디 찾기" onClick="location.href='<%=request.getContextPath()%>/findid.jsp'"> |
				<input type="button" class="btn btn-default" value="비밀번호 찾기" onClick="location.href='<%=request.getContextPath()%>/findpw.jsp'">
 			