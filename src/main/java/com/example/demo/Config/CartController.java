package com.example.demo.Config;

import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.ChiTietSanPhamRepository;
import com.example.demo.Repository.GiamGiaCTSPRepository;
import com.example.demo.Repository.GioHangChiTietRepository;
import com.example.demo.Repository.GioHangRepository;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.GioHangChiTietService;
import com.example.demo.Service.GioHangService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mssql.googlecode.cityhash.CityHash;
import org.apache.poi.hpsf.Decimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.NumberFormatter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class CartController {

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private GioHangChiTietService gioHangChiTietService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @GetMapping("/cart")
    public String showCart(Model model,
            HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/index";
        }
        model.addAttribute("kh", khachHang);
        GioHang g = gioHangService.getByKhachHang(khachHang);
//        List<GioHangChiTiet> gioHangChiTiets = gioHangChiTietRepository.getByGioHang_KhachHang(khachHangs);
//        model.addAttribute("cart", gioHangChiTiets);
        Double tongTien = 0.0;
        Double tongTienSauGiam = 0.0;
        List<GioHangChiTietDTO> gioHangChiTietDTOs = gioHangChiTietRepository.getGHCTByMaKH(khachHang.getMaKhachHang());
        for (GioHangChiTietDTO gioHangChiTietDTO : gioHangChiTietDTOs) {
            tongTien += (Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            GiamGiaChiTietSanPham giamGiaChiTietSanPham = giamGiaCTSPRepository.fillGGCTSP(gioHangChiTietDTO.getChiTietSanPham().getMaChiTietSanPham());
            if (giamGiaChiTietSanPham != null) {
                gioHangChiTietDTO.setGiaSauKhiGiam(giamGiaChiTietSanPham.getGiaSauKhiGiam());
                tongTienSauGiam += (Double.parseDouble(String.valueOf(giamGiaChiTietSanPham.getGiaSauKhiGiam())) * gioHangChiTietDTO.getSoLuong());
            } else {
                gioHangChiTietDTO.setGiaSauKhiGiam(gioHangChiTietDTO.getChiTietSanPham().getGiaBan());
                tongTienSauGiam += (Double.parseDouble(String.valueOf(gioHangChiTietDTO.getChiTietSanPham().getGiaBan())) * gioHangChiTietDTO.getSoLuong());
            }
        }
        DecimalFormat formatter = new DecimalFormat("#0.0");
        model.addAttribute("cart", gioHangChiTietDTOs);
        model.addAttribute("tongTien", formatter.format(tongTien));
        model.addAttribute("tongTienGiam", formatter.format(tongTien - tongTienSauGiam));
        model.addAttribute("tongTienSG", formatter.format(tongTienSauGiam));
        model.addAttribute("bodyPage", "/WEB-INF/views/cart.jsp");
        model.addAttribute("pageTitle", "Trang chủ");
        return "/layout/layoutcart";
    }

    @GetMapping("/cart/{maKhachHang}/add-san-pham/{maChiTietSanPham}")
    public ResponseEntity<String> addToCart(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham,
            Model model,
            HttpServletRequest request) {
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
            gioHangChiTiet.setSoLuong(1);
            //test
//            gioHangChiTiet.setGiaBan(ctsp.getGiaBan());k
            gioHangChiTiet.setTrangThai(1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        }
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
        for (GioHangChiTiet ghct : listGHCT) {
            listTN.add(ghct.getChiTietSanPham());
            DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
        }

//        GioHangChiTiet gioHangChiTiet1 = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gioHangRepository.getByKhachHang(khachHangService.getByMa(maKhachHang)));
//        if (gioHangChiTiet1 != null){
//            model.addAttribute("soLuongTrongGioHang", gioHangChiTiet1.getSoLuong());
//        }else{
//            model.addAttribute("soLuongTrongGioHang", 0);
//        }

        model.addAttribute("sp", listTN);
        model.addAttribute("DSSP", DSSP);
        gioHangChiTietService.addGHCT(gioHangChiTiet);
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }

    @PostMapping("/cart/add-san-pham")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> addToCart(
            @RequestBody Map<String, Object> payload,
            HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        // Kiểm tra đăng nhập
        KhachHang user = (KhachHang) session.getAttribute("khachHang");
        if (user == null) {
            result.put("success", false);
            result.put("message", "Bạn cần đăng nhập trước khi thêm sản phẩm vào giỏ hàng");
            return ResponseEntity.status(401).body(result); // 401: Unauthorized
        }

        try {
            // Lấy thông tin từ body
            Long maChiTietSanPham = Long.valueOf(payload.get("maChiTietSanPham").toString());
            int quantity = payload.get("quantity") != null ? Integer.parseInt(payload.get("quantity").toString()) : 1;

            GioHang g = gioHangService.getByKhachHang(user);
            ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);

            if (g == null || ctsp == null) {
                result.put("success", false);
                result.put("message", "Giỏ hàng hoặc sản phẩm không tồn tại");
                return ResponseEntity.badRequest().body(result);
            }

            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);

            if (gioHangChiTiet == null) {
                gioHangChiTiet = new GioHangChiTiet();
                gioHangChiTiet.setChiTietSanPham(ctsp);
                gioHangChiTiet.setGioHang(g);
                gioHangChiTiet.setSoLuong(quantity);
                gioHangChiTiet.setTrangThai(1);
                gioHangChiTietRepository.save(gioHangChiTiet);
            } else {
                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + quantity);
                gioHangChiTietRepository.save(gioHangChiTiet);
            }

            // Tổng số lượng sản phẩm trong giỏ hàng
            int cartSize = gioHangChiTietRepository.getByGioHang_KhachHang(user)
                    .stream().mapToInt(GioHangChiTiet::getSoLuong).sum();
            result.put("maGHCT", gioHangChiTiet.getMagiohangchitiet());
            result.put("success", true);
            result.put("cartSize", cartSize);
            result.put("productId", maChiTietSanPham);
            result.put("quantity", gioHangChiTiet.getSoLuong());
            result.put("message", "Thêm sản thành công!");
            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "Thêm sản phẩm thất bại");
            return ResponseEntity.status(500).body(result);
        }
    }



    @PostMapping("/cart/{maKhachHang}/add-san-pham2/{maChiTietSanPham}")
    public ResponseEntity<String> addToCart2(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "maChiTietSanPham") Long maChiTietSanPham,
            Model model,
            HttpServletRequest request) {
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
            gioHangChiTiet.setSoLuong(1);
            //nghịch tý
            String gia = request.getParameter("gia");
//            gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(gia)));
            //
            gioHangChiTiet.setTrangThai(1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + 1);
            ctsp.setSoLuongBan(ctsp.getSoLuongBan());
            chiTietSanPhamRepository.save(ctsp);
        }
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
        for (GioHangChiTiet ghct : listGHCT) {
            listTN.add(ghct.getChiTietSanPham());
            DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
        }
        model.addAttribute("sp", listTN);
        model.addAttribute("DSSP", DSSP);
        gioHangChiTietService.addGHCT(gioHangChiTiet);
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }

    @PostMapping("/cart/{maKhachHang}/add-san-pham1/{tenSanPham}")
    public ResponseEntity<String> addToCart1(
            @PathVariable(name = "maKhachHang") Long maKhachHang,
            @PathVariable(name = "tenSanPham") String tenSanPham,
            Model model, HttpServletRequest request) {
        String tenDungLuong = request.getParameter("tenDungLuong");
        String tenMauSac = request.getParameter("tenMauSac");
        System.out.println(tenSanPham);
        System.out.println(tenDungLuong);
        System.out.println(tenMauSac);
        Map<Long, Integer> DSSP = new HashMap<>();
        List<ChiTietSanPham> listTN = new ArrayList<>();
        ChiTietSanPham ctsp = chiTietSanPhamRepository.getCTSPByMauSacAndDungLuongAndTen(tenSanPham, tenDungLuong, tenMauSac);
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("khachHang", user);
        GioHang g = gioHangService.getByKhachHang(user);
        GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
        if (gioHangChiTiet == null) {
            gioHangChiTiet = new GioHangChiTiet();
            gioHangChiTiet.setChiTietSanPham(ctsp);
            gioHangChiTiet.setGioHang(g);
//                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaSauGiam"))));
            gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong1")));
            gioHangChiTiet.setTrangThai(1);
        } else {
            gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong1")));
        }
                    List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
            for (GioHangChiTiet ghct : listGHCT) {
                listTN.add(ghct.getChiTietSanPham());
                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
            }
            model.addAttribute("sp", listTN);
            model.addAttribute("DSSP", DSSP);
            gioHangChiTietService.addGHCT(gioHangChiTiet);
        //add spp co ma giam gia
//        String check = request.getParameter("check");
//        if (Integer.parseInt(check) == 1) {
//            model.addAttribute("sl", request.getParameter("soLuong2"));
//            model.addAttribute("phanTramGiamGia", request.getParameter("phanTramGiamGia"));
//            model.addAttribute("gia", request.getParameter("giaSauGiam"));
//
////            Cookie gia = new Cookie("gia", request.getParameter("giaSauGiam"));
////            gia.setMaxAge(3600);
////            response.addCookie(gia);
//
//            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
//            if (gioHangChiTiet == null) {
//                gioHangChiTiet = new GioHangChiTiet();
//                gioHangChiTiet.setChiTietSanPham(ctsp);
//                gioHangChiTiet.setGioHang(g);
////                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaSauGiam"))));
//                gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong2")));
//                gioHangChiTiet.setTrangThai(1);
//            } else {
//                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong2")));
//            }
//            List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
//            for (GioHangChiTiet ghct : listGHCT) {
//                listTN.add(ghct.getChiTietSanPham());
//                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
//            }
//            model.addAttribute("sp", listTN);
//            model.addAttribute("DSSP", DSSP);
//            gioHangChiTietService.addGHCT(gioHangChiTiet);
//        } else {
//            model.addAttribute("gia", request.getParameter("giaBan"));
//            model.addAttribute("sl", request.getParameter("soLuong1"));
//            model.addAttribute("phanTramGiamGia", 0);
//
//            GioHangChiTiet gioHangChiTiet = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, g);
//            if (gioHangChiTiet == null) {
//                gioHangChiTiet = new GioHangChiTiet();
//                gioHangChiTiet.setChiTietSanPham(ctsp);
//                gioHangChiTiet.setGioHang(g);
////                gioHangChiTiet.setGiaBan(BigDecimal.valueOf(Double.valueOf(request.getParameter("giaBan"))));
//                gioHangChiTiet.setSoLuong(Integer.valueOf(request.getParameter("soLuong1")));
//                gioHangChiTiet.setTrangThai(1);
//            } else {
//                gioHangChiTiet.setSoLuong(gioHangChiTiet.getSoLuong() + Integer.valueOf(request.getParameter("soLuong1")));
//            }
//            List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang_KhachHang(user);
//            for (GioHangChiTiet ghct : listGHCT) {
//                listTN.add(ghct.getChiTietSanPham());
//                DSSP.put(ghct.getChiTietSanPham().getMaChiTietSanPham(), ghct.getSoLuong());
//            }
//            model.addAttribute("sp", listTN);
//            model.addAttribute("DSSP", DSSP);
//            gioHangChiTietService.addGHCT(gioHangChiTiet);
//        }
        return ResponseEntity.ok("Sản phẩm đã được thêm vào giỏ hàng thành công!");
    }


    @GetMapping("/cart/{maKhachHang}/giamSoLuong/{maChiTietSanPham}")
    public String giamSoLuong(@PathVariable(name = "maKhachHang") Long maKhachHang,
                              @PathVariable("maChiTietSanPham") Long maChiTietSanPham
            , Model model) {
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gh);
        ghct.setSoLuong(ghct.getSoLuong() - 1);
        chiTietSanPhamRepository.save(ctsp);
        if (ghct.getSoLuong() == 0) {
            gioHangChiTietRepository.delete(ghct);
            return "redirect:/cart/{maKhachHang}";
        }
        ghct = gioHangChiTietRepository.save(ghct);
        return "redirect:/cart/{maKhachHang}";
    }


    @GetMapping("/cart/{maKhachHang}/tangSoLuong/{maChiTietSanPham}")
    public String tangSoLuong(@PathVariable(name = "maKhachHang") Long maKhachHang, @PathVariable("maChiTietSanPham") Long maChiTietSanPham
            , Model model) {
        KhachHang user = khachHangService.getByMa(maKhachHang);
        model.addAttribute("US", user);
        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maChiTietSanPham);
        GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gh);
        ghct.setSoLuong(ghct.getSoLuong() + 1);
        chiTietSanPhamRepository.save(ctsp);
        gioHangChiTietRepository.save(ghct);

        return "redirect:/cart/{maKhachHang}";
    }
    @PostMapping("/cart/updateQuantity")
    @ResponseBody
    public Map<String, Object> updateQuantity(@RequestBody Map<String, Object> payload, HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        try {
            KhachHang user = (KhachHang) session.getAttribute("khachHang");
            if (user == null) {
                result.put("success", false);
                result.put("message", "Bạn chưa đăng nhập");
                return result;
            }

            Long ghctId = Long.valueOf(payload.get("id").toString());
            int quantity = Integer.parseInt(payload.get("quantity").toString());

            GioHangChiTiet ghct = gioHangChiTietRepository.findById(ghctId).orElse(null);

            if (ghct != null) {
                ghct.setSoLuong(quantity);
                gioHangChiTietRepository.save(ghct);

                // Giá sản phẩm gốc nhân với số lượng
                BigDecimal itemPrice = ghct.getChiTietSanPham().getGiaBan().multiply(BigDecimal.valueOf(quantity));

                // Tính tổng tiền giỏ hàng
                BigDecimal totalPrice = BigDecimal.ZERO;
                for (GioHangChiTiet item : ghct.getGioHang().getGioHangChiTietList()) {
                    totalPrice = totalPrice.add(item.getChiTietSanPham().getGiaBan().multiply(BigDecimal.valueOf(item.getSoLuong())));
                }

                result.put("success", true);
                result.put("newQuantity", quantity);
                result.put("itemPrice", itemPrice);
                result.put("totalPrice", totalPrice);

            } else {
                result.put("success", false);
                result.put("message", "Sản phẩm không tồn tại trong giỏ hàng");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "Cập nhật số lượng thất bại");
        }

        return result;
    }


    @ResponseBody
    @DeleteMapping("/cart/xoaSanPham/{maGHCT}/{maCTSP}")
    public Map<String, Object> xoaSanPham(HttpSession session,
                                          @PathVariable Long maGHCT,
                                          @PathVariable Long maCTSP) {
        Map<String, Object> response = new HashMap<>();

        KhachHang user = (KhachHang) session.getAttribute("khachHang");
        if (user == null) {
            response.put("status", "error");
            response.put("message", "Bạn cần đăng nhập");
            return response;
        }

        GioHang gh = gioHangService.getByKhachHang(user);
        ChiTietSanPham ctsp = chiTietSanPhamService.getByMa(maCTSP);

        if (gh == null || ctsp == null) {
            response.put("status", "error");
            response.put("message", "Không tìm thấy dữ liệu giỏ hàng");
            return response;
        }

        GioHangChiTiet ghct = gioHangChiTietRepository.findById(maGHCT).orElse(null);

        if (ghct != null && ghct.getGioHang().getMaGioHang().equals(gh.getMaGioHang())
                && ghct.getChiTietSanPham().getMaChiTietSanPham().equals(ctsp.getMaChiTietSanPham())) {
            gioHangChiTietRepository.delete(ghct);
            response.put("status", "success");
            response.put("maGHCT", maGHCT);
            response.put("message", "Xoá thành công!");
        } else {
            response.put("status", "error");
            response.put("message", "Sản phẩm không tồn tại trong giỏ!");
        }

        return response;
    }

    @PostMapping("/cart/check-out")
    public String thanhToan(
            @RequestParam String maGHCTs,
            Model model,
            HttpSession session
    ) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/index";
        }

        List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                .map(Long::parseLong)
                .toList();

        buildCheckoutData(listMaGHCT, khachHang, model);

        model.addAttribute("bodyPage", "/WEB-INF/views/checkout.jsp");
        model.addAttribute("pageTitle", "Thanh toán");

        return "/layout/layoutcart";
    }

    @PostMapping("/cart/buy-now")
    public String buyNow(
            @RequestParam String maGHCTs,
            Model model,
            HttpSession session
    ) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/index";
        }
        List<Long> maCTSP = Arrays.stream(maGHCTs.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        buildCheckoutData(maCTSP, khachHang, model);
        model.addAttribute("bodyPage", "/WEB-INF/views/checkout.jsp");
        model.addAttribute("pageTitle", "Thanh toán");
        return "/layout/layoutcart";
    }


    public void buildCheckoutData(
            List<Long> listMaGHCT,
            KhachHang khachHang,
            Model model
    ) {
        List<Map<String, Object>> listGhctWithDiscount = new ArrayList<>();
        BigDecimal tongTien = BigDecimal.ZERO;

        for (Long maGHCT : listMaGHCT) {
            GioHangChiTiet chiTiet = gioHangChiTietService.getByMa(maGHCT);
            if (chiTiet == null) continue;

            Map<String, Object> item = new HashMap<>();
            item.put("gioHangChiTiet", chiTiet);

            ChiTietSanPham ctsp = chiTiet.getChiTietSanPham();
            GiamGiaChiTietSanPham giamGia = giamGiaCTSPRepository.findByChiTietSanPham(ctsp);
            item.put("giaGiam", giamGia);

            BigDecimal donGia = (giamGia != null && giamGia.getGiaSauKhiGiam() != null)
                    ? giamGia.getGiaSauKhiGiam()
                    : ctsp.getGiaBan();

            BigDecimal thanhTien = donGia.multiply(BigDecimal.valueOf(chiTiet.getSoLuong()));
            item.put("thanhTien", thanhTien);

            tongTien = tongTien.add(thanhTien);
            listGhctWithDiscount.add(item);
        }

        model.addAttribute("listghct", listGhctWithDiscount);
        model.addAttribute("tongTien", tongTien);
        model.addAttribute("kh", khachHang);
    }

    @GetMapping("/cart/get-count")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getCount(HttpSession session) {
        Map<String, Object> result = new HashMap<>();

        // Lấy user từ session kiểm tra đăng nhập
        KhachHang user = (KhachHang) session.getAttribute("khachHang");

        if (user == null) {
            // Nếu chưa đăng nhập thì trả về số lượng giỏ hàng là 0
            result.put("success", true);
            result.put("cartSize", 0);
            return ResponseEntity.ok(result);
        }

        try {
            GioHang g = gioHangService.getByKhachHang(user);
            if (g == null) {
                result.put("success", true);
                result.put("cartSize", 0);
                return ResponseEntity.ok(result);
            }

            // Đếm số dòng trong bảng GioHangChiTiet
            int cartSize = gioHangChiTietRepository.getByGioHang_KhachHang(user).size();
            System.out.println(cartSize);
            result.put("success", true);
            result.put("cartSize", cartSize);
            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("cartSize", 0);
            return ResponseEntity.status(500).body(result);
        }
    }
}

