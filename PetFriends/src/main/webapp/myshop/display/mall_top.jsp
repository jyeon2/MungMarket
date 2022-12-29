<%@page import="my.shop.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />

		<%
			String uid = (String)session.getAttribute("uid");
			System.out.println(uid);
			if(uid.equals("admin")){ 
			%>
				<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp"></a>
			
			<%
			}
			%>
			
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand">MungMarket</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/display/mall.jsp">Home</a></li>
 							<%
								CategoryDao cdao=CategoryDao.getInstance();
								ArrayList<CategoryBean> cateList=cdao.getAllCategory();

								for(CategoryBean cb : cateList) {%>
 							<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href=""
                            role="button" data-bs-toggle="dropdown" aria-expanded="false"><%=cb.getCname()%></a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="mall_cgList.jsp?cname=<%=cb.getCname()%>&code=<%=cb.getCode()%>">전체 상품 보기</a></li>
                            </ul>
                            <%} %>
                            <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/notice/list.jsp">고객 게시판</a></li>
                    </ul>
						<span class="logout"><%=uid %>님</span>
                    	<a href="<%=request.getContextPath()%>/logout.jsp" class="logout">
						<img src="<%=request.getContextPath()%>/images/logout3.jpg" width="50" height="20">
					</a>
                     
                     <form class="d-flex" action="mall_cartList.jsp">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>