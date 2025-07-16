package com.yorimichi.travel.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class HeartStatusVO {
    private String user_id;
    private int heart_count;
    private LocalDateTime last_used_time;
}
