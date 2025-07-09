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
    <div class="ts-line">
        <div class="ts-category">목적</div>
        <div class="ts-taglist">
            <button type="button">#식도락</button>
            <button type="button">#사진스팟</button>
            <button type="button">#쇼핑</button>
        </div>
        </div>
        <div class="ts-line">
            <div class="ts-category">카테고리</div>
            <div class="ts-taglist">
                <button type="button">#바다</button>
                <button type="button">#공원</button>
                <button type="button">#신사</button>
            </div>
        </div>
        <div class="ts-line">
            <div class="ts-category">동행자 관계</div>
            <div class="ts-taglist">
                <button type="button">#친구랑</button>
                <button type="button">#연인이랑</button>
                <button type="button">#가족이랑</button>
            </div>
        </div>
        <div class="ts-line">
            <div class="ts-category">지역</div>
            <div class="ts-taglist">
                <button type="button">오사카</button>
                <button type="button">도쿄</button>
                <button type="button">교토</button>
            </div>
        </div>
    </div>
</div>

<hr>
<div id="render-div"></div>

</body>
<%--<script>--%>
<%--    document.querySelector("button[name='btn1']").addEventListener("click", () => {--%>
<%--        let url = "/api/tagPage";--%>
<%--        url += "?tag=" + 11;--%>
<%--       fetch(url, {--%>
<%--       }).then((response) => response.json())--%>
<%--           .then((data) => {--%>
<%--               render(data);--%>
<%--       })--%>
<%--    });--%>
<%--const renderDiv = document.querySelector("#render-div");--%>
<%--    function render(data) {--%>
<%--        let content = `<div>`--%>
<%--        data.forEach(element => {--%>
<%--                        content += "<div>" + element.test + "</div>";--%>
<%--        })--%>
<%--        content += "</div>";--%>
<%--        console.log(content);--%>
<%--        renderDiv.innerHTML = content;--%>
<%--    }--%>
<%--</script>--%>
</html>