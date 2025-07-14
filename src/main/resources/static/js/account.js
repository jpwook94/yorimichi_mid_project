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
    // e.target이 a.page-link 인지 체크
    console.log("click event");
    if (e.target.matches('.pagination .page-link')) {
        console.log('근데 페이지 버튼도 같이 눌렸다!');
        e.preventDefault();
        const page = e.target.dataset.page;

        // 클릭을 하면 /account/mypageC?myPageCate=3&page=${page} 이 주소에서 리턴한 값을 res (변수명 내맘대로)에 담음
        fetch(`/account/mypageC?myPageCate=3&page=${page}`)
            .then(res => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
            .then(data => { // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
                // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
                document.querySelector('.mypage-main-content').innerHTML = data;
            });
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