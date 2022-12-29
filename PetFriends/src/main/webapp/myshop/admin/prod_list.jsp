<%@page import="my.shop.GoodsBean"%>
<%@page import="my.shop.GoodsDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	table{
		margin : 0px auto;
	}
</style> 
<script type="text/javascript">
function checkDel(gnum,gimage,gviewimage){
	alert(gnum+","+gimage+","+gviewimage);
	var isdel = confirm("정말로 삭제하시겠습니까?");
	if(isdel){
		location.href="prod_delete.jsp?gnum="+gnum+"&gimage="+gimage+"&gviewimage="+gviewimage;
	}
}

</script>
<%@ include file="top.jsp" %>
<!-- prod_list.jsp -->
<br>
	<h5 class="text-primary" align="center">상품 목록</h5><br>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>상품 사진</th>
				<th>재고</th>
				<th>가격</th>
				<th>포인트</th>
				<th>관리</th>
			</tr>
			
			<%
    		String rContext = request.getContextPath()+"/myshop/images/";


			GoodsDao gdao = GoodsDao.getInstance();
    		ArrayList<GoodsBean> lists = gdao.getAllGoods();
 			if(lists.size() == 0){
 				%>
 				<tr>
 					<td colspan="8"> 등록된 상품이 없습니다. </td>
 				</tr>
 				<%
 			}
 			else{
 				 for(GoodsBean gb : lists){
 					   String fullpath=rContext+gb.getGimage();
 					   System.out.println("fullpath:" + fullpath);
 					   %>
 					            <tr>
 					               <td><%=gb.getGnum()%></td>
 					               <td><%=gb.getGname()%></td>
 					               <td><%=gb.getGcategory_fk()%></td>
 					               <td><img src="<%=fullpath%>" width="60" height="60"></td>
 					               <td><%=gb.getGqty()%></td>
 					               <td><%=gb.getPrice()%></td>
 					               <td><%=gb.getPoint()%></td>
 					               <td>
 					                  <a href="prod_update.jsp?gnum=<%=gb.getGnum()%>">수정</a>|
 					                  <a href="javascript:checkDel('<%=gb.getGnum()%>','<%=gb.getGimage()%>','<%=gb.getGviewimage()%>')">삭제</a>
 					               </td>
 					            </tr>
 					<%    
 					}//for

 			}//else
 				
    		
    		%>
    	</table>
 
 
<%@ include file="bottom.jsp" %>
