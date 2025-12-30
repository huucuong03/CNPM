package com.example.demo.Service;

import com.example.demo.Dto.Request.SanPhamBaoHanhRequest;
import com.example.demo.Dto.WarrantyDetailDTO;
import com.example.demo.Dto.WarrantyImageDTO;
import com.example.demo.Dto.WarrantyRequestAdminDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class WarrantyService {

    @Autowired
    private WarrantyRequestRepository warrantyRequestRepository;

    @Autowired
    private WarrantyImageRepository warrantyImageRepository;

    @Autowired
    private WarrantyStatusRepository warrantyStatusRepository;

    @Autowired
    private WarrantyRequestLogRepository warrantyRequestLogRepository;

    @Autowired
    private WarrantyTypeRepository warrantyTypeRepository;

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

    public ResponseEntity<?> getWarrantyDetail(Long maBaoHanh) {
        System.out.println("=== getWarrantyDetail called with maBaoHanh: " + maBaoHanh);
        Optional<WarrantyRequest> wrOpt = warrantyRequestRepository.findById(maBaoHanh);

        if (!wrOpt.isPresent()) {
            System.out.println("=== WarrantyRequest NOT FOUND for maBaoHanh: " + maBaoHanh);
            return new ResponseEntity<>("Không tìm thấy yêu cầu bảo hành", HttpStatus.NOT_FOUND);
        }

        WarrantyRequest wr = wrOpt.get();
        System.out.println("=== Found WarrantyRequest: " + wr.getMaBaoHanh() + ", Reason: " + wr.getReason());

        // Lấy danh sách hình ảnh
        List<WarrantyImageDTO> images = warrantyImageRepository.findByWarrantyRequest(wr)
                .stream()
                .map(img -> new WarrantyImageDTO(img.getMaHinhAnh(), img.getDuongDan()))
                .collect(Collectors.toList());

        System.out.println("=== Found " + images.size() + " images");

        // Lấy tên loại warranty
        String tenType = null;
        Long maType = wr.getMaType();
        if (maType != null) {
            Optional<WarrantyType> typeOpt = warrantyTypeRepository.findById(maType);
            if (typeOpt.isPresent()) {
                tenType = typeOpt.get().getTenType();
                System.out.println("=== Found WarrantyType: " + tenType);
            } else {
                System.out.println("=== WarrantyType NOT FOUND for maType: " + maType);
            }
        }

        WarrantyDetailDTO detail = new WarrantyDetailDTO(
                wr.getMaBaoHanh(),
                wr.getReason(),
                tenType,
                wr.getTrangThai() != null ? wr.getTrangThai().getTenTrangThai() : null,
                wr.getTrangThai() != null ? wr.getTrangThai().getMaTrangThai() : null,
                maType,
                images);

        System.out.println("=== Returning WarrantyDetailDTO: " + detail.getMaBaoHanh());
        return new ResponseEntity<>(detail, HttpStatus.OK);
    }

    public ResponseEntity<?> updateWarrantyStatus(Long maBaoHanh, Long maTrangThai) {
        Optional<WarrantyRequest> wrOpt = warrantyRequestRepository.findById(maBaoHanh);

        if (!wrOpt.isPresent()) {
            return new ResponseEntity<>("Không tìm thấy yêu cầu bảo hành", HttpStatus.NOT_FOUND);
        }

        WarrantyRequest wr = wrOpt.get();

        // Tìm trạng thái mới
        Optional<WarrantyStatus> statusOpt = warrantyStatusRepository.findById(maTrangThai);
        if (!statusOpt.isPresent()) {
            return new ResponseEntity<>("Trạng thái không hợp lệ", HttpStatus.BAD_REQUEST);
        }

        // Lưu log thay đổi trạng thái
        WarrantyRequestLog log = new WarrantyRequestLog();
        log.setWarrantyRequest(wr);
        log.setOldTrangThai(wr.getTrangThai());
        log.setNewTrangThai(statusOpt.get());
        log.setCreatedAt(java.time.LocalDateTime.now());
        log.setGhiChu("Cập nhật trạng thái từ admin");

        // Set người xử lý - tạm thời dùng ID = 1 (admin), sau này có thể lấy từ session
        log.setMaNguoiXuLy(1L);
        log.setLoaiNguoiXuLy("NHANVIEN");

        warrantyRequestLogRepository.save(log);

        // Cập nhật trạng thái
        wr.setTrangThai(statusOpt.get());
        wr.setUpdatedAt(new Date());
        warrantyRequestRepository.save(wr);

        return new ResponseEntity<>("Cập nhật thành công", HttpStatus.OK);
    }
}
