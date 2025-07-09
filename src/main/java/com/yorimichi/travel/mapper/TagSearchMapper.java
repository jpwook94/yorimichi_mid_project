package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.tagSearch.TagSearchVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TagSearchMapper {


    @Select(
            "select * " +
                    "from tag_category " +
                    "join tag_theme" +
                    "on tag_category_id = tag_theme_tag_category_id " +
                    "where tag_category_id = #{category_id}")
    public List<TagSearchVO> getAllTags(int category_id);

}
