package com.example.demo.Repository;

import com.example.demo.Entity.WarrantyImage;
import com.example.demo.Entity.WarrantyRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WarrantyImageRepository extends JpaRepository<WarrantyImage, Long> {
    List<WarrantyImage> findByWarrantyRequest(WarrantyRequest warrantyRequest);
}
