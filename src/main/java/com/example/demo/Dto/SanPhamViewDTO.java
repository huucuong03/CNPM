package com.example.demo.Dto;

import lombok.*;

import java.math.BigDecimal;

@Data
@Builder
@Getter
@Setter
@NoArgsConstructor
public class SanPhamViewDTO {

    private Long maSanPham;
    private String tenSanPham;
    private String anh;
    private BigDecimal giaBan;
    private BigDecimal giaBanGG;
    private String gioiThieu;
    private long tongBinhLuan;
    private Double diemTrungBinh;
    // Constructor
    public SanPhamViewDTO(Long maSanPham, String tenSanPham, String anh, BigDecimal giaBan,BigDecimal giaBanGG, String gioiThieu) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.anh = anh;
        this.giaBan = giaBan != null ? giaBan : BigDecimal.ZERO;
        this.giaBanGG = giaBanGG != null ? giaBanGG : BigDecimal.ZERO;
        this.gioiThieu = gioiThieu != null ? gioiThieu : "";
    }
    public SanPhamViewDTO(Long maSanPham, String tenSanPham, String anh, BigDecimal giaBan,BigDecimal giaBanGG, String gioiThieu,Long tongBinhLuan, Double diemTrungBinh) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.anh = anh;
        this.giaBan = giaBan != null ? giaBan : BigDecimal.ZERO;
        this.giaBanGG = giaBanGG != null ? giaBanGG : BigDecimal.ZERO;
        this.gioiThieu = gioiThieu != null ? gioiThieu : "";
        this.tongBinhLuan = tongBinhLuan;
        this.diemTrungBinh = diemTrungBinh;
    }

    // Hàm convert giá
    public void convertGiaBan() {
        // ví dụ format giá hiển thị
        if (this.giaBan != null) {
            // format theo nhu cầu, vd: 1,000,000
        }
    }
}