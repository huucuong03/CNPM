package com.example.demo.Dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SupportOrderItemDTO {

    // Hóa đơn
    private Long maHoaDon;
    private Date ngayTao;

    // Chi tiết
    private Long maHoaDonChiTiet;
    private Integer soLuongMua;
    private BigDecimal giaTien;
    private BigDecimal giaSauGiam;
    private BigDecimal tongTien;
    private String imei;

    private String moTaTrangThaiDoiTra;
    private String moTaTrangThaiBaoHanh;
    // Sản phẩm
    private Long maSanPham;
    private String tenSanPham;
    private String hinhAnhURL;
    private String tenNSX;
    private String tenMauSac;
    private String tenDungLuong;

    private boolean conDoiTra;     // còn trong thời gian đổi trả
    private boolean daGuiDoiTra;   // đã gửi yêu cầu đổi trả

    // Bảo hành
    private boolean conBaoHanh;
    private boolean daGuiBaoHanh;

}

