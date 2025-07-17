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
                    winnerAnimate();
                    setTimeout(()=>{
                        $(".c-window-container").html(`
                                                    
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
