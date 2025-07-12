package com.yorimichi.travel.service.account;

import com.yorimichi.travel.mapper.AccountMapper;
import com.yorimichi.travel.vo.account.AccountVO;
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
}
