package com.yorimichi.travel.service.gacha;

import com.yorimichi.travel.mapper.HeartMapper;
import com.yorimichi.travel.vo.HeartStatusVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class HeartService {

    private final HeartMapper heartMapper;

    private static final int Max_Heart = 5;
    private static final int RECOVERY_MINUTES = 10;

    // userId로 하트 상태 조회
    public HeartStatusVO getHeartStatus(String userId) {
        return heartMapper.getHeartStatus(userId);
    }

    //
//    public boolean consumeHeart(String userId) {
//        HeartStatusVO status = heartMapper.getHeartStatus(userId);
//
//        if (status == null) return false;
//
//        // 자동 회복 계산
//        LocalDateTime now = LocalDateTime.now();
//        int recovered = calculateRecoveredHearts(status.getLast_used_time(), now);
//        int currentHeart = Math.min(status.getHeartCount() + recovered, MAX_HEART);
//
//        if (currentHeart <= 0) return false; // 하트 없음
//
//        status.setHeartCount(currentHeart - 1);
//        status.setLastUsedTime(now);
//
//        heartMapper.updateHeartStatus(status);
//        return true;
//    }

}
