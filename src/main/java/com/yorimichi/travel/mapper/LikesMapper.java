package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Mapper
public interface LikesMapper {

    @Insert("INSERT INTO likes (like_number, user_id, destination_number) " +
            "VALUES (likes_seq.NEXTVAL, #{userId}, #{destinationNumber})")
    int addLike(String userId,int destinationNumber);

    // 특정 유저가 찜한 모든 여행지 번호 목록을 조회
    @Select("SELECT destination_number FROM likes WHERE user_id = #{userId}")
    List<Integer> findLikedDestinationIdsByUserId(String userId);

    // 찜 취소(삭제) 메소드
    @Delete("DELETE FROM likes WHERE user_id = #{userId} AND destination_number = #{destinationNumber}")
    int deleteLike(String userId, int destinationNumber);

    // [이 메소드 사용] 특정 유저가 찜한 모든 여행지의 상세 정보 목록을 조회
    @Select("SELECT d.destination_number, d.destination_name, d.mbti_category, d.destination_address, d.location_number\n" +
            "            FROM destination d, likes l " +
            "            where d.destination_number = l.destination_number and " +
            "            l.user_id = #{userId}")
    List<DestinationVO> findLikedDestinationsByUserId(String userId);

    // [새로 추가해야 할 메소드] 특정 유저가 찜한 전체 여행지의 개수를 조회
    @Select("SELECT COUNT(*) FROM likes WHERE user_id = #{userId}")
    int getTotalLikedDestinationsCount(String userId); // userId를 파라미터로 받아서 likes 테이블의 개수를 세는 쿼리

    @Select("SELECT count(*)" +
            "            FROM destination d, likes l " +
            "            where d.destination_number = l.destination_number and " +
            "            l.user_id = #{userId}")
        int findLikedDestinationsByUserIdCount(String userId);

    // 유저가 여행지 찜 한게 있는지 없는지(없으면 0, 있으면 1)
    @Select("select count(*) from likes where user_id=#{id} and destination_number=${desNum}")
        int existsCheck(String id, int desNum);

    @Select({
            "<script>",
            "SELECT destination_number FROM likes",
            "WHERE user_id = #{userId}",
            "AND destination_number IN",
            "<foreach item='num' collection='destinationNumbers' open='(' separator=',' close=')'>",
            "#{num}",
            "</foreach>",
            "</script>"
    })
    List<Integer> findLikedDestinationNumbers(@Param("userId") String userId, @Param("destinationNumbers") List<Integer> destinationNumbers);
}

