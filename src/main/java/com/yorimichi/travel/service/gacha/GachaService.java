package com.yorimichi.travel.service.gacha;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yorimichi.travel.mapper.GachaMapper;
import com.yorimichi.travel.vo.*;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

@Service
public class GachaService {

    @Autowired
    private GachaMapper gachaMapper;

    // location 전체조회
    public List<LocationVO> getAlllocationIds() {
        List<LocationVO> locations = gachaMapper.selectAllLocation();
        System.out.println(locations);
        return locations;
    }

    // location 하나 조회
    public LocationVO getLocationById(int id) {
        LocationVO location = gachaMapper.selectLocationByNum(id);
        System.out.println(location);
        return location;
    }

    // location 랜덤 뽑기
    public LocationVO getRandomLocation() {
        List<LocationVO> Locations = gachaMapper.selectAllLocation();
        if (Locations == null || Locations.isEmpty()) return null;

        int randomIndex = ThreadLocalRandom.current().nextInt(Locations.size());
        return Locations.get(randomIndex);
    }

    // 마스코트 번호로 마스코트 조회
    public MascotVO getMascotByNumber(int mascotNumber) {
        return gachaMapper.selectMascotByNum(mascotNumber);
    }

    // 랜덤뽑기 한 location과 mascot 정보
    public PickResultVO pickLocationAndMascot() {
        LocationVO randomLocation = getRandomLocation();

        // 뽑은 LocationVO의 mascot_number로 MascotVO를 조회
        MascotVO correspondingMascot = getMascotByNumber(randomLocation.getMascot_number());
        return new PickResultVO(randomLocation, correspondingMascot);
    }

    // destination 전체 조회
    public List<DestinationVO> getAllDestination() {
        List<DestinationVO> destinations = gachaMapper.selectAllDestination();
        System.out.println(destinations);
        return destinations;
    }

    // destination 하나 조회
    public DestinationVO getDestinationById(int id) {
        DestinationVO destination = gachaMapper.selectDestinationByNum(id);
        System.out.println(destination);
        return destination;
    }

    // destination 랜덤 뽑기
    public DestinationVO getRandomDestination() {
        List<DestinationVO> destinations = gachaMapper.selectAllDestination();
        if (destinations == null || destinations.isEmpty()) return null;
        int randomIndex = ThreadLocalRandom.current().nextInt(destinations.size());
        return destinations.get(randomIndex);
    }

    // destination N개 랜덤 뽑기
    public List<DestinationVO> getRandomNDestinations(int count) {
        List<DestinationVO> destinations = gachaMapper.selectAllDestination();
        if (destinations == null || destinations.size() < count) return Collections.emptyList();

        Collections.shuffle(destinations); // 리스트를 섞고
        return destinations.subList(0, count); // 앞에서부터 count개 선택
    }

    // food 랜덤 뽑기
    public FoodVO getRandomFood() {
        List<FoodVO> foods = gachaMapper.selectAllFood();
        if (foods == null || foods.isEmpty()) return null;
        int randomIndex = ThreadLocalRandom.current().nextInt(foods.size());
        return foods.get(randomIndex);
    }

    String result = null;

    public String getRandomFoodFromGemma(HttpServletResponse response, String where) {
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");
        String prompt = "일본 여행왔는데 일본 음식 뭐먹을까?";

        if (where != null) {
            result = result.replaceAll("\n", " ").trim();
            List<String> sentences = Arrays.stream(result.split("\\."))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(s -> s + ".")
                    .limit(2)
                    .collect(Collectors.toList());

            String finalText = String.join(" ", sentences);
            System.out.println(finalText);
            result = "추천된 음식: " + finalText;
            String followUpQuestion = " 질문: 이 음식은 일본 어디에서 먹을 수 있어? 대표적인 관광지를 알려줘.";
            result += followUpQuestion;
            prompt = result;
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println(prompt);
            System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

        }

        try {
            URL url = new URL("http://192.168.0.22:11434/api/generate");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String body = String.format("{\"model\":\"gemma3:4b\",\"prompt\":\"%s\",\"stream\":true, \"num_predict\": 100}", prompt);
            conn.getOutputStream().write(body.getBytes());

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            PrintWriter writer = response.getWriter();
            StringBuilder fullText = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    JsonParser jsonParser = new JsonParser();
                    JsonObject json = jsonParser.parseString(line).getAsJsonObject();
                    if (json.has("done") && json.get("done").getAsBoolean()) {
                        break;
                    }
                    if (json.has("response")) {
                        String content = json.get("response").getAsString();

                        writer.write("data: " + content + "\n\n");
                        writer.flush();

                        fullText.append(content);
                        if (fullText.length() >= 30) {
                            result = fullText.toString();
                        }
                    }
                }
            }
            reader.close();       // 먼저 읽기 스트림 닫고
            writer.close();       // SSE 응답 스트림 닫고
            conn.disconnect();
        } catch (
                Exception e) {
            e.printStackTrace();
        }
        return prompt;
    }

}

