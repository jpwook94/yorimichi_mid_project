package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/account")
public class MyPageController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/mypageC")
    public String catePage(int myPageCate){
        if(myPageCate == 1){
            return "account/userProfile";
        } else if (myPageCate == 2) {
            return "account/userLikes";
        } else if (myPageCate == 3){
            return "account/userPlanner";
        }
        return "";
    }
}
