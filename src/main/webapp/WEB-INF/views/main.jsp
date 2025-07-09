<%@ page language = "java" contentType = "text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Document</title>
    <link rel="stylesheet" href="/other/css/main.css" />
    <link rel="stylesheet" href="/other/css/gamelist.css" />
    <%--
    <link rel="stylesheet" href="/other/css/charTest.css" />
    --%>
    <link rel="stylesheet" href="/other/css/login.css" />
  </head>
  <body>
    <%--하트--%>
    <div class="heart-list">
      <div class="heart"><img src="/other/image/heart.png" alt="" /></div>
      <div class="heart"><img src="/other/image/heart.png" alt="" /></div>
      <div class="heart"><img src="/other/image/heart.png" alt="" /></div>
      <div class="heart"><img src="/other/image/heart.png" alt="" /></div>
      <div class="heart"><img src="/other/image/heart.png" alt="" /></div>

      <div class="heart-time">10:10</div>
    </div>

    <div class="main-container">
      <div>
        <jsp:include page="${content}"></jsp:include>
      </div>
    </div>
  </body>
</html>
