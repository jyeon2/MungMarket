<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.GoodsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="mall_top.jsp" %> 

        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">MungMarket</h1>
                    <p class="lead fw-normal text-white-50 mb-0">멍멍이 친구들의 마켓</p>
                </div>
            </div>
        </header>
        
        <section class="py-5">	
        	<%	
        	
        	GoodsDao gdao = GoodsDao.getInstance();
        	ArrayList<GoodsBean> lists = gdao.getAllGoods();
        	int count = 0;
			for(int i=0;i<lists.size();i++){
				GoodsBean gb = lists.get(i);
    			String rContext = request.getContextPath()+"/myshop/images/";
    			String fullPath = rContext + gb.getGimage();
    			DecimalFormat df = new DecimalFormat("###,###");
		%>
    			
           		<div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-5 row-cols-md-15 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <img class="card-img-top" src="<%=fullPath%>" width="300" height="250"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- goods name-->
                                    <h5 class="fw-bolder"><%=gb.getGname() %></h5>
                                    ￦<%=df.format(gb.getPrice()) %><br>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="mall_prodView.jsp?gnum=<%=gb.getGnum()%>">View options</a></div>
                             </div></div> 
                           </div>
                         </div>
                       </div>
                 
				<%}	%>

                </section>                   
 <%@include file="mall_bottom.jsp" %>

