<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
   function check(){
      if(document.f.code.value==""){
         alert('카테고리 코드를 입력하세요.');
         f.code.focus();
         return false;
      }
      if(document.f.cname.value==""){
         alert('카테고리 이름을 입력하세요.');
         f.cname.focus();
         return false;
      }
   }
</script>

<%@ include file="top.jsp" %>
<!-- cate_input.jsp-->
<br><br>
	<form action="cate_input_ok.jsp" method="post" name="f" class="form-inline" align="center">
		<div class="form-group" align="center">
				<label for="Name">카테고리 코드<input type="text" name="code" class="form-control"></label>
			</div><br>
			<div class="form-group" align="center">
				<label for="Name">카테고리 이름<input type="text" name="cname" class="form-control"></label>
			</div><br>
				<input type=submit class="btn btn-outline-dark" value="카테고리 등록" onclick="return check()">
				<input type=reset class="btn btn-outline-dark" value="취소">
				<br><br>
				</form>
				
<%@ include file="bottom.jsp" %>