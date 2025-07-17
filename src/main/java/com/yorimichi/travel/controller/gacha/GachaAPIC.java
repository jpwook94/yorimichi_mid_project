package com.yorimichi.travel.controller.gacha;


import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.service.gacha.GachaService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.FoodVO;
import com.yorimichi.travel.vo.PickResultVO;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
public class GachaAPIC {

    @Autowired
    private GachaService gachaService;

    @Autowired
    private LikesService likesService;

    @GetMapping("/existsCheck/{id}/{desNum}")
    public int exitsCheck(@PathVariable String id, @PathVariable int desNum) {
        return likesService.existsCheck(id, desNum);
    }

    @GetMapping("/pick")
    public PickResultVO pickMascot(Model model) {
        PickResultVO randomLocationMas = gachaService.pickLocationAndMascot();
        return randomLocationMas; // 뽑은 객체
    }

    @GetMapping("/pickSSR")
    public DestinationVO pickDestination(Model model) {
        DestinationVO randomDestination = gachaService.getRandomDestination();
        return randomDestination;
    }

    @GetMapping("/pickSSRN")
    public List<DestinationVO> pickNDestinations(Model model) {
        int count = 5; // 원하는 개수
        List<DestinationVO> randomDestinations = gachaService.getRandomNDestinations(count);
        model.addAttribute("pickeddestlist", randomDestinations); // JSP에서 쓸 경우
        return randomDestinations; // JSON 배열로 반환
    }

    @GetMapping("pickfood")
    public FoodVO pickFood(Model model) {
        FoodVO randomFood = gachaService.getRandomFood();
//        model.addAttribute("pickedfood", randomFood);
        return randomFood;
    }


//    @GetMapping("/gacha-mascot")
//    public String gachaMascot(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachamascot.jsp");
//        return "main";
//    }
//
//    @GetMapping("/gacha-destination")
//    public String gachaDestination(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachadestination.jsp");
//        return "main";
//    }
//
//    @GetMapping("/gacha-food")
//    public String gachaFood(Model model) {
//        model.addAttribute("content", "gacha/gacha.jsp");
//        model.addAttribute("gachacontent", "/WEB-INF/views/gacha/gachafood.jsp");
//        return "main";
//    }



}
