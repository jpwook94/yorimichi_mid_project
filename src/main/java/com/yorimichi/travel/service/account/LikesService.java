package com.yorimichi.travel.service.account;

import com.yorimichi.travel.mapper.LikesMapper;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class LikesService {

    @Autowired
    private LikesMapper likesMapper;

    public void addLike(String userId, int destinationNumber) {
        likesMapper.addLike(userId, destinationNumber);
    }

//     찜 하기 메소드
    public List<Integer> getLikedDestinationIds(String userId) {
        return likesMapper.findLikedDestinationIdsByUserId(userId);
    }

    // 찜 취소(삭제)를 위한 서비스 메소드
    public void deleteLike(String userId, int destinationNumber) {
        likesMapper.deleteLike(userId, destinationNumber);
    }

    // [이 메소드 사용] 찜한 여행지 목록의 상세 정보를 가져오는 서비스 메소드
    public List<DestinationVO> getLikedDestinations(int offset, String userId) {
        return likesMapper.findLikedDestinationsByUserId(offset, userId);
    }

    public int getLikedDestinationsCount(String userId) {
        return likesMapper.findLikedDestinationsByUserIdCount(userId);
    }


    public int existsCheck(String id, int desNum) {
            return likesMapper.existsCheck(id, desNum);
    }

    public Set<Integer> getLikedDestinationNumbers(String userId, List<Integer> destinationNumbers) {
        List<Integer> liked = likesMapper.findLikedDestinationNumbers(userId, destinationNumbers);
        return new HashSet<>(liked); // 빠른 lookup 위해 Set 사용
    }


    public void addLikesBatch(String userId, List<Integer> destinationNumbers) {
        for (Integer destNum : destinationNumbers) {
            try {
                likesMapper.addLike(userId, destNum);
            } catch (Exception e) {
                // 이미 찜한 항목은 무시 (선택적)
            }
        }
    }



}
