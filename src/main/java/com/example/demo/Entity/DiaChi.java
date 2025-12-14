package com.example.demo.Entity;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
@Entity
@Table(name = "DiaChi")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class DiaChi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maDiaChi;

    @ManyToOne
    @JoinColumn(name = "MaKhachHang", nullable = false)
    private KhachHang khachHang;

    private String tinh;
    private String xa;

    @Column(name = "DiaChiNha")
    private String diaChiNha;

    @Column(name = "TenDiaChi")
    private String tenDiaChi;

    @Column(name = "LoaiDiaChi")
    private Boolean loaiDiaChi;  // false = nhà , true = văn phòng

    @Column(name = "MacDinh")
    private Boolean macDinh;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CreateDate")
    private Date createDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LastUpdate")
    private Date lastUpdate;

    @PrePersist
    public void onCreate() {
        createDate = new Date();
        lastUpdate = new Date();
    }

    @PreUpdate
    public void onUpdate() {
        lastUpdate = new Date();
    }
}