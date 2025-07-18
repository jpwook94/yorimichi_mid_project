<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<audio id="gacha-audio" controls autoplay loop style="visibility: hidden; width: 0; height: 0;">
    <source src="/other/audio/gacha/SSRback.mp3" type="audio/mpeg">
</audio>

<div class="SSRcardlogo">
    <img src="/other/image/gacha/gachacard-logo.png" alt="">
</div>

<div class="SSRment">
    <img src="/other/image/gacha/SSRment.png" alt="">
</div>
<div class="SSRcardback"></div>

<div class="sparkle-container" id="sparkleContainer"></div>

<div class="gachacitypick-cute2">
    <img src="/other/image/gacha-cute/mario-sparkle.gif" alt="">
    <img src="/other/image/gacha-cute/star-starry.gif" alt="">
    <img src="/other/image/gacha-cute/star-starry.gif" alt="">
</div>

<%-- SSR 카드 컨테이너--%>
<div class="SSRcard-wrapper">
    <div class="SSRcard-inner">
        <div class="SSRcard-flip-card-front">
            <img class="SSRcard-cardback" src="/other/image/gacha-cute/SSRcardBack.png" alt="">
        </div>
        <div class="SSRcard-flip-card-back">
            <div class="SSRcard-SSR">
                <div class="c-MBTIresultBlink">★SSR</div>
            </div>
            <img class="SSRcard-cardback" src="/other/image/gacha-cute/SSRcardBack.png" alt="">
            <div class="SSRcard-imgcontainer">
                <img src="" alt="">
            </div>
            <h1 id="SSR-destination-name" data-content=""></h1>
    </div>
    </div>

</div>

<%-- 5연가챠 결과창 --%>
    <div class="fivegacha-container">
        <div class="fivegacha-browser-window">
            <div class="fivegacha-title-bar">
                <div class="fivegacha-window-controls">
                    <div class="fivegacha-control-btn">−</div>
                    <div class="fivegacha-control-btn">□</div>
                    <div class="fivegacha-control-btn">×</div>
                </div>
            </div>
            <div class="fivegacha-content-area">
                <div class="fivegacha-main-content">
                    <img src="/other/image/gacha/airplane_pixel.gif" alt="">

                    <div class="checkbox-item">
                        <input type="checkbox" id="fivelike-0" name="fivelike" value="">
                        <span class="SSRrainbow">&nbsp;★SSR&nbsp; </span>
                        <label for="fivelike-0" class="checkbox-label"></label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="fivelike-1" name="fivelike" value="">
                        <span class="SSRrainbow">&nbsp;★SSR&nbsp; </span>
                        <label for="fivelike-1" class="checkbox-label"></label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="fivelike-2" name="fivelike" value="">
                        <span class="SSRrainbow">&nbsp;★SSR&nbsp; </span>
                        <label for="fivelike-2" class="checkbox-label"></label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="fivelike-3" name="fivelike" value="">
                        <span class="SSRrainbow">&nbsp;★SSR&nbsp; </span>
                        <label for="fivelike-3" class="checkbox-label"></label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="fivelike-4" name="fivelike" value="">
                        <span class="SSRrainbow">&nbsp;★SSR&nbsp; </span>
                        <label for="fivelike-4" class="checkbox-label"></label>
                    </div>
                </div>

            </div>
        </div>
    </div>


<%-- 찜할거야? 윈도우 --%>
<div class="likegacha-container">
    <div class="likegacha-browser-window">
        <div class="likegacha-title-bar">
            <div class="likegacha-window-controls">
                <div class="likegacha-control-btn">−</div>
                <div class="likegacha-control-btn">□</div>
                <div class="likegacha-control-btn">×</div>
            </div>
        </div>
        <div class="likegacha-content-area">
            <div class="likegacha-main-content">
                <span>여행지를 저장할래?</span>
                <img src="/other/image/gacha/heart-beating-heart.gif" alt="">
                <div class="likegacha-main-btnlist">
                    <div class="like-btn1" data-destination-number="">
                        <button class="likegacha-main-btn" data-mode="single" value="y" style="">yes</button>
                    </div>
                    <button class="likegacha-main-btn" value="n">no</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 너 이미 찜 했는데? 윈도우--%>
<div class="likegacha-container22">
    <div class="likegacha-browser-window">
        <div class="likegacha-title-bar">
            <div class="likegacha-window-controls">
                <div class="likegacha-control-btn">−</div>
                <div class="likegacha-control-btn">□</div>
                <div class="likegacha-control-btn">×</div>
            </div>
        </div>
        <div class="likegacha-content-area">
            <div class="likegacha-main-content">
                <span>이미 찜한 여행지야</span>
                <img src="/other/image/gacha/heart-beating-heart.gif" alt="">
                <div class="likegacha-main-btnlist">
                    <button class="likegacha-main-btn" value="n">ok</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gachadescard-pickcontainer">
    <div id="SSRpick1" class="gachadescard-pickbtn" data-userId="${sessionScope.loginUser.user_id}" >1회 뽑기</div>
    <div id="SSRpickN" class="gachadescard-pickbtn" data-userId="${sessionScope.loginUser.user_id}">5회 뽑기</div>
</div>

</body>
</html>