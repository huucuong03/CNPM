package com.example.demo.Controller.Api;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.ColorDetailResponse;
import com.example.demo.Repository.ProductDetailResponse;
import com.example.demo.Service.*;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.io.Resource;
import jakarta.servlet.http.HttpSession;
import org.docx4j.Docx4J;
import org.docx4j.convert.out.HTMLSettings;

import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProductApiController {
    @Autowired
    private final ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    private final HoaDonService hoaDonService;
    @Autowired
    private final HoaDonChiTietService hoaDonChiTietService;
    @Autowired
    private DiaChiService diaChiService;
    @Autowired
    public ProductApiController(ChiTietSanPhamService chiTietSanPhamService, HoaDonChiTietService hoaDonChiTietService, HoaDonService hoaDonService) {
        this.chiTietSanPhamService = chiTietSanPhamService;
        this.hoaDonChiTietService = hoaDonChiTietService;
        this.hoaDonService = hoaDonService;
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

    @GetMapping("/getProductsByHoaDon")
    public ResponseEntity<List<Map<String, Object>>> getProductsByCart(@RequestParam Long maHoaDon) {
        try {
            HoaDon hoaDon = hoaDonService.getByMa(maHoaDon);
            List<HoaDonChiTiet> products = hoaDonChiTietService.getByHoaDon(hoaDon);

            List<Map<String, Object>> result = products.stream().map(p -> {
                Map<String, Object> map = new HashMap<>();
                map.put("soLuongMua", p.getSoLuongMua());
                map.put("giaTien", p.getGiaTien());
                map.put("maHoaDonChiTiet", p.getMaHoaDonChiTiet());
                map.put("hinhAnhURL", p.getChiTietSanPham().getHinhAnhURL());
                Map<String, Object> chiTiet = new HashMap<>();
                chiTiet.put("tenSanPham", p.getChiTietSanPham().getSanPham().getTenSanPham());
                chiTiet.put("id", p.getChiTietSanPham().getMaChiTietSanPham());
                chiTiet.put("mauSac", p.getChiTietSanPham().getMauSac().getTenMauSac());
                chiTiet.put("dungLuong", p.getChiTietSanPham().getDungLuong().getTenDungLuong());
                chiTiet.put("nsx", p.getChiTietSanPham().getNsx().getTenNSX());

                map.put("chiTietSanPham", chiTiet);
                return map;
            }).collect(Collectors.toList());

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Collections.emptyList());
        }
    }

    @GetMapping("/getDiaChiByCustomer")
    public ResponseEntity<List<DiaChi>> getDiaChiByCustomer(HttpSession session) {
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        try {
            List<DiaChi> diaChiList = diaChiService.getByCustomerId(kh.getMaKhachHang());
            return ResponseEntity.ok(diaChiList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Collections.emptyList());
        }
    }

        @GetMapping("/getReasons")
        public List<String> getReasons(@RequestParam String type) {
            if ("return".equalsIgnoreCase(type)) {
                return List.of(
                        "Hỏng / lỗi khi nhận",
                        "Sản phẩm sai / lỗi",
                        "Khác"
                );
            } else if ("warranty".equalsIgnoreCase(type)) {
                return List.of(
                        "Lỗi kỹ thuật / hỏng hóc",
                        "Sản phẩm không hoạt động / không bật được",
                        "Pin / ắc quy nhanh hết",
                        "Màn hình / cảm ứng hỏng",
                        "Phần mềm / firmware lỗi",
                        "Sản phẩm bị vỡ / hư hỏng khi vận chuyển",
                        "Khác"
                );
            }
            return List.of(); // default empty
        }
    @GetMapping("/view-word")
    public String viewWord(Model model) throws Exception {

        Resource resource = new ClassPathResource("uploads/Giaychungnhan.docx");
        File file = resource.getFile();
        WordprocessingMLPackage wordMLPackage =
                WordprocessingMLPackage.load(file);

        // Convert DOCX -> HTML (CÁCH ĐÚNG)
        HTMLSettings settings = Docx4J.createHTMLSettings();
        settings.setWmlPackage(wordMLPackage);

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Docx4J.toHTML(settings, out, Docx4J.FLAG_EXPORT_PREFER_XSL);

        String htmlContent = out.toString(StandardCharsets.UTF_8);

        model.addAttribute("wordContent", htmlContent);
        return "word-view";
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
