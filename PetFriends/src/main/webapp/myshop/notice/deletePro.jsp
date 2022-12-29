<%@page import="notice.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- deleteForm.jsp(3가지 pageNum,num,passwd) => deletePro.jsp -->


<jsp:useBean id="nb" class="notice.NoticeBean" />
<jsp:setProperty property="*" name="nb" />

<%
request.setCharacterEncoding("utf-8");
int pageNum = Integer.parseInt(request.getParameter("pageNum"));

System.out.println("num : " + nb.getNum());
System.out.println("passwd : " + nb.getPasswd());
System.out.println("pageNum : " + pageNum);

NoticeDao ndao = NoticeDao.getInstance();
int cnt = ndao.deleteNotice(nb);
System.out.println("result:" + cnt);
int count = ndao.getArticleCount();

int pageCount = count / 10 + (count % 10 == 0 ? 0 : 1);

	String msg;
	String url;
	if (cnt > 0) {
		msg = "삭제 완료";
		if (pageCount < pageNum) {
			url = "list.jsp?pageNum=" + (pageNum - 1);
		} else {
			url = "list.jsp?pageNum=" + pageNum;
		}
	}
	else if (cnt == -2) {
		msg = "비밀번호가 일치하지 않습니다.";
		url = "deleteForm.jsp?num=" + nb.getNum() + "&pageNum=" + pageNum;
	} else {
		msg = "삭제에 실패했습니다.";
		url = "deleteForm.jsp?num=" + nb.getNum() + "&pageNum=" + pageNum;
	}
%>

<script>
	alert('<%=msg%>');
	window.location = '<%=url%>';
</script>


