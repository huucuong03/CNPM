package com.example.demo.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DanhSachSanPhamHoaDonDTO {
    private Long maHDCT;
    private String tenSanpham;
    private Integer soLuong;
    private BigDecimal giaTien;       // Giá gốc
    private BigDecimal giaTienGGCT;   // Giá giảm chi tiết
    private BigDecimal giaTienGGSP;   // Giá giảm sản phẩm
    private String tenGiamGia;        // Tên giảm giá sản phẩm
    private String moTaGGCT;          // Mô tả giảm giá chi tiết
    private String imei;
    private String tenMauSac;
    private String tenDungLuong;
    private String giaTienString;
    private String sdtNguoiNhan;
    private String hinhAnh;


    public DanhSachSanPhamHoaDonDTO(Long maHDCT, String tenSanpham, Integer soLuong, BigDecimal giaTien, String imei,
                                    String tenMauSac, String tenDungLuong) {
        this.maHDCT = maHDCT;
        this.tenSanpham = tenSanpham;
        this.soLuong = soLuong;
        this.giaTien = giaTien;
        this.imei = imei;
        this.tenMauSac = tenMauSac;
        this.tenDungLuong = tenDungLuong;
    }
    public DanhSachSanPhamHoaDonDTO(Long maHDCT, String tenSanpham, Integer soLuong, BigDecimal giaTien, String imei,
                                    String tenMauSac, String tenDungLuong,String hinhAnh,String sdtNguoiNhan) {
        this.maHDCT = maHDCT;
        this.tenSanpham = tenSanpham;
        this.soLuong = soLuong;
        this.giaTien = giaTien;
        this.imei = imei;
        this.tenMauSac = tenMauSac;
        this.tenDungLuong = tenDungLuong;
        this.hinhAnh = hinhAnh;
        this.sdtNguoiNhan = sdtNguoiNhan;
    }
    public DanhSachSanPhamHoaDonDTO(Long maHDCT, String tenSanpham, Integer soLuong, BigDecimal giaTien, String imei,
                                    String tenMauSac, String tenDungLuong, String hinhAnh, String sdtNguoiNhan,
                                    BigDecimal giaTienGGCT, Integer giaTienGGSP, String tenGiamGia, String moTaGGCT) {
        this.maHDCT = maHDCT;
        this.tenSanpham = tenSanpham;
        this.soLuong = soLuong;
        this.giaTien = giaTien;
        this.imei = imei;
        this.tenMauSac = tenMauSac;
        this.tenDungLuong = tenDungLuong;
        this.hinhAnh = hinhAnh;
        this.sdtNguoiNhan = sdtNguoiNhan;
        this.giaTienGGCT = giaTienGGCT;
        this.giaTienGGSP = giaTienGGSP != null ? BigDecimal.valueOf(giaTienGGSP) : null;
        this.tenGiamGia = tenGiamGia;
        this.moTaGGCT = moTaGGCT;
    }

    public void convertGiaTien(){
        if(this.giaTien != null ){
            Locale vietnameseLocale = new Locale("vi", "VN");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(vietnameseLocale);
            this.giaTienString = currencyFormat.format(this.giaTien);
        }
        if(this.imei == null){
            this.imei = "";
        }
    }

}
