<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jsp"%>     
<!-- content.jsp(deletePro.jsp) => deleteForm.jsp -->

<%
String num=request.getParameter("num");
String pageNum = request.getParameter("pageNum");

%>
<script type="text/javascript">

	function deleteCheck(){
		if(document.delForm.passwd.value==""){ // forms[0]
			alert('비밀번호를 입력하세요');
			document.delForm.passwd.focus();
			return false;
		}
	}
</script>
<form method="POST" name="delForm"  action="deletePro.jsp?pageNum=<%=pageNum%>" 
   onsubmit="return deleteCheck()"> 
 <table border="1" align="center"  width="360">
  <tr height="30">
     <td align=center  bgcolor="<%=value_c%>">
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="passwd" size="8" maxlength="12">
	   <input type="hidden" name="num" value="<%=num%>"></td>
 </tr>
 <tr height="30">
    <td align=center bgcolor="<%=value_c%>">
      <input type="submit" value="글삭제">
      <input type="button" value="글목록" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">     
   </td>
 </tr>  
</table> 
</form>

