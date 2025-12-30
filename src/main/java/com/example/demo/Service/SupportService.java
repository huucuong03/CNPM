package com.example.demo.Service;

import com.example.demo.Dto.SupportOrderItemDTO;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Entity.HoaDon;
import com.example.demo.Entity.HoaDonChiTiet;
import com.example.demo.Repository.GiamGiaCTSPRepository;
import com.example.demo.Repository.HoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneId;

@Service
public class SupportService {

    private static final int DOI_TRA_DAYS = 7;
    private static final int BAO_HANH_MONTHS = 12;

    @Autowired
    private HoaDonChiTietRepository repo;
    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    public org.springframework.data.domain.Page<SupportOrderItemDTO> getHoTro(Long maKH, Pageable pageable) {

        org.springframework.data.domain.Page<HoaDonChiTiet> pageHDCT = repo.findByKhachHangHoanTat(maKH, 2, pageable);
        LocalDateTime now = LocalDateTime.now();

        return pageHDCT.map(ct -> {

            HoaDon h = ct.getHoaDon();
            LocalDateTime ngayMua = h.getNgayTao()
                    .toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDateTime();

            boolean conDoiTra = now.isBefore(ngayMua.plusDays(DOI_TRA_DAYS));
            boolean conBaoHanh = now.isBefore(ngayMua.plusMonths(BAO_HANH_MONTHS));
            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository
                    .fillGGCTSP(ct.getChiTietSanPham().getMaChiTietSanPham());
            BigDecimal giaSauGiam = (giamGiaChiTietSanPham != null) ? giamGiaChiTietSanPham.getGiaSauKhiGiam()
                    : BigDecimal.ZERO; // nếu null thì lấy giá gốc
            return SupportOrderItemDTO.builder()
                    // Hóa đơn
                    .maHoaDon(h.getMaHoaDon())
                    .ngayTao(h.getNgayTao())

                    // Chi tiết hóa đơn
                    .maHoaDonChiTiet(ct.getMaHoaDonChiTiet())
                    .soLuongMua(ct.getSoLuongMua())
                    .giaTien(ct.getGiaTien())
                    .tongTien(h.getTongTien())
                    .giaSauGiam(giaSauGiam)
                    .imei(ct.getImei())

                    // Sản phẩm
                    .maSanPham(ct.getChiTietSanPham().getSanPham().getMaSanPham())
                    .tenSanPham(ct.getChiTietSanPham().getSanPham().getTenSanPham())
                    .hinhAnhURL(ct.getChiTietSanPham().getHinhAnhURL())
                    .tenNSX(ct.getChiTietSanPham().getNsx().getTenNSX())
                    .tenMauSac(ct.getChiTietSanPham().getMauSac().getTenMauSac())
                    .tenDungLuong(ct.getChiTietSanPham().getDungLuong().getTenDungLuong())

                    // Trạng thái hỗ trợ
                    .conDoiTra(conDoiTra)
                    .conBaoHanh(conBaoHanh)
                    .build();

        });
    }
}
