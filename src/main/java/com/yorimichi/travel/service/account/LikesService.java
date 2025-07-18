package com.yorimichi.travel.service.account;

import com.yorimichi.travel.mapper.LikesMapper;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikesService {

    @Autowired
    private LikesMapper likesMapper;

    public int addLike(String userId, int destinationNumber) {
       return  likesMapper.addLike(userId, destinationNumber);
    }

    //     찜 하기 메소드
    public List<Integer> getLikedDestinationIds(String userId) {
        return likesMapper.findLikedDestinationIdsByUserId(userId);
    }

    // 찜 취소(삭제)를 위한 서비스 메소드
    public int deleteLike(String userId, int destinationNumber) {
        System.out.println(userId);
        System.out.println(destinationNumber);
        int row = likesMapper.deleteLike(userId, destinationNumber);
        return row;
    }

    // [이 메소드 사용] 찜한 여행지 목록의 상세 정보를 가져오는 서비스 메소드
    public List<DestinationVO> findLikedDestinationsByUserId(String userId) {
        return likesMapper.findLikedDestinationsByUserId(userId);
    }

    public int getLikedDestinationsCount(String userId) {
        return likesMapper.findLikedDestinationsByUserIdCount(userId);
    }

    public int getTotalLikedDestinationsCount(String userId) {
        return likesMapper.getTotalLikedDestinationsCount(userId);
    }


    public int existsCheck(String id, int desNum) {
            return likesMapper.existsCheck(id, desNum);
    }
}
