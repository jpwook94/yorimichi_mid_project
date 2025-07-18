<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="/other/js/itTest.js"
    ></script>

</head>
<body>

<div class="gamelist-container">
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/hc'" src="/other/image/logo.png" alt="">
    </div>

    <div class="c-window-container">
        <img class="c-ITtest-timething" src="/other/image/chartest/sandglass.png" alt="">

        <div class="c-window">
            <div class="c-title-bar">
                <div class="c-window-buttons">
                    <div class="c-btn minimize">
                        <div class="icon-line"></div>
                    </div>
                    <div class="c-btn maximize" onclick="location.href='/temporary'">
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
                <div class="c-fake-address">게임/성향 테스트/이상형 월드컵</div>
                <button class="c-search-button">Search...</button>
            </div>
            <div class="c-content-box">
                <div class="c-content-area">

                    <div class="c-ITtheme-selector">
                        <div class="c-ITtheme-frame">
                            <div class="c-ITtheme-container">
                                <!-- 왼쪽 박스 -->
                                <div class="c-ITtheme-box" id="${left.food_number}">
                                    <div class="c-ITtheme-preview">
                                        <img class="c-ITtheme-selecimg" src="/other/image/food/${left.food_number}" alt=""
                                             onerror="
                                                     this.onerror=null;
                                                     this.src='/other/image/food/${left.food_number}.jpg';
                                                     this.onerror=function(){
                                                     this.onerror=null;
                                                     this.src='/other/image/food/${left.food_number}.jpeg';
                                                     };
                                                     "
                                        >
                                    </div>
                                    <div class="c-ITtheme-label">${left.food_name}</div>
                                </div>

                                <!-- 오른쪽 박스 -->
                                <div class="c-ITtheme-box" id="${right.food_number}">
                                    <div class="c-ITtheme-preview mono">
                                        <img class="c-ITtheme-selecimg" src="/other/image/food/${right.food_number}" alt=""
                                             onerror="
                                                     this.onerror=null;
                                                     this.src='/other/image/food/${right.food_number}.jpg';
                                                     this.onerror=function(){
                                                     this.onerror=null;
                                                     this.src='/other/image/food/${right.food_number}.jpeg';
                                                     };
                                                     "
                                        >
                                    </div>
                                    <div class="c-ITtheme-label">${right.food_name}</div>
                                </div>
                            </div>

                            <!-- 하단 스크롤바 -->
                            <div class="c-ITscrollbar-container">
                                <div class="c-ITscroll-track">
                                    <div class="c-ITscroll-arrow">◀</div>
                                    <div class="c-ITscroll-thumb"></div>
                                    <div class="c-ITscroll-arrow">▶</div>
                                </div>
                            </div>
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

        <%--라운드 팝업 (메모장)--%>
        <div class="c-notepad-window">
            <div class="c-notepad-title-bar">
                <span>- - Notepad</span>
            </div>
            <div class="c-notepad-menu-bar">
                <span>File</span>
                <span>Edit</span>
                <span>Search</span>
                <span>Help</span>
            </div>
            <div class="c-notepad-content-area">
                <span id="round">${round}</span><span class="c-notepad-fake-caret">┃</span>
            </div>
            <div class="c-notepad-scrollbars">
                <div class="c-notepad-resize-corner"></div>
            </div>
        </div>

        <%--여기서부터 팝업창--%>
        <div class="c-commonPopup-container">
            <div class="c-commonPopup1">
                <div class="c-popup-header">
                    <span class="c-commonPopup-title">cloud.png</span>
                    <div class="c-popup-buttons">
                        <div class="c-commonPopup-extraBTN"></div>
                    </div>
                </div>
                <div class="c-commonPopup-body">
                    <div class="c-commonPopup-imgblock">
                        <img src="/other/image/charTest_cloud.gif" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--여기서부터 팝업창--%>
    <div class="c-commonPopup-container">
        <div class="c-commonPopup2">
            <div class="c-commonPopup2-header">
                <span class="c-commonPopup-title">gombangwha.png</span>
            </div>
            <div class="c-commonPopup-body">
                <div class="c-commonPopup-imgblock">
                    <img src="/other/image/charTest_sakura.gif" alt="">
                </div>
            </div>
        </div>
    </div>

</div>



</body>
</html>