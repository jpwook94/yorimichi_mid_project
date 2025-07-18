$(document).ready(function () {
    $(document).on("click", ".c-ITtheme-box", function () {
        const selectedId = $(this).attr("id");
        console.log("선택된 ID:", selectedId); // ← 클릭된 요소 ID 확인용

        $.ajax({
            url: "/ITTest/select",
            type: "POST",
            data: { selectedId: selectedId },
            success: function (data) {
                console.log("서버 응답:", data); // ← 서버에서 넘어온 결과 확인

                if (data.finished) {
                    $(".c-commonPopup2").remove();
                    winnerAnimate();
                    setTimeout(()=>{
                        $(".c-window-container").html(`
                            
                                    <div class="c-notepad-window2">
                                        <div class="c-notepad-title-bar2">
                                            <span>- - Notepad</span>
                                        </div>
                                        <div class="c-notepad-menu-bar2">
                                            <span>File</span>
                                            <span>Edit</span>
                                            <span>Search</span>
                                            <span>Help</span>
                                        </div>
                                        <div class="c-notepad-content-area">
                                            <span>WINNER!</span><span class="c-notepad-fake-caret">┃</span>
                                        </div>
                                        <div class="c-notepad-scrollbars">
                                            <div class="c-notepad-resize-corner"></div>
                                        </div>
                                    </div>
                            
                            <div class="c-ITphone-frame">
                                <div class="c-ITtitle-bar">
                                    <div class="c-ITtitle-left">
                                        <div class="c-ITtitle-icon">🦆</div>
                                        <span>Yorimichi.exe</span>
                                    </div>
                                    <div class="c-ITwindow-controls">
                                        <div class="c-ITcontrol-btn">_</div>
                                        <div class="c-ITcontrol-btn">□</div>
                                        <div class="c-ITcontrol-btn close" id="c-ITcontrol-BTNclose">×</div>
                                    </div>
                                </div>
                            
                                <div class="c-ITmenu-bar">
                                    <div class="c-ITmenu-item">File</div>
                                    <div class="c-ITmenu-item">Edit</div>
                                    <div class="c-ITmenu-item">View</div>
                                    <div class="c-ITmenu-item">Options</div>
                                    <div class="c-ITmenu-item">Help
                                        <div class="c-ITdropdown">
                                            <div class="c-ITdropdown-item" id="c-ITdropdown">receive <br> food advice?</div>
                                        </div>
                                    </div>
                                </div>
                            
                                <div class="c-ITtoolbar">
                                    <div class="c-ITtoolbar-btn" id="c-ITtoolbar-back">Back</div>
                                    <div style="flex: 1; text-align: center; font-weight: bold;">Food</div>
                                    <div class="c-ITtoolbar-btn" id="c-ITtoolbar-reload">Reload</div>
                                </div>
                            
                                <div class="c-ITresult-content">
                                    <div class="c-ITresult-profile-section">
                                        <div class="c-ITprofile-pic"></div>
                                        <div class="c-ITresult-username">${data.winner.food_name}</div>
                                        <div class="c-ITresult-more-btn">•••</div>
                                    </div>
                            
                                    <div class="c-ITresult-image-container">
                                        <div class="c-ITresult-post-image">
                                            <div class="c-ITresult-imageBox">
                                                <img src="/other/image/food/${data.winner.food_number}.jpg" class="c-ITresult-img" alt="">
                                            </div>
                                            <div class="c-ITresult-scrollbar">
                                                <div class="c-ITresult-scroll-button">▲</div>
                                                <div class="c-ITresult-scroll-thumb"></div>
                                                <div class="c-ITresult-scroll-button">▼</div>
                                            </div>
                                        </div>
                                    </div>
                            
                                    <div class="c-ITresult-action-buttons">
                                        <div class="c-ITresult-action-btn">Like</div>
                                        <div class="c-ITresult-action-btn comment-effect">Comment
                                            <span class="c-IT-sparkle"></span>
                                            <span class="c-IT-sparkle"></span>
                                            <span class="c-IT-sparkle"></span>
                                            <span class="c-IT-sparkle"></span>
                                            <span class="c-IT-sparkle"></span>
                                            <span class="c-IT-sparkle"></span>
                                        </div>
                                    </div>
                            
                                    <div class="c-ITresult-post-info">
                                        <div class="c-ITresult-likes">🩷 1 132 likes</div>
                                        <div class="c-ITresult-caption"><strong>${data.winner.food_name}</strong> Im a very sexy food...</div>
                                        <div style="height: 14px;"></div>
                                    </div>
                                </div>
                            
                                <div class="c-ITresult-status-bar">
                                    <span>Ready</span>
                                    <span>12:34 PM</span>
                                </div>
                            </div>
                            
                            <div class="c-sassy-popup" style="display: none;">
                                <div class="c-sassy-title-bar">
                                    <span>tasty !</span>
                                </div>
                                <div class="c-sassy-message">
                                    ${data.winner.food_details}
                                </div>
                                <div class="c-sassy-button-area">
                                    <button class="c-sassy-btn">eat</button>
                                </div>
                            </div>                        
                                                    
                        
                    
                        
                       
                    `);
                    }, 1000)

                } else {
                    const left = data.left;
                    const right = data.right;
                    $("#round").text(data.round + "강") /*진행중*/

                    
                    $(".c-ITtheme-container").html(`
                        <div class="c-ITtheme-box" id="${left.food_number}">
                            <div class="c-ITtheme-preview">
                                <img class="c-ITtheme-selecimg" src="/other/image/food/${left.food_number}.png"
                                     onerror="this.onerror=null;this.src='/other/image/food/${left.food_number}.jpg';">
                            </div>
                            <div class="c-ITtheme-label">${left.food_name}</div>
                        </div>

                        <div class="c-ITtheme-box" id="${right.food_number}">
                            <div class="c-ITtheme-preview mono">
                                <img class="c-ITtheme-selecimg" src="/other/image/food/${right.food_number}.png"
                                     onerror="this.onerror=null;this.src='/other/image/food/${right.food_number}.jpg';">
                            </div>
                            <div class="c-ITtheme-label">${right.food_name}</div>
                        </div>
                    `);
                    }

            },
            error: function () {
                alert("문제가 발생했습니다. 다시 시도해주세요.");
            }
        });
    });
});

