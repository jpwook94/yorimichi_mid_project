<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            font-family: sans-serif;
            background: transparent;
        }

        .c-window {
            position: relative;
            background: white;
            border: 2px solid #000;
            width: 400px;
            height: 500px;
            box-shadow: 4px 4px 0 #222;
            margin: 40px auto;
        }

        .c-title-bar {
            background-color: #a5aaff;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 0 5px;
            border-bottom: 1px solid #000;
        }

        .c-window-buttons {
            display: flex;
            gap: 4px;
        }

        .c-btn {
            width: 18px;
            height: 18px;
            background: #fff;
            border: 1px solid #000;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .minimize .icon-line {
            width: 10px;
            height: 2px;
            background: #000;
        }

        .maximize .icon-square {
            width: 10px;
            height: 8px;
            border: 1px solid #000;
        }

        .close .icon-x {
            position: relative;
            width: 10px;
            height: 10px;
        }

        .close .icon-x span {
            position: absolute;
            top: 4px;
            left: 0;
            width: 10px;
            height: 2px;
            background: #000;
        }

        .close .icon-x span:first-child {
            transform: rotate(45deg);
        }

        .close .icon-x span:last-child {
            transform: rotate(-45deg);
        }

        .c-search-bar {
            display: flex;
            padding: 8px;
            gap: 5px;
            border-bottom: 1px solid #000;
        }

        .c-search-input {
            flex: 1;
            padding: 5px;
            border: 1px solid #000;
        }

        .c-search-button {
            padding: 5px 10px;
            border: 1px solid #000;
            background: white;
            cursor: pointer;
            font-weight: bold;
        }

        .c-content-box {
            height: 400px;
            display: flex;
            flex-direction: row;
        }

        .c-content-area {
            flex: 1;
            background: white;
            border-right: 1px solid #000;
        }

        .c-fake-scrollbar {
            width: 24px;
            height: 100%;
            border-left: 1px solid #000;
            border-right: 1px solid #000;
            display: flex;
            flex-direction: column;
            background: #f0f0f0;
            box-sizing: border-box;
        }

        .c-scroll-btn {
            height: 24px;
            width: 100%;
            background: #e5e5e5;
            border-top: 1px solid #000;
            border-bottom: 1px solid #000;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .c-scroll-btn svg {
            width: 10px;
            height: 10px;
        }

        .c-track {
            flex: 1;
            position: relative;
            background: #f0f0f0;
        }

        .c-thumb {
            width: 100%;
            height: 40%;
            background: #a5aaff;
            border: 1px solid #000;
            position: absolute;
            top: 30%;
            left: 0;
        }
    </style>
</head>
<body>

<div class="c-window-container">
    <div class="c-window">
        <div class="c-title-bar">
            <div class="c-window-buttons">
                <div class="c-btn minimize">
                    <div class="icon-line"></div>
                </div>
                <div class="c-btn maximize">
                    <div class="icon-square"></div>
                </div>
                <div class="c-btn close">
                    <div class="icon-x">
                        <span></span><span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="c-search-bar">
            <input type="text" class="c-search-input" />
            <button class="c-search-button">Search...</button>
        </div>
        <div class="c-content-box">
            <div class="c-content-area">

                <div>
                    <img src="" onclick="location.href='/mbtiTest-detail'" alt="">
                </div>

                <div>
                    <img src="" onclick="location.href='/idealType-detail'" alt="">
                </div>

            </div>
            <div class="c-fake-scrollbar">
                <div class="c-scroll-btn up">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">
                        <polygon points="5,2 2,7 8,7" fill="black"/>
                    </svg>
                </div>
                <div class="c-track">
                    <div class="c-thumb"></div>
                </div>
                <div class="c-scroll-btn down">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">
                        <polygon points="2,3 8,3 5,8" fill="black"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>
</div>


<div>
    <img src="" onclick="location.href='/mbtiTest-detail'" alt="">
</div>

<div>
    <img src="" onclick="location.href='/idealType-detail'" alt="">
</div>

</body>
</html>