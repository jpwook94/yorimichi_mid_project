<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
    <style>
        body {
            background-color: #dcdcdc;
            font-family: sans-serif;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 30px;
        }

        .pixel-card {
            width: 200px;
            height: 320px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            background-color: #d9d9d0;
            box-shadow:
                    -4px -4px 0px #ffffff,
                    4px 4px 0px #5a5a5a;
            border: 2px solid #9e9e9e;
            image-rendering: pixelated;
            position: relative;
        }

        .pixel-card::before,
        .pixel-card::after {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            border: 2px inset #c0c0c0;
            top: 0;
            left: 0;
        }

        .pixel-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border: 2px solid #c2c2c2;
            margin-bottom: 10px;
        }

        .pixel-title {
            background-color: #ffffff;
            padding: 6px 10px;
            font-size: 16px;
            border: 2px solid #aaa;
            box-shadow: inset 2px 2px 0 #e0e0e0;
            text-align: center;
            width: 100%;
        }
    </style>
</head>
<body>
<h1>index jsp</h1>

<div class="pixel-card">
    <img src="https://source.unsplash.com/featured/?tokyo" alt="도쿄">
    <div class="pixel-title">도쿄</div>
</div>

<div class="pixel-card">
    <img src="https://source.unsplash.com/featured/?kyoto" alt="교토">
    <div class="pixel-title">교토</div>
</div>

<div class="pixel-card">
    <img src="https://source.unsplash.com/featured/?osaka" alt="오사카">
    <div class="pixel-title">오사카</div>
</div>
</body>
</html>