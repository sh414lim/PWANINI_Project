<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Sign Up</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="style/signup.css" />
<script type="text/javascript">
	var checkID = false;
	var checkPWD = false;
	var checkNAME = false;
	var code = "";		//이메일 전송 인증번호 저장위한 코드
	
	$(document).ready(
			function() {
				$("#member_pwd").keyup(function() {
					$("#checkPasswd").text("");
				});

				$("#chk_member_pwd").keyup(
						function() {
							var checkText = $("#checkPasswd");
							if ($("#member_pwd").val() == ""
									|| $("#chk_member_pwd").val() == "") {
								checkText.css("color", "red");
								checkText.text("필수정보입니다.");
								checkPWD = false;
							} else if ($("#member_pwd").val() != $(
									"#chk_member_pwd").val()) {
								checkPWD = false;
								checkText.text("패스워드가 동일하지 않습니다.");
								checkText.css("color", "red");
							} else {
								checkPWD = true;
								checkText.text("패스워드가 동일합니다.");
								checkText.css("color", "green");
							}
						});

				$("#email_select").change(function() {
					if ($("#email_select").val() == "1") {
						$("#email_addr").val("");
						$("#email_addr").prop("disabled", false);
					} else if ($("#email_select").val() == "") {
						$("#email_addr").val("");
						$("#email_addr").prop("disabled", true);
					} else {
						$("#email_addr").val($("#email_select").val());
						$("#email_addr").prop("disabled", true);
					}
				});

				$("#member_name").blur(function() {
					checkName();
				});
			})

	function doSignup() {
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();
		var member_name = $("#member_name").val();
		var member_nickname = $("#member_nickname").val();
		var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
		var member_phone = $("#NUMst").val() + "-" + $("#NUMnd").val() + "-"
				+ $("#NUMrd").val();
		var member_postcode = $("#member_postcode").val();
		var member_f_addr = $("#member_f_addr").val();
		var member_s_addr = $("#member_s_addr").val();
		var email_ver = $(".email_check_input").val();
		
		
		var verEmail = $("#email_check_input_warn").val();
		
		if (checkID == false) {
			console.log("아이디 중복검사 안함");
		}
		if (checkPWD == false) {
			console.log("비밀번호 다름");
		}
		if (checkNAME == false) {
			console.log("이름이 비어있음");
		}
		if (checkID == false || checkPWD == false || checkNAME == false) {
			swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
		} else if (email_ver == null || email_ver == ""){
			swal("", "이메일 인증을 해주세요.", "warning");
		}else {
			$.ajax({
				type : "POST",
				url : "insertMember.do",
				data : {
					"member_id" : member_id,
					"member_pwd" : member_pwd,
					"member_name" : member_name,
					"member_nickname" : member_nickname,
					"member_email" : member_email,
					"member_phone" : member_phone,
					"member_postcode" : member_postcode,
					"member_f_addr" : member_f_addr,
					"member_s_addr" : member_s_addr
				},
				success : function(data) {
					swal({
						icon:"success",
						title: "",
						text : "회원가입이 완료되었습니다!"
					});
					setTimeout('window.location.href = "main.do"',3000);
				}
			});
		}
	}

	function idChk() {
		var member_id = $("#member_id").val();
		var oMsg = $("#idchk");
		if (!member_id) {
			swal("", "아이디를 입력해주세요.", "error");
		} else {
			$.ajax({
				type : "POST",
				url : "checkID.do",
				data : {
					"member_id" : member_id
				},
				success : function(data) {
					if (data == 0) {
						$("#member_id").attr("disabled", true);
						oMsg.css("color", "green");
						oMsg.text("사용 가능한 아이디입니다.");
						checkID = true;
					} else if (data != 0) {
						$("#idchk").css("color", "red");
						$("#idchk").text("이미 존재하는 아이디입니다.");
						checkID = false;
					} else {
						console.log('ERROR');
					}
				},
				error : function(error) {
					swal("", member_id, "error");
				}
			});
		}
	}

	function checkName() {
		var oMsg = $("#chkname");
		var nonchar = /[^가-힣a-zA-Z0-9]/gi;

		var name = $("#member_name").val();
		if (name == "") {
			oMsg.css("color", "red");
			oMsg.text("필수정보입니다.");
			return false;
		}

		if (name != "" && nonchar.test(name)) {
			oMsg.css("color", "red");
			oMsg.text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			return false;
		}
		checkNAME = true;
		oMsg.text("");
		return true;
	}

	function searchPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType == 'R') {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType == 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? '(' + extraAddr
									+ ')' : '');
						}
						document.getElementById('member_postcode').value = data.zonecode;
						document.getElementById('member_f_addr').value = fullAddr;
						document.getElementById('member_s_addr').focus();
					}
				}).open();
	};

	
	/*인증번호 이메일 전송*/
	function emailCheck(){
		var member_email = $("#email_id").val() + "@" + $("#email_addr").val();		//입력한 이메일
		var checkBox = $(".email_check_input");		//인증번호 입력란
		var checkBtn = $(".email_check_btn"); 	//버튼
		
		if (member_email == "@" || $("#email_id").val()== "" || $("#email_addr").val() == "")  {
			swal({
				icon:"error",
				title: "에러!",
				text: "이메일을 입력해 주세요!"
			});
		}
		else {
			$.ajax({
				type:"GET",
				url:"emailCheck.do?email="+member_email,
				data: {
					"member_email" : member_email
				},
				success:function(data) {
					swal({
						icon:"success",
						title: "",
						text : "인증메일이 발송되었습니다. 이메일을 체크해 주세요!"
					});
				//	console.log("data : "+data);
				checkBox.attr("disabled", false);
				checkBox.attr("id", "email_check_input_true");
				checkBox.attr("autofocus", true);	
				checkBtn.attr("disabled", true);
				checkBtn.css("color", "#dbdbd5");
				code = data;
				
				
				/* 인증번호 비교*/
				$(".email_check_input").blur(function(){
					var inputCode = $(".email_check_input").val();			//사용자가 입력한 코드 
					var checkResult = $("#email_check_input_warn");	//비교 결과 메세지
					
					if (inputCode == code) {			//일치할 경우
					 	checkResult.text("인증번호가 일치합니다");
					 	checkResult.css("color", "green");
					} else if (inputCode != code) {
						checkResult.text("인증번호를 다시 확인해주세요.");
						checkResult.css("color", "red");
					} else {
						console.log('ERROR');
					}
				});
				}
			});	
		}		
	};
	
	
