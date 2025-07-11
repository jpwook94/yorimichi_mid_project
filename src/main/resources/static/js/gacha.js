const observer = new MutationObserver((mutations) => {
    const joystick = document.querySelector("#joystick-left");
    if (joystick) {
        console.log("✅ joystick-left가 추가되었음!", joystick);
        const joystickleft = document.getElementById("joystick-left");
        console.log(joystickleft);

        console.log("✅ gacha.js 파일이 제대로 연결되었습니다!");





        //뽑기를 아직 안눌렀음
        let hasPicked = false;

        const crane = document.querySelector(".gachacitypick-crane");
        const picked = document.querySelector(".pickmascot");

        const leftBtn = document.querySelector("#joystick-left");
        const rightBtn = document.querySelector("#joystick-right");
        const pickup = document.querySelector("#gachacitypick-pickup");
        let isPressing = false;
        let pressInterval;

        // 뽑기 버튼 클릭!
        pickup.addEventListener("click", () => {
            if (hasPicked) return; // 이미 눌렸다면 아무것도 하지 않음
            console.log("🎯 뽑기 버튼 클릭됨"); // 추가
            hasPicked = true;

            animatecrane();

            // 버튼 기능 차단 (원하는 경우 시각적으로 비활성화도 가능)
            pickup.style.pointerEvents = "none";
            leftBtn.style.pointerEvents = "none";
            rightBtn.style.pointerEvents = "none";
        });

        // 조이스틱 왼쪽
        leftBtn.addEventListener("mousedown", () => {
            isPressing = true;
            console.log("눌렀다!");

            pressInterval = setInterval(() => {
                if (isPressing) {
                    console.log("계속 누르는 중...");

                    let currentLeft = parseInt(getComputedStyle(crane).left, 10) || 0;
                    console.log(currentLeft);
                    if (currentLeft >= 1) crane.style.left = currentLeft - 1 + "px";
                }
            }, 1);
        });

        leftBtn.addEventListener("mouseup", () => {
            isPressing = false;
            clearInterval(pressInterval);
        });

        leftBtn.addEventListener("mouseleave", () => {
            isPressing = false;
            clearInterval(pressInterval);
        });

        // 조이스틱 오른쪽
        rightBtn.addEventListener("mousedown", () => {
            isPressing = true;
            console.log("눌렀다!");

            pressInterval = setInterval(() => {
                if (isPressing) {
                    console.log("계속 누르는 중...");

                    let currentRight = parseInt(getComputedStyle(crane).left, 10) || 0;
                    console.log(currentRight);
                    if (currentRight <= 295) crane.style.left = currentRight + 1 + "px";
                }
            }, 1);
        });

        rightBtn.addEventListener("mouseup", () => {
            isPressing = false;
            clearInterval(pressInterval);
        });

        rightBtn.addEventListener("mouseleave", () => {
            isPressing = false;
            clearInterval(pressInterval);
        });

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

        function delay(ms) {
            return new Promise((resolve) => setTimeout(resolve, ms));
        }

        observer.disconnect(); // 더 이상 감시할 필요 없으면 끊기
    }
});

observer.observe(document.body, {childList: true, subtree: true});
