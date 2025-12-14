package com.example.demo.Service;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.Request.ChiTietSanPhamRequest;
import com.example.demo.Dto.Request.SanPhamRequest;
import com.example.demo.Dto.SanPhamViewDTO;
import com.example.demo.Dto.SanPhamTHongKeDTO;
import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.DanhGia;
import com.example.demo.Entity.SanPham;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.DanhGiaRepository;
import com.example.demo.Repository.SanPhamRepository;
import com.example.demo.Utils.Constants;
import com.example.demo.Utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class SanPhamService {

    @Autowired
    private SanPhamRepository repository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;
    @Autowired
    private DanhGiaRepository danhGiaRepository;


    public List<SanPham> getAll() {
        return repository.findAll();
    }
    public List<SanPhamTHongKeDTO> getTop20SanPhamDeHienThi() {
        Pageable pageRequest = PageRequest.of(0, 20);
        List<SanPhamTHongKeDTO> topList = repository.topSanPhamBanChayNhat(pageRequest);

        // Chuyển đổi giá sang định dạng
        topList.forEach(SanPhamTHongKeDTO::convert);

        int soSanPhamCanThem = 20 - topList.size();
        if (soSanPhamCanThem > 0) {
            List<SanPham> danhSachSPConHang = repository.danhSachSPConHang();
            // Lọc bỏ những sản phẩm đã có trong topList
            List<Long> daCo = topList.stream().map(SanPhamTHongKeDTO::getMaSanPham).toList();
            int count = 0;
            for (SanPham sp : danhSachSPConHang) {
                if (!daCo.contains(sp.getMaSanPham()) && count < soSanPhamCanThem) {
                    SanPhamTHongKeDTO dto = new SanPhamTHongKeDTO(0L, sp.getMaSanPham(), sp.getTenSanPham(), BigDecimal.ZERO);
                    dto.convert(); // chuyển đổi giá (0 -> "0 ₫")
                    topList.add(dto);
                    count++;
                }
            }
        }
        return topList;
    }

    public List<SanPhamViewDTO> get20SanPhamMoiNhat() {
        // Lấy top 20 sản phẩm mới nhất từ repository
        Pageable top20 = PageRequest.of(0, 20);
        List<SanPhamViewDTO> danhSachMoiNhat = chiTietSanPhamRepository.findTop20SanPhamMoiNhat( top20);

        // Chuyển sang DTO, format giá
        List<SanPhamViewDTO> dtos = danhSachMoiNhat.stream()
                .map(ctsp -> new SanPhamViewDTO(
                        ctsp.getMaSanPham(),
                        ctsp.getTenSanPham(),
                        ctsp.getAnh(),
                        ctsp.getGiaBan(),
                        ctsp.getGiaBanGG(),
                        ctsp.getGioiThieu()
                ))
                .toList();;
        System.out.println("Service - danhSachMoiNhat size: " + dtos.size());
        return dtos;
    }
    public Page<SanPhamViewDTO> getSanPhamByNsx(Long maNsx, int page) {
        Pageable pageable = PageRequest.of(page, 20); // 12 sản phẩm mỗi trang
        return chiTietSanPhamRepository.getSanPhamViewByNsx(maNsx, pageable);
    }

    public Page<SanPhamViewDTO> getSanPhamGiaTangDan(Long maNsx, int page) {
        Pageable pageable = PageRequest.of(page, 20);
        return chiTietSanPhamRepository.getSanPhamGiaTangDan(maNsx, pageable);
    }

    public Page<SanPhamViewDTO> getSanPhamGiaGiamDan(Long maNsx, int page) {
        Pageable pageable = PageRequest.of(page, 20);
        return chiTietSanPhamRepository.getSanPhamGiaGiamDan(maNsx, pageable);
    }
    public Map<String, Long> getMinMaxGia(Long maNsx) {

        Object result = chiTietSanPhamRepository.findMinMaxGiaByNsx(maNsx);

        Object[] arr = (Object[]) result; // ← ép đúng kiểu

        Long min = arr[0] == null ? 0L : ((Number) arr[0]).longValue();
        Long max = arr[1] == null ? 0L : ((Number) arr[1]).longValue();

        Map<String, Long> map = new HashMap<>();
        map.put("min", min);
        map.put("max", max);

        return map;
    }



    public SanPham addSP(ChiTietSanPhamRequest sanPhamRequest) {
        SanPham sanPham = new SanPham();
        sanPham.setTenSanPham(sanPhamRequest.getTenSanPham());
        sanPham.setRam(sanPhamRequest.getRam());
        sanPham.setHeDieuHanh(sanPhamRequest.getHeDieuHanh());
        sanPham.setManhinh(sanPhamRequest.getManHinh());
        sanPham.setCameratruoc(sanPhamRequest.getCameratruoc());
        sanPham.setCamerasau(sanPhamRequest.getCamerasau());
        sanPham.setSim(sanPhamRequest.getSim());
        sanPham.setDungLuongPin(sanPhamRequest.getDungLuongPin());
        sanPham.setTrangThai(Constants.ACTIVE);
        repository.save(sanPham);
        return sanPham;
    }

    public SanPham getByMa(Long maSanPham) {
        SanPham sanPham = repository.getReferenceById(maSanPham);
        return sanPham;
    }

    public SanPham update(ChiTietSanPhamRequest sanPhamRequest) {
        SanPham sanPham = this.getByMa(sanPhamRequest.getMaSanPham());
        if(sanPham != null){
            sanPham.setTenSanPham(sanPhamRequest.getTenSanPham());
            sanPham.setRam(sanPhamRequest.getRam());
            sanPham.setHeDieuHanh(sanPhamRequest.getHeDieuHanh());
            sanPham.setManhinh(sanPhamRequest.getManHinh());
            sanPham.setCameratruoc(sanPhamRequest.getCameratruoc());
            sanPham.setCamerasau(sanPhamRequest.getCamerasau());
            sanPham.setSim(sanPhamRequest.getSim());
            sanPham.setDungLuongPin(sanPhamRequest.getDungLuongPin());
            repository.save(sanPham);
        }
        return sanPham;
    }

    public SanPham delete(Long maSP){
        SanPham sanPham = this.getByMa(maSP);
        if(sanPham != null){
            sanPham.setTrangThai(Constants.INACTIVE);
            repository.save(sanPham);
        }
        return sanPham;
    }

    public Integer checkSoLuongTon(SanPhamRequest request){
        ChiTietSanPham sanPhamCheck = chiTietSanPhamRepository.getChiTietSanPhamCheckSoLuong(request.getMaSanPham());
        Integer soLuongTon = null;
        if (sanPhamCheck != null){
            soLuongTon = sanPhamCheck.getSoLuongNhap() - sanPhamCheck.getSoLuongBan();
        }
        return soLuongTon;
    }

    public Integer countSanPhamDangCo(){
        return repository.countSanPhamDangCo();
    }

    public Integer countSanPhamHetHang(){
        return chiTietSanPhamRepository.countSanPhamHetHang();
    }

    public List<SanPhamTHongKeDTO> top10SanPhamBanChayNhat() {
        Pageable top10 = PageRequest.of(0, 10);
        List<SanPhamTHongKeDTO> topList = repository.topSanPhamBanChayNhat(top10);
        topList.forEach(SanPhamTHongKeDTO::convert); // chuyển đổi giaBan -> giaBanString
        return topList;
    }

    public List<ChiTietSanPhamDTO> danhSachSanPhamHetHang(){
        return chiTietSanPhamRepository.getDanhSachSanPhamHetHang();
    }

    public Integer tongSoLuongBan(String ngayBatDauStr, String ngayKetThucStr){
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        return repository.tongSoLuongBan(null, ngayBatDau, ngayKetThuc);
    }

    public Integer tongSoLuongNhap(){
        return repository.tongSoLuongNhap(null);
    }

    public List<SanPham> danhSachSPConHang() {
        return repository.danhSachSPConHang();
    }

    public Integer tongSoLuongBanTheoSanPham(Long maSP, String ngayBatDauStr, String ngayKetThucStr){
        Date ngayBatDau = null;
        Date ngayKetThuc = null;
        if (!ngayBatDauStr.isEmpty()) {
            ngayBatDau = DateUtils.convertStringToDate(ngayBatDauStr, "yyyy-MM-dd");
        }
        if (!ngayKetThucStr.isEmpty()) {
            ngayKetThuc = DateUtils.convertStringToDate(ngayKetThucStr, "yyyy-MM-dd");
        }
        return repository.tongSoLuongBan(maSP, ngayBatDau, ngayKetThuc);
    }

    public Integer tongSoLuongNhapTheoSanPham(Long maSP){
        return repository.tongSoLuongNhap(maSP);
    }

    public SanPham sanPhamCheckTonTai(String tenSanPham, Long maDungLuong, Long maMauSac, Long maSP){
        return repository.sanPhamCheckTT(tenSanPham, maDungLuong, maMauSac, maSP);
    }


    public Page<SanPhamViewDTO> getSanPhamByNsxSort(Long maNsx, int page, String sort) {
        // Kiểm tra direction: mặc định DESC nếu không đúng
        Sort.Direction direction = Sort.Direction.DESC;
        if ("asc".equalsIgnoreCase(sort)) {
            direction = Sort.Direction.ASC;
        }

        // Tạo pageable với 20 sản phẩm mỗi trang
        Pageable pageable = PageRequest.of(page, 20, Sort.by(direction, "maChiTietSanPham"));

        // Gọi repository
        return chiTietSanPhamRepository.getSanPhamViewByNsx(maNsx, pageable);
    }

    public Page<SanPhamViewDTO> getSanPhamTheoKhoangGia(Long maNsx, Long min, Long max, int page) {
        Pageable pageable = PageRequest.of(page, 12); // 12 sản phẩm/trang, bạn chỉnh được
        return chiTietSanPhamRepository.findByNsxAndGiaBetween(maNsx, min, max, pageable);
    }

}
