<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<div class="teamlogo-container">
    <img
            id="teamlogo2"
            onclick="location.href='/gamelist'"
            src="/other/image/logo.png"
            alt=""
    />
</div>

<form class="signup-form" action="/sign-up-submit" method="post" onsubmit="return validatePassword()">
    <div class="signup-form-title"><span>join the</span></div>
    <div class="signup-title-2"><span>Journey</span></div>

    <div class="signup-input-container">
        <input placeholder="Name" name="user_name" type="text" class="signup-input-name"/>
    </div>

    <div class="signup-input-container">
        <input placeholder="ID" name="user_id" type="text" class="signup-input-id" id="signup-user-id"/>
        <button type="button" onclick="checkDuplicateId()" class="id-check-btn">CHECK</button>
    </div>
    <span id="id-check-result"></span>


    <div class="signup-input-container">
        <input placeholder="Password" name="user_pw" type="password" class="signup-input-pw"/>
    </div>

    <div class="signup-input-container">
        <input placeholder="Confirm Password" type="password" class="signup-input-pw-confirm"/>
    </div>

    <div class="signup-input-container">
        <input placeholder="Email" name="user_email" type="email" class="signup-input-email"/>
    </div>

    <section class="signup-bg-stars">
        <span class="signup-star"></span>
        <span class="signup-star"></span>
        <span class="signup-star"></span>
        <span class="signup-star"></span>
    </section>

    <button class="signup-submit" type="submit">
        <span class="sign-text">Sign up</span>
    </button>

    <p class="signup-login-link">
        Wanna go back?
        <a class="signup-up" onclick="loadContent(event, '/login-page')">Sign in</a>
    </p>
</form>

<script>
    let isIdAvailable = false;

    function validatePassword() {
        const pw = document.querySelector('.signup-input-pw').value;
        const pwConfirm = document.querySelector('.signup-input-pw-confirm').value;

        if (pw !== pwConfirm) {
            alert('비밀번호가 일치하지 않습니다.');
            return false; // 제출 막기
        }
        if (!isIdAvailable) {
            alert('ID 중복 확인을 해주세요.');
            return false;
        }
        return true; // 제출 허용
    }

    function checkDuplicateId() {
        const userId = document.getElementById('signup-user-id').value.trim();
        if (!userId) {
            alert("ID를 입력해주세요.");
            return;
        }

        fetch(`/account/check-id?user_id=\${encodeURIComponent(userId)}`)
            .then(response => response.json())
            .then(isDuplicated => {
                const resultSpan = document.getElementById('id-check-result');
                if (isDuplicated) {
                    resultSpan.textContent = "이미 사용 중인 ID입니다.";
                    resultSpan.style.color = "red";
                    isIdAvailable = false; // 중복 → 회원가입 불가
                } else {
                    resultSpan.textContent = "사용 가능한 ID입니다!";
                    resultSpan.style.color = "green";
                    isIdAvailable = true; // 사용 가능 → 회원가입 가능
                }
            })
            .catch(err => {
                alert("서버 오류가 발생했습니다.");
            });


    }
/* 유저가 회원가입시, Id 중복확인에 걸려서 sign up 버튼 누른후 다시 인풋창에 입력할때마다 다시 isIdAvailable를 false로 초기화 */
    document.getElementById('signup-user-id').addEventListener('input', function () {
        isIdAvailable = false;
        document.getElementById('id-check-result').textContent = "";
    });
</script>
</body>
</html>