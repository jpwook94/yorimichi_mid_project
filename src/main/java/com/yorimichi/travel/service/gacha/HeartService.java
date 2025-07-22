package com.yorimichi.travel.service.gacha;

import com.yorimichi.travel.mapper.HeartMapper;
import com.yorimichi.travel.vo.HeartStatusVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class HeartService {

    private final HeartMapper heartMapper;

    private static final int Max_Heart = 5;
    private static final int RECOVERY_MINUTES = 10;

    // 회원가입 시 하트 5개 지급
    public void createInitialHeartStatus(String userId) {
        HeartStatusVO status = new HeartStatusVO();
        status.setUser_id(userId);                // 회원가입된 사용자 ID
        status.setHeart_count(5);                 // 하트 5개 지급
        status.setLast_used_time(null);           // 아직 사용 안 했으니 null

        heartMapper.insertHeartStatus(status);
    }

    // userId로 하트 상태 조회
    public HeartStatusVO getHeartStatus(String userId) {
        return heartMapper.getHeartStatus(userId);
    }

    // 하트 1개 소비
    public boolean consumeHeart(String userId) {
        HeartStatusVO status = heartMapper.getHeartStatus(userId);

        if (status == null) return false;

        // 자동 회복 계산
        LocalDateTime now = LocalDateTime.now();
        int recovered = calculateRecoveredHearts(status.getLast_used_time(), now);
        int currentHeart = Math.min(status.getHeart_count() + recovered, Max_Heart);

        if (currentHeart <= 0) return false; // 하트 없음

        status.setHeart_count(currentHeart - 1);
        status.setLast_used_time(now);

        heartMapper.updateHeartStatus(status);
        return true;
    }

    // 다음 하트 회복까지 남은 시간(초) 반환
    public long getSecondsUntilNextRecovery(String userId) {
        HeartStatusVO status = heartMapper.getHeartStatus(userId);
        if (status == null || status.getHeart_count() >= Max_Heart) return 0;

        LocalDateTime nextRecoveryTime = status.getLast_used_time().plusMinutes(RECOVERY_MINUTES);
        long seconds = Duration.between(LocalDateTime.now(), nextRecoveryTime).getSeconds();
        return Math.max(seconds, 0);
    }

    // 마지막 사용 시간 기준 자동 회복된 하트 개수 계산
    public int calculateRecoveredHearts(LocalDateTime lastUsed, LocalDateTime now) {
        if (lastUsed == null) return 0;
        long minutesPassed = Duration.between(lastUsed, now).toMinutes();
        return (int) (minutesPassed / 10);
    }




}
