<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="card-list">
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
</div>

<div class="pagination">
    <c:forEach begin="1" end="${totalPage}" var="i">
        <c:choose>
            <c:when test="${i == curPage}">
                <span class="active cur-page page-link" data-page="${curPage}">[${i}]</span>
            </c:when>
            <c:otherwise>
                <a href="#" class="page-link" data-page="${i}">[${i}]</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
<%--<script src="/other/js/account.js"></script>--%>
