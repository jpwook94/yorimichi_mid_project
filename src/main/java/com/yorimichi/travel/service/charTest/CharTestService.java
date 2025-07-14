package com.yorimichi.travel.service.charTest;

import com.yorimichi.travel.mapper.CharTestMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.TagMbtiVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CharTestService {

    @Autowired
    private CharTestMapper charTestMapper;

    ArrayList<String> ansArray = null;

    // mbti 테스트 값 계산
    public Map<String, Object> resultMBTI(String[] ans) {
        int E = 0, I = 0;
        int S = 0, N = 0;
        int T = 0, F = 0;
        int J = 0, P = 0;
        ansArray = new ArrayList<>();
        for (int i = 0; i < ans.length; i++) {
            String answer = ans[i];
            ansArray.add(answer);
            switch (i) {  // 문제 번호: 0부터 시작
                case 0: // 그래서 1번 문제
                    if (answer.equals("a")) {
                        E++;
                        N++;
                    } else if (answer.equals("b")) {
                        I++;
                        N++;
                    } else if (answer.equals("c")) {
                        I++;
                        S++;
                    } else if (answer.equals("d")) {
                        E++;
                        S++;
                    }
                    break;

                case 1: // 2번 문제
                    if (answer.equals("a")) {
                        E++;
                        F++;
                    } else if (answer.equals("b")) {
                        I++;
                        F++;
                    } else if (answer.equals("c")) {
                        I++;
                        T++;
                    } else if (answer.equals("d")) {
                        E++;
                        T++;
                    }
                    break;

                case 2: // 3번 문제
                    if (answer.equals("a")) {
                        E++;
                        P++;
                    } else if (answer.equals("b")) {
                        I++;
                        J++;
                    } else if (answer.equals("c")) {
                        I++;
                        P++;
                    } else if (answer.equals("d")) {
                        E++;
                        J++;
                    }
                    break;

                case 3: // 4번 문제
                    if (answer.equals("a")) {
                        N++;
                        F++;
                    } else if (answer.equals("b")) {
                        S++;
                        F++;
                    } else if (answer.equals("c")) {
                        S++;
                        T++;
                    } else if (answer.equals("d")) {
                        N++;
                        T++;
                    }
                    break;

                case 4: // 5번 문제
                    if (answer.equals("a")) {
                        N++;
                        J++;
                    } else if (answer.equals("b")) {
                        N++;
                        P++;
                    } else if (answer.equals("c")) {
                        S++;
                        P++;
                    } else if (answer.equals("d")) {
                        S++;
                        J++;
                    }
                    break;

                case 5: // 6번 문제
                    if (answer.equals("a")) {
                        F++;
                        P++;
                    } else if (answer.equals("b")) {
                        F++;
                        J++;
                    } else if (answer.equals("c")) {
                        T++;
                        J++;
                    } else if (answer.equals("d")) {
                        T++;
                        P++;
                    }
                    break;
            }
        }


        // 여기서 점수 다 모였으니 이제 MBTI 조합
        StringBuilder result = new StringBuilder();

        result.append(E >= I ? "E" : "I");
        result.append(S >= N ? "S" : "N");
        result.append(T >= F ? "T" : "F");
        result.append(J >= P ? "J" : "P");

        String mbtiType = result.toString(); // 스트링으로 변환...
        System.out.println("계산된 MBTI: " + mbtiType);


        // 매퍼로 정보 조회
        TagMbtiVO traitInfo = charTestMapper.selectByMbti(mbtiType);
        List<DestinationVO> destinationList = charTestMapper.selectDestinationsByMbti(mbtiType);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("trait", traitInfo);
        resultMap.put("destination", destinationList);

        return resultMap;


    }


}




