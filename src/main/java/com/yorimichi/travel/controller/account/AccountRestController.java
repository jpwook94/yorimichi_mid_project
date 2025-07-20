package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/account")
public class AccountRestController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/check-id")
    public ResponseEntity<Boolean> checkId(@RequestParam("user_id") String user_id) {
        boolean duplicated = accountService.isIdDuplicated(user_id);
        return ResponseEntity.ok(duplicated);
    }

    @PostMapping("/update")
    public ResponseEntity<?> updateUser(@RequestBody AccountVO formData, HttpSession session) {
        //1. 세션에서 현재 로그인한 사용자 정보를 가져온다. (가장 신뢰할 수 있는 정보)
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }
        //2. form으로 받은 데이터(formData)에 세션의 user_id를 설정해준다.
        // 클라이언트가 보낸 user_id를 무시하고, 세션에서 신뢰할 수 있는 로그인 사용자 ID를 넣는 보안 조치
        // “너 누구인지 몰라도, 네가 수정하는 건 네 정보만 가능하게 한다.”
        formData.setUser_id(loginUser.getUser_id());

        boolean isSuccess = accountService.updateUser(formData);
        // [수정] isSuccess 값에 따라 다른 응답을 보낸다
        if (isSuccess) {
            // 성공 시
            AccountVO freshUserInfo = accountService.getUserById(loginUser.getUser_id());
            session.setAttribute("loginUser", freshUserInfo);
            return ResponseEntity.ok(Map.of("status", "success", "message", "프로필이 수정되었습니다.", "updatedUser", freshUserInfo));
        } else {
            // 실패 시
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", "정보 업데이트에 실패했습니다."));
        }}
}
