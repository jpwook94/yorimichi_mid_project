package com.yorimichi.travel.vo;

import lombok.Data;

@Data

// 이미지 필요하면 el = 파일명(프라이머리키 숫자) 이니까 맞춰서 작업 하시면 됩니다!
public class MascotVO {
    private int mascot_number;
    private String mascot_name;
    private int location_number;
}
