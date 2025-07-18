package com.yorimichi.travel.service.charTest;

import com.yorimichi.travel.mapper.CharTestMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.FoodVO;
import com.yorimichi.travel.vo.TagMbtiVO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

@Service
public class CharTestService {


    @Autowired
    private CharTestMapper charTestMapper;

    ArrayList<String> ansArray = null;

    int round = 16;

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


    // 이상형 월드컵 전체조회
    public List<FoodVO> getAllFood() {
        List<FoodVO> foods = charTestMapper.selectAllFood();
        System.out.println(foods);
        return foods;
    }

    // 무작위 16명 추출
    public List<FoodVO> getRandom16Foods() {
        List<FoodVO> all = getAllFood();
        Collections.shuffle(all);

        // 후보 수 부족하면 예외 발생
        if (all.size() < 16) {
            throw new IllegalStateException("후보 수가 16명 미만입니다.");
        }

        return all.subList(0, 16);
    }

    public static FoodVO findFoodById(List<FoodVO> list, int id) {
        return list.stream()
                .filter(f -> id == f.getFood_number())
                .findFirst()
                .orElse(null);
    }


    public Map<String, Object> processSelection(int selectedId, HttpSession session) {
        List<FoodVO> roundList = (List<FoodVO>) session.getAttribute("roundList");
        List<FoodVO> tempWinners = (List<FoodVO>) session.getAttribute("tempWinners");
        Integer index = (Integer) session.getAttribute("currentIndex");



        Map<String, Object> result = new HashMap<>();
        FoodVO selected = findFoodById(roundList, selectedId);
        System.out.println(selected);

        if (selected != null) {
            tempWinners.add(selected);
        }

        index += 2;
        session.setAttribute("currentIndex", index);
        if (index >= roundList.size()) {
            System.out.println("---------마지막에만 나와야됨.");
            round /= 2;
            System.out.println(round + "강 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println(tempWinners.size());
            if (tempWinners.size() == 1) {
                result.put("finished", true);
                result.put("winner", tempWinners.get(0));
                round = 16;
                session.invalidate();
                return result;
            }

            session.setAttribute("roundList", tempWinners);
            session.setAttribute("tempWinners", new ArrayList<>());
            session.setAttribute("currentIndex", 0);
            roundList = tempWinners;
            index = 0;
        }

        result.put("finished", false);
        result.put("left", roundList.get(index));
        result.put("right", roundList.get(index + 1));
        result.put("round", round);
        return result;
    }





}




