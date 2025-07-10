package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.vo.account.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
}
