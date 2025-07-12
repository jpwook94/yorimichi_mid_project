package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.gacha.DestinationVO;
import com.yorimichi.travel.vo.gacha.LocationVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface GachaMapper {

    // location 전체조회
    @Select("select * from location")
    public List<LocationVO> selectAllLocation();

    // location 하나조회
    @Select("select * from location where location_number=#{num}")
    LocationVO selectLocationByNum(int num);

    // destination 전체조회
    @Select("select * from destination")
    public List<DestinationVO> selectAllDestination();

    // destination 하나조회
    @Select("select * from destination where destination_number=#{num}")
    DestinationVO selectDestinationByNum(int num);

}
