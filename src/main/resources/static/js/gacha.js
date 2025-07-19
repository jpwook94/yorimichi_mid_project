document.querySelectorAll(".gacha-sidebar-item").forEach((dom) => {
    dom.addEventListener("click", (e) => {
        const url = "api/gacha?cate=" + e.target.dataset.cate;
        fetch(url)
            .then(response => response.text())
            .then(data => {
                document.querySelector(".gacha-main-content").innerHTML = data;
                initGachaMachineEvents(); // ✅ 이벤트 등록은 fetch 이후!

                if (e.target.dataset.cate === "2") {
                    initSSRcardEvents(); // 원하는 함수 호출
                }
            });
    });
});

// 페이지 로딩 후 기본 호출
document.querySelectorAll(".gacha-sidebar-item")[0].click();



function initGachaMachineEvents() {
    const crane = document.querySelector(".gachacitypick-crane");
    const picked = document.querySelector(".pickmascot");
    const leftBtn = document.querySelector("#joystick-left");
    const rightBtn = document.querySelector("#joystick-right");
    const pickup = document.querySelector("#gachacitypick-pickup");
    const speechBubble = document.querySelector(".gachacitypick-pickstart-speechbubble");
    const joystickAudio = new Audio("/other/audio/gacha/robot-movement-sound-effects.mp3");
    joystickAudio.loop = true; // 계속 재생되도록
    joystickAudio.volume = 0.4

    if (!crane || !picked || !leftBtn || !rightBtn || !pickup) return;

    //뽑기를 아직 안눌렀음
    let hasPicked = false;
    let isPressing = false;
    let pressInterval;


    pickup.addEventListener("click", async () => {
            if (hasPicked) return; // 이미 눌렸다면 아무것도 하지 않음
            hasPicked = true;

        // 버튼 기능 차단 (원하는 경우 시각적으로 비활성화도 가능)
        pickup.style.pointerEvents = "none";
        leftBtn.style.pointerEvents = "none";
        rightBtn.style.pointerEvents = "none";

        speechBubble.classList.add("hidden");

        const pushbtnSound = new Audio("/other/audio/gacha/pushbtn.mp3");
        pushbtnSound.play().catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
        });

        const response = await fetch("/pick");
        const data = await response.json();
        console.log(data)

        const mascotImg = document.querySelector(".pickmascot");
        if (mascotImg && data.location_number) {
            mascotImg.src = `/other/image/mascot/${data.location_number}.png`;
        }


        // 크레인 움직임
        await animatecrane();

        const pickedmascot = document.querySelector(".gachacitypic-picked-mascot");
        const backlight = document.querySelector(".gachacitypic-picked-mascot-backlight");
        const locationnameEl = document.querySelector(".gachacitypic-picked-locationname");
        if (locationnameEl) {
            locationnameEl.textContent = data.location_name;
            locationnameEl.setAttribute("data-content", data.location_name); // data-content 속성도 업데이트
        }
        const mascotnameEl = document.querySelector(".gachacitypic-picked-mascotname");
        if (mascotnameEl) {
            mascotnameEl.textContent = data.mascot_name;
            mascotnameEl.setAttribute("data-content", data.mascot_name);
        }
        const pickedmascotimg = document.querySelector(".gachacitypic-picked-mascotimg");
        if (pickedmascotimg && data.location_number) {
            pickedmascotimg.src = `/other/image/mascot/${data.location_number}.png`;
        }
        backlight.classList.add("rotate");
        pickedmascot.style.display = "flex";
        void pickedmascot.offsetWidth;
        pickedmascot.style.opacity = "1";

        // 새로고침 누르도록
        document.querySelector(".gachacitypick-onemore").style.display = "block";
        }
    );

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
        picked.style.transition = "all 1s"

        // 1단계: 크레인 아래로 내려옴
        crane.style.top = "-40px";
        await delay(1000);

        // 2단계: picked 요소 좌우 위치 crane에 맞춤
        picked.style.left = crane.style.left;
        await delay(1000);

        // picked crane아래에 두고 올리기
        const craneRect = crane.getBoundingClientRect();
        const containerRect = crane.parentElement.getBoundingClientRect();
        const craneBottomRelative = craneRect.bottom - containerRect.top;

        picked.style.top = `${craneBottomRelative}px`;
        picked.style.bottom = "auto";
        await delay(50);
        crane.style.top = "-120px";
        picked.style.top = "calc(100% - 110px)";
        const dropSound = new Audio("/other/audio/gacha/jump03.mp3");
        dropSound.volume= 0.5;
        dropSound.play().catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
        });
        await delay(1000);

        // 5단계: 좌우로 이동
        crane.style.left = "15px";
        picked.style.left = "15px";
        await delay(1000);

        const getmasSound = new Audio("/other/audio/gacha/8-bit-powerup.mp3");
        getmasSound.play().catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
        });
    }

}






