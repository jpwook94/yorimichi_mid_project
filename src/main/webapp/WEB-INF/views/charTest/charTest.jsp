<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<div class="c-window-container">
    <div class="c-window">
        <div class="c-title-bar">
            <div class="c-window-buttons">
                <div class="c-btn minimize">
                    <div class="icon-line"></div>
                </div>
                <div class="c-btn maximize">
                    <div class="icon-square"></div>
                </div>
                <div class="c-btn close">
                    <div class="icon-x">
                        <span></span><span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="c-search-bar">
            <div class="c-fake-address">게임/성향 테스트</div>
            <button class="c-search-button">Search...</button>
        </div>
        <div class="c-content-box">
            <div class="c-content-area">

                <div>
                    <img src="" onclick="location.href='/mbtiTest-detail'" alt="">
                </div>

                <div>
                    <img src="" onclick="location.href='/idealType-detail'" alt="">
                </div>

            </div>
            <div class="c-fake-scrollbar">
                <div class="c-scroll-btn up">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">
                        <polygon points="5,2 2,7 8,7" fill="black"/>
                    </svg>
                </div>
                <div class="c-track">
                    <div class="c-thumb"></div>
                </div>
                <div class="c-scroll-btn down">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">
                        <polygon points="2,3 8,3 5,8" fill="black"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>
</div>


<div>
    <img src="" onclick="location.href='/mbtiTest-detail'" alt="">
</div>

<div>
    <img src="" onclick="location.href='/idealType-detail'" alt="">
</div>

</body>
</html>