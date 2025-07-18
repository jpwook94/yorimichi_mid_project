package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequestMapping("/api/likes")
@RestController
public class APIAccountController {
    // 강사님이 DB 확인 최적화 해주셨을때 코드
    private boolean firstReq;

    public APIAccountController() {
        firstReq = true;
    }

    @Autowired
    private AccountService accountService;

    @Autowired
    private LikesService likesService;

    @GetMapping
    public List<DestinationVO> like(HttpSession session, Model model) {
        AccountVO accountVO = (AccountVO) session.getAttribute("loginUser");
        return likesService.findLikedDestinationsByUserId(accountVO.getUser_id());
    }
    @DeleteMapping
    public int delete(@RequestBody DestinationVO destinationVO, HttpSession session, Model model) {
        AccountVO accountVO = (AccountVO) session.getAttribute("loginUser");
        if (accountVO == null) {
            return -1; // 3 이면 로그인 안된거
        }
        return likesService.deleteLike(accountVO.getUser_id(), destinationVO.getDestination_number());
    }
    @PostMapping
    public int post(@RequestBody DestinationVO destinationVO, HttpSession session, Model model) {
        AccountVO accountVO = (AccountVO) session.getAttribute("loginUser");
        if (accountVO == null) {
            return -1;
        }
        // 2. 서비스 호출해서 '좋아요' 추가 로직 실행
          return  likesService.addLike(accountVO.getUser_id(), destinationVO.getDestination_number());
    }
}
