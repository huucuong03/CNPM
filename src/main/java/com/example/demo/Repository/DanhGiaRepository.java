package com.example.demo.Repository;

import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.DanhGia;
import com.example.demo.Entity.SanPham;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DanhGiaRepository extends JpaRepository<DanhGia, Long> {
    List<DanhGia> findAllByChiTietSanPham(ChiTietSanPham c);

    @Query("SELECT dg FROM DanhGia dg JOIN FETCH dg.khachHang WHERE dg.sanPham = :sanPham")
    List<DanhGia> findAllBySanPham(@Param("sanPham") SanPham sanPham);


}
