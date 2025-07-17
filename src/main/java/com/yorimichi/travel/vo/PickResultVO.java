package com.yorimichi.travel.vo;

import lombok.Data;

@Data
public class PickResultVO {
    private int location_number;
    private String location_name;
    private int mascot_number;
    private String mascot_name;

    public PickResultVO(LocationVO randomLocation, MascotVO correspondingMascot) {
        this.location_number = randomLocation.getLocation_number();
        this.location_name = randomLocation.getLocation_name();
        this.mascot_number = randomLocation.getMascot_number(); // LocationVO의 mascot_number 사용
        this.mascot_name = correspondingMascot.getMascot_name(); // MascotVO의 mascot_name 사용
    }
}
