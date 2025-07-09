package com.yorimichi.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HC {

    @GetMapping("/hc")
    public String home(Model model) {
        model.addAttribute("content", "home.jsp");
        /*System.out.println(model.getAttribute("content"));*/
        return "main";
    }

    @GetMapping("/gamelist")
    public String gamelist(Model model) {
        model.addAttribute("content", "gamelist.jsp");
        return "main";
    }

    @GetMapping("/login-page")
    public String loginPage(Model model) {
        model.addAttribute("content", "account/login.jsp");
        return "main";
    }

    @GetMapping("/gacha")
    public String gacha(Model model) {
        model.addAttribute("content", "gacha/gacha.jsp");
        return "main";
    }

}
