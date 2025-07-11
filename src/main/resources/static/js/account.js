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

/* 유저가 회원가입시, Id 중복확인에 걸려서 sign up 버튼 누른후 다시 인풋창에 입력할때마다 다시 isIdAvailable를 false로 초기화 */
document.getElementById('signup-user-id').addEventListener('input', function () {
    isIdAvailable = false;
    document.getElementById('id-check-result').textContent = "";
});


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