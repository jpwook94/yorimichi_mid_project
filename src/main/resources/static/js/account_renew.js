let func;

window.onload = () => {
    func = location.pathname.split("/").filter(Boolean).pop();
    console.log(func)
    if (func == 'tag-page') {
        console.log(11)
        likeFn(".render-wrapper")
    } else if (func == 'gacha') {
        likeFn(".main-container")
    } else if (func == 'mbtiTest-result') {
        likeFn(".c-mbti-menu")
    } else if (func == 'mypage') {
        console.log(22)
        renderUserProfil();
        sidebar();
    }
};

const mainContent = document.querySelector("#myPageContentArea");


function sidebar() {
    document.querySelectorAll(".mypage-sidebar-item").forEach((bar) => {
        bar.addEventListener("click", async () => {
            let cate = bar.dataset.mycate;
            if (cate == 1) {
                renderUserProfil();
            } else if (cate == 2) {
                await renderLikes();
                likeFn(".main-container"); // .like-btn 을 가지고 있는 상위

            }
        })
    })
}

function likeFn(container) {
    if (func == 'gacha') {
        console.log('gacha event config')
        container = ".main-container"
    }
    document.querySelector(container).addEventListener('click', function (e) {
        const btn = e.target.closest('.like-btn');
        console.log(e.target.closest('.like-btn').value)
        console.log(e.target.closest('.like-btn').dataset.liked)
        let tf = btn.dataset.liked;
        console.log(tf);
        const destination_number = btn.dataset.destinationNumber;
        console.log('찜 클릭됨:', destination_number);
        console.log(destination_number);
        console.log(tf);
        if (tf == 'true') {
            axios.delete('api/likes', {data: {destination_number}})
                .then(res => {
                    console.log(res.data)
                    if (res.data == 1) {
                        if (func != 'tag-page') {
                            e.target.closest(".pokemon-card").remove();
                            renderLikes();
                        } else {
                            // 병주용 공간
                            btn.children[0].src = '/other/image/emptyheart.png';
                            btn.dataset.liked = 'false';
                        }
                    } else if (res.data == -1) {
                        alert('로그인이 필요합니다.');
                        location.href = '/login-page'
                    }
                })
        } else {
            console.log('add request')
            console.log(destination_number);
            axios.post('api/likes', {destination_number})
                .then(res => {
                    console.log(res.data);
                    if (res.data == -1) {
                        alert('로그인이 필요합니다')
                        location.href = '/login-page'
                    } else {

                        if (func == 'gacha') {
                            document.querySelectorAll(".likegacha-control-btn")[2].click();
                        } else if (func == 'tag-page') {
                            // 병주 페이지 어떻게 할건지
                            btn.children[0].src = '/other/image/heart.png';
                            btn.dataset.liked = 'true';
                        } else if (func == 'mbtiTest-result') {
                            // 가은 페이지 어떻게 할건지
                            // 찜 버튼 누룬 이후에 어떻게 할것인가
                            alert('찜 완료!')
                        }
                    }
                })
                .catch(err => {
                console.error("찜 등록중 에러 발생! 아마 이미 찜해놔서 그럴거임")
                alert('이미 찜 했잖아 이 자식아');
            })
        }

    });
}

