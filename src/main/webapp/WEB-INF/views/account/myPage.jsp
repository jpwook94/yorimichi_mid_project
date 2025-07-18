<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
        language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.yorimichi.travel.vo.account.AccountVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>MyPage</title>
    <link rel="stylesheet" href="/other/css/myPage.css"/>

</head>
<body>
<div class="mypagelist-container">
    <%--위에 고정되는 로고--%>
    <div class="teamlogo-container">
        <img
                id="teamlogo2"
                onclick="location.href='/gamelist'"
                src="/other/image/logo.png"
                alt=""
        />
    </div>
    <%-- 가챠 컨테이너 --%>
    <div class="mypage-container">
        <div class="mypage-browser-window">
            <div class="mypage-title-bar">
                <div class="mypage-tab active" onclick="location.href='/hc'">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="16"
                            height="16"
                            fill="currentColor"
                            class="bi bi-house-fill"
                            viewBox="0 0 16 16"
                    >
                        <path
                                d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"
                        />
                        <path
                                d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"
                        />
                    </svg>
                </div>
                <div class="mypage-tab" onclick="location.href='/mypage'">가챠</div>
                <div class="mypage-tab">심리테스트</div>
                <div class="mypage-window-controls">
                    <div class="mypage-control-btn">−</div>
                    <div class="mypage-control-btn">□</div>
                    <div
                            class="mypage-control-btn"
                            onclick="location.href='/gamelist'"
                    >
                        ×
                    </div>
                </div>
            </div>

            <div class="mypage-toolbar">
                <div class="mypage-nav-btn">←</div>
                <div class="mypage-nav-btn">→</div>
                <div class="mypage-nav-btn">↻</div>
                <%--누르면 새로고침 되도록--%>

                <input
                        type="text"
                        class="mypage-address-bar"
                        value=""
                        placeholder="주소를 입력하세요..."
                />
            </div>

            <div class="mypage-content-area">
                <div class="mypage-sidebar">
                    <div class="mypage-sidebar-item" data-mycate="1">
                        <p>내 정보</p>
                    </div>
                    <div class="mypage-sidebar-item" data-mycate="2">
                        <p>찜 목록</p>
                    </div>
                    <div class="mypage-sidebar-item" data-mycate="3">
                        <p>플래너</p>
                    </div>
                </div>

                <div style="position: relative;width: 100%;">

                    <div class="mypage-main-content" id="myPageContentArea" data-current-cate="">
                    </div>
                    <div id="pagination-container"></div>
                </div>

                <div class="mypage-scrollbar">
                    <div class="mypage-scroll-arrow">▲</div>
                    <div class="mypage-scroll-thumb"></div>
                    <div class="mypage-scroll-arrow">▼</div>
                </div>
            </div>
        </div>
    </div>
</div>
<span id="user-info" data-user_id="${loginUser.user_id}" data-user_name="${loginUser.user_name}"
      data-user_email="${loginUser.user_email}" data-user_pw="${loginUser.user_pw}"></span>
<%--    <script src="/other/js/account.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</body>
<script src="/other/js/account_renew.js"></script>
</html>
