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


<div class="gamelist-container">
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/gamelist'" src="https://cdn.discordapp.com/attachments/1389097872523530293/1392025998312079420/TEAM_YORIMICHI_LOGO-Photoroom.png?ex=686e08bc&is=686cb73c&hm=6d826cd0bcf03a0bf3d837c0870d9346361b24fa81fca1d00b208ddedee66199&" alt="">
    </div>
    <%-- 심리테스트와 가챠 선택창을 감싸는 큰 div--%>
    <div class="gamelist-btnlist">
        <div class="gamelist-btn">

            <div class="pixel-card">
                <div class="card-border">
                    <div class="card-content">
                        <div class="card-oriimg2">
                            <img src="https://cdn.discordapp.com/attachments/1389097872523530293/1392063298001965126/DUCK3.png?ex=686e2b79&is=686cd9f9&hm=9b2c1bf145d20d270288711683350e69980120f1a092fbe1a25f71dee58707e1&" alt="">
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
        <div class="gamelist-btn">

            <div class="pixel-card">
                <div class="card-border">
                    <div class="card-content">
                        <div class="card-oriimg">
                            <img src="https://cdn.discordapp.com/attachments/1389097872523530293/1392061194176696382/DUCK2.png?ex=686e2983&is=686cd803&hm=e60b6f9fa1cf761b2b5406d1706d0feadd18890ad17403473c51c3d958d00aa8&" alt="">
                        </div>
                        <div class="card-title">랜덤 뽑기</div>
                        <div class="card-description">
                            가고싶은 곳이 너무 많아!<br>
                            선택하지 못하는 너를 위해<br>
                            랜덤 뽑기를 준비했어!<br>
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

    <%--로그인 버튼--%>
    <div class="login-container">
        <button>로그인</button>
    </div>

    <div class="tagsearch-container">
        <div class="tagsearch-speechbubble">
            <img src="https://cdn.discordapp.com/attachments/1389097872523530293/1392057521518153759/pixel-speech-bubble.gif?ex=686e2618&is=686cd498&hm=d397bb0cd12a652107b4184a9f0848abdc55f29762efbd4ce18e50a5f748d811&" alt="">
        </div>
        <div class="tagsearch-ori">
            <img  src="https://cdn.discordapp.com/attachments/1389097872523530293/1392061193891614760/DUCK1.png?ex=686e2983&is=686cd803&hm=6cf3b37d66ac43c9e2991a998afae776734d5fc94e94dd53e0854bb54cdda384&" alt="">
        </div>
        <div class="tagsearch-ori2">
            <img src="https://cdn.discordapp.com/attachments/1389097872523530293/1392066921788084234/assets2Ftask_01jzmkc19zfcvvfh1k6d3y6x5b2F1751964442_img_0.png?ex=686e2ed9&is=686cdd59&hm=3e05fea627128bbbb9c86871fad217de62ba6ad232c90738cfe1619bb733c3d8&" alt="">
        </div>
    </div>
    
</div>

</body>
</html>