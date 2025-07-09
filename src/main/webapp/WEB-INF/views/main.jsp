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
    <link rel="stylesheet" href="/other/css/gacha.css" />
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

<<<<<<< HEAD
    <div class="heart-time"> 10:10</div>
</div>



<div class="main-container">
<div>
    <jsp:include page="${content}"></jsp:include>
</div>
</div>


<%-- 뭔가 비동기로 하는걸 피티한테 물어봄 --%>
<a class="login-up" href="/sign-up" onclick="loadContent(event, '/sign-up')">Sign up!</a>

<script>
    function loadContent(event, url) {
        event.preventDefault();
        fetch(url, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.text())
            .then(html => {
                const parser = new DOMParser();
                const doc = parser.parseFromString(html, 'text/html');

                // 기존 main.jsp 구조를 유지하고 있으므로,
                // include된 컨텐츠가 들어가는 "main-container" 안의 <div>를 다시 넣는 방식으로
                const newMain = doc.querySelector('.main-container');
                document.querySelector('.main-container').innerHTML = newMain.innerHTML;
            });
    }
</script>
</body>
</html>
=======
    <div class="main-container">
      <div>
        <jsp:include page="${content}"></jsp:include>
      </div>
    </div>
  </body>
</html>
>>>>>>> 7b33be1820f3fa5925da43009bdc6cdab46ca0a9
