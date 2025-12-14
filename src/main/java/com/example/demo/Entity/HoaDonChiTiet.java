package com.example.demo.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "hoadonchitiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mahoadonchitiet")
    private Long maHoaDonChiTiet;

    @Column(name = "soluongmua")
    private Integer soLuongMua;

    @Column(name = "giatien")
    private BigDecimal giaTien;

    @Column(name = "trangthai")
    private Integer trangThai;

    @ManyToOne
    @JoinColumn(name = "mahoadon")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "machitietsanpham")
    private ChiTietSanPham chiTietSanPham;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createddate")
    private Date createdDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastupdate")
    private Date lastUpdate;

    @Column(name = "imei")
    private String imei;
}
