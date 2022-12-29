<%@page import="my.shop.GoodsDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_input_ok.jsp -->
<%
ServletContext s = config.getServletContext();
String sContext = s.getRealPath("/myshop/images");

String rContext = request.getContextPath()+"myshop/images";

System.out.println("sContext:"+sContext);
System.out.println("rContext:"+rContext);

int maxSize = 1024 * 1024 * 5;
String encType = "UTF-8";
MultipartRequest mr = new MultipartRequest(request,
						 sContext,
						 maxSize, 
						 encType,
						 new DefaultFileRenamePolicy());
%>
 상품명3 : <%=mr.getParameter("gname") %> <br> 
 카테고리 : <%=mr.getParameter("gcategory_fk") %><br> 
 이미지 화일명1 : <%=mr.getFilesystemName("gimage") %><br>  
 이미지 화일명2 : <%=mr.getFilesystemName("gviewimage") %><br>  
<%
GoodsDao gdao = GoodsDao.getInstance();
int cnt= gdao.insertGoods(mr);


String msg,url;
   
   if(cnt>0){
      msg="삽입 성공";
      url="prod_list.jsp";
   } else {
      msg="삽입 실패";
      url="prod_input.jsp";      
   }

%>
<script type="text/javascript">
   alert('<%=msg%>');
   location.href="<%=url%>";
</script>


