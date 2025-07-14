package com.yorimichi.travel.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Mapper
public interface LikesMapper {

    @Insert("INSERT INTO likes (like_number, user_id, destination_number) " +
            "VALUES (likes_seq.NEXTVAL, #{userId}, #{destinationNumber})")
    int addLike(@Param("userId") String userId, @Param("destinationNumber") int destinationNumber);

    // 특정 유저가 찜한 모든 여행지 번호 목록을 조회
    @Select("SELECT destination_number FROM likes WHERE user_id = #{userId}")
    List<Integer> findLikedDestinationIdsByUserId(String userId);

    // 찜 취소(삭제) 메소드
    @Delete("DELETE FROM likes WHERE user_id = #{userId} AND destination_number = #{destinationNumber}")
    int deleteLike(@Param("userId") String userId, @Param("destinationNumber") int destinationNumber);
}

