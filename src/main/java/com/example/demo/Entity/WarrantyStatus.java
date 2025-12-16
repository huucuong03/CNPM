package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "WarrantyStatus")
public class WarrantyStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTrangThai")
    private Long maTrangThai;

    @Column(name = "TenTrangThai")
    private String tenTrangThai;

    @Column(name = "MoTa")
    private String moTa;

    // getter / setter
}

