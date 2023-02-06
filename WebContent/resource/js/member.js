
function validate(){
    let userId = document.getElementById("user_id").value;
    let userName = document.getElementById("user_name").value;
    let userPw = document.getElementById("user_pass").value;
    let checkPw = document.getElementById("pwd2_lbl").value;


        // // 아이디
        let regExp = /^[a-z][a-z\d]{3,12}$/i;
        if(!regExp.test(userId)){
            alert("첫 글자는 반드시 영문자하고 영문자, 숫자 포함 총 4~12자로 입력하시오");
            return false
        }
        // 이름
        regExp = /^[가-힣]+$/;
        if(!regExp.test(userName)){
            alert("한글로만 이루어져 있어야 되며 2글자 이상으로 입력하시오.");
            return false
        }
        // 비밀번호
        regExp = /^[a-z\d!@#$%&]{8,15}$/i;
        if(regExp.test(userPw)){

        }else{
            alert("비밀번호는 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.");
            return false
        }
        // 비밀번호 확인
        if(userPw != checkPw){
            alert("비밀번호가 일치하지 않습니다.");
            return false
        }

        // frm.submit(); return에서 false 지우고 하면 모든게 완료 후에 전송되게 할 수 있다.
}

