<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
		
			<%
			String uid = (String)session.getAttribute("uid");
			//System.out.println(uid);
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/admin/main.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/admin/cate_input.jsp">카테고리 등록</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="cate_list.jsp">카테고리 목록</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/admin/prod_input.jsp">상품 등록</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/admin/prod_list.jsp">상품 목록</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/myshop/display/mall.jsp">사용자 홈</a></li>
                    </ul>
						<span class="logout"><%=uid %>님</span>
                    	<a href="<%=request.getContextPath()%>/logout.jsp" class="logout">
						<img src="<%=request.getContextPath()%>/images/logout3.jpg" width="50" height="20"></a>
                    </div> 
               </div>
        </nav>