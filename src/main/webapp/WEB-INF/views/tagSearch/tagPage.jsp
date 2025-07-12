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
<c:forEach items="${tagList}" var="tl">
    <div class="ts-line">
        <div class="ts-category">${tl.key}</div>
        <div class="ts-taglist">
            <c:forEach items="${tl.value}" var="v">
                <button type="button" name="${v.tag_name}">#${v.tag_name}</button>
            </c:forEach>
        </div>
    </div>
</c:forEach>
<div class="ts-line">
    <div class="ts-category">지역</div>
        <div class="ts-taglist">
    <c:forEach items="${tags4}" var="t">
            <button type="button" name="${t.location_name}">#${t.location_name}</button>
    </c:forEach>
        </div>
</div>

<hr>
<div id="render-div"></div>

</body>
<script>

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