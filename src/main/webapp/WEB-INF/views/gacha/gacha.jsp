<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
    <%-- <script src="js/gacha"></script>--%>

</head>
<body>
<%--<h1>gashamascot jsp</h1>--%>

<div class="gachalist-container">
    <%--위에 고정되는 로고--%>
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/gamelist'"
             src="/other/image/logo.png"
             alt="">
    </div>
    <%-- 가챠 컨테이너 --%>
    <div class="gacha-container">
        <div class="gacha-browser-window">
            <div class="gacha-title-bar">
                <div class="gacha-tab active" onclick="location.href='/hc'">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                        <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                    </svg>
                </div>
                <div class="gacha-tab" onclick="location.href='/gacha'">가챠</div>
                <div class="gacha-tab">심리테스트</div>
                <div class="gacha-window-controls">
                    <div class="gacha-control-btn">−</div>
                    <div class="gacha-control-btn">□</div>
                    <div class="gacha-control-btn" onclick="location.href='/gamelist'">×</div>
                </div>
            </div>

            <div class="gacha-toolbar">
                <div class="gacha-nav-btn">←</div>
                <div class="gacha-nav-btn">→</div>
                <div class="gacha-nav-btn">↻</div>
                <%--누르면 새로고침 되도록--%>

                <input type="text" class="gacha-address-bar" value="" placeholder="주소를 입력하세요...">
            </div>

            <div class="gacha-content-area">
                <div class="gacha-sidebar">
                    <div class="gacha-sidebar-item" data-cate="1">
                        <img data-cate="1" src="/other/image/gachacitypick_logo.png"
                             alt="">
                    </div>
                    <div  class="gacha-sidebar-item" data-cate="2"></div>
                    <div class="gacha-sidebar-item" data-cate="3"></div>
                </div>

                <div class="gacha-main-content">
                    <%--                    <jsp:include page="${gachacontent}"></jsp:include>--%>

                </div>

                <div class="gacha-scrollbar">
                    <div class="gacha-scroll-arrow">▲</div>
                    <div class="gacha-scroll-thumb"></div>
                    <div class="gacha-scroll-arrow">▼</div>
                </div>
            </div>
        </div>

    </div>

</div>
<script>
    document.querySelectorAll(".gacha-sidebar-item").forEach((dom) => {
        dom.addEventListener("click", (e) => {
            /*console.log(e.target.dataset.cate); // cate   1,2,3*/
            const url = "api/gacha?cate=" + e.target.dataset.cate;
            fetch(url).then(response => response.text()).then(data => {
                /*console.log(data);*/
                document.querySelector(".gacha-main-content").innerHTML = data;
            });
        })
    })
    document.querySelectorAll(".gacha-sidebar-item")[0].click() ;</script>

</body>
</html>