package com.yorimichi.travel.controller.gacha;

import com.yorimichi.travel.service.gacha.HeartService;
import com.yorimichi.travel.vo.HeartStatusVO;
import com.yorimichi.travel.vo.account.AccountVO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/heart")
@RequiredArgsConstructor
public class HeartController {

    @Autowired
    private HeartService heartService;

    // 현재 하트 상태 및 다음 회복 시간 조회
    @PostMapping("/status")
    public Map<String, Object> getHeartStatus(@RequestBody Map<String, String> payload) {
        String userId = payload.get("userId");
        Map<String, Object> result = new HashMap<>();

        HeartStatusVO status = heartService.getHeartStatus(userId);
        if (status == null) {
            // 사용자 상태가 없으면 기본값 세팅
            result.put("currentHeart", 5);
            result.put("timeUntilNext", "0:00");
            return result;
        }

        int maxHeart = 5;
        int recovered = heartService.calculateRecoveredHearts(status.getLast_used_time(), LocalDateTime.now());
        int currentHeart = Math.min(status.getHeart_count() + recovered, maxHeart);

        long seconds = heartService.getSecondsUntilNextRecovery(userId);
        long minutes = seconds / 60;
        long secs = seconds % 60;

        result.put("currentHeart", currentHeart);
        result.put("timeUntilNext", String.format("%d:%02d", minutes, secs));

        return result;
    }

    // 하트 확인
    @PostMapping("/consume-heart")
    public ResponseEntity<?> consumeHeart(@RequestBody Map<String, String> payload, HttpSession session) {
        AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("message", "로그인이 필요합니다."));
        }

        String userId = loginUser.getUser_id(); // 세션에서 직접 가져오기 권장
        boolean success = heartService.consumeHeart(userId);

        if (!success) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "하트가 부족합니다."));
        }

        return ResponseEntity.ok(Map.of("message", "하트 1개 소비 완료"));
    }

}
