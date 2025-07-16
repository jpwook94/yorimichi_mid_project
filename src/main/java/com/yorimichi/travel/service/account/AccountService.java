package com.yorimichi.travel.service.account;

import com.yorimichi.travel.mapper.AccountMapper;
import com.yorimichi.travel.vo.account.AccountVO;
import com.yorimichi.travel.vo.DestinationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {

    @Autowired
    private final AccountMapper accountMapper;

    public AccountService(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    public List<AccountVO> getAccounts() {
        List<AccountVO> users = accountMapper.selectAll();
        return users;
    }

    public boolean isIdDuplicated(String user_id) {
        int count = accountMapper.countByUserId(user_id);
        return count > 0; // 0보다 크면 true(중복), 아니면 false(사용 가능) 반환
    }

    public void insertUser(AccountVO accountVO) {
        if (accountMapper.insertUser(accountVO) == 1) {
            System.out.println("add review success");
        }
    }

    public AccountVO login(String userId, String userPw) {
        return accountMapper.login(userId, userPw);
    }

    public List<DestinationVO> getDestinations() {
        List<DestinationVO> destinations = accountMapper.selectAllDestination();
        return destinations;
    }

    // 유저 아이디로 유저 정보 가지고오기
    public AccountVO getUserById(String userId) {
        return accountMapper.selectById(userId);
    }

    // 사용자 정보 업데이트 로직
    public boolean updateUser(AccountVO user) {

        // --- 1. 디버깅 로그 추가 ---
        System.out.println("===== Service: updateUser 시작 =====");
        System.out.println("입력받은 이름: " + user.getUser_name());
        System.out.println("입력받은 이메일: " + user.getUser_email());
        System.out.println("입력받은 PW: " + user.getUser_pw());
        System.out.println("=====================================");


        int updatedRows = 0;
        // 업데이트할 내용이 하나라도 있는지 확인
        boolean hasName = user.getUser_name() != null && !user.getUser_name().isEmpty();
        boolean hasEmail = user.getUser_email() != null && !user.getUser_email().isEmpty();
        boolean hasPassword = user.getUser_pw() != null && !user.getUser_pw().isEmpty();

        // 변경 사항이 하나도 없다면, DB에 접근조차 하지 않고 여기서 종료
        if (!hasName && !hasEmail && !hasPassword) {
            // --- 2. 디버깅 로그 추가 ---
            System.out.println(">>> 변경 사항 없음! DB 접근 안 하고 true 반환!");
            return true;
        }
        updatedRows = accountMapper.updateUser(user);

        // --- 3. 디버깅 로그 추가 ---
        System.out.println(">>> Mapper 실행 결과, 업데이트된 행의 수: " + updatedRows);
        return updatedRows > 0;
    }

}