$(document).on("click", ".comment-effect", function () {
    $(".c-sassy-popup").fadeIn(); // 부드럽게 나타나게
});

$(document).on("click", ".c-sassy-btn", function () {
    $(".c-sassy-popup").fadeOut(); // 부드럽게 사라지게
});

$(document).on("click", "#c-ITcontrol-BTNclose", function () {
    window.location.href = "/gamelist"; // ← 원하는 경로로 보내기
});

$(document).on("click", "#c-ITtoolbar-back", function () {
    window.location.href = "/charTest"; // ← 원하는 경로로 보내기
});

$(document).on("click", "#c-ITtoolbar-reload", function () {
    window.location.href = "/ITTest"; // ← 원하는 경로로 보내기
});

$(document).on("click", "#c-ITdropdown", function () {
    window.location.href = "/gacha"; // ← 원하는 경로로 보내기
});

function wait(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function winnerAnimate() {

    const hourglass = document.querySelector('.c-ITtest-timething');
    hourglass.style.display = 'block'
    // 애니메이션 초기화
    hourglass.classList.remove('rotate-1sec');
    void hourglass.offsetWidth;

    // 애니메이션 클래스 추가
    hourglass.classList.add('rotate-1sec');

    // 1초 기다림 (애니메이션 완료까지)
    await wait(1000);

    // 그 다음 코드 실행
    console.log("회전 끝! 다음 코드 실행");
    // 여기에 다음 작업 추가하면 됨
}
