package com.example.demo.Dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@NoArgsConstructor
public class SanPhamViewDTO {

    private Long maSanPham;
    private String tenSanPham;
    private String anh;
    private BigDecimal giaBan;
    private BigDecimal giaBanGG;
    private String gioiThieu;

    // Constructor
    public SanPhamViewDTO(Long maSanPham, String tenSanPham, String anh, BigDecimal giaBan,BigDecimal giaBanGG, String gioiThieu) {
        this.maSanPham = maSanPham;
        this.tenSanPham = tenSanPham;
        this.anh = anh;
        this.giaBan = giaBan != null ? giaBan : BigDecimal.ZERO;
        this.giaBanGG = giaBanGG != null ? giaBanGG : BigDecimal.ZERO;
        this.gioiThieu = gioiThieu != null ? gioiThieu : "";
    }


    // Getter
    public Long getMaSanPham() {
        return maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public String getAnh() {
        return anh;
    }

    public BigDecimal getGiaBan() {
        return giaBan;
    }

    public BigDecimal getGiaBanGG() {
        return giaBanGG;
    }

    public String getGioiThieu() {
        return gioiThieu;
    }

    // Nếu cần setter, có thể thêm
    public void setMaSanPham(Long maSanPham) {
        this.maSanPham = maSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public void setGiaBan(BigDecimal giaBan) {
        this.giaBan = giaBan;
    }
    public void setgiaBanGG(BigDecimal giaBanGG) {
        this.giaBanGG = giaBanGG;
    }

    public void setGioiThieu(String gioiThieu) {
        this.gioiThieu = gioiThieu;
    }

    // Hàm convert giá
    public void convertGiaBan() {
        // ví dụ format giá hiển thị
        if (this.giaBan != null) {
            // format theo nhu cầu, vd: 1,000,000
        }
    }
}