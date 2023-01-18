<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

<body>
<div>
    <div>
        <h3>회원가입</h3>
    </div>
    <div>
        <form name="signup_form" method="post">
            <div>
                <label>아이디:</label>
                <input type="text" name="id" placeholder="아이디를 입력해 주세요">
                <button type="button" id="checkId">중복체크</button>
            </div>

            <div>
                <label>비밀번호:</label>
                <input type="password" name="passwd" id="passwd1" class="passwdCheck">
            </div>

            <div>
                <label>비밀번호 확인:</label>
                <input type="password" name="passwd_valid" id="passwd2" class="passwdCheck">
                <span id="same" style="display: none;">비밀번호가 일치합니다.</span>
                <span id="different" style="display: none;">비밀번호가 일치하지 않습니다.</span>
            </div>

            <div>
                <label>이름:</label>
                <input type="text" name="name" placeholder="이름을 입력해 주세요">
            </div>

            <div>
                <button>가입하기</button>
                <a href="/">
                    <button type="button">취소</button>
                </a>
            </div>
        </form>
    </div>
</div>
<script>
    $("#checkId").click(function() {
        const val = $("input[name=id]").val();

        $.ajax({
            type:'POST',
            url:'/checkId/' + val,
            success:function(result){
                if(result == 'OK'){
                    alert("사용가능한 아이디 입니다");

                }else{
                    alert("이미 사용중입니다");
                }
            }
        })
    })
                        /*check pw*/
    $('.passwdCheck').focusout(function(){
        const pw1 = $("#passwd1").val();
        const pw2 = $("#passwd2").val();

        if(pw1 == pw2){
            const pws = 1;
            $("#same").css('display', 'inline-block');
            $("#different").css('display', 'none');
        }else{
            const pws = 0;
            $('#same').css('display', 'none');
            $('#different').css('display', 'inline-block');
        }
    });
</script>
</body>
</html>