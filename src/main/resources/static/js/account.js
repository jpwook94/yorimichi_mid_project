// 쿼리스트링에서 joined=ok이면 안내문 띄움
window.addEventListener('DOMContentLoaded', function () {
    const params = new URLSearchParams(window.location.search);
    if (params.get('joined') === 'ok') {
        alert('회원가입이 완료되었습니다!');
        // 필요하면, 안내 문구 표시 후 파라미터 지우기 (옵션)
        // location.replace('/login-page');
    }
});

let isIdAvailable = false;

function validatePassword() {
    const pw = document.querySelector('.signup-input-pw').value;
    const pwConfirm = document.querySelector('.signup-input-pw-confirm').value;

    if (pw !== pwConfirm) {
        alert('비밀번호가 일치하지 않습니다.');
        return false; // 제출 막기
    }
    if (!isIdAvailable) {
        alert('ID 중복 확인을 해주세요.');
        return false;
    }
    return true; // 제출 허용
}

function checkDuplicateId() {
    const userId = document.getElementById('signup-user-id').value.trim();
    if (!userId) {
        alert("ID를 입력해주세요.");
        return;
    }

    fetch(`/account/check-id?user_id=${encodeURIComponent(userId)}`)
        .then(response => response.json())
        .then(isDuplicated => {
            const resultSpan = document.getElementById('id-check-result');
            if (isDuplicated) {
                resultSpan.textContent = "이미 사용 중인 ID입니다.";
                resultSpan.style.color = "red";
                isIdAvailable = false; // 중복 → 회원가입 불가
            } else {
                resultSpan.textContent = "사용 가능한 ID입니다!";
                resultSpan.style.color = "green";
                isIdAvailable = true; // 사용 가능 → 회원가입 가능
            }
        })
        .catch(err => {
            alert("서버 오류가 발생했습니다.");
        });
}


/* 비동기 */
function loadContent(event, url) {
    event.preventDefault();
    fetch(url, {
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');

            // 기존 main.jsp 구조를 유지하고 있으므로,
            // include된 컨텐츠가 들어가는 "main-container" 안의 <div>를 다시 넣는 방식으로
            const newMain = doc.querySelector('.main-container');
            document.querySelector('.main-container').innerHTML = newMain.innerHTML;
        });
}


document.addEventListener('click', function (e) {
    if (e.target.matches('.pagination .page-link')) {
        e.preventDefault();
        const page = e.target.dataset.page;

        // 클릭을 하면 /account/mypageC?myPageCate=3&page=${page} 이 주소에서 리턴한 값을 res (변수명 내맘대로)에 담음
        // [수정] 고정된 '3' 대신, myPage.jsp에 저장해둔 현재 카테고리 번호를 읽어온다.
        const currentCate = document.getElementById('myPageContentArea').dataset.currentCate;

        fetch(`/account/mypageC?myPageCate=${currentCate}&page=${page}`)
            .then(res => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
            .then(data => { // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
                // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
                document.querySelector('.mypage-main-content').innerHTML = data;
            });
    }
});

document.addEventListener('click', function(e) {
    const likeButton = e.target.closest('.like-btn');
    if (likeButton) {
        likeButton.disabled = true;

        const heartImage = likeButton.querySelector('img');
        const destinationNumber = likeButton.dataset.destinationNumber;

        // [수정] 이미지 src 대신, 버튼의 data-liked 꼬리표 값으로 상태를 판단한다.
        const isLiked = likeButton.dataset.liked === 'true';

        if (isLiked) {
            // --- 찜 취소 로직 ---
            fetch(`/api/likes/delete-like/${destinationNumber}`, { method: 'DELETE' })
                .then(response => response.json())
                .then(result => {
                    alert(result.message);
                    if (result.status === 'success') {
                        heartImage.src = '/other/image/emptyheart.png';
                        heartImage.alt = '찜하지 않은 상태 하트';
                        // [핵심] 꼬리표의 값도 'false'로 바꿔준다!
                        likeButton.dataset.liked = 'false';
                        // [이런 방법도 있긴한데 페이지에서 사라지고 다음게 넘어오지는 않음ㅠㅠ] 하트 이미지를 바꾸는 대신, 카드 전체를 삭제한다.
                        // likeButton.closest('.pokemon-card').remove();
                    }
                })
                .finally(() => {
                    likeButton.disabled = false;
                });

        } else {
            // --- 찜하기 로직 ---
            const likeData = { destination_number: destinationNumber };
            fetch('/api/likes/add-like', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(likeData)
            })
                .then(response => response.json())
                .then(result => {
                    alert(result.message);
                    if (result.status === 'success') {
                        heartImage.src = '/other/image/heart.png';
                        heartImage.alt = '찜한 상태 하트';
                        // [핵심] 꼬리표의 값도 'true'로 바꿔준다!
                        likeButton.dataset.liked = 'true';
                    }
                })
                .finally(() => {
                    likeButton.disabled = false;
                });
        }
    }
});
// ===== DOM이 바뀔 때마다 필요한 다른 기능을 처리하는 부분 =====
const observer2 = new MutationObserver((mutations) => {

    // 회원가입 ID 입력창에 대한 처리는 동적으로 생기므로 여기에 있는 게 맞아!
    const signupUserIdInput = document.getElementById('signup-user-id');
    if (signupUserIdInput) {
        // 중복 추가를 막기 위해 리스너를 추가하기 전에 기존 리스너가 있는지 확인하거나,
        // 한번만 실행되도록 플래그를 사용하는 게 더 좋지만 일단 지금은 이대로도 괜찮아.
        signupUserIdInput.addEventListener('input', function () {
            // fucntion() 콜백함수
            isIdAvailable = false;
            document.getElementById('id-check-result').textContent = "";
        });
    }
});
observer2.observe(document.body, { childList: true, subtree: true });