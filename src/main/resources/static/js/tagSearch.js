const userSelect = document.querySelector("#user-select");
const renderDiv = document.querySelector("#render-div");
const selectedTags = new Set();  // 중복 없이 태그 저장

document.querySelectorAll(".ts-taglist button").forEach(button => {
    button.addEventListener("click", () => {
        const tag = button.getAttribute("name");

        // 토글: 이미 선택된 태그라면 제거, 아니라면 추가
        if (selectedTags.has(tag)) {
            selectedTags.delete(tag);
            button.classList.remove("active");
        } else {
            selectedTags.add(tag);
            button.classList.add("active");
        }

        userRender();

        if (selectedTags.size === 0) {
            render([]);  // ← 이 때는 빈 배열을 넘겨 '태그 선택해주세요' 출력
            updateClearButton();
            return;
        }


        // 선택된 태그들을 URL 쿼리로 전송
        const tagParam = Array.from(selectedTags).join(",");
        const url = "/search/tag-search?tags=" + encodeURIComponent(tagParam);

        fetch(url)
            .then(response => response.json())
            .then(data => {
                render(data);
                console.log(data);
            });
        updateClearButton();
    });
});

async function render(data) {
    let content = "";
    const resultSizeDiv = document.querySelector("#ts-result-size");

    if (selectedTags.size === 0) {
        content = `<div class="no-result-message">태그를 선택해 여행지를 검색해 보세요.</div>`;
        resultSizeDiv.innerText = "";
    } else if (data.length === 0) {
        content = `<div class="no-result-message">검색 결과가 없습니다.</div>`;
        resultSizeDiv.innerHTML = `총 <span class="highlight-number">0</span> 개의 여행지`;
    } else {
        content = `<div class="tag-result-wrapper">`;
        resultSizeDiv.innerHTML = `총 <span class="highlight-number">${data.length}</span> 개의 여행지`;

        for (const element of data) {
            const isLiked = likedDestinations.includes(element.destination_number);

            if ('destination_name' in element) {
                content += "<div class='tag-result-one-result'>";
                content += "<div class='tag-result-img-wrapper'><img src='/other/image/destination/" + element.destination_number + ".png' alt=''/></div>";
                content += "<div class='tag-result-info-wrapper'>";
                content += "<div class='tag-result'><h1>" + element.destination_name + "</h1>" +
                    "<button style='position: static' class='like-btn'" +
                    " id='heart-icon-btn'" +
                    " data-destination-number='" + element.destination_number + "'" +
                    " data-liked='" + isLiked + "'>";

                if (isLiked) {
                    content += "<img src='/other/image/heart.png' style='width: 40px' alt='찜한 상태 하트'>";
                } else {
                    content += "<img src='/other/image/emptyheart.png' style='width: 40px' alt='빈 하트'>";
                }

                content += "</button></div><hr>";
                content += "<div class='tag-result'>추천 유형 : " + element.mbti_category + "</div>";
                content += "<div class='tag-result'>주소 : " + element.destination_address + "</div><div class='tag-item-wrapper'>";

                // 🔽 이 부분을 await로 대기
                const url2 = "/search/dest-search?dest=" + element.destination_number;
                try {
                    const response = await fetch(url2);
                    const tagData = await response.json();

                    tagData.forEach(tag => {
                        content += `<div class='tag-item'>#${tag.tag_name}</div>`;
                    });
                } catch (err) {
                    console.error("태그 fetch 실패:", err);
                }

                for (let i = 0; i < locations.length; i++) {
                    if (locations[i].location_number == element.location_number) {
                        content += "<div class='tag-item'>#" + locations[i].location_name + "</div>";
                    }
                }

                content += "</div></div></div><br>";
            }
        }

        content += "</div>";
    }

    renderDiv.innerHTML = content;
}

