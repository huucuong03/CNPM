package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WarrantyStatusRepository extends JpaRepository<WarrantyStatus, Long> {
    // không cần viết gì thêm, JpaRepository đã có findById
}
