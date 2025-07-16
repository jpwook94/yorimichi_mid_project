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

<div class="SSRcard-wrapper">
    <div class="SSRcard-inner">
        <div class="SSRcard-flip-card-front">
            <img class="SSRcard-cardback" src="/other/image/gacha-cute/SSRcardBack.png" alt="">
        </div>
        <div class="SSRcard-flip-card-back">
            <img class="SSRcard-cardback" src="/other/image/gacha-cute/SSRcardBack.png" alt="">
            <div class="SSRcard-imgcontainer">이미지</div>
            <h1 id="SSR-destination-name" data-content=""></h1>
    </div>
    </div>

</div>

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
                    <div class="like-btn" >
                    <button class="likegacha-main-btn" style="">yes</button>
                    </div>
                    <button class="likegacha-main-btn">no</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="gachadescard-pickcontainer">
    <div id="SSRpick1" class="gachadescard-pickbtn" >1회 뽑기</div>
    <div id="SSRpickN" class="gachadescard-pickbtn">n회 뽑기</div>
</div>

</body>
</html>