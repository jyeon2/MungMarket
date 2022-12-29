<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content.jsp(부모 3가지) => replyForm.jsp  -->

<%@ include file="color.jsp"%>
<style>
	body{
		text-align: center;
	}
	table{
		margin : auto;
	}
</style>    
<!-- jQuery -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>

<%
// 부모의 정보가 넘어온다.
String ref = request.getParameter("ref");
String re_step = request.getParameter("re_step");
String re_level = request.getParameter("re_level");
System.out.println(ref); 
System.out.println(request.getParameter("re_step"));
System.out.println(request.getParameter("re_level"));

%>
<body bgcolor="<%=bodyback_c%>">
	<!-- <center> -->
		<b>답글쓰기</b> <br>
		<form method="post" name="writeform" action="replyPro.jsp?" onsubmit="return writeSave()">
			<input type="hidden" name="ref" value="<%=ref%>"> 
			<input type="hidden" name="re_step" value="<%=re_step%>"> 
			<input type="hidden" name="re_level" value="<%=re_level%>">
		 
			<table width="430" border="1" cellspacing="0" cellpadding="0"
				bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>">
						<a href="list.jsp"> 글목록</a>
					</td>
				</tr>
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">이 름</td>
					<td width="330" align="left">
					<input type="text" size="30" maxlength="10"	name="writer"></td>
				</tr>
				
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">제 목</td>
					<td width="330" align="left">					
						<input type="text" size="50" maxlength="50" name="subject" 
								value="[답글]어떤글">
					</td>
				</tr>
				
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">내 용</td>
					<td width="330" align="left">
						<textarea name="content" id="abc" rows="13" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td width="100" bgcolor="<%=value_c%>" align="center">비밀번호</td>
					<td width="330" align="left">
						<input type="password" size="10" maxlength="12"	name="passwd">
					</td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center" height="30">
						<input	type="submit" value="답글쓰기" >
						<input type="reset"	value="다시작성"> 
						<input type="button" value="목록보기"	
								OnClick="window.location='list.jsp'">
					</td>
				</tr>
			</table>	
		</form>
</body>