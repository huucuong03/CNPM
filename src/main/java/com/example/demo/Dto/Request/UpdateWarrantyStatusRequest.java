package com.example.demo.Dto.Request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateWarrantyStatusRequest {
    private Long maBaoHanh;
    private Long maTrangThai;
}
