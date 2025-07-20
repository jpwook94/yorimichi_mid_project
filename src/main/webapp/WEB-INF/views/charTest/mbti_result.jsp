<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:forEach var="desti" items="${destList}" varStatus="status">
            <div class="c-window-container" data-index="${status.index}"
                 style="${status.index != 0 ? 'display:none;' : ''}">
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
                            <div class="c-contentTXT">
                                <h3 style="font-size: 50px">${mbtiResult.mbti_category}</h3>
                                <p>${mbtiResult.mbti_description}인 당신!</p>
                                <p>▾당신의 여행지는 바로 여기▾</p>

                                <div class="c-contentTXT2">
                                    <h3 class="c-MBTIresultBlink" style="font-size: 30px" id="destinationName">
                                        >>> ${desti.destination_name} <<< </h3>
                                    <p style="font-size: 16px">${desti.destination_address}</p>
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
                    <%--여행지 결과창 팝업--%>
                <div class="c-commonPopup-container3">
                    <div class="c-commonPopup3">
                        <div class="c-commonPopup3-header">
                            <span class="c-commonPopup-title">your_destination.jpg</span>
                        </div>
                        <div class="c-commonPopup-body">
                            <div class="c-commonPopup-imgblock3">
                                <img class="c-commonPopup-img3" id="destinationImage"
                                     src="/other/image/destination/${desti.destination_number}.jpg" alt=""
                                     onerror="
                                             this.onerror=null;
                                             this.src='/other/image/${desti.destination_number}.png';
                                             this.onerror=function(){
                                             this.onerror=null;
                                             this.src='/other/image/${desti.destination_number}.jpeg';
                                             };
                                             "
                                     alt="">
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


            <%--            <c:if test="${status.index == 0}">--%>
            <%--                <button class="like-btn"--%>
            <%--                        data-liked="false"--%>
            <%--                        data-destination-number="${desti.destination_number}">--%>
            <%--                    Like--%>
            <%--                </button>--%>
            <%--            </c:if>--%>
            <c:if test="${status.index == 0}">
                <div class="c-mbti-menu">
                <ul class="c-MBTImenu-items">
                <li class="c-MBTImenu-item like-btn" data-liked="false" data-destination-number="${desti.destination_number}">
                    <img class="c-MBTImenu-icon" src="/other/image/mbtiLike.png">
                    <span>
                        Like
                    </span>
                    <span class="c-MBTImenu-arrow">▶</span>
                </li>
                    <li class="c-MBTImenu-item" id="mbtiMoreBtn">
                        <img class="c-MBTImenu-icon" src="/other/image/mbtiMore.png">
                        <span><u>M</u>ore</span>
                        <span class="c-MBTImenu-arrow">▶</span>
                    </li>
                </ul>
                </div>
            </c:if>

            <%--
            <c:set var="isLiked" value="false"/>
        <c:forEach items="${likedDestinationIds}" var="likedId">
            <c:if test="${des.destination_number == likedId}">
                <c:set var="isLiked" value="true"/>
            </c:if>
        </c:forEach>
            --%>

        </c:forEach>


        <%--여기서부터 팝업창--%>
        <div class="c-commonPopup-container">
            <div class="c-commonPopup2-plus">
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
</div>


<script>
    let currentIndex = 0;

    document.addEventListener("DOMContentLoaded", function () {
        const items = document.querySelectorAll(".c-window-container");
        let currentIndex = 0;

        document.addEventListener("click", function (e) {
            if (e.target.closest("#mbtiMoreBtn")) {
                items[currentIndex].style.display = "none";
                currentIndex++;

                if (currentIndex >= items.length) {
                    alert("모든 추천지를 보여드렸습니다.");

                    // 첫 번째 추천으로 되돌리기
                    currentIndex = 0;
                }

                items[currentIndex].style.display = "block";
            }
        });
    });
</script>
</body>
</html>