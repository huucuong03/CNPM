package com.example.demo.Repository;

import com.example.demo.Entity.DiaChi;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface DiaChiRepository extends JpaRepository<DiaChi, Long> {

    List<DiaChi> findByKhachHang_MaKhachHang(Long maKhachHang);

    DiaChi findByKhachHang_MaKhachHangAndMacDinh(Long maKhachHang, Boolean macDinh);

    @Modifying
    @Transactional
    @Query("UPDATE DiaChi d SET d.macDinh = false WHERE d.khachHang.maKhachHang = :maKhachHang")
    int unsetAllDefaultByKhachHang(@Param("maKhachHang") Long maKhachHang);
}
