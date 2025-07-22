<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:if test="${empty destinations}">
    <p>찜한 여행지가 없습니다.</p>
</c:if>

<c:forEach items="${destinations}" var="des">
    <%-- [수정] userPlanner.jsp와 동일한 구조로 변경 --%>
    <div class="pokemon-card" data-url="/destination/${des.destination_number}">
        <div class="card-header">
            <div class="pokemon-hp-type">${des.destination_name}</div>
        </div>

        <%-- 이 페이지에서는 항상 '찜한 상태' --%>
        <button class="like-btn"
                id="heart-icon-btn"
                data-destination-number="${des.destination_number}"
                data-liked="true">
            <img src="/other/image/heart.png" alt="찜한 상태 하트">
        </button>

        <div class="card-image">
            <img src="/other/image/DUCK1.png" alt="피카츄">
        </div>
    </div>
</c:forEach>
