package com.example.demo.Repository;

import java.math.BigDecimal;

public class ProductDetailResponse {
    private Long maChiTietSanPham; // thêm trường này
    private String hinhAnhURL;
    private BigDecimal giaBan;      // Giá gốc
    private BigDecimal giaBanGG;    // Giá giảm (nếu có)

    // Getter và Setter
    public String getHinhAnhURL() { return hinhAnhURL; }
    public Long getMaChiTietSanPham() { return maChiTietSanPham; }
    public void SetMaChiTietSanPham(Long maChiTietSanPham) { this.maChiTietSanPham = maChiTietSanPham; }
    public void setHinhAnhURL(String hinhAnhURL) { this.hinhAnhURL = hinhAnhURL; }

    public BigDecimal getGiaBan() { return giaBan; }
    public void setGiaBan(BigDecimal giaBan) { this.giaBan = giaBan; }

    public BigDecimal getGiaBanGG() { return giaBanGG; }
    public void setGiaBanGG(BigDecimal giaBanGG) { this.giaBanGG = giaBanGG; }
}
