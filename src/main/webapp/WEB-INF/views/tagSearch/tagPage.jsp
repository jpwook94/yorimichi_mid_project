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
</head>
<body>
<div class="ts-box">
    <c:forEach items="${tagList}" var="tl">
    <c:forEach items="${tags}" var="map">
    <div class="ts-line">
        <div class="ts-category">${map.key}</div>
        <div class="ts-taglist">
            <button type="button" name="${map.value.getTag_name}">#${map.value.getTag_name}</button>
        </div>
    </div>
    </c:forEach>
    <div class="ts-line">
        </c:forEach>
        <div class="ts-category">지역</div>
        <c:forEach items="${tags4}" var="t">
            <div class="ts-taglist">
                <button type="button" name="${t.location_name}">${t.location_name}</button>
            </div>
        </c:forEach>
    </div>


    <%--    <div class="ts-line">--%>
    <%--        <div class="ts-category">목적</div>--%>
    <%--        <c:forEach items="${tags1}" var="t">--%>
    <%--        <div class="ts-taglist">--%>
    <%--            <button type="button" name="${t.tag_name}">#${t.tag_name}</button>--%>
    <%--        </div>--%>
    <%--        </c:forEach>--%>
    <%--        </div>--%>
    <%--        <div class="ts-line">--%>
    <%--            <div class="ts-category">카테고리</div>--%>
    <%--            <c:forEach items="${tags2}" var="t">--%>
    <%--            <div class="ts-taglist">--%>
    <%--                <button type="button" name="${t.tag_name}">#${t.tag_name}</button>--%>
    <%--            </div>--%>
    <%--            </c:forEach>--%>
    <%--        </div>--%>
    <%--        <div class="ts-line">--%>
    <%--            <div class="ts-category">동행자 관계</div>--%>
    <%--            <c:forEach items="${tags3}" var="t">--%>
    <%--            <div class="ts-taglist">--%>
    <%--                <button type="button" name="${t.tag_name}">#${t.tag_name}</button>--%>
    <%--            </div>--%>
    <%--            </c:forEach>--%>
    <%--        </div>--%>
    <%--        <div class="ts-line">--%>
    <%--            <div class="ts-category">지역</div>--%>
    <%--            <c:forEach items="${tags4}" var="t">--%>
    <%--            <div class="ts-taglist">--%>
    <%--                <button type="button" name="${t.location_name}">${t.location_name}</button>--%>
    <%--            </div>--%>
    <%--            </c:forEach>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--</div>--%>

    <hr>
    <div id="render-div"></div>

</body>
<script>
    // const renderDiv = document.querySelector("#render-div");
    //
    // // 목적, 카테고리, 동행자 관계, 지역 버튼 모두 선택
    // document.querySelectorAll(".ts-taglist button").forEach(button => {
    //     button.addEventListener("click", () => {
    //         const tag = button.getAttribute("name");
    //         // console.log(tag);
    //
    //         let url = "/search/tag-search?name=" + tag;
    //
    //         fetch(url)
    //             .then((response) => response.json())
    //             .then((data) => {
    //                 // console.log(data);
    //                 render(data);
    //             });
    //     });
    // });
    //
    // function render(data) {
    //     let content = `<div class="tag-result-wrapper">`;
    //     data.forEach(element => {
    //         console.log(element);
    //         content += "<div class='tag-result'>" + element.destination_number + "</div>";
    //         content += "<div class='tag-result'>" + element.destination_name + "</div>";
    //         content += "<div class='tag-result'>" + element.mbti_category + "</div>";
    //         content += "<div class='tag-result'>" + element.destination_address + "</div>";
    //         content += "<hr>"
    //     });
    //     content += "</div>";
    //     // console.log(content);
    //     renderDiv.innerHTML = content;
    // }
    const renderDiv = document.querySelector("#render-div");
    const selectedTags = new Set();  // 중복 없이 태그 저장

    document.querySelectorAll(".ts-taglist button").forEach(button => {
        button.addEventListener("click", () => {
            const tag = button.getAttribute("name");

            // 토글: 이미 선택된 태그라면 제거, 아니라면 추가
            if (selectedTags.has(tag)) {
                selectedTags.delete(tag);
                button.classList.remove("active");
            } else {
                selectedTags.add(tag);
                button.classList.add("active");
            }

            // 선택된 태그들을 URL 쿼리로 전송
            const tagParam = Array.from(selectedTags).join(",");
            const url = "/search/tag-search?tags=" + encodeURIComponent(tagParam);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    render(data);
                });
        });
    });

    function render(data) {
        let content = `<div class="tag-result-wrapper">`;
        data.forEach(element => {
            content += "<div class='tag-result'>" + element.destination_number + "</div>";
            content += "<div class='tag-result'>" + element.destination_name + "</div>";
            content += "<div class='tag-result'>" + element.mbti_category + "</div>";
            content += "<div class='tag-result'>" + element.destination_address + "</div>";
            content += "<hr>";
        });
        content += "</div>";
        renderDiv.innerHTML = content;
    }
</script>
</html>