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

<h1>gachafood</h1>
    <button class="gacha">random!!</button>
    <button class="gacha" value="on">어디가면 그 음식 먹을 수 있는데??</button>
<span id="result" style="display: inline-block;
    width: 500px;
    margin-left: 300px;"></span>
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