<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.GoodsBean"%>
<%@page import="my.shop.GoodsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
<!-- mall_prodView.jsp -->
<script type="text/javascript">
	function goCart(gnum){
		oqty = f.oqty.value;
		
		//alert(gnum+","+oqty);
		
		if(oqty.length==0 || oqty<=0){ 
			alert('상품개수는 1개 이상 입력해야합니다.');
			location.href="mall.jsp";
			return;
		}
		
		location.href="mall_cartAdd.jsp?oqty="+oqty+"&gnum="+gnum;

	}//goCart
	
</script>
<%@include file="mall_top.jsp" %>
<%
	String gnum = request.getParameter("gnum");
	GoodsDao gdao = GoodsDao.getInstance();
	GoodsBean gb = gdao.selectByGnum(gnum);
	
	DecimalFormat df = new DecimalFormat("###,###");
	String imgPath = request.getContextPath()+"/myshop/images/"+gb.getGimage();
	String imgPath1 = request.getContextPath()+"/myshop/images/"+gb.getGviewimage();
	
%>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="<%=imgPath%>" width="600" height="600"/></div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder"><%=gb.getGname() %></h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration"><b>￦</b><%=df.format(gb.getPrice()) %><br>
                            <b>point</b> <%=df.format(gb.getPoint()) %></span>
                        </div>
                        <p class="lead"><%=gb.getGcontents() %></p>
                        <div class="d-flex">
                        <form name="f" method="post">
                            <input class="form-control text-center me-3" name="oqty" type="text" value="1" style="max-width: 3rem" />
                            </form>
                            
                           <a href="javascript:goCart('<%=gb.getGnum() %>')" >
                             <button class="btn btn-outline-dark flex-shrink-0">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5">
         <div class="container px-4 px-lg-5 my-9">
        <div class="row gx-4 gx-lg-9 align-items-center">
       <div class="col-md-10"><img class="card-img-top mb-5 mb-md-0" src="<%=imgPath1%>" width="600" height="500"/></div>
       </div></div></section>