function renderUserProfil() {
    console.log("profile called.")
    const loginUser = document.querySelector("#user-info").dataset;
    let content = `
<div id="display-mode" class="retro-window">
    <div class="retro-titlebar">
            <h3 id="profile-title">주민등록증</h3>
    </div>
    <div class="retro-body">
        <div class="retro-content">
            <p id="display_user_id"><strong>아이디:</strong> ${loginUser?.user_id}</p>
            <p id="display_user_name"><strong>이름:</strong> ${loginUser?.user_name}</p>
            <p id="display_user_email"><strong>이메일:</strong> ${loginUser?.user_email}</p>
            <button type="button" id="edit-profile-btn">수정</button>
        </div>
        <div class="retro-image-box">
            <img src="/other/image/DUCK1.png" alt="프로필 이미지" />
        </div>
    </div>
</div>

<div id="edit-mode" class="retro-window" style="display:none;">
    <div class="retro-titlebar">
            <h3 id="profile-title">프로필 수정</h3>
    </div>
    <div class="retro-body">
        <div class="retro-content">
            <form action="/account/update" method="post" id="profile-update-form">
                <input type="hidden" name="user_id" value="${loginUser?.user_id}">
                <p>
                    <strong>이름:</strong><br>
                    <input type="text" name="user_name" id="input_user_name" value="${loginUser?.user_name}" required>
                </p>
                <p>
                    <strong>이메일:</strong><br>
                    <input type="email" name="user_email" id="input_user_email" value="${loginUser?.user_email}" required>
                </p>
                <p>
                    <strong>새 비밀번호:</strong><br>
                    <input type="password" name="user_pw" id="new_pw">
                </p>
                <p>
                    <strong>새 비밀번호 확인:</strong><br>
                    <input type="password" id="confirm_pw">
                </p>
                <button type="submit" id="save-profile-btn">저장</button>
                <button type="button" id="cancel-edit-btn">취소</button>
            </form>
        </div>
        <div class="retro-image-box">
            <img src="/other/image/DUCK1.png" alt="프로필 이미지" />
        </div>
    </div>
</div>`;
    mainContent.innerHTML = content;
    document.querySelector("#edit-profile-btn").addEventListener("click", () => {
        console.log("edit");
        document.getElementById("edit-profile-btn").addEventListener("click", () => {
            document.getElementById("display-mode").style.display = "none";
            document.getElementById("edit-mode").style.display = "block";
        });

        document.getElementById("cancel-edit-btn").addEventListener("click", () => {
            document.getElementById("display-mode").style.display = "block";
            document.getElementById("edit-mode").style.display = "none";
        });
    })

}
// 수정 제출
document.addEventListener("submit", function (e) {
    if (!e.target.matches('#profile-update-form')) return;

    e.preventDefault();

    const form = e.target;
    const newPw = form.querySelector('#new_pw').value;
    const confirmPw = form.querySelector('#confirm_pw').value;

    if (newPw && newPw !== confirmPw) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

    const data = Object.fromEntries(new FormData(form).entries());

    fetch("/account/update", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    })
        .then(res => res.json())
        .then(result => {
            alert(result.message);
            if (result.status === "success") {
                document.getElementById("display_user_name").innerHTML = `<strong>이름:</strong> ${result.updatedUser.user_name}`;
                document.getElementById("display_user_email").innerHTML = `<strong>이메일:</strong> ${result.updatedUser.user_email}`;
                document.getElementById("edit-mode").style.display = "none";
                document.getElementById("display-mode").style.display = "block";
            }
        });
});

async function renderLikes() {
    const arrayData = await selectLikes();

    pagination(arrayData, function (data) {
        let content = '<div class="card-list">';

        if (data.length === 0) {
            content += `<p>찜한 여행지가 없습니다.</p>`;
        }

        for (const des of data) {
            content += `
                <div class="pokemon-card" data-url="/destination/${des.destination_number}">
                    <div class="card-header">
                        <div class="pokemon-hp-type">${des.destination_name}</div>
                    </div>

                    <button class="like-btn"
                            id="heart-icon-btn"
                            data-destination-number="${des.destination_number}"
                            data-liked="true">
                        <img src="/other/image/heart.png" alt="찜한 상태 하트">
                    </button>

                    <div class="card-image">
                        <img src="/other/image/destination/${des.destination_number}.png" alt="피카츄">
                    </div>
                </div>`;
        }

        content += '</div>';
        return content;
    });

}

async function selectLikes() {
    console.log('likes called.')
    let arrayData = [];
    const res = await axios.get('/api/likes')
        .then(res => {
            console.log("데이터:", res.data);
            arrayData = res.data;
        })
        .catch(error => {
            console.error("에러:", error);
        });
    return arrayData;
}

