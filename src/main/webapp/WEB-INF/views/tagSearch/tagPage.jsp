<%@ page import="com.google.gson.Gson" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/other/css/tag.css">
    <link rel="stylesheet" href="/other/css/card-list.css">
    <style>
        /* 마이페이지 버튼 */
        .mypage-btn {
            font-family: "pixelfont", sans-serif;
            background-color: #ffcc66;
            color: #333;
            border: 2px solid #000;
            border-radius: 20px;
            padding: 8px 16px;
            margin-right: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 2px 2px 0 #000;
            transition: all 0.2s ease-in-out;
        }

        .mypage-btn:hover {
            background-color: #fff176;
            transform: translateY(-2px);
        }

        /* 로그아웃 버튼 */
        .logout-btn {
            font-family: "pixelfont", sans-serif;
            background-color: transparent;
            color: #e53935;
            border: 2px solid #e53935;
            border-radius: 20px;
            padding: 8px 16px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            box-shadow: 2px 2px 0 #000;
            transition: all 0.2s ease-in-out;
        }

        .logout-btn:hover {
            background-color: #e53935;
            color: #fff;
            transform: translateY(-2px);
        }

        /* 환영 메시지 */
        .welcome-msg {
            font-family: "pixelfont", sans-serif;
            font-size: 16px;
            margin-right: 10px;
            color: #444;
        }
    </style>
</head>
<body>
<div class="header-wrapper" onclick="">
    <div class="return-container"><img src="/other/image/return.png" alt="" onclick="history.back()"></div>
    <div class="teamlogo-container"><img id="teamlogo2" onclick="location.href='/gamelist'" src="/other/image/logo.png"
                                         alt=""></div>
    <div class="login-menu-area">
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <span class="welcome-msg">${sessionScope.loginUser.user_name}님, 환영합니다!</span>
                <button class="mypage-btn" onclick="location.href='/mypage'">마이페이지</button>
                <a class="logout-btn" href="/logout">로그아웃</a>
            </c:when>
            <c:otherwise>
                <!-- 로그인 안 된 상태면 로그인/회원가입 버튼 노출 -->
                <%--로그인 버튼--%>
                <button class="login-container" onclick="location.href='/login-page'">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 36 36"
                            width="36px"
                            height="36px"
                    >
                        <rect width="36" height="36" x="0" y="0" fill="#fdd835"></rect>
                        <path
                                fill="#e53935"
                                d="M38.67,42H11.52C11.27,40.62,11,38.57,11,36c0-5,0-11,0-11s1.44-7.39,3.22-9.59 c1.67-2.06,2.76-3.48,6.78-4.41c3-0.7,7.13-0.23,9,1c2.15,1.42,3.37,6.67,3.81,11.29c1.49-0.3,5.21,0.2,5.5,1.28 C40.89,30.29,39.48,38.31,38.67,42z"
                        ></path>
                        <path
                                fill="#b71c1c"
                                d="M39.02,42H11.99c-0.22-2.67-0.48-7.05-0.49-12.72c0.83,4.18,1.63,9.59,6.98,9.79 c3.48,0.12,8.27,0.55,9.83-2.45c1.57-3,3.72-8.95,3.51-15.62c-0.19-5.84-1.75-8.2-2.13-8.7c0.59,0.66,3.74,4.49,4.01,11.7 c0.03,0.83,0.06,1.72,0.08,2.66c4.21-0.15,5.93,1.5,6.07,2.35C40.68,33.85,39.8,38.9,39.02,42z"
                        ></path>
                        <path
                                fill="#212121"
                                d="M35,27.17c0,3.67-0.28,11.2-0.42,14.83h-2C32.72,38.42,33,30.83,33,27.17 c0-5.54-1.46-12.65-3.55-14.02c-1.65-1.08-5.49-1.48-8.23-0.85c-3.62,0.83-4.57,1.99-6.14,3.92L15,16.32 c-1.31,1.6-2.59,6.92-3,8.96v10.8c0,2.58,0.28,4.61,0.54,5.92H10.5c-0.25-1.41-0.5-3.42-0.5-5.92l0.02-11.09 c0.15-0.77,1.55-7.63,3.43-9.94l0.08-0.09c1.65-2.03,2.96-3.63,7.25-4.61c3.28-0.76,7.67-0.25,9.77,1.13 C33.79,13.6,35,22.23,35,27.17z"
                        ></path>
                        <path
                                fill="#01579b"
                                d="M17.165,17.283c5.217-0.055,9.391,0.283,9,6.011c-0.391,5.728-8.478,5.533-9.391,5.337 c-0.913-0.196-7.826-0.043-7.696-5.337C9.209,18,13.645,17.32,17.165,17.283z"
                        ></path>
                        <path
                                fill="#212121"
                                d="M40.739,37.38c-0.28,1.99-0.69,3.53-1.22,4.62h-2.43c0.25-0.19,1.13-1.11,1.67-4.9 c0.57-4-0.23-11.79-0.93-12.78c-0.4-0.4-2.63-0.8-4.37-0.89l0.1-1.99c1.04,0.05,4.53,0.31,5.71,1.49 C40.689,24.36,41.289,33.53,40.739,37.38z"
                        ></path>
                        <path
                                fill="#81d4fa"
                                d="M10.154,20.201c0.261,2.059-0.196,3.351,2.543,3.546s8.076,1.022,9.402-0.554 c1.326-1.576,1.75-4.365-0.891-5.267C19.336,17.287,12.959,16.251,10.154,20.201z"
                        ></path>
                        <path
                                fill="#212121"
                                d="M17.615,29.677c-0.502,0-0.873-0.03-1.052-0.069c-0.086-0.019-0.236-0.035-0.434-0.06 c-5.344-0.679-8.053-2.784-8.052-6.255c0.001-2.698,1.17-7.238,8.986-7.32l0.181-0.002c3.444-0.038,6.414-0.068,8.272,1.818 c1.173,1.191,1.712,3,1.647,5.53c-0.044,1.688-0.785,3.147-2.144,4.217C22.785,29.296,19.388,29.677,17.615,29.677z M17.086,17.973 c-7.006,0.074-7.008,4.023-7.008,5.321c-0.001,3.109,3.598,3.926,6.305,4.27c0.273,0.035,0.48,0.063,0.601,0.089 c0.563,0.101,4.68,0.035,6.855-1.732c0.865-0.702,1.299-1.57,1.326-2.653c0.051-1.958-0.301-3.291-1.073-4.075 c-1.262-1.281-3.834-1.255-6.825-1.222L17.086,17.973z"
                        ></path>
                        <path
                                fill="#e1f5fe"
                                d="M15.078,19.043c1.957-0.326,5.122-0.529,4.435,1.304c-0.489,1.304-7.185,2.185-7.185,0.652 C12.328,19.467,15.078,19.043,15.078,19.043z"
                        ></path>
                    </svg>
                    <span class="now">in</span>
                    <span class="play">sign</span>
                </button>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<hr>


