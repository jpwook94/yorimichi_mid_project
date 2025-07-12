package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/account")
public class MyPageController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/mypageC")
    public String catePage(int myPageCate ,@RequestParam(defaultValue="1") int page, Model model) {
        if(myPageCate == 1){
            return "account/userProfile";
        } else if (myPageCate == 2) {
            return "account/userLikes";
        } else if (myPageCate == 3){
            int pageSize = 3;
            // 1. 전체 여행지 리스트 가져오기
            List<DestinationVO> all = accountService.getDestinations();

            // 2. 전체 페이지 개수
            int totalPage = (int) Math.ceil((double) all.size() / pageSize);

            // 3. 현재 페이지의 데이터만 추출
            int start = (page - 1) * pageSize;
            int end = Math.min(start + pageSize, all.size());
            List<DestinationVO> pageList = all.subList(start, end);

            // 4. 모델에 추가
            model.addAttribute("destinations", pageList);
            model.addAttribute("curPage", page);
            model.addAttribute("totalPage", totalPage);

            return "account/userPlanner";
        }
        return "";
    }
}
