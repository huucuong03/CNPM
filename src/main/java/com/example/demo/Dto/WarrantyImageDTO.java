package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WarrantyImageDTO {
    private Long maHinhAnh;
    private String duongDan;
    private String imageUrl; // URL đầy đủ để hiển thị

    public WarrantyImageDTO(Long maHinhAnh, String duongDan) {
        this.maHinhAnh = maHinhAnh;
        this.duongDan = duongDan;
        // Đảm bảo có / ở đầu
        this.imageUrl = duongDan.startsWith("/") ? duongDan : "/" + duongDan;
    }
}
