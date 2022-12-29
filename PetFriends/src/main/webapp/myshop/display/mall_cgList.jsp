<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.GoodsBean"%>
<%@page import="my.shop.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_cgList.jsp -->
 <%@include file="mall_top.jsp" %>
<%
String code = request.getParameter("code");
String cname = request.getParameter("cname");
System.out.println(code+","+cname);
 
GoodsDao gdao = GoodsDao.getInstance(); 
ArrayList<GoodsBean> lists = gdao.selectByCategory(code);
DecimalFormat df = new DecimalFormat("###,###");
	
	int count = 0;
	for(int j=0;j<lists.size();j++){ 
		GoodsBean gb = lists.get(j);
		String rContext = request.getContextPath()+"/myshop/images/";
		String fullPath = rContext + gb.getGimage();
		
		%>
		<section class="py-5">		
           		<div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%=fullPath%>" width="300" height="300"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"><%=gb.getGname() %></h5>
                                    ￦<%=df.format(gb.getPrice()) %><br>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="mall_prodView.jsp?gnum=<%=gb.getGnum()%>">View options</a></div>
                             </div></div> 
                           </div>
                         </div>
                       </div> </section>
		<%
		if(j % 3 == 2){
		}//if
	}//for 


%>	


 