<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
    <style>
        h1, button{
            margin-left: 500px;
        }
    </style>
</head>
<body>
<audio controls autoplay loop style="display: none">
    <source src="/other/audio/gacha/foodback.mp3">
</audio>

<%-- 배경 --%>
<div class="gachafoodback">

<%-- 미연시 오리 --%>
<div class="gachafood-duckcontainer">
    <img id="gachafood-duck" src="/other/image/gacha/dokidoki21.png" alt="">
</div>

<%-- 선택지 --%>
<div class="gachafood-choices">
    <button class="gacha">일본 여행왔는데 추천해줄 음식 있어?</button>
    <button class="gacha" value="on">어디가면 그 음식 먹을 수 있는데??</button>
</div>

<%-- 대화창 --%>
<div class="gachafood-chatwindow">
    <span id="result" > 앗, 오리쿤에게 물어볼까?</span>
</div>
</div>
<script>
    // document.addEventListener('click', (e) => {
        // if (e.target && e.target.class === 'gacha') {
        //     console.log('랜덤뽑기!!');
        //     let url = "api/gacha/food";
        //     if (e.target.value == on) url += '?where=on';
        //     fetch(url)
        //         .then(response => response.text())
        //         .then(data => {
        //             console.log(data)
        //             document.querySelector("#result").innerText = data;
        //         });
        // }
    // });
</script>

</body>
</html>