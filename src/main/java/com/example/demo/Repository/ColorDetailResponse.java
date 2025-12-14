package com.example.demo.Repository;

import lombok.Data;

@Data
public class ColorDetailResponse {
    private Long maMauSac;
    private String tenMauSac;
    private String hinhAnhURL;
    private Double giaBan;
    private Double giaBanGG; // null nếu không có giảm giá
}