<div class="tag-search-wrapper">
    <div class="tag-search-title"><h1># 태그로 검색</h1></div>
    <c:forEach items="${tagList}" var="tl">
        <div class="ts-line">
            <div class="ts-category"><b>${tl.key}</b></div>
            <div class="ts-taglist">
                <c:forEach items="${tl.value}" var="v">
                    <button type="button" name="${v.tag_name}">#${v.tag_name}</button>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
    <div class="ts-line">
        <div class="ts-category"><b>지역</b></div>
        <div class="ts-taglist">
            <c:forEach items="${tags4}" var="t">
                <button type="button" name="${t.location_name}">#${t.location_name}</button>
            </c:forEach>
        </div>
    </div>

    <hr>

    <div id="user-select"></div>
    <div id="clear-button-container"></div>
    <div id="ts-result-size" class="tag-result-size"></div>
    <div class="render-wrapper">
        <div id="render-div">
            <div class="no-result-message">태그를 선택해 여행지를 검색해 보세요.</div>
        </div>
    </div>
</div>


<div class="top-button-bubble"></div>
<div class="top-button-wrapper" id="topBtn"><img src="/other/image/DUCK7.png" alt="" class="top-duck"></div>


<footer>
    <div class="teamlogo-container2" >
        <img src="/other/image/logo.png" alt="">
        <hr>
        <div class="wowwow" style="left: 507px; bottom: 96px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="wowwow" style="left: 432px; bottom: 73px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="wowwow" style="left: 446px; bottom: 67px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="wowwow" style="left: 366px; bottom: 46px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="wowwow" style="left: 320px; bottom: 35px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="wowwow" style="left: 220px; bottom: 15px; cursor: pointer"><img src="/other/image/gacha-cute/mario-sparkle.gif" alt=""></div>
        <div class="team-description">여행지 고르기 어려우셨죠? <span style="color: #F97267; cursor: pointer">팀</span> <span style="color:#FF9900;">요리미치</span>가 도와드릴게요! <br>
            친구가 기획에 소극적인가요? 게임처럼 참여하게 만드는 <span style="color: #ffe97d; cursor: pointer"  onclick="location.href='/gacha'">가챠 기능</span>으로 해결! <br>
            원하는 조건에 딱 맞는 여행지를 고르고 싶다면? <span style="color: #ffe97d; cursor: pointer" onclick="location.href='/tag-page'">태그 검색</span>으로 한 눈에! <br>
            어디로 가야할지 모르겠다면? <span style="color: #ffe97d; cursor: pointer" onclick="location.href='/charTest'">성향 테스트</span>로 나와 맞는 여행지를 탐색! <br>
            지루하고 딱딱한 기존 사이트와 달리, 감성+재미를 모두 담았답니다! <br>
        </div>
    </div>
    
    


    <div class="team-member">
        <div class="team-member-title"><h1>팀원</h1></div>
        <div class="team-member-list">
            <div class="tag-member">
                <div><span class="SSRrainbow">(팀장)</span><br>정현욱</div>
                <div><img src="/other/image/jhw.png" alt=""></div>
            </div>
            <div class="tag-member">
                <div>이가은</div>
                <div><img src="/other/image/lge.png" alt=""></div>
            </div>
            <div class="tag-member">
                <div>장채은</div>
                <div><img src="/other/image/jce.png" alt=""></div>
            </div>
            <div class="tag-member">
                <div>최병주</div>
                <div><img src="/other/image/DUCK1.png" alt=""></div>
            </div>
        </div>
    </div>
</footer>
<%--<span id="user-info" data-user_id="${loginUser.user_id}" data-user_name="${loginUser.user_name}"--%>
<%--      data-user_email="${loginUser.user_email}" data-user_pw="${loginUser.user_pw}"></span>--%>


<script>
    const likedDestinations = "${likedDestinations}";
    const locations = JSON.parse('${tags5}');

</script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/other/js/tagSearch.js"></script>
<script src="/other/js/account_renew.js"></script>


</body>
</html>