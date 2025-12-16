package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "WarrantyRequestLog")
public class WarrantyRequestLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLog")
    private Long maLog;

    @ManyToOne
    @JoinColumn(name = "MaBaoHanh")
    private WarrantyRequest warrantyRequest;

    @ManyToOne
    @JoinColumn(name = "OldMaTrangThai")
    private WarrantyStatus oldTrangThai;

    @ManyToOne
    @JoinColumn(name = "NewMaTrangThai")
    private WarrantyStatus newTrangThai;

    /* ========== Action info ========== */

    @Column(name = "GhiChu", columnDefinition = "NVARCHAR(MAX)")
    private String ghiChu;

    @Column(name = "LoaiNguoiXuLy")
    private String loaiNguoiXuLy; // NHANVIEN / KHACHHANG

    @Column(name = "MaNguoiXuLy")
    private Long maNguoiXuLy;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // getter / setter
}
