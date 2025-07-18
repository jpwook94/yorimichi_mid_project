// // 쿼리스트링에서 joined=ok이면 안내문 띄움
// window.addEventListener('DOMContentLoaded', function () {
//     const params = new URLSearchParams(window.location.search);
//     if (params.get('joined') === 'ok') {
//         alert('회원가입이 완료되었습니다!');
//         // 필요하면, 안내 문구 표시 후 파라미터 지우기 (옵션)
//         // location.replace('/login-page');
//     }
//     addEvent();
//     addInfoEvent();
//     addLikeEvent();
//     document.querySelectorAll(".page-link")[0].click();
// });
//
// document.querySelectorAll(".mypage-sidebar-item").forEach((dom) => {
//     dom.addEventListener("click", (e) => {
//         const mycate = dom.dataset.mycate;
//
//         // [추가] 메인 컨텐츠 영역에 현재 카테고리 번호를 기록한다!
//         document.getElementById("myPageContentArea").dataset.currentCate = mycate;
//
//         const url = "/account/mypageC?myPageCate=" + mycate;
//         fetch(url)
//             .then((response) => response.text())
//             .then((data) => {
//
//                 document.querySelector(".mypage-main-content").innerHTML = data;
//                 if (mycate == 1) {
//                     addInfoEvent();
//                 } else if (mycate == 2) {
//                     addEvent();
//                 }
//             });
//     });
// });
// // 첫 번째 메뉴 기본 출력
// document.querySelectorAll(".mypage-sidebar-item")[0].click();
// // 회원가입 비밀번호 확인
// let isIdAvailable = false;
//
// function validatePassword() {
//     const pw = document.querySelector('.signup-input-pw').value;
//     const pwConfirm = document.querySelector('.signup-input-pw-confirm').value;
//
//     if (pw !== pwConfirm) {
//         alert('비밀번호가 일치하지 않습니다.');
//         return false; // 제출 막기
//     }
//     if (!isIdAvailable) {
//         alert('ID 중복 확인을 해주세요.');
//         return false;
//     }
//     return true; // 제출 허용
// }
//
// // 회원가입 아이디 중복 체크
// function checkDuplicateId() {
//     const userId = document.getElementById('signup-user-id').value.trim();
//     if (!userId) {
//         alert("ID를 입력해주세요.");
//         return;
//     }
//
//     fetch(`/account/check-id?user_id=${encodeURIComponent(userId)}`)
//         .then(response => response.json())
//         .then(isDuplicated => {
//             const resultSpan = document.getElementById('id-check-result');
//             if (isDuplicated) {
//                 resultSpan.textContent = "이미 사용 중인 ID입니다.";
//                 resultSpan.style.color = "red";
//                 isIdAvailable = false; // 중복 → 회원가입 불가
//             } else {
//                 resultSpan.textContent = "사용 가능한 ID입니다!";
//                 resultSpan.style.color = "green";
//                 isIdAvailable = true; // 사용 가능 → 회원가입 가능
//             }
//         })
//         .catch(err => {
//             alert("서버 오류가 발생했습니다.");
//         });
// }
//
// /* 비동기 */
// function loadContent(event, url) {
//     event.preventDefault();
//     fetch(url, {
//         headers: {
//             'X-Requested-With': 'XMLHttpRequest'
//         }
//     })
//         .then(response => response.text())
//         .then(html => {
//             const parser = new DOMParser();
//             const doc = parser.parseFromString(html, 'text/html');
//
//             // 기존 main.jsp 구조를 유지하고 있으므로,
//             // include된 컨텐츠가 들어가는 "main-container" 안의 <div>를 다시 넣는 방식으로
//             const newMain = doc.querySelector('.main-container');
//             document.querySelector('.main-container').innerHTML = newMain.innerHTML;
//         });
// }
//
// // 페이징 기능
//
// function addEvent() {
//
//     console.log(document.querySelectorAll(".page-link"))
// document.addEventListener('click', function (e) {
//     if (e.target.matches('.pagination .page-link')) {
//         e.preventDefault();
//         const page = e.target.dataset.page;
//
//         // 클릭을 하면 /account/mypageC?myPageCate=3&page=${page} 이 주소에서 리턴한 값을 res (변수명 내맘대로)에 담음
//         // [수정] 고정된 '3' 대신, myPage.jsp에 저장해둔 현재 카테고리 번호를 읽어온다.
//         const currentCate = document.getElementById('myPageContentArea').dataset.currentCate;
//
//         fetch(`/account/mypageC?myPageCate=${currentCate}&page=${page}`)
//             .then(res => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
//             .then(data => { // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
//                 // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
//                 document.querySelector('.mypage-main-content').innerHTML = data;
//             });
//     }
//     if (e.target && e.target.className === 'gacha') {
//         console.log('랜덤뽑기!!');
//
//     document.querySelectorAll(".page-link").forEach((el) => {
//
//         el.addEventListener("click", function (e) {
//             if (el.className.includes("page-link")) {
//                 const page = el.dataset.page;
//
//                 document.querySelectorAll(".page-link").forEach((el) => {
//                     el.classList.remove("active");
//                     el.classList.remove("cur-page");
//                 });
//                 el.classList.add("active", "cur-page")
//                 // 클릭을 하면 /account/mypageC?myPageCate=3&page=${page} 이 주소에서 리턴한 값을 res (변수명 내맘대로)에 담음
//                 // [수정] 고정된 '3' 대신, myPage.jsp에 저장해둔 현재 카테고리 번호를 읽어온다.
//                 const currentCate =
//                     document.getElementById("myPageContentArea").dataset.currentCate;
//
//                 fetch(`/account/mypageC?myPageCate=${currentCate}&page=${page}&first=2`)
//                     .then((res) => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
//                     .then((data) => {
//                         // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
//                         // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
//                         document.querySelector(".card-list").innerHTML = data;
//                         addLikeEvent();
//                     });
//         const duckImage = document.getElementById('gachafood-duck');
//         const duckImages = [
//             '/other/image/gacha/dokidoki22.png',
//             '/other/image/gacha/dokidoki33.png'
//         ];
//         const randomIndex = Math.floor(Math.random() * duckImages.length);
//         duckImage.src = duckImages[randomIndex];
//
//         // bounce 애니메이션 적용
//         duckImage.classList.add('bounce');
//
//         // 애니메이션 끝나고 클래스 제거 (지속시간과 맞춤)
//         setTimeout(() => {
//             duckImage.classList.remove('bounce');
//         }, 600);
//
//         let flag = 0;
//         let url = "/api/gacha/food";
//         console.log(e.target.value)
//         if (e.target.value == 'on') {
//             url += '?where=on'}
//         const eventSource = new EventSource(url);
//         eventSource.onmessage = function (event) {
//
//             console.log(event.data)
//             const data = event.data;
//             document.querySelector("#result").textContent += data;
//             if (data.includes(".")) {
//                 flag++;
//                 if (flag == 2){
//                  eventSource.close();  // ✅ 프론트에서 수동으로 끊기
//                     /*const hr = document.createElement("hr");
//                     document.querySelector("#result").appendChild(hr);*/
//                 }
//             }
//             if (e.target && e.target.className === "gacha") {
//                 console.log("랜덤뽑기!!");
//
//                 document.querySelector("#result").textContent = "";
//
//                 const duckImage = document.getElementById("gachafood-duck");
//                 const duckImages = [
//                     "/other/image/gacha/dokidoki22.png",
//                     "/other/image/gacha/dokidoki33.png",
//                 ];
//                 const randomIndex = Math.floor(Math.random() * duckImages.length);
//                 duckImage.src = duckImages[randomIndex];
//
//                 // bounce 애니메이션 적용
//                 duckImage.classList.add("bounce");
//
//                 // 애니메이션 끝나고 클래스 제거 (지속시간과 맞춤)
//                 setTimeout(() => {
//                     duckImage.classList.remove("bounce");
//                 }, 600);
//
//                 let flag = 0;
//                 let url = "/api/gacha/food";
//                 console.log(e.target.value);
//                 if (e.target.value == "on") {
//                     url += "?where=on";
//                 }
//                 const eventSource = new EventSource(url);
//                 eventSource.onmessage = function (event) {
//                     console.log(event.data);
//                     const data = event.data;
//                     document.querySelector("#result").textContent += data;
//                     if (data.includes(".")) {
//                         flag++;
//                         if (flag == 2) {
//                             eventSource.close(); // ✅ 프론트에서 수동으로 끊기
//                             /*const hr = document.createElement("hr");
//                             document.querySelector("#result").appendChild(hr);*/
//                         }
//                     }
//                 };
//             }
//
//         });
// }
// function addLikeEvent() {
//
//
// // 찜기능
//     document.querySelectorAll(".like-btn").forEach((el) => {
//         el.addEventListener("click", function (e) {
//             console.log("clicked???")
//             const likeButton = el;
//             // 비동기로 현재 페이지로 새로고침 될수있게
//             const curPageElement = document.querySelector(".cur-page"); // .cur-page 클래스를 가진 span 태그를 찾고
//             const page = curPageElement?.dataset.page; // 여기서 .dataset.page 속성 값을 가져와야 해!
// // 이제 'page' 변수에는 "1", "2", "3" 같은 문자열 형태의 페이지 번호가 들어있을 거야.
//
//             if (likeButton) {
//                 likeButton.disabled = true;
//
//                 const heartImage = likeButton.querySelector("img");
//                 const destinationNumber = likeButton.dataset.destinationNumber;
//
//                 // [수정] 이미지 src 대신, 버튼의 data-liked 꼬리표 값으로 상태를 판단한다.
//                 const isLiked = likeButton.dataset.liked === "true";
// document.addEventListener('click', function (e) {
//     const likeButton = e.target.closest('.like-btn');
//     const page = document.querySelector(".cur-page").dataset.page;
//
//     if (likeButton) {
//         likeButton.disabled = true;
//         const heartImage = likeButton.querySelector('img');
//         const destinationNumber = likeButton.dataset.destinationNumber;
//
//         // [수정] 이미지 src 대신, 버튼의 data-liked 꼬리표 값으로 상태를 판단한다.
//         const isLiked = likeButton.dataset.liked === 'true';
//
//         if (isLiked) {
//             // --- 찜 취소 로직 ---
//             fetch(`/api/likes/delete-like/${destinationNumber}`, {method: 'DELETE'})
//                 .then(response => response.json())
//                 .then(result => {
//                     alert(result.message);
//                     if (result.status === 'success') {
//                         heartImage.src = '/other/image/emptyheart.png';
//                         heartImage.alt = '찜하지 않은 상태 하트';
//                         // [핵심] 꼬리표의 값도 'false'로 바꿔준다!
//                         likeButton.dataset.liked = 'false';
//                         // [이런 방법도 있긴한데 페이지에서 사라지고 다음게 넘어오지는 않음ㅠㅠ] 하트 이미지를 바꾸는 대신, 카드 전체를 삭제한다.
//                         // likeButton.closest('.pokemon-card').remove();
//                     }
//                 })
//                 .finally(() => {
//                     likeButton.disabled = false;
//                     fetch(`/account/mypageC?myPageCate=2&page=${page}`)
//                         .then(res => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
//                         .then(data => { // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
//                             // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
//                             document.querySelector('.mypage-main-content').innerHTML = data;
//                         });
//
//                 });
//
//         } else {
//             // --- 찜하기 로직 ---
//             const likeData = {destination_number: destinationNumber};
//             fetch('/api/likes/add-like', {
//                 method: 'POST',
//                 headers: {'Content-Type': 'application/json'},
//                 body: JSON.stringify(likeData)
//             })
//                 .then(response => response.json())
//                 .then(result => {
//                     alert(result.message);
//                     if (result.status === 'success') {
//                         heartImage.src = '/other/image/heart.png';
//                         heartImage.alt = '찜한 상태 하트';
//                         // [핵심] 꼬리표의 값도 'true'로 바꿔준다!
//                         likeButton.dataset.liked = 'true';
//                     }
//                 })
//                 .finally(() => {
//                     likeButton.disabled = false;
//                 });
//         }
//     }
// });
//
//                 if (isLiked) {
//                     // --- 찜 취소 로직 ---
//                     fetch(`/api/likes/delete-like/${destinationNumber}`, {
//                         method: "DELETE",
//                     })
//                         .then((response) => response.json())
//                         .then((result) => {
//                             alert(result.message);
//                             if (result.status === "success") {
//                                 el.parentElement.remove();
//                                 document.querySelectorAll(".mypage-sidebar-item")[1].click();
//                             }
//                         })
//                         .finally(() => {
//                             likeButton.disabled = false;
//                             // 그 삭제할때 머물렀던 페이지로!!!!
//                             if (page != null) {
//                                 fetch(`/account/mypageC?myPageCate=2&page=${page}`)
//                                     .then((res) => res.text()) // 그래서 그 res를 text화 시켜줌 (그게 text 펑션임)
//                                     .then((data) => {
//                                         // 래서 이제 그 값을 data(변수명 내맘대로)에 담아줌
//                                         // 그 다음에 data를 어떻게 사용할지 (지금은 이 클래스에(.mypage-main-content)에 innerHTML(안에 띄워줘라)
//                                         document.querySelector(
//                                             ".mypage-main-content"
//                                         ).innerHTML = data;
//                                     });
//                             }
//                         });
//                 } else {
//                     // --- 찜하기 로직 ---
//                     const likeData = {destination_number: destinationNumber};
//                     fetch("/api/likes/add-like", {
//                         method: "POST",
//                         headers: {"Content-Type": "application/json"},
//                         body: JSON.stringify(likeData),
//                     })
//                         .then((response) => response.json())
//                         .then((result) => {
//                             alert(result.message);
//                             if (result.status === "success") {
//                                 heartImage.src = "/other/image/heart.png";
//                                 heartImage.alt = "찜한 상태 하트";
//                                 // [핵심] 꼬리표의 값도 'true'로 바꿔준다!
//                                 likeButton.dataset.liked = "true";
//                             }
//                         })
//                         .finally(() => {
//                             likeButton.disabled = false;
//                         });
//                 }
//             }
//         });
//
//     });
// }
//
// function addInfoEvent() {
// // 이거는 마이페이지 정보 수정으로 바꾸는거
//     document.querySelector("#edit-profile-btn")?.addEventListener("click", function (e) {
//         // '수정' 버튼 클릭 시
//         document.getElementById("display-mode").style.display = "none";
//         document.getElementById("edit-mode").style.display = "block";
//     });
//     document.querySelector("#cancel-edit-btn")?.addEventListener("click", function (e) {
//         document.getElementById("display-mode").style.display = "block";
//         document.getElementById("edit-mode").style.display = "none";
//     });
//
//
// // 이거는 폼 제출(submit) 이벤트 처리
//     document.addEventListener("submit", function (e) {
//         // 프로필 수정 폼이 제출될 때
//         if (e.target.matches("#profile-update-form")) {
//             e.preventDefault(); // 폼의 기본 제출(새로고침) 동장을 막음
//
//             const form = e.target;
//             const newPw = form.querySelector("#new_pw").value;
//             const confirmPw = form.querySelector("#confirm_pw").value;
//
//             // 비밀번호 유효성 검사
//             if (newPw !== "" && newPw !== confirmPw) {
//                 alert("새 비밀번호가 일치하지 않습니다.");
//                 return;
//             }
//
//             // fetch를 사용해 폼 데이터를 서버로 비동기 전송
//             const formData = new FormData(form);
//             const data = Object.fromEntries(formData.entries());
//
//             fetch("/account/update", {
//                 method: "POST",
//                 headers: {"Content-type": "application/json"},
//                 body: JSON.stringify(data),
//             })
//                 .then((response) => response.json())
//                 .then((result) => {
//                     alert(result.message);
//                     if (result.status === "success") {
//                         //성공시, JavaScript가 직접 화면을 업데이트하고 모드를 변경한다!
//                         const updatedUser = result.updatedUser;
//
//                         //1. '보기 모드'의 내용들을 최신 정보로 바꿔치기
//                         const displayMode = document.getElementById("display-mode");
//                         document.getElementById("display_user_name").innerHTML =
//                             "<strong>이름:</strong> " + updatedUser.user_name;
//                         document.getElementById("display_user_email").innerHTML =
//                             "<strong>이메일:</strong> " + updatedUser.user_email;
//
//                         //2. '수정 모드'는 숨기고 '보기 모드'를 보여준다.
//                         document.getElementById("edit-mode").style.display = "none";
//
//                         //3. id를 올바르게 고치고, 위에서 만든 변수를 재사용한다.
//                         displayMode.style.display = "block";
//                     }
//                 });
//         }
//     });
// }
// document.addEventListener('click', function (e) {
//
//     // '수정' 버튼 클릭 시
//     if (e.target.matches('#edit-profile-btn')) {
//         document.getElementById('display-mode').style.display = 'none';
//         document.getElementById('edit-mode').style.display = 'block';
//         return;
//     }
//
//     // '취소' 버튼 클릭 시
//     if (e.target.matches('#cancel-edit-btn')) {
//         document.getElementById('display-mode').style.display = 'block';
//         document.getElementById('edit-mode').style.display = 'none';
//         return;
//     }
// });
//
// // 이거는 폼 제출(submit) 이벤트 처리
// document.addEventListener('submit', function (e) {
//     // 프로필 수정 폼이 제출될 때
//     if (e.target.matches('#profile-update-form')) {
//         e.preventDefault(); // 폼의 기본 제출(새로고침) 동장을 막음
//
//         const form = e.target;
//         const newPw = form.querySelector('#new_pw').value;
//         const confirmPw = form.querySelector('#confirm_pw').value;
//
//         // 비밀번호 유효성 검사
//         if (newPw !== "" && newPw !== confirmPw) {
//             alert("새 비밀번호가 일치하지 않습니다.")
//             return;
//         }
//
//         // fetch를 사용해 폼 데이터를 서버로 비동기 전송
//         const formData = new FormData(form);
//         const data = Object.fromEntries(formData.entries());
//
//         fetch('/account/update', {
//             method: 'POST',
//             headers: {'Content-type': 'application/json'},
//             body: JSON.stringify(data)
//         })
//             .then(response => response.json())
//             .then(result => {
//                 alert(result.message);
//                 if (result.status === 'success') {
//                     //성공시, JavaScript가 직접 화면을 업데이트하고 모드를 변경한다!
//                     const updatedUser = result.updatedUser;
//
//                     //1. '보기 모드'의 내용들을 최신 정보로 바꿔치기
//                     const displayMode = document.getElementById('display-mode');
//                     document.getElementById('display_user_name').innerHTML = '<strong>이름:</strong> ' + updatedUser.user_name;
//                     document.getElementById('display_user_email').innerHTML = '<strong>이메일:</strong> ' + updatedUser.user_email;
//
//                     //2. '수정 모드'는 숨기고 '보기 모드'를 보여준다.
//                     document.getElementById('edit-mode').style.display = 'none';
//
//                     //3. id를 올바르게 고치고, 위에서 만든 변수를 재사용한다.
//                     displayMode.style.display = 'block';
//                 }
//             })
//     }
// })
//
// // ===== DOM이 바뀔 때마다 필요한 다른 기능을 처리하는 부분 =====
// const observer2 = new MutationObserver((mutations) => {
//
//     // 회원가입 ID 입력창에 대한 처리는 동적으로 생기므로 여기에 있는 게 맞아!
//     const signupUserIdInput = document.getElementById('signup-user-id');
//     if (signupUserIdInput) {
//         // 중복 추가를 막기 위해 리스너를 추가하기 전에 기존 리스너가 있는지 확인하거나,
//         // 한번만 실행되도록 플래그를 사용하는 게 더 좋지만 일단 지금은 이대로도 괜찮아.
//         signupUserIdInput.addEventListener('input', function () {
//             // fucntion() 콜백함수
//             isIdAvailable = false;
//             document.getElementById('id-check-result').textContent = "";
//         });
//     }
// });
// observer2.observe(document.body, {childList: true, subtree: true});
