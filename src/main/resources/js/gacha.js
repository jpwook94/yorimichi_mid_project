
const crane = document.querySelector(".gachacitypick-crane");
/*const btn = document.querySelector("#btn");*/

const leftBtn = document.querySelector("#joystick-left");
const rightBtn = document.querySelector("#joystick-right");
const pickup = document.querySelector("#gachacitypick-pickup");
let isPressing = false;
let pressInterval;


pickup.addEventListener("click", () => {
    animateWlqrp2();
});

// 조이스틱 왼쪽
leftBtn.addEventListener("mousedown", () => {
    isPressing = true;
    console.log("눌렀다!");

    pressInterval = setInterval(() => {
        if (isPressing) {
            console.log("계속 누르는 중...");

            // 현재 left 값을 가져와서 숫자로 변환
            let currentLeft = parseInt(getComputedStyle(wlqrp).left, 10) || 0;
            console.log(currentLeft);
            // 20px 줄이기
            if (currentLeft >= 1) wlqrp.style.left = currentLeft - 1 + "px";
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
            let currentRight = parseInt(getComputedStyle(wlqrp).left, 10) || 0;
            console.log(currentRight);
            // 20px 줄이기
            if (currentRight <= 320) wlqrp.style.left = currentRight + 1 + "px";
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


btn.addEventListener("click", () => {
    // 실행

    animateWlqrp();
});

async function animateWlqrp() {
    wlqrp.style.transition = "all 1s";

    // 1. 왼쪽 이동
    wlqrp.style.left = "0px";
    await delay(1000);

    // 2. 아래로 이동
    wlqrp.style.top = "30px";
    await delay(1000);

    picked.style.bottom = "220px";
    // 3. 다시 위로 이동
    wlqrp.style.top = "-170px";
    await delay(1000);

    // 4. 오른쪽 이동
    wlqrp.style.left = "50px";
    picked.style.left = "50px";
}



async function animateWlqrp2() {
    wlqrp.style.transition = "all 1s";

    // 2. 아래로 이동
    wlqrp.style.top = "30px";
    await delay(1000);
    picked.style.left = wlqrp.style.left;
    await delay(1000);
    picked.style.bottom = "220px";
    // 3. 다시 위로 이동
    wlqrp.style.top = "-170px";
    await delay(1000);

    // 4. 오른쪽 이동
    wlqrp.style.left = "50px";
    picked.style.left = "50px";
}

function delay(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}