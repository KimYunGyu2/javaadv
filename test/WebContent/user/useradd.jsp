<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

 <HEAD>
  <TITLE> JOIN </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">



  <style>


  tr, td{
    border: 2px solid #FFDF24;	
  }


  #main-title {
  color:#050099;
  font-size:15pt;
  font-weight:bold;
  }

  #sub-title {
  color:#050099;
  font-size:10pt;
  font-weight:bold;
  }

      .se {font-family: serif;}
      .sa {font-family: sans-serif;}
      .cu {font-family: cursive;}
      .fa {font-family: fantasy;}
      .mo {font-family: monospace;}

  </style>

<script>


	function check1(){
		var frm=document.enroll;
		frm.checkid.value=1;
	}

	function enter(){

	var frm=document.enroll;

	if(frm.id.value.length<3){
		alert("아이디는 3자 이상 입력해주세요");
		return;
	}

	 if(frm.checkid.value==0)
	{
		alert("중복확인을 눌러주세요");
		return;
	}

	if(frm.pwd.value.length<4){
		alert("비밀번호는 4자이상 입력해주세요");
		return;
	}
	if(frm.pwd1.value!=frm.pwd.value){
		alert("비밀번호가 다릅니다");
		return;
	}
	if(frm.name.value.length<1){
		alert("이름을 입력해주세요");
		return;
	}
	if(frm.sex.value==""){
		alert("성별을 선택해주세요");
		return;
	}
	if(frm.email.value.length<1 || frm.e_domain.value.length<1){
		alert("이메일을 입력해주세요");
		return;
	}
	
	frm.method="get";
	frm.action="./join.html"; //넘어간화면
	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
	}


//이메일 부분

	function checkid(){

		var frm=document.enroll;

		var regExp=/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

		

		if(!regExp.test(frm.email.value)){

			alert('올바른 email을 입력해주세요.');

			frm.email.focus();

		}

	}




	function domainCheck(){

		var frm=document.enroll;

		if(frm.domain.value==0){
			frm.e_domain.value="";
			frm.e_domain.disabled=false;

		}else{
			frm.e_domain.value=frm.domain.value;
			frm.e_domain.disabled=true;

		}

	}

		
 </script>

 </HEAD>


 <BODY bgcolor="#FFDF24"> 

	<form name="enroll" method="post">
	<table height="90" align="center" style="background-color:#FFDF24">
	<tr>	
		<td><img src="./pen.png" height="64px" ></td>
		<td><div id="main-title" class="mo">회원가입</div></td>
		<td><div id="sub-title" class="mo"> | 정확한 회원정보를 입력하여 주십시오.</td>
	 </tr>

	 <table width="550" height="460" align="center" style="background-color:#FFDF24; border:dotted 5px #050099; "  class="mo">
		
			<tr>
				<td>
					<table align="center" border=1 style="background-color:white; border-color:#FFDF24;" width="550">
			<tr>			

				<td style="text-align:center">ID</td>
				<td style="color:red; font-size:10px;"><input type="text" name="id" value="">
				<input type="button" name="id1" value="중복확인" onClick="check1()" > 최소 3자이상 입력하세요.
				<input type="hidden" name="checkid" value="0"></td>
			</tr>
			<tr>
				<td style="text-align:center;">FW</td> 
				<td ><input type="password" name="pwd" value=""><img src="lock.png" height="25px" align="center"></td>
			</tr>
			<tr>
				<td style="text-align:center;">FW 확인</td> 
				<td><input type="password" name="pwd1" value=""> <img src="lock2.png" height="23px" align="center"></td>
			</tr>
			<tr>
				<td style="text-align:center;">이름</td> 
				<td style="color:red; font-size:10px;"><input type="name" name="name" value=""> (공백없이 한글만 입력 가능)</td>
			</tr>
			<tr>
				<td style="text-align:center;">성별</td> <td><input type="radio" name="sex" value="1"> 여자
				<input type="radio" name="sex" value="2"> 남자</td>
			</tr>
			<tr>
				<td style="text-align:center;">연락처</td> 
				<td><select name="phone">
				<option value ="010" selected="selected">010</option>
				<option value ="011">011</option>
				<option value ="016">016</option> 
				<option value ="017">017</option>
				</select>
				- <input type="text" name="phone1" value="" style="width:70">
				- <input type="text" name="phone2" value="" style="width:70"></td>
			</tr>
			<tr>
				<td style="text-align:center;">E-mail</td>
				<td><input type="text" name="email" style="width:80" onblur="checkid()"> @
				<input type="text" name="e_domain" style="width:80">
				<select name="domain" onchange="domainCheck();">
				<option value ="0" selected="selected">직접입력</option>
				<option value ="naver.com" >naver.com</option>
				<option value ="hanmail.net">hanmail.net</option>
				<option value ="nate.com">nate.com</option> 
				<option value ="yahoo.com">yahoo.com</option>		</select></td></tr>
			<tr>
				<td style="text-align:center;">주소</td> 
				<td><input type="text" name="ad" value="" style="width:300"></td>
			</tr>
			<tr>
				<td style="text-align:center;">&nbsp&nbsp&nbsp자기소개&nbsp&nbsp&nbsp</td> 
				<td><textarea name="fcontent" rows="13" cols="57" onfocus="this.value=null;">내용을 적으세요...</textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="color:blue"> * 원하시는 서비스에 체크해주세요...</td>
			</tr>
			<tr>
				<td style="text-align:center;">메일링 서비스</td>
				<td><input type="checkbox" name="check" value="check1">정보 메일을 수신합니다.</td>
			</tr>
			<tr>
				<td style="text-align:center;">SNS 서비스</td>
				<td><input type="checkbox" name="check" value="check2">핸드폰 문자메세지를 수신합니다.</td>
			</tr>
					</table>
				</td>
			</tr>
			
		</table>
		<br>
		<table align="center" style="background-color:#FFDF24;">
	  <tr>	
		<td><input type="button"  value="  가입  " style="background-color:#050099; border:solid 5px #050099; color:white;" onClick="javascript:enter()">
			<a href="./3.login.html">
			<input type="button" value="  취소  " style="background-color:#050099; border:solid 5px #050099; color:white;"></a></td>

			
	 </tr>
	 </form>
 </BODY>			
</HTML>