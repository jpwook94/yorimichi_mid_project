package com.yorimichi.travel.controller.gacha;


import com.yorimichi.travel.service.gacha.GachaService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.FoodVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.PickResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class GachaController {

    @Autowired
    private GachaService gachaService;

    @ResponseBody
    @GetMapping("/pick")
    public PickResultVO pickMascot(Model model) {
        PickResultVO randomLocationMas = gachaService.pickLocationAndMascot();
        model.addAttribute("pickedlocMos", randomLocationMas);
        return randomLocationMas; // 뽑은 객체
    }

    @ResponseBody
    @GetMapping("/pickSSR")
    public DestinationVO pickDestination(Model model) {
        DestinationVO randomDestination = gachaService.getRandomDestination();
        model.addAttribute("pickeddest", randomDestination);
        return randomDestination;
    }

    @ResponseBody
    @GetMapping("/pickSSRN")
    public List<DestinationVO> pickNDestinations(Model model) {
        int count = 5; // 원하는 개수
        List<DestinationVO> randomDestinations = gachaService.getRandomNDestinations(count);
        model.addAttribute("pickeddestlist", randomDestinations); // JSP에서 쓸 경우
        return randomDestinations; // JSON 배열로 반환
    }

    @ResponseBody
    @GetMapping("pickfood")
    public FoodVO pickFood(Model model) {
        FoodVO randomFood = gachaService.getRandomFood();
        model.addAttribute("pickedfood", randomFood);
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
