package com.yorimichi.travel.controller.charTest;

import com.yorimichi.travel.service.charTest.CharTestService;
import com.yorimichi.travel.vo.DestinationVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
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
        /*charTestService.resultMBTIByGPT();*/
        // jsp에서 쓸 값 셋팅
        model.addAttribute("destList", resultMap.get("destination"));
        model.addAttribute("mbtiResult", resultMap.get("trait"));

        // jsp 페이지 경로 설정
        model.addAttribute("content", "charTest/mbti_result.jsp");
        return "main";
    }


    @GetMapping("/getDestination")
    @ResponseBody
    public ResponseEntity<DestinationVO> getDestination(@RequestParam("page") int page, HttpSession session) {
        List<DestinationVO> destList = (List<DestinationVO>) session.getAttribute("destList");

        System.out.println("===== [destList 디버깅] 요청된 page: " + page + " =====");

        if (destList == null) {
            System.out.println("⚠ destList가 null임! 세션 저장 여부 확인 필요!");
            return ResponseEntity.badRequest().build(); // null 대신 400 에러 반환
        }

        System.out.println("🔍 destList.size(): " + destList.size());

        for (int i = 0; i < destList.size(); i++) {
            DestinationVO d = destList.get(i);
            System.out.println("[" + i + "] " + d.getDestination_number() + " / " + d.getDestination_name() + " / " + d.getMbti_category());
        }

        if (page < 0 || page >= destList.size()) {
            System.out.println("⚠ 유효하지 않은 페이지 번호! → 첫 번째로 fallback");
            return ResponseEntity.ok(destList.get(0));
        }

        System.out.println("✅ 반환할 여행지: " + destList.get(page).getDestination_name());
        return ResponseEntity.ok(destList.get(page));
    }






    // 이상형 월드컵 문항 페이지
    @GetMapping("/ITTest")
    public String ITTest(Model model) {
        model.addAttribute("content", "charTest/ITTest.jsp");
        return "main";
    }








}