</script>

</head>
<%@ include file="include/Header.jsp"%>
<body>
   <div class="Guide">
      <span>회원 가입</span>
    </div>
	<section class="Form_section">
		<form class="f1rm" name="f1rm" id="f1rm">
				<h1>개인정보 <i class="fas fa-paw"></i></h1>
				<hr>
				<div class="required"><span class="star">*</span>필수입력사항</div>
				<div class="field">
					<label class="label">아이디<span class="star">*</span></label>
					<input type="text" id="member_id" class="input" onFocus="" />
					<input class="btn-default" onClick="idChk()" size="10" style="text-align:center; cursor: pointer;" value="중복확인"/><br />
					<label class="ver_info" id="idchk"></label>
				</div>
				<div class="field">
					<label class="label">비밀번호<span class="star">*</span></label>
					<input type="password" id="member_pwd" class="input" maxlength="20" />
				</div>
				<div class="field">
					<label class="label">비밀번호 확인<span class="star">*</span></label>
					<input type="password" id="chk_member_pwd" class="input" maxlength="20" /> <label id="checkPasswd"></label>				
				</div>
				<div class="field">
					<label class="label">이름<span class="star">*</span></label>
					<input type="text" id="member_name" class="input" /><label id="chkname"></label>
				</div>	
				<div class="field">
					<label class="label">닉네임</label>
       	            <input type="text" id="member_nickname" class="input" />				
				</div>
				<div class="field">
		                <label class="label">이메일<span class="star">*</span></label>
			            <input type="text" size="15" id="email_id"
									class="input" />@
			            <input type="text" size="15" id="email_addr"
									class="input" disabled />
			                  <select id="email_select">
			                    <option value="" selected style="text-align:center">:: 선택하세요 ::</option>
			                    <option value="naver.com">naver.com</option>
			                    <option value="gmail.com">gmail.com</option>
			                    <option value="hanmail.net">hanmail.net</option>
			                    <option value="nate.com">nate.com</option>
			                    <option value="1">직접입력</option>
			                  </select>									
					<div>
						<label class="label"></label>
		           		<input type="text" size="15" id="email_check_input_false" 	class="email_check_input" disabled="disabled"/>
		           		<input class="btn-default email_check_btn" onclick="emailCheck()" size="12" style="text-align:center; cursor: pointer" value="인증번호 전송"/>
            	  		<div id="email_check_input_warn"></div>
		               	</div>					
				</div>                
            
        		<div  class="field">
	                <label class="label">연락처</label>
	                  <select id="NUMst">
		                    <option value="" selected>:: 선택 ::</option>
		                    <option value="010">010</option>
		                    <option value="011">011</option>
		                    <option value="016">016</option>
	                  </select>        		
	                  -
	                  <input type="text" id="NUMnd" class="input"
							maxlength="4" size="4" />
	                  -
	                  <input type="text" id="NUMrd" class="input"
							maxlength="4" size="4" />
        		</div>    
              	<div  class="field">
	                <label class="label">주소</label>
	                  <input type="text" name="member_postcode"
							id="member_postcode" class="input" readonly size="10" />
	                  <input class="btn-default" onclick="searchPost()"  size="12" style="text-align:center; cursor: pointer" value="우편번호 찾기"/><br/>
	                  <label class="label">기본주소</label>
	                  <input type="text" name="member_f_addr"
							id="member_f_addr" class="input" size="60" readonly /><br/>             	
					<label class="label">상세주소</label>
	                  <input type="text" name="member_s_addr" id="member_s_addr" class="input" size="60" />
	            </div>
	            
				<div class="btns">
	                  <input class="btn-default" onclick="doSignup()"  size="10" style="text-align:center; cursor: pointer" value="회원가입"/>			
				</div>
      </form>
    </section>
  </body>

    <%@ include file="include/Footer.jsp"%></html>
