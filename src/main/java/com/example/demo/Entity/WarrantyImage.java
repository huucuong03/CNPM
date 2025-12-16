package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "WarrantyImage")
public class WarrantyImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long maHinhAnh;

    private String duongDan;

    @ManyToOne
    @JoinColumn(name = "MaBaoHanh")
    private WarrantyRequest warrantyRequest;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    // getters & setters
}

