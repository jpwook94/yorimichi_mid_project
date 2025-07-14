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
    <div class="teamlogo-container"><img id="teamlogo2" onclick="location.href='/gamelist'" src="/other/image/logo.png"
                                         alt=""></div>
    <div>로그인 / 마이페이지</div>
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
    <div id="render-div"><div class="no-result-message">태그를 선택해 여행지를 검색해 보세요.</div></div>
</div>


<div class="banner-wrapper"><img src="/other/image/banner2.png" alt=""></div>
<div class="top-button-wrapper"><img src="/other/image/DUCK7.png" alt="" class="top-duck"></div>



<footer>dddd</footer>
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

            if (selectedTags.size === 0) {
                render([]);  // ← 이 때는 빈 배열을 넘겨 '태그 선택해주세요' 출력
                updateClearButton();
                return;
            }


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
        let content = "";
        const resultSizeDiv = document.querySelector("#ts-result-size");

        //  case 1: 아무 태그도 선택 안 했을 때
        if (selectedTags.size === 0) {
            content = `<div class="no-result-message">태그를 선택해 여행지를 검색해 보세요.</div>`;
            resultSizeDiv.innerText = ""; // 👉 안 보이게 처리
        }
            //  case 2: 태그는 선택했지만 결과가 없을 때
        else if (data.length === 0) {
            content = `<div class="no-result-message">검색 결과가 없습니다.</div>`;
            resultSizeDiv.innerHTML = `총 <span class="highlight-number">0</span> 개의 여행지`;

        //  case 3: 결과 있음

        } else {
            content = `<div class="tag-result-wrapper">`;
            console.log("data.length:", data.length);
            resultSizeDiv.innerHTML = `총  <span class="highlight-number">\${data.length}</span> 개의 여행지`;
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
        }
        renderDiv.innerHTML = content;
    }

    function userRender() {
        let content = `<div class="user-select-wrapper">`;

        selectedTags.forEach(name => {
            content += `<div class="user-tag" data-tag="\${name}">#\${name}</div>`;
        });
        content += `</div>`;
        userSelect.innerHTML = content;

        // 클릭 시 해당 태그 제거
        document.querySelectorAll(".user-tag").forEach(tagDiv => {
            tagDiv.addEventListener("click", () => {
                const tagName = tagDiv.getAttribute("data-tag");
                console.log("삭제 대상 태그:", tagName);
                console.log("현재 Set 상태:", selectedTags);
                selectedTags.delete(tagName);

                // 모든 버튼 중에서 name 속성이 일치하는 것 찾아서 active 제거
                document.querySelectorAll(".ts-taglist button").forEach(btn => {
                    if (btn.getAttribute("name") === tagName) {
                        btn.classList.remove("active");
                    }
                });

                userRender();
                renderDiv.innerHTML = "";
                updateClearButton();
            });
        });

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
                render([]);
                clearButtonContainer.innerHTML = ""; // 버튼도 제거
            });
        } else {
            clearButtonContainer.innerHTML = "";
        }
    }


</script>
</html>