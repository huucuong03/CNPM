package com.example.demo.Repository;

import com.example.demo.Dto.WarrantyRequestAdminDTO;
import com.example.demo.Entity.WarrantyRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface WarrantyRequestRepository extends JpaRepository<WarrantyRequest, Long> {

    boolean existsByMaHoaDonChiTietAndMaType(Long maHoaDonChiTiet, long maType);

    boolean existsByMaHoaDonChiTiet(Long maHoaDonChiTiet);

    Optional<WarrantyRequest> findByMaHoaDonChiTietAndMaType(Long maHoaDonChiTiet, long maType);

    @Query("SELECT new com.example.demo.Dto.WarrantyRequestAdminDTO(" +
            "wr.maBaoHanh, " +
            "sp.tenSanPham, " +
            "ctsp.mauSac.tenMauSac, " +
            "ctsp.dungLuong.tenDungLuong, " +
            "hdct.imei, " +
            "wr.tenKhachHang, " +
            "wr.sdtKhachHang, " +
            "ws.tenTrangThai, " +
            "wt.tenType, " +
            "wr.reason, " +
            "wr.phuongThuc, " +
            "wr.created_At, " +
            "CAST('' AS string), " +
            "ws.maTrangThai) " +
            "FROM WarrantyRequest wr " +
            "JOIN HoaDonChiTiet hdct ON wr.maHoaDonChiTiet = hdct.maHoaDonChiTiet " +
            "JOIN ChiTietSanPham ctsp ON hdct.chiTietSanPham.maChiTietSanPham = ctsp.maChiTietSanPham " +
            "JOIN SanPham sp ON ctsp.sanPham.maSanPham = sp.maSanPham " +
            "LEFT JOIN WarrantyStatus ws ON wr.trangThai.maTrangThai = ws.maTrangThai " +
            "LEFT JOIN WarrantyType wt ON wr.maType = wt.maType " +
            "WHERE (:imei IS NULL OR hdct.imei = :imei) " +
            "AND (:tenSanPham IS NULL OR sp.tenSanPham LIKE %:tenSanPham%) " +
            "AND (:ngayBatDau IS NULL OR wr.created_At >= :ngayBatDau) " +
            "AND (:ngayKetThuc IS NULL OR wr.created_At <= :ngayKetThuc) " +
            "ORDER BY wr.created_At DESC")
    List<WarrantyRequestAdminDTO> searchWarrantyRequests(
            @Param("tenSanPham") String tenSanPham,
            @Param("imei") String imei,
            @Param("ngayBatDau") Date ngayBatDau,
            @Param("ngayKetThuc") Date ngayKetThuc);
}
