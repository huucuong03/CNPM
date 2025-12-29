package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WarrantyRequestAdminDTO {
    private Long maBaoHanh;
    private String tenSanPham;
    private String mauSac;
    private String dungLuong;
    private String imei;
    private String tenKhachHang;
    private String sdtKhachHang;
    private String tenTrangThai;
    private String tenType;
    private String reason;
    private String phuongThuc;
    private Date createdAt;
    private String createdAtString;
    private Long maTrangThai;
}
