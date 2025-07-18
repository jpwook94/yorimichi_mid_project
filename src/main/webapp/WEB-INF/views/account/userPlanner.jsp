<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>여행지 플래너</title>
    <link rel="stylesheet" href="/other/css/card-list.css">
</head>
<body>
<div class="card-list">
    <c:forEach items="${destinations}" var="des">
        <div class="pokemon-card">
            <div class="card-header">
                <div class="pokemon-hp-type">${des.destination_name}</div>
            </div>

                <%-- [수정] 1. 찜 상태를 확인하는 로직을 버튼보다 위로 옮긴다. --%>
            <c:set var="isLiked" value="false"/>
            <c:forEach items="${likedDestinationIds}" var="likedId">
                <c:if test="${des.destination_number == likedId}">
                    <c:set var="isLiked" value="true"/>
                </c:if>
            </c:forEach>

                <%-- [수정] 2. 위에서 결정된 isLiked 값을 사용해서 버튼과 이미지를 만든다. --%>
            <button class="like-btn"
                    data-destination-number="${des.destination_number}"
                    data-liked="${isLiked}">
                <c:choose>
                    <c:when test="${isLiked}">
                        <img src="/other/image/heart.png" alt="찜한 상태 하트">
                    </c:when>
                    <c:otherwise>
                        <img src="/other/image/emptyheart.png" alt="찜하지 않은 상태 하트">
                    </c:otherwise>
                </c:choose>
            </button>

            <div class="card-image">
                <img src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png" alt="피카츄">
            </div>
        </div>
    </c:forEach>
</div>

<!-- 페이지네이션 -->
<div class="pagination">
    <c:forEach begin="1" end="${totalPage}" var="i">
        <c:choose>
            <c:when test="${i == curPage}">
                <span class="active cur-page" data-page="${curPage}">[${i}]</span>
            </c:when>
            <c:otherwise>
                <span class="page-link" data-page="${i}">[${i}]</span>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
<%--<script src="/other/js/account.js"></script>--%>
</body>
</html>