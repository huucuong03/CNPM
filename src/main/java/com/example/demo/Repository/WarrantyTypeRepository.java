package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WarrantyTypeRepository extends JpaRepository<WarrantyType, Long> {
}
