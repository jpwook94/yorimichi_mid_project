package com.yorimichi.travel.controller.charTest;

import com.yorimichi.travel.service.charTest.CharTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CharTestController {


    @Autowired
    private CharTestService charTestService;

    // 전체조회 테스트
    @GetMapping("/destination-all")
    public String destinationAll(Model model) {
        model.addAttribute(CharTestService.getAllDestination() );
        return "charTest/select_test";
    }

}
