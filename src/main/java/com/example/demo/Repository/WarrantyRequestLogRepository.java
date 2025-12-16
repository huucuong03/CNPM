package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyRequestLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WarrantyRequestLogRepository extends JpaRepository<WarrantyRequestLog, Long> {
    // JpaRepository đã có sẵn các method như save(), findById(), findAll()...
}

