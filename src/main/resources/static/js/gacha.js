const observer = new MutationObserver((mutations) => {
    const joystick = document.querySelector("#joystick-left");
    if (joystick) {
        console.log("✅ joystick-left가 추가되었음!", joystick);
        const joystickleft = document.getElementById("joystick-left");
        console.log(joystickleft);

        console.log("✅ gacha.js 파일이 제대로 연결되었습니다!");

        const crane = document.querySelector(".gachacitypick-crane");
        const picked = document.querySelector(".pickmascot");


        const leftBtn = document.querySelector("#joystick-left");
        const rightBtn = document.querySelector("#joystick-right");
        const pickup = document.querySelector("#gachacitypick-pickup");
        let isPressing = false;
        let pressInterval;


        pickup.addEventListener("click", () => {
            animatecrane();
        });

// 조이스틱 왼쪽
        leftBtn.addEventListener("mousedown", () => {
            isPressing = true;
            console.log("눌렀다!");

            pressInterval = setInterval(() => {
                if (isPressing) {
                    console.log("계속 누르는 중...");

                    // 현재 left 값을 가져와서 숫자로 변환
                    let currentLeft = parseInt(getComputedStyle(crane).left, 10) || 0;
                    console.log(currentLeft);
                    // 20px 줄이기
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

                    // 현재 left 값을 가져와서 숫자로 변환
                    let currentRight = parseInt(getComputedStyle(crane).left, 10) || 0;
                    console.log(currentRight);
                    // 20px 줄이기
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

            // 2. 아래로 이동
            crane.style.top = "-40px";
            await delay(1000);
            picked.style.left = crane.style.left;
            await delay(1000);
            picked.style.bottom = "35px";
            // 3. 다시 위로 이동
            crane.style.top = "-120px";
            await delay(1000);

            // 4. 원래 위치로 복귀
            crane.style.left = "15px";
            picked.style.left = "15px"; // picked도 따라오게 하려면
            await delay(1000);
        }

        function delay(ms) {
            return new Promise((resolve) => setTimeout(resolve, ms));
        }

        observer.disconnect(); // 더 이상 감시할 필요 없으면 끊기
    }
});

observer.observe(document.body, {childList: true, subtree: true});




