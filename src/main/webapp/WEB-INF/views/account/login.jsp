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
<%-- 로고 --%>
<div class="teamlogo-container">
    <img
            id="teamlogo2"
            onclick="location.href='/gamelist'"
            src="/other/image/logo.png"
            alt=""
    />
</div>

<%-- 로그인 폼 --%>
<form class="login-form" action="/login-submit" method="post">
    <div class="login-form-title"><span>sign in to your</span></div>
    <div class="login-title-2"><span>Journey</span></div>
    <div class="login-input-container">
        <input placeholder="Id" name="user_id" type="text" class="login-input-mail" />
        <span> </span>
    </div>
    <section class="login-bg-stars">
        <span class="login-star"></span>
        <span class="login-star"></span>
        <span class="login-star"></span>
        <span class="login-star"></span>
    </section>
    <div class="login-input-container">
        <input placeholder="Password" name="user_pw" type="password" class="login-input-pwd" />
    </div>
    <button class="login-submit"  type="submit">
        <span class="sign-text">Sign in</span>
    </button>
    <p class="login-signup-link">
        No account?
        <a class="login-up" onclick="loadContent(event, '/sign-up')">Sign up</a>
    </p>
</form>
<script src="/other/js/account.js"></script>
</body>
</html>