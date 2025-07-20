<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--<div style="border: 1px solid black; margin-left: 270px ">--%>

<%--    &lt;%&ndash; 보기 모드 &ndash;%&gt;--%>
<%--    <div id="display-mode">--%>
<%--        <h3>내 프로필</h3>--%>
<%--        <p><strong>아이디:</strong> ${sessionScope.loginUser.user_id}</p>--%>
<%--        <p id="display_user_name"><strong>이름:</strong> ${sessionScope.loginUser.user_name}</p>--%>
<%--        <p id="display_user_email"><strong>이메일:</strong> ${sessionScope.loginUser.user_email}</p>--%>
<%--        &lt;%&ndash; [수정] onclick을 지우고 id 추가 &ndash;%&gt;--%>
<%--        <button type="button" id="edit-profile-btn">수정</button>--%>
<%--    </div>--%>

<%--    &lt;%&ndash; 수정 모드 &ndash;%&gt;--%>
<%--    <div id="edit-mode" style="display:none;">--%>
<%--        <h3>프로필 수정</h3>--%>
<%--        &lt;%&ndash; [수정] onsubmit을 지우고 form에 id 추가 &ndash;%&gt;--%>
<%--        <form action="/account/update" method="post" id="profile-update-form">--%>
<%--            <p><strong>아이디:</strong> ${sessionScope.loginUser.user_id}</p>--%>
<%--            <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">--%>
<%--            <p>--%>
<%--                <strong>이름:</strong><br>--%>
<%--                <input type="text" name="user_name" value="${sessionScope.loginUser.user_name}" required>--%>
<%--            </p>--%>
<%--            <p>--%>
<%--                <strong>이메일:</strong><br>--%>
<%--                <input type="email" name="user_email" value="${sessionScope.loginUser.user_email}" required>--%>
<%--            </p>--%>
<%--            <hr>--%>
<%--            <p><strong>비밀번호 변경 (변경할 경우에만 입력)</strong></p>--%>
<%--            <p>--%>
<%--                <strong>새 비밀번호:</strong><br>--%>
<%--                <input type="password" name="user_pw" id="new_pw">--%>
<%--            </p>--%>
<%--            <p>--%>
<%--                <strong>새 비밀번호 확인:</strong><br>--%>
<%--                <input type="password" id="confirm_pw">--%>
<%--            </p>--%>
<%--            <button type="submit">저장</button>--%>
<%--            &lt;%&ndash; [수정] onclick을 지우고 id 추가 &ndash;%&gt;--%>
<%--            <button type="button" id="cancel-edit-btn">취소</button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>

    <!-- 보기 모드 -->
    <div id="display-mode" class="retro-window">
        <div class="retro-titlebar">
            <div class="retro-buttons">
                <div class="btn-minimize"></div>
                <div class="btn-maximize"></div>
                <div class="btn-close"></div>
            </div>
        </div>
        <div class="retro-body">
            <div class="retro-content">
                <h3 id="profile-title">내 프로필</h3>
                <p><strong>아이디:</strong> ${sessionScope.loginUser.user_id}</p>
                <p id="display_user_name"><strong>이름:</strong> ${sessionScope.loginUser.user_name}</p>
                <p id="display_user_email"><strong>이메일:</strong> ${sessionScope.loginUser.user_email}</p>
                <button type="button" id="edit-profile-btn">수정</button>
            </div>
            <div class="retro-image-box">
                <img src="/other/image/DUCK1.png" alt="프로필 이미지" />
            </div>
        </div>
    </div>
    <!-- 수정 모드 -->
    <div id="edit-mode" class="retro-window" style="display:none;">
        <div class="retro-titlebar">
            <div class="retro-buttons">
                <div class="btn-minimize"></div>
                <div class="btn-maximize"></div>
                <div class="btn-close"></div>
            </div>
        </div>
        <div class="retro-body">
            <div class="retro-content">
                <h3 id="profile-title">프로필 수정</h3>
                <form action="/account/update" method="post" id="profile-update-form">
                    <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
                    <p>
                        <strong>이름:</strong><br>
                        <input type="text" name="user_name" id="input_user_name" value="${sessionScope.loginUser.user_name}" required>
                    </p>
                    <p>
                        <strong>이메일:</strong><br>
                        <input type="email" name="user_email" id="input_user_email" value="${sessionScope.loginUser.user_email}" required>
                    </p>
                    <hr>
                    <p><strong>비밀번호 변경 (변경할 경우에만 입력)</strong></p>
                    <p>
                        <strong>새 비밀번호:</strong><br>
                        <input type="password" name="user_pw" id="input_user_pw">
                    </p>
                    <p>
                        <strong>새 비밀번호 확인:</strong><br>
                        <input type="password" id="input_confirm_pw">
                    </p>
                    <button type="submit" id="save-profile-btn">저장</button>
                    <button type="button" id="cancel-edit-btn">취소</button>
                </form>
            </div>
            <div class="retro-image-box">
                <img src="/other/image/DUCK1.png" alt="프로필 이미지" />
            </div>
        </div>
    </div>
<%--<script src="/other/js/account.js"></script>--%>
