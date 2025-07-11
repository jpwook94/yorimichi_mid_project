package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.gacha.LocationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface GachaMapper {

    // 전체조회
    @Select("select * from location")
    public List<LocationVO> selectAllLocation();

    // 하나조회
    @Select("select * from location where location_number=#{num}")
    LocationVO selectLocationByNum(int num);

}
