var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
    var msg = "${msg}";
        if(msg != ""){
            alert(msg);    
        }
});
 
 
function fnSubmit() {
 
var email_rule = /^[a-z0-9]+@[a-z]+\.(com|co.kr|net|or.kr)+$/i;
var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
 
if ($("#user_name").val() == null || $("#user_name").val() == "") {
alert("이름을 입력해주세요.");
$("#user_name").focus();
 
return false;
}
 
if ($("#user_tel").val() == null || $("#me_tel").val() == "") {
alert("전화번호를 입력해주세요.");
$("#me_tel").focus();
 
return false;
}
 
if(!tel_rule.test($("#user_tel").val())){
alert("전화번호 형식에 맞게 입력해주세요.");
return false;
}
 
 
if (confirm("아이디를 찾으시겠습니까?")) {
 
$("#createForm").submit();
 
return false;
}
}
 