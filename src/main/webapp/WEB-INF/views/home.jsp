<%@ page language = "java" contentType = "text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Document</title>
</head>
<body>
<div class="startcuteduck">
    <img src="/other/image/cuteduck.gif" alt="">
</div>

<div class="home-container">
    <img id="teamlogo" src="/other/image/logo.png" alt="">
    <div class="start-btn">
        <button class="btn btn-3d btn-delete"><img src="/other/image/start.png" alt="" style="width: 200px"></button>
    </div>
</div>




</body>
<script>
    const startclickSound = new Audio("/other/audio/powerup02.mp3");
    const startButton = document.querySelector(".start-btn");
    const startduck = document.querySelector(".startcuteduck");

    startButton.addEventListener("click", (e) => {
        e.preventDefault(); // 기본 동작(즉시 이동) 방지
        startduck.style.display="block";
        // 소리 재생
        startclickSound.play().then(() => {
            // 재생이 끝났을 때 페이지 이동
            startclickSound.addEventListener("ended", () => {
                location.href = "/gamelist";
            });
        }).catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            // 차단된 경우 바로 이동
            location.href = "/gamelist";
        });
    });
</script>
</html>