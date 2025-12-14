package com.example.demo.Controller.Api;

import com.example.demo.Entity.ChiTietSanPham;
import com.example.demo.Entity.GiamGiaChiTietSanPham;
import com.example.demo.Repository.ColorDetailResponse;
import com.example.demo.Repository.ProductDetailResponse;
import com.example.demo.Service.ChiTietSanPhamService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProductApiController {
    @Autowired
    private final ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    public ProductApiController(ChiTietSanPhamService chiTietSanPhamService) {
        this.chiTietSanPhamService = chiTietSanPhamService;
    }
    private final RestTemplate restTemplate = new RestTemplate();
    private static final String BASE_URL = "https://production.cas.so/address-kit/2025-07-01";
    @GetMapping("/provinces")
    public ResponseEntity<String> getProvinces() {
        String url = BASE_URL + "/provinces";
        return restTemplate.getForEntity(url, String.class);
    }


    @GetMapping("/provinces/{provinceId}/communes")
    public ResponseEntity<?> getCommunesByProvince(@PathVariable String provinceId) {
        try {
            // Gọi trực tiếp API mới
            String url = BASE_URL + "/provinces/" + provinceId + "/communes";
            String responseJson = restTemplate.getForObject(url, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode responseNode = mapper.readTree(responseJson);

            // Trả về luôn JSON như API gốc
            return ResponseEntity.ok(responseNode);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    // API lấy chi tiết sản phẩm theo màu & dung lượng
    @GetMapping("/getProductDetail")
    public ResponseEntity<ProductDetailResponse> getProductDetail(
            @RequestParam("id") long id,
            @RequestParam("maDungLuong") Long maDungLuong,
            @RequestParam("maMauSac") Long maMauSac) {

        ChiTietSanPham chiTiet = chiTietSanPhamService.findByTenDungLuongMauSac(id, maDungLuong, maMauSac);
        if (chiTiet == null) {
            return ResponseEntity.notFound().build();
        }

        GiamGiaChiTietSanPham giamGiaChiTiet = chiTietSanPhamService.findByChiTietSanPham(chiTiet);

        ProductDetailResponse response = new ProductDetailResponse();
        response.SetMaChiTietSanPham(chiTiet.getMaChiTietSanPham());
        response.setHinhAnhURL(chiTiet.getHinhAnhURL());
        response.setGiaBan(chiTiet.getGiaBan());
        response.setGiaBanGG(giamGiaChiTiet != null ? giamGiaChiTiet.getGiaSauKhiGiam() : null);

        return ResponseEntity.ok(response);
    }

    // API lấy danh sách màu theo dung lượng
    @GetMapping("/getColorsByCapacity")
    public ResponseEntity<List<ColorDetailResponse>> getColorsByCapacity(
            @RequestParam("id") long maSanPham,
            @RequestParam("maDungLuong") Long maDungLuong) {

        // Lấy tất cả chi tiết sản phẩm theo id và dung lượng
        List<ChiTietSanPham> chiTietList = chiTietSanPhamService.findBySanPhamAndDungLuong(maSanPham, maDungLuong);

        if (chiTietList == null || chiTietList.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        List<ColorDetailResponse> responseList = new ArrayList<>();

        for (ChiTietSanPham chiTiet : chiTietList) {
            GiamGiaChiTietSanPham giamGiaChiTiet = chiTietSanPhamService.findByChiTietSanPham(chiTiet);
            ColorDetailResponse colorDetail = new ColorDetailResponse();
            colorDetail.setMaMauSac(chiTiet.getMauSac().getMaMauSac()); // giả sử có phương thức getId()
            colorDetail.setTenMauSac(chiTiet.getMauSac().getTenMauSac()); // tên màu
            colorDetail.setHinhAnhURL(chiTiet.getHinhAnhURL());
            colorDetail.setGiaBan(chiTiet.getGiaBan().doubleValue());
            colorDetail.setGiaBanGG(giamGiaChiTiet != null ? giamGiaChiTiet.getGiaSauKhiGiam().doubleValue() : null);

            responseList.add(colorDetail);
        }

        return ResponseEntity.ok(responseList);
    }
    @GetMapping("/account/check-login")
    @ResponseBody
    public Map<String, Object> checkLogin(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        response.put("loggedIn", session.getAttribute("khachHang") != null);
        return response;
    }




}
