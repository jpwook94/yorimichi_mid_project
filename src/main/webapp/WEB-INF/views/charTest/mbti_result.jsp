<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <div id="destContainer">
    <c:forEach var="desti" items="${destList}">
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
                <div class="c-fake-address">게임/성향 테스트/MBTI/내 결과</div>
                <button class="c-search-button">Search...</button>
            </div>
            <div class="c-content-box">
                <div class="c-content-area">
                <h3>${mbtiResult.mbti_category}</h3>
                <p>${mbtiResult.mbti_description}인 당신!</p>
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

        <%--여기서부터 팝업창--%>
        <div class="c-commonPopup-container">
            <div class="c-commonPopup1">
                <div class="c-popup-header">
                    <span class="c-commonPopup-title">destination.png</span>
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

        <%--여행지 결과창 팝업--%>
        <div class="c-commonPopup-container">
            <div class="c-commonPopup3">
                <div class="c-commonPopup3-header">
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
    </c:forEach>


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