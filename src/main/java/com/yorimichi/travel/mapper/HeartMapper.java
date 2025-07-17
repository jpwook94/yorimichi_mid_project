package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.HeartStatusVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface HeartMapper {

    // 1. 하트 상태 조회
    @Select("SELECT * FROM heart_status WHERE user_id = #{userId}")
    HeartStatusVO getHeartStatus(String userId);

    // 2. 하트 수 업데이트
    @Update("UPDATE heart_status SET heart_count = #{heartCount}, last_used_time = #{lastUsedTime} WHERE user_id = #{userId}")
    int updateHeartStatus(HeartStatusVO heartStatus);

    // 3. 새 사용자 삽입 (최초 로그인 시 하트 5개 지급 등)
    @Insert("INSERT INTO heart_status (user_id, heart_count, last_used_time) VALUES (#{userId}, #{heartCount}, #{lastUsedTime})")
    int insertHeartStatus(HeartStatusVO heartStatus);
}
