package com.yorimichi.travel.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class AccountController {

    @GetMapping("/sign-up")
    public String signUp(Model model) {
        model.addAttribute("content", "account/signUp.jsp");
        return "main";
    }

    @PostMapping("/sign-up-submit")
    public String signUpSubmit(@ModelAttribute("content") String content, Model model) {
        model.addAttribute("content", content);
        return "main";
    }

}
