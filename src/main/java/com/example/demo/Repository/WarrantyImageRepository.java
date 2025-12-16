package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WarrantyImageRepository extends JpaRepository<WarrantyImage, Long> {
}