function userRender() {
    let content = `<div class="user-select-wrapper">`;

    selectedTags.forEach(name => {
        content += `<div class="user-tag" data-tag="${name}">#${name}</div>`;
    });
    content += `</div>`;
    userSelect.innerHTML = content;

    // 클릭 시 해당 태그 제거
    document.querySelectorAll(".user-tag").forEach(tagDiv => {
        tagDiv.addEventListener("click", () => {
            const tagName = tagDiv.getAttribute("data-tag");
            selectedTags.delete(tagName);

            // 모든 버튼 중에서 name 속성이 일치하는 것 찾아서 active 제거
            document.querySelectorAll(".ts-taglist button").forEach(btn => {
                if (btn.getAttribute("name") === tagName) {
                    btn.classList.remove("active");
                }
            });

            // 다시 태그 UI 재구성
            userRender();

            // 선택된 태그가 0개면 메시지, 숫자, 버튼 제거
            if (selectedTags.size === 0) {
                render([]); // → "태그를 선택해 보세요" 메시지 출력
                document.querySelector("#ts-result-size").innerText = "";
                document.querySelector("#clear-button-container").innerHTML = "";
            }
        });
    });

    updateClearButton();
}


const clearButtonContainer = document.querySelector("#clear-button-container");

function updateClearButton() {
    if (selectedTags.size > 0) {
        clearButtonContainer.innerHTML = `<button id="clear-all-button">태그 전체 해제</button>`;

        document.querySelector("#clear-all-button").addEventListener("click", () => {
            selectedTags.clear();  // 전체 해제
            document.querySelectorAll(".ts-taglist button").forEach(btn => btn.classList.remove("active"));
            userRender();
            render([]);
            clearButtonContainer.innerHTML = ""; // 버튼도 제거
        });
    } else {
        clearButtonContainer.innerHTML = "";
    }
}


// top button

document.getElementById("topBtn").addEventListener("click", function () {
    window.scrollTo({
        top: 0,
        behavior: "smooth" // 부드러운 스크롤
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const bubble = document.querySelector('.top-button-bubble');
    const topBtn = document.getElementById('topBtn');

    const gif1 = '/other/image/topbtn1.gif';   // 반복 재생 gif
    const gif2 = '/other/image/topbtn2.gif';  // 한번만 재생 gif

    // 스크롤 시 gif1을 bubble에 삽입 (처음에만 한 번)
    let gif1Inserted = false;
    window.addEventListener('scroll', () => {
        if (window.scrollY > 0) {
            if (!gif1Inserted) {
                bubble.innerHTML = `<img src="${gif1}" class="top-bubble-gif" alt="duck idle" style="width: 140px; height: 100px;">`;
                bubble.style.display = 'block';
                gif1Inserted = true;
            }
        } else {
            // 맨 위로 올라가면 bubble 숨김 처리
            bubble.style.display = 'none';
            bubble.innerHTML = '';
            gif1Inserted = false;
        }
    });

    // hover 시 gif2 삽입 (한 번 재생, 멈춘 채 유지)
    topBtn.addEventListener('mouseenter', () => {
        bubble.innerHTML = ''; // gif1 제거
        const gif2Img = document.createElement('img');
        gif2Img.src = `${gif2}?t=${new Date().getTime()}`; // 캐시 방지용 timestamp
        gif2Img.alt = 'duck hover';
        gif2Img.style.width = '180px';
        gif2Img.style.height = '120px';
        bubble.appendChild(gif2Img);
        bubble.style.display = 'block';
    });

    // hover 빠지면 다시 gif1 반복 재생으로 복구
    topBtn.addEventListener('mouseleave', () => {
        if (window.scrollY > 0) {
            bubble.innerHTML = `<img src="${gif1}" class="top-bubble-gif" alt="duck idle" style="width: 140px; height: 100px;">`;
            bubble.style.display = 'block';
        } else {
            bubble.style.display = 'none';
            bubble.innerHTML = '';
        }
    });
});







