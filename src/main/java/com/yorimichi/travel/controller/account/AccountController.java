package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.vo.account.AccountVO;
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
        return selectAllUser(model);
    }

}
