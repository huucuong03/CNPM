package com.example.demo.Entity;

import jakarta.persistence.*;

@Entity
@Table(name = "WarrantyType")
public class WarrantyType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaType")
    private Long maType;

    @Column(name = "TenType")
    private String tenType;

    @Column(name = "MoTa")
    private String moTa;

    // getter / setter
}

