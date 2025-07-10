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


<div class="gachacitypick-box">
    <div class="gachacitypick-arcade-machine">
        <div class="gachacitypic-topbox">
            <div class="gachacitypic-topboxbox">
                <div class="gachacitypic-topboxbox-txt">인형뽑기</div>
                <div class="gachacitypick-logo">
                <img src="/other/image/gachacitypick_logo.png" alt="">
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
                    <img src="/other/image/crane.png" alt="">
                </div>
                <div>
                    <img class="pick" src="/other/image/DUCK1.png" alt="">
                </div>
            </div>
        </div>
        <div class="gachacitypic-bottombox">
            <div class="gachacitypick-coin-slot"></div>
            <div class="gachacitypick-control-panel abs">
                <div class="gachacitypick-control-top-panel">
                    <div id="joystick-left" class="gachacitypick-joystick-left">
                        <img src="/other/image/gachacitypick-left.png" alt="">
                    </div>
                    <div id="joystick-right" class="gachacitypick-joystick-right">
                        <img src="/other/image/gachacitypick-right.png" alt="">
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
<script src="/other/js/gacha.js"></script>
</html>