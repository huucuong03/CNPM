package com.example.demo.Controller.Admin;

import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Service.WarrantyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin/warranty")
public class WarrantyAdminController {

    @Autowired
    private WarrantyService warrantyService;

    @PostMapping("/search")
    public ResponseEntity<?> searchWarrantyRequests(@RequestBody SanPhamBaoHanhRequest request) {
        return warrantyService.searchWarrantyRequests(request);
    }
}
