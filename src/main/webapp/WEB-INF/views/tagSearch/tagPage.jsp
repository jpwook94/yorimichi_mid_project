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
<div class="header-wrapper" onclick="">
    <div class="return-container" onclick="history.back()"><img src="/other/image/return.png" alt=""></div>
    <div class="teamlogo-container"><img id="teamlogo2" onclick="location.href='/gamelist'" src="/other/image/logo.png" alt=""></div>
    <div>로그인 / 마이페이지</div>
</div>
    <hr>



<div class="tag-search-wrapper">
<div><h1># 태그로 검색</h1></div>
    <br>
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
<div id="render-div"></div>
</div>



<div class="top-button-wrapper"><img src="/other/image/DUCK7.png" alt="" class="top-duck"></div>


</body>
<script>

    const userSelect = document.querySelector("#user-select");
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

            userRender();

            // 선택된 태그들을 URL 쿼리로 전송
            const tagParam = Array.from(selectedTags).join(",");
            const url = "/search/tag-search?tags=" + encodeURIComponent(tagParam);

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    render(data);
                    console.log(data);
                });
            updateClearButton();
        });
    });

    function render(data) {
        let content = `<div class="tag-result-wrapper">`;
        data.forEach(element => {
            // ### [추가 시작] 태그 검색 결과인 경우
            if ('destination_name' in element) {
                content += "<div class='tag-result'>" + element.destination_number + "</div>";
                content += "<div class='tag-result'>" + element.destination_name + "</div>";
                content += "<div class='tag-result'>" + element.mbti_category + "</div>";
                content += "<div class='tag-result'>" + element.destination_address + "</div>";
            }
                // ### [추가 끝]

            // ### [추가 시작] 지역 검색 결과인 경우
            else if ('location_name' in element) {
                content += "<div class='tag-result'>" + element.location_name + "</div>";
            }
            // ### [추가 끝]
            content += "<hr>";
        });
        content += "</div>";
        renderDiv.innerHTML = content;
    }

    function userRender() {
        let content = `<div class="user-select-wrapper">`;

        selectedTags.forEach(name => {
            content += `<div>\#\${name}</div>`;
        });
        content += `</div>`;
        userSelect.innerHTML = content;
        updateClearButton();
    }


    const clearButtonContainer = document.querySelector("#clear-button-container");

    function updateClearButton() {
        if (selectedTags.size > 0) {
            clearButtonContainer.innerHTML = `<button id="clear-all-button">태그 전체 해제</button>`;

            document.querySelector("#clear-all-button").addEventListener("click", () => {
                selectedTags.clear();  // 전체 해제
                document.querySelectorAll(".ts-taglist button").forEach(btn => btn.classList.remove("active"));
                userRender();
                renderDiv.innerHTML = "";  // 결과 초기화
                clearButtonContainer.innerHTML = ""; // 버튼도 제거
            });
        } else {
            clearButtonContainer.innerHTML = "";
        }
    }


</script>
</html>