//===================================== SSR 카드 뽑기 ==========================================
// 파티클 생성 함수
function createSparkleEffect() {
    const container = document.getElementById('sparkleContainer');
    const cardWrapper = document.querySelector('.SSRcard-wrapper');
    const cardRect = cardWrapper.getBoundingClientRect();

    // 카드 중심점 계산
    const centerX = cardRect.left + cardRect.width / 2;
    const centerY = cardRect.top + cardRect.height / 2;

    // 작은 반짝이 파티클들 (30개)
    for (let i = 0; i < 30; i++) {
        const sparkle = document.createElement('div');
        sparkle.className = 'sparkle';

        // 랜덤 위치 (카드 주변에 분포)
        const angle = (Math.PI * 2 * i) / 30;
        const distance = Math.random() * 150 + 50;
        const x = centerX + Math.cos(angle) * distance;
        const y = centerY + Math.sin(angle) * distance;

        sparkle.style.left = x + 'px';
        sparkle.style.top = y + 'px';
        sparkle.style.animationDelay = Math.random() * 0.5 + 's';

        container.appendChild(sparkle);

        // 0.8초 후 제거
        setTimeout(() => {
            if (sparkle.parentNode) {
                sparkle.parentNode.removeChild(sparkle);
            }
        }, 1300);
    }

    // 큰 반짝이 효과들 (8개)
    for (let i = 0; i < 8; i++) {
        const bigSparkle = document.createElement('div');
        bigSparkle.className = 'big-sparkle';

        const angle = (Math.PI * 2 * i) / 8;
        const distance = Math.random() * 100 + 80;
        const x = centerX + Math.cos(angle) * distance;
        const y = centerY + Math.sin(angle) * distance;

        bigSparkle.style.left = x + 'px';
        bigSparkle.style.top = y + 'px';
        bigSparkle.style.animationDelay = Math.random() * 0.3 + 's';

        container.appendChild(bigSparkle);

        setTimeout(() => {
            if (bigSparkle.parentNode) {
                bigSparkle.parentNode.removeChild(bigSparkle);
            }
        }, 1500);
    }

    // 별 모양 반짝이들 (12개)
    for (let i = 0; i < 12; i++) {
        const starSparkle = document.createElement('div');
        starSparkle.className = 'star-sparkle';

        const angle = (Math.PI * 2 * i) / 12;
        const distance = Math.random() * 120 + 60;
        const x = centerX + Math.cos(angle) * distance;
        const y = centerY + Math.sin(angle) * distance;

        starSparkle.style.left = x + 'px';
        starSparkle.style.top = y + 'px';
        starSparkle.style.animationDelay = Math.random() * 0.4 + 's';

        container.appendChild(starSparkle);

        setTimeout(() => {
            if (starSparkle.parentNode) {
                starSparkle.parentNode.removeChild(starSparkle);
            }
        }, 1400);
    }

    // 광선 효과들 (6개)
    for (let i = 0; i < 6; i++) {
        const lightRay = document.createElement('div');
        lightRay.className = 'light-ray';

        const angle = (Math.PI * 2 * i) / 6;
        const distance = 30;
        const x = centerX + Math.cos(angle) * distance;
        const y = centerY + Math.sin(angle) * distance;

        lightRay.style.left = x + 'px';
        lightRay.style.top = y + 'px';
        lightRay.style.transform = `rotate(${angle * 180 / Math.PI}deg)`;
        lightRay.style.animationDelay = Math.random() * 0.2 + 's';

        container.appendChild(lightRay);

        setTimeout(() => {
            if (lightRay.parentNode) {
                lightRay.parentNode.removeChild(lightRay);
            }
        }, 1800);
    }
}


