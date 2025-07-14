package com.yorimichi.travel.service.account;

import com.yorimichi.travel.mapper.LikesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikesService {

    @Autowired
    private LikesMapper likesMapper;

    public void addLike(String userId, int destinationNumber) {
        likesMapper.addLike(userId, destinationNumber);
    }

    // 찜 하기 메소드
    public List<Integer> getLikedDestinationIds(String userId) {
        return likesMapper.findLikedDestinationIdsByUserId(userId);
    }

    // 찜 취소(삭제)를 위한 서비스 메소드
    public void deleteLike(String userId, int destinationNumber) {
        likesMapper.deleteLike(userId, destinationNumber);
    }
}
