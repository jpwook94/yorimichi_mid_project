package com.yorimichi.travel.service.gacha;

import com.yorimichi.travel.mapper.GachaMapper;
import com.yorimichi.travel.vo.DestinationVO;
import com.yorimichi.travel.vo.LocationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

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

                int randomIndex = ThreadLocalRandom.current().nextInt(Locations.size());
                return Locations.get(randomIndex);
        }

        // destination 전체 조회
        public List<DestinationVO> getAllDestination(){
                List<DestinationVO> destinations = gachaMapper.selectAllDestination();
                System.out.println(destinations);
                return destinations;
        }

        // destination 하나 조회
        public DestinationVO getDestinationById(int id){
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

}
