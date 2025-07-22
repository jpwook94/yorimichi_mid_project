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
<%--<script src="/other/js/account.js"></script>--%>
</body>
</html>