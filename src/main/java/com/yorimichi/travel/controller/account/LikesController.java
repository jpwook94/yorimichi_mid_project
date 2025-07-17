package com.yorimichi.travel.controller.account;

import com.yorimichi.travel.service.account.AccountService;
import com.yorimichi.travel.service.account.LikesService;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/likes")
public class LikesController {

    @Autowired
    private LikesService likesService;

    @PostMapping("/add-like")
    public ResponseEntity<?> LikeMethodCreatedByTeamLeader(@RequestBody DestinationVO data, HttpSession session) {
        // 1. 세션에서 로그인 정보 가져오기
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            // 로그인 안 한 경우 - 에러 메시지 반환
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }
        // 2. 서비스 호출해서 '좋아요' 추가 로직 실행
        try {
            likesService.addLike(loginUser.getUser_id(), data.getDestination_number());
            // 성공 시 - 성공 메시지 반환
            return ResponseEntity.ok(Map.of("status", "success", "message", "찜 목록에 추가되었습니다!"));
        } catch (Exception e) {
            // 실패 시 (이미 찜한 경우 등) - 실패 메시지 반환
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "이미 찜한 여행지입니다."));
        }
    }

    // 찜 취소를 위한 컨트롤러 메소드
    @DeleteMapping("/delete-like/{destinationNumber}")
    public ResponseEntity<?> deleteLike(@PathVariable int destinationNumber, HttpSession session) {
        // 1. 세션에서 로그인 정보 가져오기
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }

        // 2. 서비스 호출해서 '좋아요' 삭제 로직 실행
        try {
            likesService.deleteLike(loginUser.getUser_id(), destinationNumber);
            // 성공 시 - 성공 메시지 반환
            return ResponseEntity.ok(Map.of("status", "success", "message", "찜을 취소했습니다."));
        } catch (Exception e) {
            // 실패 시 - 실패 메시지 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("message", "처리 중 오류가 발생했습니다."));
        }
    }

    @PostMapping("/check-liked-list")
    @ResponseBody
    public ResponseEntity<?> checkMultipleLikes(@RequestBody List<Integer> destinationNumbers, HttpSession session) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "로그인이 필요합니다."));
        }

        Map<Integer, Boolean> likedMap = new HashMap<>();
        for (int num : destinationNumbers) {
            boolean isLiked = likesService.isLiked(loginUser.getUser_id(), num);
            likedMap.put(num, isLiked);
        }

        return ResponseEntity.ok(likedMap);
    }
}
