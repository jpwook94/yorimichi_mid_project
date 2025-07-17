package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.FoodVO;
import com.yorimichi.travel.vo.TagMbtiVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CharTestMapper {

    // MBTI 유형에 맞는 성향 정보 조회
    @Select("SELECT * from tag_mbti where mbti_category = #{mbtiType}")
    TagMbtiVO selectByMbti(String mbtiType);

    // MBTI 유형에 해당하는 여행지들 조회
    @Select("SELECT * from destination WHERE mbti_category = #{mbtiType} ORDER BY destination_number")
    List<DestinationVO> selectDestinationsByMbti(String mbtiType);

    // 이상형월드컵 문항 조회
    @Select("SELECT * from Food")
    List<FoodVO> selectAllFood();
}

