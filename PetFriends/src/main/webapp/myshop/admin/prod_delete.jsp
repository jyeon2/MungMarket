<%@page import="my.shop.GoodsDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_delete.jsp -->
<%@ include file="top.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String gnum = request.getParameter("gnum");
	String gimage = request.getParameter("gimage");
	String gviewimage = request.getParameter("gviewimage");
%>

gnum : <%=gnum%> <br>
gimage : <%=gimage%> <br>
gviewimage : <%=gviewimage%> <br>

<%
String delPath = config.getServletContext().getRealPath("/myshop/images");
System.out.println("delPath:"+delPath);


File delFile = new File(delPath,gimage);
File delFile1 = new File(delPath,gviewimage);

if(delFile.exists()){
	
	if(delFile.delete()){
%>	
	<script type="text/javascript">
		alert("이미지 파일 삭제 성공");
	</script>

<%	
	}
}

if(delFile1.exists()){
	
	if(delFile1.delete()){
%>	
	<script type="text/javascript">
		alert("이미지 파일 삭제 성공2");
	</script>

<%	
	}
}

GoodsDao gdao = GoodsDao.getInstance();
int cnt = gdao.deleteGoods(gnum);

String msg,url;
if(cnt>0){
	msg = "삭제 성공";
	url = "prod_list.jsp";
}
else{
	msg = "삭제 실패";
	url = "prod_list.jsp";
}
%>

<script>
alert("<%=msg%>");
location.href="<%=url%>";
</script>