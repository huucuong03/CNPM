package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface WarrantyRequestRepository extends JpaRepository<WarrantyRequest, Long> {

    boolean existsByMaHoaDonChiTietAndMaType(Long maHoaDonChiTiet, long maType);
    boolean existsByMaHoaDonChiTiet(Long maHoaDonChiTiet);

    Optional<WarrantyRequest> findByMaHoaDonChiTietAndMaType(Long maHoaDonChiTiet, long maType);
}
