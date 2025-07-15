<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
<%-- 오디오 --%>
<audio controls autoplay loop style="display: none">
    <source src="/other/audio/gacha/8-bit-game-music.mp3">
</audio>

<%-- 뽑은 마스코트 보여주기--%>
<div class="gachacitypic-picked-mascot">
    <div class="gachacitypic-picked-locationname" data-content=""> 도쿄 </div>
    <img class="gachacitypic-picked-mascotimg" src="" alt="">
    <div class="gachacitypic-picked-mascotname" data-content=""> 니시코군 </div>
    <div class="gachacitypic-picked-mascot-like">
        <img src="/other/image/gacha-cute/one-more.gif" alt="">
    </div>
    <img class="gachacitypic-picked-mascot-backlight" src="/other/image/gacha/backlight.png" alt="">
</div>

<div class="gachacitypick-box">
    <div class="gachacitypick-arcade-machine">

        <%-- 꾸미기 용도 --%>
        <div class="gachacitypick-cute">
            <img src="/other/image/gacha-cute/heart2.gif" alt="">
            <img src="/other/image/gacha-cute/rebbon.gif" alt="">
            <img src="/other/image/gacha-cute/candy.gif" alt="">
            <img src="/other/image/gacha-cute/Marshmallows.gif" alt="">
            <img src="/other/image/gacha-cute/piano.gif" alt="">
            <img src="/other/image/gacha-cute/gameboy.gif" alt="">
            <img src="/other/image/gacha-cute/cinnamoroll.gif" alt="">
            <img src="/other/image/gacha-cute/heart2.gif" alt="">
            <img src="/other/image/gacha-cute/sakura.gif" alt="">
        </div>

        <%-- 한번 더 이미지 --%>
        <div class="gachacitypick-onemore">
            <img src="/other/image/gacha-cute/one-more.gif" alt="">
        </div>


        <%-- 인형뽑기 상자 --%>
        <div class="gachacitypic-topbox">
            <div class="gachacitypic-topboxbox">
                <div class="gachacitypic-topboxbox-txt">인형뽑기</div>
                <div class="gachacitypick-logo">
                <img src="/other/image/gacha/gachacitypick_logo.png" alt="">
                <div class="gachacitypick-pixel-rivet top-left">
                    <div class="gachacitypick-rivet-center"></div>
                </div>
                <div class="gachacitypick-pixel-rivet top-right">
                    <div class="gachacitypick-rivet-center"></div>
                </div>
                <div class="gachacitypick-pixel-rivet bottom-left">
                    <div class="gachacitypick-rivet-center"></div>
                </div>
                <div class="gachacitypick-pixel-rivet bottom-right">
                    <div class="gachacitypick-rivet-center"></div>
                </div>
            </div>
            </div>
            <div class="gachacitypick-screen-area">
                <div class="gachacitypick-crane">
                    <img src="/other/image/gacha/crane.png" alt="">
                </div>
                <div class="gachacitypick-mascots">
                    <img src="/other/image/gacha/gachacitypick-mascots.png" alt="">
                </div>
                <div>
                    <span id="random-number"></span>
                    <%-- 뽑히는 마스코트 이미지 --%>
                    <img class="pickmascot" src="" alt="">
                </div>
            </div>
        </div>
        <div class="gachacitypic-bottombox">
            <div class="gachacitypick-pickstart-speechbubble">
                <img src="/other/image/pixel-speech-bubble-click.gif" alt="">
            </div>
            <div class="gachacitypick-coin-slot"></div>
            <div class="gachacitypick-control-panel abs">
                <div class="gachacitypick-control-top-panel">
                    <div class="gachacitypick-joystick-left">
                        <img id="joystick-left" src="/other/image/gacha/gachacitypick-left.png" alt="">
                    </div>
                    <div class="gachacitypick-joystick-right">
                        <img id="joystick-right" src="/other/image/gacha/gachacitypick-right.png" alt="">
                    </div>
                    <div class="gachacitypick-button-container">
                        <div id="gachacitypick-pickup" class="gachacitypick-button"></div>
                    </div>
                </div>
           </div>
        </div>
    </div>
</div>

</body>

</html>