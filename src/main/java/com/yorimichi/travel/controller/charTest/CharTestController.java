package com.yorimichi.travel.controller.charTest;

import com.yorimichi.travel.service.charTest.CharTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CharTestController {

/*

    @Autowired
    private CharTestService charTestService;
*/

    /*// 전체조회 테스트
    @GetMapping("/destination-all")
    public String destinationAll(Model model) {
        model.addAttribute(CharTestService.getAllDestination() );
        return "charTest/select_test";
    }*/


    // 테스트 유형 선택 페이지
    @GetMapping("/charTest")
    public String charTest(Model model) {
        model.addAttribute("content", "charTest/charTest.jsp");
        return "main";
    }

    // MBTI 시작(상세) 페이지
    @GetMapping("/mbtiTest-detail")
    public String mbtiDetail(Model model) {
        model.addAttribute("content", "charTest/mbti_detail.jsp");
        return "main";
    }

    // 이상형 월드컵 시작(상세) 페이지
    @GetMapping("/idealType-detail")
    public String idealTypeDetail(Model model) {
        model.addAttribute("content", "charTest/idealType_detail.jsp");
        return "main";
    }

    // MBTI 문항 페이지









}