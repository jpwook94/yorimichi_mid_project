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

<div class="gamelist-container">
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/hc'" src="/other/image/logo.png" alt="">
    </div>

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
                <div class="c-btn close" onclick="location.href='/gamelist'">
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
                <div class="c-icons">
                    <div class="c-icon-box" onclick="showMBTIPopup()" >
                        <img class="c-test-img" src="/other/image/MBTItest.png" alt="">
                        <p class="c-icon-label">mbti.exe</p>
                    </div>

                    <div class="c-icon-box" onclick="showITPopup()">
                    <img class="c-test-img" src="/other/image/idealtest.png" alt="">
                        <p class="c-icon-label">ideal_type.exe</p>
                    </div>
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

    <%--여기서부터 팝업창--%>
<div class="fake-popup-body" id="MBTIpopup" style="display: none;">
    <div class="c-fake-popup">
        <div class="c-popup-header">
            <span class="c-popup-title">System</span>
            <div class="c-popup-buttons">
                <div class="c-popup-extraBTN"></div>
                <div class="c-popup-extraBTN"></div>
                <div class="c-popup-extraBTN"></div>
            </div>
        </div>
        <div class="c-popup-body">
            <p class="c-popup-text">start?</p>
            <div class="c-popup-actions">
                <button class="c-popup-btn" onclick="location.href='/mbtiTest'">sure</button>
                <button class="c-popup-btn highlight" onclick="hideMBTIPopup()">cancel</button>
            </div>
        </div>
    </div>
</div>

    <%--여기서부터 팝업창--%>
    <div class="fake-popup-body" id="ITpopup" style="display: none;">
        <div class="c-fake-popup">
            <div class="c-popup-header">
                <span class="c-popup-title">System</span>
                <div class="c-popup-buttons">
                    <div class="c-popup-extraBTN"></div>
                    <div class="c-popup-extraBTN"></div>
                    <div class="c-popup-extraBTN"></div>
                </div>
            </div>
            <div class="c-popup-body">
                <p class="c-popup-text">start?</p>
                <div class="c-popup-actions">
                    <button class="c-popup-btn" onclick="location.href='/ITTest'">sure</button>
                    <button class="c-popup-btn highlight" onclick="hideITPopup()">cancel</button>
                </div>
            </div>
        </div>
    </div>

</div>

    <script>

        function showMBTIPopup() {
            document.getElementById("MBTIpopup").style.display = "block";
        }

        function showITPopup() {
            document.getElementById("ITpopup").style.display = "block";
        }

        function hideMBTIPopup() {
            document.getElementById("MBTIpopup").style.display = "none";
        }

        function hideITPopup() {
            document.getElementById("ITpopup").style.display = "none";
        }
    </script>
</body>
</html>