package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Data
@NoArgsConstructor
public class SanPhamHTDTO {
    private Long maChiTietSanPham;
    private String tenSanPham;
    private String hinhAnhURL;
    private BigDecimal giaBan;
    private BigDecimal giaSauKhiGiam;
    private Integer checkSPGG;
    private String dungLuong;
    private String moTa;
    private String tenMau;

    public SanPhamHTDTO(Long maChiTietSanPham, String tenSanPham, String hinhAnhURL, BigDecimal giaBan,BigDecimal giaSauKhiGiam, String dungLuong) {
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnhURL = hinhAnhURL;
        this.giaBan = giaBan;
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.dungLuong = dungLuong;
    }
    public SanPhamHTDTO(Long maChiTietSanPham, String tenSanPham, String hinhAnhURL, BigDecimal giaBan,BigDecimal giaSauKhiGiam, String dungLuong, String moTa, String tenMau) {
        this.maChiTietSanPham = maChiTietSanPham;
        this.tenSanPham = tenSanPham;
        this.hinhAnhURL = hinhAnhURL;
        this.giaBan = giaBan;
        this.giaSauKhiGiam = giaSauKhiGiam;
        this.dungLuong = dungLuong;
        this.moTa = moTa;
        this.tenMau = tenMau;
    }

    public void CheckGGSP(){
        if(this.giaSauKhiGiam == null){
            this.checkSPGG = 1;
        }else {
            this.checkSPGG=0;
        }
    }
    public Integer getPhanTramGiam() {
        if (giaBan != null && giaSauKhiGiam != null && giaBan.compareTo(BigDecimal.ZERO) > 0) {
            return giaBan.subtract(giaSauKhiGiam)
                    .multiply(BigDecimal.valueOf(100))
                    .divide(giaBan, 0, RoundingMode.HALF_UP)
                    .intValue();
        }
        return null; // không giảm giá
    }
}

