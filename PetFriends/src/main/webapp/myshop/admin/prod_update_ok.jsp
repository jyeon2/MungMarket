<%@page import="java.io.File"%>
<%@page import="my.shop.GoodsDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_update_ok.jsp -->
<%
	String configPath = config.getServletContext().getRealPath("/myshop/images");
	int maxSize = 1024 * 1024 * 5;
	String encoding = "UTF-8";
	MultipartRequest mr = new MultipartRequest(request, 
										configPath, maxSize, encoding, 
										new DefaultFileRenamePolicy());

	String gnum = mr.getParameter("gnum");
	String gcategory = mr.getParameter("gcategory_fk");
	String gname = mr.getParameter("gname");
	String gimage = mr.getFilesystemName("gimage");//새 이미지
	String gimage2 = mr.getParameter("gimage2"); // 기존이미지 type=text
	String gviewimage = mr.getFilesystemName("gviewimage");
	String gviewimage2 = mr.getParameter("gviewimage2");
	String gspec = mr.getParameter("gspec");
	

%>

gnum : <%=gnum%> <br>
gcategory : <%=gcategory%> <br>
gname : <%=gname %> <br>
gimage : <%=gimage %> <br>
gimage2 : <%=gimage2 %> <br>
gviewimage : <%=gviewimage %> <br>
gviewimage2 : <%=gviewimage2 %> <br>
gspec : <%=gspec %> <br>


<%
	GoodsDao gdao = GoodsDao.getInstance();
	int cnt = gdao.updateGoods(mr);
	
String delPath = config.getServletContext().getRealPath("/myshop/images");
System.out.println("delPath:"+delPath);

File delFile = new File(delPath,gimage2); 
File delFile1 = new File(delPath,gviewimage2); 

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
	String msg,url;
   
   if(cnt>0){
      msg="수정 성공";
      url="prod_list.jsp";
   } else {
      msg="수정 실패";
      url="prod_update.jsp?gnum="+gnum;      
   }

%>
<script type="text/javascript">
   alert('<%=msg%>');
   location.href="<%=url%>";
</script>
