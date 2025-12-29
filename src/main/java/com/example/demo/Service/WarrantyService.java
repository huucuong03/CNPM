package com.example.demo.Service;

import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Dto.WarrantyRequestAdminDTO;
import com.example.demo.Repository.WarrantyRequestRepository;
import com.example.demo.Utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class WarrantyService {

    @Autowired
    private WarrantyRequestRepository warrantyRequestRepository;

    public ResponseEntity<?> searchWarrantyRequests(SanPhamBaoHanhRequest request) {
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        String tenSanPham = null;
        String imei = null;

        if (request.getNgayBatDau() != null && !request.getNgayBatDau().isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(request.getNgayBatDau(), "yyyy-MM-dd");
        }
        if (request.getNgayKetThuc() != null && !request.getNgayKetThuc().isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(request.getNgayKetThuc(), "yyyy-MM-dd");
        }
        if (request.getTenSanPhamSearch() != null && !request.getTenSanPhamSearch().isEmpty()) {
            tenSanPham = request.getTenSanPhamSearch();
        }
        if (request.getImei() != null && !request.getImei().isEmpty()) {
            imei = request.getImei();
        }

        List<WarrantyRequestAdminDTO> results = warrantyRequestRepository.searchWarrantyRequests(
                tenSanPham, imei, ngayBatDau, ngayKetThuc);

        // Format dates
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        for (WarrantyRequestAdminDTO dto : results) {
            if (dto.getCreatedAt() != null) {
                dto.setCreatedAtString(sdf.format(dto.getCreatedAt()));
            }
        }

        return new ResponseEntity<>(results, HttpStatus.OK);
    }
}
