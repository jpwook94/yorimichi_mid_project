package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.FoodVO;
import com.yorimichi.travel.vo.LocationVO;
import com.yorimichi.travel.vo.MascotVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

    // food 전체조회
    @Select("select * from food")
    public List<FoodVO> selectAllFood();

    @Select("SELECT * FROM mascot WHERE mascot_number = #{mascotNumber}")
    MascotVO selectMascotByNum(@Param("mascotNumber") int mascotNumber);

}
