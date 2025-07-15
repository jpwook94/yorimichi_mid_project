package com.yorimichi.travel.controller.charTest;

import com.yorimichi.travel.service.charTest.CharTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class CharTestController {


    @Autowired
    private CharTestService charTestService;


    // 테스트 유형 선택 페이지
    @GetMapping("/charTest")
    public String charTest(Model model) {
        model.addAttribute("content", "charTest/charTest.jsp");
        return "main";
    }

    // MBTI 문항 페이지
    @GetMapping("/mbtiTest")
    public String mbtiTest(Model model) {
        model.addAttribute("content", "charTest/mbtiTest.jsp");
        return "main";
    }

    // mbti 결과 페이지
    @GetMapping("/mbtiTest-result")
    public String mbtiTestCalc(String[] ans, Model model) {
        for (String s : ans) {System.out.println(s);
        }

        // 서비스에서 값 계산 및 정보 조회
        Map<String, Object> resultMap = charTestService.resultMBTI(ans);
//        charTestService.resultMBTIByGPT();
        // jsp에서 쓸 값 셋팅
        model.addAttribute("destList", resultMap.get("destination"));
        model.addAttribute("mbtiResult", resultMap.get("trait"));

        // jsp 페이지 경로 설정
        model.addAttribute("content", "charTest/mbti_result.jsp");
        return "main";
    }




    // 이상형 월드컵 문항 페이지
    @GetMapping("/ITTest")
    public String ITTest(Model model) {
        model.addAttribute("content", "charTest/ITTest.jsp");
        return "main";
    }








}