/* SSR 카드뽑기 선택 */
function initSSRcardEvents(){
    window.addEventListener("DOMContentLoaded", () => {
        const audio = document.getElementById("gacha-audio");
        if (audio) {
            audio.volume = 0.2;
        }
    });

    /* 뽑기 버튼 */
    const SSRcardpicked1 = document.querySelector('#SSRpick1');
    const SSRcardpickedN = document.querySelector('#SSRpickN');

    /* 찜하기 창 전체 */
    const likegachaContainer = document.querySelector(".likegacha-container");
    const likegachaContainer2 = document.querySelector(".likegacha-container22");
    const fivegachaContainer = document.querySelector(".fivegacha-container")
    /* 찜하기 버튼 */
    const likeBtn = document.querySelector(".likegacha-main-btnlist .like-btn1");
    /* 닫기 버튼 */
    const closeButton = document.querySelector(".likegacha-window-controls .likegacha-control-btn:last-child");
    const noButton = document.querySelector('.likegacha-main-btn[value=\"n\"]');
    const closeButton2 = likegachaContainer2.querySelector(".likegacha-control-btn:last-child");
    const noButton2 = likegachaContainer2.querySelector('.likegacha-main-btn[value="n"]');
    const closeButton3 = fivegachaContainer.querySelector(".fivegacha-window-controls:last-child");
    /* 닫기 버튼 누를 때 사운드 */
    const likenoclickSound = new Audio("/other/audio/gacha/gameboy-pluck.mp3");
    if (closeButton) {
        closeButton.addEventListener("click", () => {
            likenoclickSound.play().catch((err) => {
                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            });
            likegachaContainer.style.display = "none";
            document.querySelector(".fivegacha-container").style.display = "none";
            document.querySelector(".SSRcard-wrapper").classList.add("hide");
            SSRcardpicked1.style.pointerEvents = "auto";
            SSRcardpicked1.style.opacity = "1";
            SSRcardpickedN.style.pointerEvents = "auto";
            SSRcardpickedN.style.opacity = "1";
        });
    } else {
        console.warn("닫기 버튼 (×)을 찾을 수 없습니다.");
    }

    if (noButton) {
        noButton.addEventListener("click", () => {
            likenoclickSound.play().catch((err) => {
                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            });
            likegachaContainer.style.display = "none";
            document.querySelector(".fivegacha-container").style.display = "none";
            document.querySelector(".SSRcard-wrapper").classList.add("hide");
            SSRcardpicked1.style.pointerEvents = "auto";
            SSRcardpicked1.style.opacity = "1";
            SSRcardpickedN.style.pointerEvents = "auto";
            SSRcardpickedN.style.opacity = "1";
        });
    } else {
        console.warn("'no' 버튼을 찾을 수 없습니다.");
    }

    if (closeButton2) {
        closeButton2.addEventListener("click", () => {
            likenoclickSound.play().catch((err) => {
                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            });
            likegachaContainer2.style.display = "none";
            document.querySelector(".fivegacha-container").style.display = "none";
            document.querySelector(".SSRcard-wrapper").classList.add("hide");
            SSRcardpicked1.style.pointerEvents = "auto";
            SSRcardpicked1.style.opacity = "1";
            SSRcardpickedN.style.pointerEvents = "auto";
            SSRcardpickedN.style.opacity = "1";
        });
    }

    if (noButton2) {
        noButton2.addEventListener("click", () => {
            likenoclickSound.play().catch((err) => {
                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            });
            likegachaContainer2.style.display = "none";
            document.querySelector(".fivegacha-container").style.display = "none";
            document.querySelector(".SSRcard-wrapper").classList.add("hide");
            SSRcardpicked1.style.pointerEvents = "auto";
            SSRcardpicked1.style.opacity = "1";
            SSRcardpickedN.style.pointerEvents = "auto";
            SSRcardpickedN.style.opacity = "1";
        });
    }
    if (closeButton3) {
        closeButton3.addEventListener("click", () => {
            likenoclickSound.play().catch((err) => {
                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
            });
            likegachaContainer.style.display = "none";
            document.querySelector(".fivegacha-container").style.display = "none";
            document.querySelector(".SSRcard-wrapper").classList.add("hide");
            SSRcardpicked1.style.pointerEvents = "auto";
            SSRcardpicked1.style.opacity = "1";
            SSRcardpickedN.style.pointerEvents = "auto";
            SSRcardpickedN.style.opacity = "1";
        });
    } else {
        console.warn("닫기 버튼 (×)을 찾을 수 없습니다.");
    }
    /* 카드 뽑기 눌렀을 때 사운드 */
    const clickSSRSound = new Audio("/other/audio/gacha/clickSSRbut.mp3");
    /* 카드 나올 때 사운드 */
    const SSRcardshow = new Audio("/other/audio/gacha/shine-5.mp3");
    /* 카드 스파클 사운드 */
    const SSRcardSparkle = new Audio("/other/audio/gacha/shine-7.mp3");

    /* 1회 뽑기를 눌렀는지 5회뽑기를 눌렀는지 구분용 */
    let currentPickType = ""; // "single" 또는 "multi"

    /* 1회 뽑기 눌렀을 때 */
    SSRcardpicked1.addEventListener("click", async (e) => {
        console.log("1회뽑기 눌렀음")
        // 버튼 비활성화
        SSRcardpicked1.style.pointerEvents = "none"; // 클릭 막기
        SSRcardpicked1.style.opacity = "0.5"; // 시각적으로 흐리게
        SSRcardpickedN.style.pointerEvents = "none"; // 클릭 막기
        SSRcardpickedN.style.opacity = "0.5"; // 시각적으로 흐리게

        clickSSRSound.play().catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
        });

        document.querySelectorAll(".likegacha-main-btn")[0].dataset.mode = "single";

        const wrapper = document.querySelector(".SSRcard-wrapper");
        const innerCard = document.querySelector(".SSRcard-inner");

        let userId = e.target.dataset.userid;
        /* 데이터 받아오기 */
        const response = await fetch("/pickSSR");
        const data = await response.json();
        console.log(data)
        const destination_num = data.destination_number;
        // 유저가 여행지 찜 한게 있는지 없는지(없으면 0, 있으면 1 / 기본세팅 0)
        let exists = 0;
        if(userId !== null || userId !== ""){
            const response = await fetch(`/existsCheck/${userId}/${destination_num}`);
            const data2 = await response.json();
            // 유저가 여행지 찜 한게 있는지 없는지(없으면 0, 있으면 1로 바꿔준다)
            exists = data2 === 1 ? 1 : 0;
        }

        /* 받아온 destination 이름 적기 */
        const destNameEl = document.getElementById("SSR-destination-name");
        if (destNameEl) {
            destNameEl.textContent = data.destination_name;
            destNameEl.setAttribute("data-content", data.destination_name);
        }

        if (likeBtn && data.destination_number) { // likeBtn과 data.destination_number가 모두 있는지 확인
            likeBtn.setAttribute("data-destination-number", data.destination_number);
            console.log(`data-destination-number 설정됨: ${data.destination_number}`);
            document.querySelector(".like-btn1").setAttribute("data-destination-number", data.destination_number);
        } else {
            console.warn("likeBtn 요소를 찾을 수 없거나 data.destination_number가 없습니다.");
        }

        const pickeddestimg = document.querySelector(".SSRcard-imgcontainer img");
        if (pickeddestimg && data.destination_number) {
            pickeddestimg.src = `/other/image/destination/${data.destination_number}.png`;
        }

        if (wrapper) {
            // 초기 상태 리셋
            wrapper.classList.remove("flip", "show");
            wrapper.classList.add("hide");
            likegachaContainer.style.display = "none";
            /* 받아온 destination 이름 적기 */
            const destNameEl = document.getElementById("SSR-destination-name");
            if (destNameEl) {
                destNameEl.textContent = data.destination_name;
                destNameEl.setAttribute("data-content", data.destination_name);
            }

            setTimeout(() => {
                wrapper.classList.remove("hide");

                // 강제 리플로우로 transition 다시 계산
                void wrapper.offsetWidth;

                // 등장
                wrapper.classList.add("show");
                SSRcardshow.play().catch((err) => {
                    console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
                });


                // flip은 2초 후
                setTimeout(() => {
                    wrapper.classList.add("flip");

                    // flip 1초 뒤 효과
                    setTimeout(() => {
                        createSparkleEffect();
                        SSRcardSparkle.play().catch((err) => {
                            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
                        });
                        setTimeout(() => {
                            if(exists == 1){
                            // 이미 찜해놓은 여행지면 너 이미 찜햇는딩 윈도우 보여주기
                            document.querySelector(".likegacha-container22").style.display = "block";
                            }else {
                            // 찜 안해둔 여행지면 찜할래?? 윈도우 보여주기
                            document.querySelector(".likegacha-container").style.display = "block";
                            let tg = document.querySelectorAll(".likegacha-main-btn")[0];
                            tg.dataset.destinationNumber = destination_num;
                            addEvent();
                            }

                        }, 1000);
                    }, 1000);
                }, 2000);
            }, 1000); // hide 애니메이션 시간에 맞게
        }

    })

    /* 5회 뽑기 누르기 */
    SSRcardpickedN.addEventListener("click", async () => {
        console.log("N회뽑기 눌렀음")
        document.querySelectorAll(".likegacha-main-btn")[0].dataset.mode = "multi";

        // 버튼 비활성화
        SSRcardpicked1.style.pointerEvents = "none"; // 클릭 막기
        SSRcardpicked1.style.opacity = "0.5"; // 시각적으로 흐리게
        SSRcardpickedN.style.pointerEvents = "none"; // 클릭 막기
        SSRcardpickedN.style.opacity = "0.5"; // 시각적으로 흐리게

        clickSSRSound.play().catch((err) => {
            console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
        });

        likegachaContainer.style.display = "none";

        const response = await fetch("/pickSSRN");
        const data = await response.json();
        console.log(data)
        const destinationNumbers = data.map(d => d.destination_number);

        const likedRes = await fetch("/api/likes/check-liked-list", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(destinationNumbers),
            credentials: 'include'
        });
        const likedMap = await likedRes.json();

        // SSRN 시작
        playSSRN(data, likedMap);
        setTimeout(() => {
            document.querySelector(".likegacha-container").style.display = "block";
            document.querySelector(".fivegacha-container").style.display = "block";
            addEvent();
        }, 33000);

    })

    /* 5회뽑기 돌아감 */
    function playSSRN(destinations, likedMap = {}) {
        let index = 0;
        /* 카드 나올 때 사운드 */
        const SSRcardshow = new Audio("/other/audio/gacha/shine-5.mp3");
        /* 카드 스파클 사운드 */
        const SSRcardSparkle = new Audio("/other/audio/gacha/shine-7.mp3");

        //여행지 하나
        function revealNext() {

            // 모든 여행지가 표시되었으면 함수를 종료합니다.
            if (index >= destinations.length) {
                console.log("모든 목적지가 표시되었습니다!");
                document.querySelectorAll("input[data-destination-number]").forEach(e => console.log(e.onclick));
                document.querySelector(".SSRcard-wrapper").classList.add("hide");
                setTimeout(() => {
                    const checkboxes = document.querySelectorAll("input[name='fivelike']");
                    checkboxes.forEach((input, idx) => {
                        const destNum = destinations[idx].destination_number;

                        if (likedMap[destNum]) {
                            input.checked = true;
                            input.disabled = true;
                        } else {
                            input.checked = false;
                            input.disabled = false;
                        }
                    });

                }, 300);
                return;
            }

            const wrapper = document.querySelector(".SSRcard-wrapper");
            if (wrapper) {
                // 초기 상태 리셋
                wrapper.classList.remove("flip", "show");
                wrapper.classList.add("hide");

                const destNameEl = document.getElementById("SSR-destination-name");
                const currentDest = destinations[index];
                const checkboxes = document.querySelectorAll("input[name='fivelike']");
                const labels = document.querySelectorAll(".checkbox-label");
                if (destNameEl) {
                    destNameEl.textContent = currentDest.destination_name;
                    destNameEl.setAttribute("data-content", currentDest.destination_name);
                }
                const pickeddestimg = document.querySelector(".SSRcard-imgcontainer img");
                if (pickeddestimg && currentDest.destination_number) {
                    pickeddestimg.src = `/other/image/destination/${currentDest.destination_number}.png`;
                }
                if (checkboxes[index]) {
                    const destNum = currentDest.destination_number;
                    checkboxes[index].value = currentDest.destination_name;
                    checkboxes[index].dataset.destinationNumber = destNum;

                    if (likedMap[destNum]) {
                        checkboxes[index].checked = true;
                        checkboxes[index].disabled = true;
                    } else {
                        checkboxes[index].checked = false;
                        checkboxes[index].disabled = false;
                    }
                }

                if (labels[index]) {
                    labels[index].textContent = currentDest.destination_name;
                }

                setTimeout(() => {
                    wrapper.classList.remove("hide");

                    // 강제 리플로우로 transition 다시 계산
                    void wrapper.offsetWidth;

                    // 등장
                    wrapper.classList.add("show");
                    SSRcardshow.currentTime = 0;
                    SSRcardshow.play().catch((err) => {
                        console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
                    });

                    // flip은 2초 후
                    setTimeout(() => {
                        wrapper.classList.add("flip");

                        // flip 1초 뒤 효과
                        setTimeout(() => {
                            createSparkleEffect();
                            SSRcardSparkle.play().catch((err) => {
                                console.warn("사운드 재생이 차단되었을 수 있습니다:", err);
                            });
                            setTimeout(() => {
                                index++; // 다음 목적지를 위해 인덱스 증가
                                revealNext(); // 다음 항목을 위해 revealNext 호출
                            }, 2500);

                        }, 1000);

                    }, 2000);
                }, 1000);
            } else {
                console.error("SSRcard-wrapper를 찾을 수 없습니다.");
                return;
            }
        }
        revealNext(); // 프로세스 시작
    }


    function addEvent() {
        const yesBtn = document.querySelectorAll(".likegacha-main-btn")[0];
        yesBtn.replaceWith(yesBtn.cloneNode(true));
        const newYesBtn = document.querySelectorAll(".likegacha-main-btn")[0];

        const yesClickHandler = (e) => {
            const mode = e.target.dataset.mode;
            if (mode === "single") {
                const destinationNum = e.target.dataset.destinationNumber;
                sendLike([destinationNum]); // 배열로 감싸줌
            } else if (mode === "multi") {
                const checked = document.querySelectorAll('input[name="fivelike"]:checked:not(:disabled)');
                if (checked.length === 0) {
                    alert("찜할 여행지를 선택해주세요!");
                    return;
                }

                const destinationNums = Array.from(checked).map(input => input.dataset.destinationNumber);
                sendLike(destinationNums); // 배열로 전송
            }
        };

        newYesBtn.addEventListener("click", yesClickHandler);
    }




    function sendLike(destinationNumbers) {
        fetch('/api/likes/add-like-list', { // ✅ 새로운 엔드포인트로 변경
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ destination_numbers: destinationNumbers }),
            credentials: 'include'
        })
            .then(async res => {
                const result = await res.json();

                if (res.ok) {
                    console.log("찜 성공:", result.message);
                    alert(result.message);

                    // 체크된 항목 UI 업데이트
                    destinationNumbers.forEach(num => {
                        const input = document.querySelector(`input[data-destination-number="${num}"]`);
                        if (input) {
                            input.checked = true;
                            input.disabled = true;
                        }
                    });
                } else {
                    console.warn("찜 실패:", result.message);
                    alert(result.message);
                }
            })
            .catch(err => {
                console.error("찜 요청 중 오류 발생:", err);
                alert("찜 중 오류가 발생했습니다.");
            });
    }




}