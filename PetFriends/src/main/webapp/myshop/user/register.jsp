<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/main_top.jsp"%> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>   
<script type="text/javascript">
$(document).ready(function(){
	//alert(1);
	var use;
	var isCheck = false;
	$('input[name="isCheck"]').val('false');
	
	$('form').find('#id_check').click(function() { //중복체크 클릭
		//alert(2);
		isCheck = true; //중복체크 눌러야 true
		$('input[name="isCheck"]').val(isCheck);
		
		if($('input[name="id"]').val().length == 0) {
			alert("아이디를 입력하세요(중복체크)");
			$('input[name="id"]').focus();
			return;
		}
				
				
			$.ajax({
				url : "id_check_proc.jsp",
				data : { 
					userid: $('input[name="id"]').val() //userid 변수에 담김
				},
				success : function(data){ //data에는 서버가 보내는 응답정보가 담긴다
					alert(data);
					if($.trim(data)=='YES'){ 
						$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
							use = "possible";
							$('#idmessage').show();
						}
						else{
							$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
							use = "impossible";
							$('#idmessage').show();
						}
					}//success
				});//ajax

			});//click
			
			$('#sub').click(function(){ // submit
				//alert(3);
				
				if(use =="impossible"){
					alert("이미 사용중인 아이디입니다.");
					return false;
				}
				else if(isCheck==false){ //아직 중복체크 안함
					alert("중복체크 먼저 하세요");
					return false;
				}
				
				else if($('input[name="id"]').val().length == 0) {
					alert("아이디를 입력하세요(submit)");
					$('input[name="id"]').focus();
					return false;
				}
				
			});//submit 클릭의 끝(가입하기)
			
			$('input[name="id"]').keydown(function(){ //키보드 눌렀을 때 alert 
				//alert(4);
				
				$('#idmessage').css('display','none');
				use = ""; //누르기 전까진 모르니까 다시 없어지도록 초기화
				isCheck= false;
				$('input[name="isCheck"]').val(isCheck);

			});
			
		}); //ready
	
function pwcheck(){
	//alert(1);
	pw = document.forms[0].password.value;
	
	if(pw==""){
		alert('비밀번호 입력하세요');
		return;
	}
	
	var chk_num = pw.search(/[0-9]/); 
	var chk_eng = pw.search(/[a-z]/);
	
	//alert(chk_num+","+chk_eng);
	
	if(chk_num<0 || chk_eng<0){ //Blur 됐을 때
		alert('비밀번호는 숫자와 영문자의 조합으로 입력하세요.');
		return;
	}
	
	var regex = /^[a-z0-9]{3,8}$/; //3~8자
	if(pw.search(regex) == -1){
		alert('비밀번호 형식이 틀렸습니다.');
		return;
	}
	
}//pwcheck

function repwcheck(){
	//alert(2);
	
	if($('input[name=password]').val() != $('input[name=repassword]').val()){
		$('#pwmessage').html("<font color=red>비밀번호 불일치</font>");
		$('#pwmessage').show();
		pwsame = "nosame";
	}
	else{ 
		$('#pwmessage').html("<font color=blue>비밀번호 일치</font>");
		$('#pwmessage').show();
		pwsame = "same";
	}
	
}//repwcheck

function writeSave(){
	//alert(3);
	if(myform.name.value == ""){
		alert("이름을 입력하세요.");
		myform.name.focus();
		return false;
	}
	
	if(myform.id.value == ""){
		alert("아이디를 입력하세요.");
		myform.id.focus();
		return false;
	}
	
	if(myform.password.value == ""){
		alert("비밀번호를 입력하세요.");
		myform.password.focus();
		return false;
	}
	
	if(myform.repassword.value == ""){
		alert("비밀번호를 입력하세요.");
		myform.repassword.focus();
		return false;
	}
	
	if(pwsame == "nosame"){ //같지 않을 때
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	
	if(myform.email.value == ""){
		alert("이메일을 입력하세요.");
		myform.email.focus();
		return false;
	}
	
	if(myform.hp1.value == ""){
		alert("전화번호1을 입력하세요.");
		myform.hp1.focus();
		return false;
	}
	
	if(myform.hp2.value == ""){
		alert("전화번호2를 입력하세요.");
		myform.hp2.focus();
		return false;
	}
	
	if(myform.hp3.value == ""){
		alert("전화번호3을 입력하세요.");
		myform.hp3.focus();
		return false;
	}	
	
}//writeSave
</script>  
<!-- register.jsp -->

<br>
 <h5 class="text-primary" align="center">회원가입</h5><br>
<form name="myform" role="form" class="form-inline" action="registerPro.jsp" method="post" align="center" onsubmit="return writeSave()">
	<div class="form-group">
				<label for="Name"><input type="text" name="name" class="form-control"
					placeholder="이름"></label><br><br>

				<label for="Name"><input type="text" name="id" class="form-control"
					placeholder="아이디를 입력하세요"></label>
					<button type="button" class="btn btn-outline-dark" onclick="idcheck()" id="id_check">중복체크</button>
					<span id="idmessage" style="display:none;"></span><br><br>

				<label for="Name"><input type="password" name="password" class="form-control"
					placeholder="비밀번호를 입력하세요" onBlur="pwcheck()"></label>
			
				<label for="Name"><input type="password" name="repassword" id="repassword"
				 class="form-control" placeholder="비밀번호 확인" onKeyup="repwcheck()"></label>
					<span id="pwmessage" style="display:none;"></span><br><br>
					
				<label for="emailaddress"><input type="email" name="email"
					class="form-control" size="48" placeholder="이메일을 입력하세요"></label><br><br>
					
				<label for="Name"><input type="text" name="hp1" class="form-control" maxlength="3" size="3" placeholder="010"></label>
				-
				<label for="Name"><input type="text" name="hp2" class="form-control" maxlength="4" size="4" placeholder="1111"></label>
				-
				<label for="Name"><input type="text" name="hp3" class="form-control" maxlength="4" size="4" placeholder="1111"></label>
			</div><br>
			<input type="submit" class="btn btn-primary btn-lg btn-block" value="회원가입하기" id="sub">
			</form>
			