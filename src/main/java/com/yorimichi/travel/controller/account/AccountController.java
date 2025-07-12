package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/selectAllUser")
    public String selectAllUser(Model model) {
        model.addAttribute("users", accountService.getAccounts());
        return "account/selectAllUser";
    }

    @GetMapping("/sign-up")
    public String signUp(Model model) {
        model.addAttribute("content", "account/signUp.jsp");
        return "main";
    }

    @PostMapping("/sign-up-submit")
    public String signUpSubmit(AccountVO accountVO, Model model) {
        accountService.insertUser(accountVO);
        model.addAttribute("content", "account/login.jsp");
        return "redirect:/login-page?joined=ok";
    }

    @PostMapping("/login-submit")
    public String loginSubmit(@RequestParam String user_id,
                              @RequestParam String user_pw,
                              Model model,
                              HttpSession session) {
        AccountVO user = accountService.login(user_id, user_pw);

        if (user != null) {
            // 로그인 성공 → 세션에 정보 저장!
            session.setAttribute("loginUser", user);
            // 메인 페이지로 이동 (ex. gamelist)
            return "redirect:/gamelist";
        } else {
            // 실패 시 에러 메시지와 함께 로그인 폼 다시
            model.addAttribute("loginError", "ID 또는 비밀번호가 올바르지 않습니다.");
            model.addAttribute("content", "account/login.jsp");
            return "main";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션(로그인 정보) 삭제
        return "redirect:/login-page";
    }

    @GetMapping("/mypage")
    public String myPage(HttpSession session, Model model) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
//        if (loginUser == null) {
//            // 로그인 안했으면 로그인 페이지로!
//            return "redirect:/login-page";
//        }
        model.addAttribute("loginUser", loginUser);
        model.addAttribute("content", "account/myPage.jsp");
        return "main"; // 템플릿 이름에 맞게 조정 (ex. "main" or "account/mypage" 등)
    }
}
