package com.yorimichi.travel.service.gacha;

import com.yorimichi.travel.mapper.GachaMapper;
import com.yorimichi.travel.vo.gacha.LocationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class GachaService {

        @Autowired
        private GachaMapper gachaMapper;

        // location 전체조회
        public List<LocationVO> getAlllocationIds(){
                List<LocationVO> locations =gachaMapper.selectAllLocation();
                System.out.println(locations);
                return locations;
        }

        // location 하나 조회
        public LocationVO getLocationById(int id){
                LocationVO location =gachaMapper.selectLocationByNum(id);
                System.out.println(location);
                return location;
        }

        // location 랜덤 뽑기
        public LocationVO getRandomLocation() {
                List<LocationVO> Locations = gachaMapper.selectAllLocation();
                if (Locations == null || Locations.isEmpty()) return null;

                int randomIndex = new Random().nextInt(Locations.size());
                return Locations.get(randomIndex);
        }
}
