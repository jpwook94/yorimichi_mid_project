package com.yorimichi.travel.mapper;

import com.yorimichi.travel.vo.account.AccountVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AccountMapper {

    @Select("select * from users")
    public List<AccountVO> selectAll();

    @Select("SELECT COUNT(*) FROM users WHERE user_id = #{user_id}")
    int countByUserId(String user_id); // 아이디로 개수를 세는 메서드 추가

    @Select("SELECT * FROM users WHERE user_id = #{user_id} AND user_pw = #{user_pw}")
    AccountVO login(@Param("user_id") String user_id, @Param("user_pw") String user_pw);

    @Insert("insert into users values (#{user_id},#{user_name},#{user_email},#{user_pw})")
    int insertUser(AccountVO user);


}
