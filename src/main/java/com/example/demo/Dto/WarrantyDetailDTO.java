package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WarrantyDetailDTO {
    private Long maBaoHanh;
    private String reason;
    private String tenType;
    private String tenTrangThai;
    private Long maTrangThai;
    private Long maType;
    private List<WarrantyImageDTO> images;
}
