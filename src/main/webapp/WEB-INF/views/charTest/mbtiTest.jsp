<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<body>

<div class="gamelist-container">
    <div class="teamlogo-container">
        <img id="teamlogo2" onclick="location.href='/hc'" src="/other/image/logo.png" alt="">
    </div>

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
                    <div class="c-btn close" onclick="location.href='/gamelist'">
                        <div class="icon-x">
                            <span></span><span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="c-search-bar">
                <div class="c-fake-address">게임/성향 테스트/MBTI</div>
                <button class="c-search-button">Search...</button>
            </div>
            <div class="c-content-box">
                <div class="c-content-area">
                    <div class="c-MBTIsurvey">
                        <div class="c-MBTIiconbox">
                            <img class="c-MBTIicons" src="/other/image/MBTIicon1.png" alt="">
                        </div>
                        <div class="c-mbtiQ" data-qnum="1" style="font-size: 24px">
                            친구들이 갑자기 "야! 이번 주말에 여행 가자!"라고 한다.
                        </div>
                        <div class="c-mbtiA">
                            <label><input type="radio" name="mbtiA" value="a"><span class="mbtiA-text" data-ans="a">어디든 일단 콜! 이런 게 여행이지!</span></label><br>
                            <label><input type="radio" name="mbtiA" value="b"><span class="mbtiA-text" data-ans="b">응? 좋긴 한데... 뭐 타고 갈 건데? 숙소는?</span></label><br>
                            <label><input type="radio" name="mbtiA" value="c"><span class="mbtiA-text" data-ans="c">너무 갑작스러워서... 난 패스~</span></label><br>
                            <label><input type="radio" name="mbtiA" value="d"><span class="mbtiA-text" data-ans="d">좋아! 근데 누구랑 가는 건지, 몇시 출발인지 말해줘.</span></label><br>
                        </div>
                    </div>
                    <div class="c-MBTIbtnBlock">
                        <button class="c-MBTIbefore">before</button>
                        <button class="c-MBTInext">next ></button>
                        <button class="sb-btn" style="display: none">See Result</button>
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

        <%--여기서부터 팝업창--%>
        <div class="c-commonPopup-container">
            <div class="c-commonPopup1">
                <div class="c-popup-header">
                    <span class="c-commonPopup-title">cloud.png</span>
                    <div class="c-popup-buttons">
                        <div class="c-commonPopup-extraBTN"></div>
                    </div>
                </div>
                <div class="c-commonPopup-body">
                    <div class="c-commonPopup-imgblock">
                        <img src="/other/image/charTest_cloud.gif" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--여기서부터 팝업창--%>
    <div class="c-commonPopup-container">
        <div class="c-commonPopup2">
            <div class="c-commonPopup2-header">
                <span class="c-commonPopup-title">gombangwha.png</span>
            </div>
            <div class="c-commonPopup-body">
                <div class="c-commonPopup-imgblock">
                    <img src="/other/image/charTest_sakura.gif" alt="">
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    // 버튼 숨기기용
    const nextBtn = document.querySelector(".c-MBTInext");
    const beforeBtn = document.querySelector(".c-MBTIbefore");

    function updateButtonVisibility(qnum) {
        if (qnum <= 1) {
            beforeBtn.style.display = "none";
        } else {
            beforeBtn.style.display = "inline-block";
        }

        if (qnum >= tests.length - 1) {
            nextBtn.style.display = "none";
        } else {
            nextBtn.style.display = "inline-block";
        }
    }

    const submitBtn = document.querySelector(".sb-btn");
    const mbtiQ = document.querySelector(".c-mbtiQ");
    const tests = ["", "친구들이 갑자기 \"야! 이번 주말에 여행 가자!\"라고 한다.",
        "낯선 사람들과 2박 3일 여행을 같이 하게 되었다.",
        "여행 전날 밤, 당신의 모습은?",
        "시장에서 현지인도 잘 안 먹는 로컬 음식을 발견!", "갑자기 일정에 빈 시간이 생겼다.", "여행 마지막 밤, 숙소에 도착한 당신은?"]

    const iconImages = ["", "/other/image/MBTIicon1.png", "/other/image/MBTIicon2.png",
        "/other/image/MBTIicon3.png", "/other/image/MBTIicon4.png", "/other/image/MBTIicon5.png", "/other/image/MBTIicon6.png"]
    const saveAns = [""];

    document.querySelector(".c-MBTInext").addEventListener("click", () => {
        qnum = mbtiQ.dataset.qnum;
        if (!valid(qnum)) return;
        console.log(qnum)
        if (qnum != tests.length - 1) {
            const nextQ = parseInt(qnum) + 1;
            mbtiQ.dataset.qnum = nextQ;
            mbtiQ.innerText = tests[nextQ];
            updateAnswerTexts(nextQ - 1);
            updateIcon(nextQ);
            updateButtonVisibility(nextQ);
        }
        if (qnum == 5) {
            submitBtn.style.display = "block"
        }
        console.log(saveAns);
    })
    document.querySelector(".c-MBTIbefore").addEventListener("click", () => {
        qnum = mbtiQ.dataset.qnum;
        console.log(qnum)
        if (qnum != 1) {
            const prevQ = parseInt(qnum) - 1;
            mbtiQ.dataset.qnum = prevQ;
            mbtiQ.innerText = tests[prevQ];
            updateAnswerTexts(prevQ - 1);
            updateIcon(prevQ);
            updateButtonVisibility(prevQ);
            const ans = document.querySelectorAll("input[name='mbtiA']");
            for (let a of ans) {
                console.log("------------")
                console.log(prevQ)
                console.log(saveAns[prevQ])
                if (a.value == saveAns[prevQ]) a.checked = true;
            }
            saveAns.pop();
        }
        if (mbtiQ.dataset.qnum <= 5) {
            submitBtn.style.display = "none"
        }
        console.log(saveAns);
    })
    submitBtn.addEventListener("click", () => {
        valid(tests.length - 1)
        console.log(saveAns);
        let url = 'mbtiTest/result'
        for (let i = 1; i < saveAns.length; i++) {
            if (i === 1) {
                url += '?ans=' + saveAns[i];
            } else {
                url += '&ans=' + saveAns[i];
            }
        }
        location.href = url;

    });

    // 아이콘 이미지 업데이트 함수
    function updateIcon(qnum) {
        const iconImg = document.querySelector(".c-MBTIicons");
        if (iconImg) {
            iconImg.src = iconImages[qnum];
        }
    }


    // 선택지 문항 유동적으로 바꾸기
    const answerChoices = [
        {
            a: "어디든 일단 콜! 이런 게 여행이지!",
            b: "응? 좋긴 한데... 뭐 타고 갈 건데? 숙소는?",
            c: "너무 갑작스러워서... 난 패스~",
            d: "좋아! 근데 누구랑 가는 건지, 몇시 출발인지 말해줘."
        },
        {
            a: "재밌겠다! 새로운 인연이 생길 것 같아.",
            b: "괜찮은 사람들이었으면 좋겠다... 말 안 섞이면 어떡하지?",
            c: "각자 역할만 잘 나눠서 조용히 갔다왔으면 좋겠다.",
            d: "어색하면 내가 분위기 띄우지 뭐~"
        },
        {
            a: "와 벌써 설렌다ㅋㅋ 단톡방에 짐 사진 찍어 올리는 중",
            b: "조용히 짐 정리하면서 체크리스트 다시 한 번 확인",
            c: "꼭 필요한 것만 대강 챙기고 침대 다이빙",
            d: "인원 파악하고 역할 정리해서 단톡방에 공유"
        },
        {
            a: "지금 아니면 언제 또 이런 걸 먹어보냐. 도전!",
            b: "향은 좀 별로인데... 지금 기분 좋으니까 딱 한 입만?",
            c: "위생 괜찮은 거 맞나? 괜히 잘못 먹었다가 일정 다 틀어지는데...",
            d: "저게 정확히 무슨 음식일까? 검색해봐야지."
        },
        {
            a: "근처에 뭐 할 만한 거 없나? (검색)",
            b: "일단 발 닿는 대로 가야겠다!",
            c: "좀 쉬고 싶은데... 카페나 갈까?",
            d: "아까 못 간 곳 있었는데 지금 가면 딱이겠다."
        },
        {
            a: "하~ 진짜 좋았어! 다음엔 어디 갈까?",
            b: "여행 사진 돌아보며 혼자 여운을 즐긴다.",
            c: "숙소비, 식비 정산표 만들어서 카톡에 공유",
            d: "이번에 이런 거 좀 아쉬웠지... 다음엔 좀 더 잘해보고 싶다."
        }
    ];

    function updateAnswerTexts(index) {
        const textSpans = document.querySelectorAll(".mbtiA-text");
        const choiceSet = answerChoices[index];

        textSpans.forEach(span => {
            const key = span.dataset.ans;
            span.textContent = choiceSet[key];
        });
    }



    // radio 체크 됐는지 다 검사
    function valid(no) {
        const ans = document.querySelectorAll("input[name='mbtiA']");
        for (let a of ans) {
            if (a.checked) {
                saveAns.push(a.value)
                ans.forEach((a) => a.checked = false)
                return true; // 하나라도 체크되어 있으면 유효
            }
        }
        return false; // 모두 체크 안 되어 있으면 유효하지 않음
    }

    updateButtonVisibility(1);
</script>

</body>
</html>