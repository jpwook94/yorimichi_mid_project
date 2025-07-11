<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="mypage-info-box" style="margin-left: 270px">
        <h2>마이페이지</h2>
        <p>아이디: ${loginUser.user_id}</p>
        <p>이름: ${loginUser.user_name}</p>
        <p>이메일: ${loginUser.user_email}</p>
    </div>
</body>
</html>