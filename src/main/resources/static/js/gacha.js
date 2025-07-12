document.querySelectorAll(".gacha-sidebar-item").forEach((dom) => {
    dom.addEventListener("click", (e) => {
        const url = "api/gacha?cate=" + e.target.dataset.cate;
        fetch(url)
            .then(response => response.text())
            .then(data => {
                document.querySelector(".gacha-main-content").innerHTML = data;
                initGachaMachineEvents(); // ✅ 이벤트 등록은 fetch 이후!
            });
    });
});

// 페이지 로딩 후 기본 호출
document.querySelectorAll(".gacha-sidebar-item")[0].click();

window.addEventListener('DOMContentLoaded', () => {
    const bgMusic = document.getElementById("bg-music");
    bgMusic.muted = false; // 소리 켜기
    bgMusic.play().catch((err) => {
        console.warn("브라우저가 자동 재생을 막았어요. 클릭 후 재생됩니다.");
    });
});

function initGachaMachineEvents() {
    const crane = document.querySelector(".gachacitypick-crane");
    const picked = document.querySelector(".pickmascot");
    const leftBtn = document.querySelector("#joystick-left");
    const rightBtn = document.querySelector("#joystick-right");
    const pickup = document.querySelector("#gachacitypick-pickup");
    const speechBubble = document.querySelector(".gachacitypick-pickstart-speechbubble");
    const joystickAudio = new Audio("/other/audio/gacha/robot-movement-sound-effects.mp3");
    joystickAudio.loop = true; // 계속 재생되도록

    if (!crane || !picked || !leftBtn || !rightBtn || !pickup) return;

    //뽑기를 아직 안눌렀음
    let hasPicked = false;
    let isPressing = false;
    let pressInterval;


    pickup.addEventListener("click", async () => {
            if (hasPicked) return; // 이미 눌렸다면 아무것도 하지 않음
            hasPicked = true;

            speechBubble.classList.add("hidden");


            //그놈의 비동기
            const response = await fetch("/pick");
            const data = await response.text();
            console.log(data)


            // 크레인 움직임
            await animatecrane();


            // 버튼 기능 차단 (원하는 경우 시각적으로 비활성화도 가능)
            pickup.style.pointerEvents = "none";
            leftBtn.style.pointerEvents = "none";
            rightBtn.style.pointerEvents = "none";

            document.querySelector(".gachacitypick-onemore").style.display = "block";
        }
    )
    ;

    function stopPressing() {
        isPressing = false;
        clearInterval(pressInterval);
        joystickAudio.pause();      // 소리 멈춤
        joystickAudio.currentTime = 0; // 처음으로 되돌림
    }


// 조이스틱 왼쪽
    leftBtn.addEventListener("mousedown", () => {
        isPressing = true;
        console.log("눌렀다!");
        joystickAudio.play();

        pressInterval = setInterval(() => {
            if (isPressing) {
                console.log("계속 누르는 중...");

                let currentLeft = parseInt(getComputedStyle(crane).left, 10) || 0;
                console.log(currentLeft);
                if (currentLeft >= 1) crane.style.left = currentLeft - 1 + "px";
            }
        }, 1);
    });

    leftBtn.addEventListener("mouseup", stopPressing);
    leftBtn.addEventListener("mouseleave", stopPressing);
// 조이스틱 왼쪽 끝

// 조이스틱 오른쪽
    rightBtn.addEventListener("mousedown", () => {
        isPressing = true;
        console.log("눌렀다!");
        joystickAudio.play();

        pressInterval = setInterval(() => {
            if (isPressing) {
                console.log("계속 누르는 중...");

                let currentRight = parseInt(getComputedStyle(crane).left, 10) || 0;
                console.log(currentRight);
                if (currentRight <= 295) crane.style.left = currentRight + 1 + "px";
            }
        }, 1);
    });


    rightBtn.addEventListener("mouseup", stopPressing);
    rightBtn.addEventListener("mouseleave", stopPressing);

//조이스틱 오른쪽 끝

    function delay(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }

    async function animatecrane() {


        crane.style.transition = "all 1s";

        crane.style.top = "-40px";
        await delay(1000);
        picked.style.left = crane.style.left;
        await delay(1000);
        picked.style.bottom = "35px";
        crane.style.top = "-120px";
        await delay(1000);
        crane.style.left = "15px";
        picked.style.left = "15px";
        await delay(1000);
    }

    //===================================== SSR 카드 뽑기 ==========================================














}
