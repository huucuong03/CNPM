package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "WarrantyRequest")
public class WarrantyRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBaoHanh")
    private Long maBaoHanh;

    @Column(name = "MaHoaDonChiTiet")
    private Long maHoaDonChiTiet;

    @Column(name = "MaChiTietSanPham")
    private Long maChiTietSanPham;

    @Column(name = "MaKhachHang")
    private Long maKhachHang;

    @Column(name = "MaType")
    private Long maType;

    @ManyToOne
    @JoinColumn(name = "MaTrangThai")
    private WarrantyStatus trangThai;

    @Column(name = "Reason")
    private String reason;

    @Column(name = "MaNhanVien")
    private String maNhanVien;

    @Column(name = "TenKhachHang")
    private String tenKhachHang;

    @Column(name = "SdtKhachHang")
    private String sdtKhachHang;

    @Column(name = "MaDiaChi")
    private Long maDiaChi;

    @Column(name = "PhuongThuc")
    private String phuongThuc;

    @CreationTimestamp
    @Column(name = "created_at")
    private Date created_At;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private Date updatedAt;

    @OneToMany(mappedBy = "warrantyRequest", cascade = CascadeType.ALL)
    private List<WarrantyImage> images = new ArrayList<>();

    // getters & setters
}

