<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Document</title>
</head>
<body>


<div class="gamelist-container">
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/gamelist'" src="/other/image/logo.png" alt="">
    </div>
    <%-- 심리테스트와 가챠 선택창을 감싸는 큰 div--%>
    <div class="gamelist-btnlist">
        <div class="gamelist-btn" onclick="location.href='/charTest'">

            <div class="pixel-card">
                <div class="card-border">
                    <div class="card-content">
                        <div class="card-oriimg2">
                            <img src="/other/image/DUCK3.png" alt="">
                        </div>
                        <div class="card-title">심리 테스트</div>
                        <div class="card-description">
                            MBTI, 이상형 월드컵 같은<br>
                            참신한 방법으로 여행지를<br>
                            추천해줄게! 네 성향에 맞는<br>
                            여행지는 어디일까??
                        </div>
                    </div>
                </div>
                <!-- 모서리 선 장식 -->
                <div class="corner-lines top-left"></div>
                <div class="corner-lines top-right"></div>
                <div class="corner-lines bottom-left"></div>
                <div class="corner-lines bottom-right"></div>

                <!-- 못 박힌 듯한 픽셀 장식 -->
                <div class="pixel-rivet top-left">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet top-right">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet bottom-left">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet bottom-right">
                    <div class="rivet-center"></div>
                </div>
            </div>
        </div>



        <div class="gamelist-btn" onclick="location.href='/gacha'">
            <div class="pixel-card">
                <div class="card-border">
                    <div class="card-content">
                        <div class="card-oriimg">
                            <img src="/other/image/DUCK2.png" alt=""/>
                        </div>
                        <div class="card-title">랜덤 뽑기</div>
                        <div class="card-description">
                            가고싶은 곳이 너무 많아!<br/>
                            선택하지 못하는 너를 위해<br/>
                            랜덤 뽑기를 준비했어!<br/>
                            내 여행지는 과연 어디일까??
                        </div>
                    </div>
                </div>

                <!-- 모서리 선 장식 -->
                <div class="corner-lines top-left"></div>
                <div class="corner-lines top-right"></div>
                <div class="corner-lines bottom-left"></div>
                <div class="corner-lines bottom-right"></div>

                <!-- 못 박힌 듯한 픽셀 장식 -->
                <div class="pixel-rivet top-left">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet top-right">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet bottom-left">
                    <div class="rivet-center"></div>
                </div>
                <div class="pixel-rivet bottom-right">
                    <div class="rivet-center"></div>
                </div>
            </div>
        </div>
    </div>
</div>





</body>
</html>
