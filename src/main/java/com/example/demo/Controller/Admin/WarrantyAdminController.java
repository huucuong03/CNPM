package com.example.demo.Controller.Admin;

import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Dto.Request.UpdateWarrantyStatusRequest;
import com.example.demo.Service.WarrantyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/warranty")
public class WarrantyAdminController {

    @Autowired
    private WarrantyService warrantyService;

    @PostMapping("/search")
    public ResponseEntity<?> searchWarrantyRequests(@RequestBody SanPhamBaoHanhRequest request) {
        return warrantyService.searchWarrantyRequests(request);
    }

    @GetMapping("/detail/{maBaoHanh}")
    public ResponseEntity<?> getWarrantyDetail(@PathVariable Long maBaoHanh) {
        return warrantyService.getWarrantyDetail(maBaoHanh);
    }

    @PostMapping("/update-status")
    public ResponseEntity<?> updateWarrantyStatus(@RequestBody UpdateWarrantyStatusRequest request) {
        return warrantyService.updateWarrantyStatus(request.getMaBaoHanh(), request.getMaTrangThai());
    }
}
