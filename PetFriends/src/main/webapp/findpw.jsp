<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/main_top.jsp"%> 
 
<br>
 <h5 class="text-primary" align="center">비밀번호 찾기</h5>
 <br>
		<form role="form" class="form-inline" action="findpwPro.jsp" method="post" align="center">
		<div class="form-group" align="center">
				<label for="Name"><input type="text" name="name" class="form-control"
					placeholder="이름"></label><br>
					
				<label for="Name"><input type="text" name="id" class="form-control"
					placeholder="아이디"></label><br><br>

				<label for="Name"><input type="text" name="hp1" class="form-control" maxlength="3" size="3" placeholder="010"></label>
				-
				<label for="Name"><input type="text" name="hp2" class="form-control" maxlength="4" size="4" placeholder="1111"></label>
				-
				<label for="Name"><input type="text" name="hp3" class="form-control" maxlength="4" size="4" placeholder="2222"></label>
			</div><br>
				<input type="submit" class="btn btn-outline-dark" value="비밀번호 찾기">
			</form>
			
  <%@include file="../myshop/display/mall_bottom.jsp" %>   