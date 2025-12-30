package com.example.demo.Controller;

import com.example.demo.Config.CartController;
import com.example.demo.Dto.GioHangChiTietDTO;
import com.example.demo.Dto.SanPhamViewDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Service.*;
import com.example.demo.Service.VNPChuaDN.VnpayServiceChuaDN;
import com.example.demo.Service.VNPChuaDN.VnpayServiceDN;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.DocumentException;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class VnpayController {
    @Autowired
    private VnpayService vnPayService;
    @Autowired
    private SanPhamService SanPhamService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private CartController cartController;
    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private VnpayServiceChuaDN vnpayServiceChuaDN;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GiamGiaCTSPRepository giamGiaCTSPRepository;
    @Autowired
    private GioHangChiTietService gioHangChiTietService;
    @Autowired
    private VnpayServiceDN vnpayServiceDN;
    @Autowired
    private NSXService nSXService;

    @GetMapping("index")
    public String home(Model model) {
        // Set body page và tiêu đề
        List<SanPhamViewDTO> products = SanPhamService.get20SanPhamMoiNhat();
        List<NSX> nsx = nSXService.getAll();
        model.addAttribute("bodyPage", "/WEB-INF/views/page/index.jsp");
        model.addAttribute("pageTitle", "Trang chủ");
        model.addAttribute("products", products);
        model.addAttribute("nsx", nsx);
        return "/layout/layout";
    }

    @PostMapping("/submitOrder")
    public String submidOrderKhiDangNhap(@CookieValue("makhachhang") Long maKhachHang,
            @RequestParam("tongTien") String orderTotal,
            @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response,
            HttpServletRequest request) throws UnsupportedEncodingException {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);

        Map<String, Integer> DSSP = new HashMap<>();
        List<SanPham> listSP = new ArrayList<>();
        GioHang gh = gioHangService.getByKhachHang(kh);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);
        List<GioHangChiTiet> listGHCT = gioHangChiTietRepository.getByGioHang(gh);

        String[] soLuongArray = request.getParameterValues("soLuong");

        // Chuyển mảng số lượng thành một danh sách List<Integer>
        List<Integer> listSoLuong = new ArrayList<>();
        if (soLuongArray != null) {
            for (String soLuong : soLuongArray) {
                // Kiểm tra và chuyển đổi số lượng từ chuỗi sang số nguyên
                try {
                    int soLuongInt = Integer.parseInt(soLuong);
                    listSoLuong.add(soLuongInt);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi
                    e.printStackTrace();
                }
            }
        }

        // Chuyển danh sách số lượng thành chuỗi JSON
        ObjectMapper mapper = new ObjectMapper();
        String danhSachSoLuongJson = "";
        try {
            danhSachSoLuongJson = mapper.writeValueAsString(listSoLuong);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        // Encode chuỗi JSON
        String encodedDanhSachSoLuongJson = URLEncoder.encode(danhSachSoLuongJson, "UTF-8");

        // Tạo cookie với giá trị đã được encode
        Cookie soLuongCookie = new Cookie("listSoLuong", encodedDanhSachSoLuongJson);
        soLuongCookie.setMaxAge(3600);

        // Thêm cookie vào response
        response.addCookie(soLuongCookie);

        String[] sanPhamArray = request.getParameterValues("maChiTietSanPhamss");

        // Chuyển mảng số lượng thành một danh sách List<Integer>
        List<Integer> listMaChiTietSanPham = new ArrayList<>();
        if (sanPhamArray != null) {
            for (String maChiTietSanPham : sanPhamArray) {
                // Kiểm tra và chuyển đổi số lượng từ chuỗi sang số nguyên
                try {
                    int maCTSP = Integer.parseInt(maChiTietSanPham);
                    listMaChiTietSanPham.add(maCTSP);
                } catch (NumberFormatException e) {
                    // Xử lý lỗi chuyển đổi
                    e.printStackTrace();
                }
            }
        }

        // Chuyển danh sách số lượng thành chuỗi JSON
        ObjectMapper mapper1 = new ObjectMapper();
        String danhSachMaChiTietSanPhamJson = "";
        try {
            danhSachMaChiTietSanPhamJson = mapper.writeValueAsString(listMaChiTietSanPham);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        // Encode chuỗi JSON
        String encodedDanhSachMaChiTietSanPhamJson = URLEncoder.encode(danhSachMaChiTietSanPhamJson, "UTF-8");

        // Tạo cookie với giá trị đã được encode
        Cookie maChiTietSanPhamCookie = new Cookie("listMaChiTietSanPham", encodedDanhSachMaChiTietSanPhamJson);
        maChiTietSanPhamCookie.setMaxAge(3600);

        // Thêm cookie vào response
        response.addCookie(maChiTietSanPhamCookie);

        // String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String maVoucher = request.getParameter("maVoucher3");

        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");
        String giaTriCookieMaVoucher = URLEncoder.encode(maVoucher, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");

        // //cookie

        String giaTienSauGiamFormatted = orderTotal.replaceAll("[^\\d]", "");
        Cookie cookie3 = new Cookie("tongTien", giaTienSauGiamFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);

        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);

        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);
        Cookie cookie12 = new Cookie("maVoucher", giaTriCookieMaVoucher);

        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);

        cookie8.setMaxAge(3600);

        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);
        cookie12.setMaxAge(3600);

        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie8);

        response.addCookie(cookie10);
        response.addCookie(cookie11);
        response.addCookie(cookie12);

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnPayService.createOrder(BigDecimal.valueOf(Double.parseDouble(giaTienSauGiamFormatted)),
                orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    // thanh toán ngay
    @PostMapping("/submitOrder1")
    public String submidOrderChuaDangNhap(@RequestParam("tongTien") String orderTotal,
            @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response,
            HttpServletRequest request) throws DocumentException, MessagingException, IOException {
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String giaTienSauGiam = request.getParameter("giaTienSauGiam1");
        String giaTienSauGiamFormatted = giaTienSauGiam.replaceAll("[^\\d]", "");
        String orderTotalFormatted = orderTotal.replaceAll("[^\\d]", "");
        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");
        String giaTriCookieEmail = URLEncoder.encode(email, "UTF-8");

        // cookie
        Cookie cookie1 = new Cookie("giaSauGiam", giaTienSauGiamFormatted);
        Cookie cookie2 = new Cookie("soLuong", request.getParameter("soLuong"));
        Cookie cookie3 = new Cookie("tongTien", orderTotalFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);
        Cookie cookie7 = new Cookie("maChiTietSanPham", maChiTietSanPham);
        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);
        Cookie cookie9 = new Cookie("email", giaTriCookieEmail);
        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);

        cookie1.setMaxAge(3600);
        cookie2.setMaxAge(3600);
        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);
        cookie7.setMaxAge(3600);
        cookie8.setMaxAge(3600);
        cookie9.setMaxAge(3600);
        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);

        response.addCookie(cookie1);
        response.addCookie(cookie2);
        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie7);
        response.addCookie(cookie8);
        response.addCookie(cookie9);
        response.addCookie(cookie10);
        response.addCookie(cookie11);

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnpayServiceChuaDN.createOrder(BigDecimal.valueOf(Double.parseDouble(orderTotalFormatted)),
                orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    @GetMapping("/vnpay-payment1")
    public String ThanhToanKhiChuaDangNhap(
            @CookieValue(name = "giaSauGiam") String giaTienSauGiam1,
            @CookieValue(name = "maChiTietSanPham") Long maChiTietSanPham,
            @CookieValue(name = "tongTien") BigDecimal orderTotal,
            @CookieValue(name = "soLuong") Integer soLuong,
            @CookieValue(name = "tinh") String tinh,
            @CookieValue(name = "huyen") String huyen, @CookieValue(name = "xa") String xa,
            @CookieValue(name = "nguoiNhan") String nguoiNhan,
            @CookieValue(name = "email") String email,
            @CookieValue(name = "sdt") String sdt, @CookieValue(name = "diaChi") String diaChi

            , HttpServletRequest request, HttpServletResponse response, Model model)
            throws DocumentException, MessagingException, IOException {

        int paymentStatus = vnpayServiceChuaDN.orderReturn(request);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        if (paymentStatus == 1) {
            // Lấy các giá trị từ cookie và giải mã
            String giaTriDaGiaiMaTinh = "", giaTriDaGiaiMaHuyen = "", giaTriDaGiaiMaXa = "",
                    giaTriDaGiaiMaNguoiNhan = "", giaTriDaGiaiMaDiaChi = "", giaTriDaGiaiMaEmail = "";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    switch (cookie.getName()) {
                        case "tinh":
                            giaTriDaGiaiMaTinh = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "huyen":
                            giaTriDaGiaiMaHuyen = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "xa":
                            giaTriDaGiaiMaXa = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "nguoiNhan":
                            giaTriDaGiaiMaNguoiNhan = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "diaChi":
                            giaTriDaGiaiMaDiaChi = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "email":
                            giaTriDaGiaiMaEmail = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;

                    }
                }
            }

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();

            // Sử dụng thông tin từ cookie để tạo KhachHang
            KhachHang k = KhachHang.builder()
                    .ten(giaTriDaGiaiMaNguoiNhan)
                    .email(giaTriDaGiaiMaEmail)
                    .sdt(sdt)
                    .diaChi(giaTriDaGiaiMaDiaChi)
                    .build();
            khachHangRepository.save(k);

            HoaDon hd = HoaDon.builder()
                    .nguoiNhan(k.getTen())
                    .khachHang(k)
                    .diaChi(k.getDiaChi())
                    .sdt(k.getSdt())
                    .trangThai(0)
                    .nhanVien(nhanVienMD)
                    .ngayTao(Date.valueOf(datenow))
                    .ngayThanhToan(Date.valueOf(datenow))
                    .tongTien(orderTotal)
                    .loaiThanhToan(1)
                    .tinh(giaTriDaGiaiMaTinh)
                    .huyen(giaTriDaGiaiMaHuyen)
                    .xa(giaTriDaGiaiMaXa)
                    .build();
            hoaDonRepository.save(hd);

            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(maChiTietSanPham);

            for (int i = 0; i < soLuong; i++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setHoaDon(hd);
                hoaDonChiTiet.setGiaTien(BigDecimal.valueOf(Double.parseDouble(giaTienSauGiam1)));
                hoaDonChiTiet.setSoLuongMua(1);
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTiet.setCreatedDate(new java.util.Date());
                hoaDonChiTiet.setLastUpdate(new java.util.Date());
                hoaDonChiTietRepository.save(hoaDonChiTiet);

                chiTietSanPham.setSoLuongBan(chiTietSanPham.getSoLuongBan() + hoaDonChiTiet.getSoLuongMua());
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            if (chiTietSanPham.getSoLuongNhap() <= chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(0);
                // SanPham sp =
                // sanPhamRepository.findById(chiTietSanPham.getSanPham().getMaSanPham()).orElse(null);
                // sp.setTrangThai(0);
                // sanPhamRepository.save(sp);
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            hoaDonService.sendEmailWithAttachment(k.getEmail());

            Cookie cookie = new Cookie("makhachhang", null);
            cookie.setMaxAge(0);
            response.addCookie(cookie);

            Cookie cookie12 = new Cookie("maHoaDon", null);
            cookie12.setMaxAge(0);
            response.addCookie(cookie12);

            Cookie cookie1 = new Cookie("giaSauGiam", null);
            Cookie cookie2 = new Cookie("soLuong", null);
            Cookie cookie3 = new Cookie("tongTien", null);
            Cookie cookie4 = new Cookie("tinh", null);
            Cookie cookie5 = new Cookie("huyen", null);
            Cookie cookie6 = new Cookie("xa", null);
            Cookie cookie7 = new Cookie("maChiTietSanPham", null);
            Cookie cookie8 = new Cookie("nguoiNhan", null);
            Cookie cookie9 = new Cookie("email", null);
            Cookie cookie10 = new Cookie("sdt", null);
            Cookie cookie11 = new Cookie("diaChi", null);

            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            cookie4.setMaxAge(0);
            cookie5.setMaxAge(0);
            cookie6.setMaxAge(0);
            cookie7.setMaxAge(0);
            cookie8.setMaxAge(0);
            cookie9.setMaxAge(0);
            cookie10.setMaxAge(0);
            cookie11.setMaxAge(0);

            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            response.addCookie(cookie4);
            response.addCookie(cookie5);
            response.addCookie(cookie6);
            response.addCookie(cookie7);
            response.addCookie(cookie8);
            response.addCookie(cookie9);
            response.addCookie(cookie10);
            response.addCookie(cookie11);

            return "/VNP/odersuc";
        } else {
            return "/VNP/orderfail";
        }

    }

    @PostMapping("/cart/submit-order")
    public String thanhToanVNPay(
            @RequestParam String email,
            @RequestParam String nguoiNhan,
            @RequestParam String sdt,
            @RequestParam String tinh,
            @RequestParam String xa,
            @RequestParam String diaChi,
            @RequestParam(required = false) String note,
            @RequestParam String maGHCTs,
            HttpServletRequest request,
            HttpSession session,
            Model model) throws MessagingException {
        boolean hasError = false;

        if (email == null || email.trim().isEmpty()) {
            model.addAttribute("error", "Email không được để trống");
            hasError = true;
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            model.addAttribute("error", "Email không đúng định dạng");
            hasError = true;
        }

        if (nguoiNhan == null || nguoiNhan.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng nhập tên người nhận");
            hasError = true;
        }

        if (sdt == null || !sdt.matches("^0[0-9]{9}$")) {
            model.addAttribute("error", "Số điện thoại không hợp lệ");
            hasError = true;
        }

        if (tinh == null || tinh.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn tỉnh/thành");
            hasError = true;
        }

        if (xa == null || xa.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn xã/phường");
            hasError = true;
        }

        if (diaChi == null || diaChi.trim().isEmpty()) {
            model.addAttribute("error", "Địa chỉ không được để trống");
            hasError = true;
        }
        if (hasError) {
            model.addAttribute("email", email);
            model.addAttribute("nguoiNhan", nguoiNhan);
            model.addAttribute("sdt", sdt);
            model.addAttribute("tinh", tinh);
            model.addAttribute("xa", xa);
            model.addAttribute("diaChi", diaChi);
            model.addAttribute("note", note);

            List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                    .map(Long::parseLong)
                    .toList();

            KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
            cartController.buildCheckoutData(listMaGHCT, khachHang, model);

            model.addAttribute("bodyPage", "/WEB-INF/views/checkout.jsp");
            model.addAttribute("pageTitle", "Thanh toán");

            return "/layout/layoutcart";
        }

        // int paymentStatus = vnPayService.orderReturn(request);
        // if (paymentStatus != 1) {
        // return "/VNP/orderfaildn";
        // }

        List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/index";
        }
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);
        // 4️⃣ Tạo hóa đơn
        HoaDon hoaDon = HoaDon.builder()
                .khachHang(khachHang)
                .nguoiNhan(nguoiNhan)
                .sdt(sdt)
                .diaChi(diaChi)
                .tinh(tinh)
                .xa(xa)
                .nhanVien(nhanVienMD)
                .ghiChu(note)
                .ngayTao(new java.util.Date())
                .createdDate(new java.util.Date())
                .lastUpdate(new java.util.Date())
                .loaiThanhToan(0) // Thanh toán khi nhận hàng
                .trangThai(0)
                .build();

        hoaDonRepository.save(hoaDon);
        BigDecimal tongTien = BigDecimal.ZERO;
        // 5️⃣ Tạo hóa đơn chi tiết
        for (Long maGHCT : listMaGHCT) {
            GioHangChiTiet ghct = gioHangChiTietService.getByMa(maGHCT);
            if (ghct == null)
                continue;

            ChiTietSanPham ctsp = ghct.getChiTietSanPham();

            // lấy giá (ưu tiên giảm giá)
            GiamGiaChiTietSanPham gg = giamGiaCTSPRepository.findByChiTietSanPham(ctsp);

            BigDecimal donGia = (gg != null)
                    ? gg.getGiaSauKhiGiam()
                    : ctsp.getGiaBan();

            HoaDonChiTiet hdct = HoaDonChiTiet.builder()
                    .hoaDon(hoaDon)
                    .chiTietSanPham(ctsp)
                    .soLuongMua(ghct.getSoLuong())
                    .createdDate(new java.util.Date())
                    .lastUpdate(new java.util.Date())
                    .giaTien(donGia)
                    .trangThai(1)
                    // .imei("12345678")
                    .build();

            hoaDonChiTietRepository.save(hdct);
            tongTien = tongTien.add(
                    donGia.multiply(BigDecimal.valueOf(ghct.getSoLuong())));

            // trừ kho
            ctsp.setSoLuongNhap(ctsp.getSoLuongNhap() - ghct.getSoLuong());
            chiTietSanPhamRepository.save(ctsp);

            // xóa khỏi giỏ
            gioHangChiTietRepository.delete(ghct);
        }

        // 6️⃣ Update tổng tiền
        hoaDon.setTongTien(tongTien);
        hoaDonRepository.save(hoaDon);
        // 7️⃣ Gửi email xác nhận
        hoaDonService.sendEmailWithAttachment(email);

        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("message", "Mua hàng thành công!");
        return "redirect:/index";
    }

    @PostMapping("/cart/submit-order-vnpay")
    public String thanhToanVNPayRedirect(
            @RequestParam String email,
            @RequestParam String nguoiNhan,
            @RequestParam String sdt,
            @RequestParam String tinh,
            @RequestParam String xa,
            @RequestParam String diaChi,
            @RequestParam(required = false) String note,
            @RequestParam String maGHCTs,
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session,
            Model model) throws UnsupportedEncodingException {
        // Validate dữ liệu
        boolean hasError = false;

        if (email == null || email.trim().isEmpty()) {
            model.addAttribute("error", "Email không được để trống");
            hasError = true;
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            model.addAttribute("error", "Email không đúng định dạng");
            hasError = true;
        }

        if (nguoiNhan == null || nguoiNhan.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng nhập tên người nhận");
            hasError = true;
        }

        if (sdt == null || !sdt.matches("^0[0-9]{9}$")) {
            model.addAttribute("error", "Số điện thoại không hợp lệ");
            hasError = true;
        }

        if (tinh == null || tinh.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn tỉnh/thành");
            hasError = true;
        }

        if (xa == null || xa.trim().isEmpty()) {
            model.addAttribute("error", "Vui lòng chọn xã/phường");
            hasError = true;
        }

        if (diaChi == null || diaChi.trim().isEmpty()) {
            model.addAttribute("error", "Địa chỉ không được để trống");
            hasError = true;
        }

        if (hasError) {
            model.addAttribute("email", email);
            model.addAttribute("nguoiNhan", nguoiNhan);
            model.addAttribute("sdt", sdt);
            model.addAttribute("tinh", tinh);
            model.addAttribute("xa", xa);
            model.addAttribute("diaChi", diaChi);
            model.addAttribute("note", note);

            List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                    .map(Long::parseLong)
                    .toList();

            KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
            cartController.buildCheckoutData(listMaGHCT, khachHang, model);

            model.addAttribute("bodyPage", "/WEB-INF/views/checkout.jsp");
            model.addAttribute("pageTitle", "Thanh toán");

            return "/layout/layoutcart";
        }

        // Tính tổng tiền
        List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());

        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/index";
        }

        BigDecimal tongTien = BigDecimal.ZERO;
        for (Long maGHCT : listMaGHCT) {
            GioHangChiTiet ghct = gioHangChiTietService.getByMa(maGHCT);
            if (ghct == null)
                continue;

            ChiTietSanPham ctsp = ghct.getChiTietSanPham();
            GiamGiaChiTietSanPham gg = giamGiaCTSPRepository.findByChiTietSanPham(ctsp);

            BigDecimal donGia = (gg != null) ? gg.getGiaSauKhiGiam() : ctsp.getGiaBan();
            tongTien = tongTien.add(donGia.multiply(BigDecimal.valueOf(ghct.getSoLuong())));
        }

        // Lưu thông tin vào SESSION thay vì cookie (cookie bị mất khi redirect từ
        // VNPay)
        session.setAttribute("vnpay_email", email);
        session.setAttribute("vnpay_nguoiNhan", nguoiNhan);
        session.setAttribute("vnpay_sdt", sdt);
        session.setAttribute("vnpay_tinh", tinh);
        session.setAttribute("vnpay_xa", xa);
        session.setAttribute("vnpay_diaChi", diaChi);
        session.setAttribute("vnpay_note", note != null ? note : "");
        session.setAttribute("vnpay_maGHCTs", maGHCTs);

        System.out.println("=== Session Save Debug ===");
        System.out.println("Saved to session - maGHCTs: " + maGHCTs);

        // Tạo URL VNPay
        String baseUrl = request.getScheme() + "://" + request.getServerName();

        // Chỉ thêm port nếu không phải 80 (HTTP) hoặc 443 (HTTPS)
        int port = request.getServerPort();
        if ((request.getScheme().equals("http") && port != 80) ||
                (request.getScheme().equals("https") && port != 443)) {
            baseUrl += ":" + port;
        }

        System.out.println("=== VNPay Redirect Debug ===");
        System.out.println("Base URL: " + baseUrl);
        System.out.println("Scheme: " + request.getScheme());
        System.out.println("Server Name: " + request.getServerName());
        System.out.println("Server Port: " + port);

        String orderInfo = "Thanh toan don hang";
        String vnpayUrl = vnPayService.createOrder(tongTien, orderInfo, baseUrl);

        System.out.println("VNPay URL: " + vnpayUrl);
        System.out.println("===========================");

        return "redirect:" + vnpayUrl;
    }

    // thanh toán ngay
    @PostMapping("/submitOrder2")
    public String submidOrderMuaNgayKhiDN(@RequestParam("tongTien") String orderTotal,
            @RequestParam("orderInfo") String orderInfo, Model model, HttpServletResponse response,
            HttpServletRequest request) throws DocumentException, MessagingException, IOException {
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String datenow = dtf.format(now).toLowerCase();
        String maChiTietSanPham = request.getParameter("maChiTietSanPham");
        String nguoiNhan = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String tinh = request.getParameter("quocGia1");
        String huyen = request.getParameter("thanhPho1");
        String xa = request.getParameter("diaChi1");
        String maVoucher = request.getParameter("maVoucher3");

        String giaTienSauGiam = request.getParameter("giaSauGiam");
        String giaTienSauGiamFormatted = giaTienSauGiam.replaceAll("[^\\d]", "");
        String orderTotalFormatted = orderTotal.replaceAll("[^\\d]", "");
        String giaTriCookieTinh = URLEncoder.encode(tinh, "UTF-8");
        String giaTriCookieHuyen = URLEncoder.encode(huyen, "UTF-8");
        String giaTriCookieXa = URLEncoder.encode(xa, "UTF-8");

        String giaTriCookieNguoiNhan = URLEncoder.encode(nguoiNhan, "UTF-8");
        String giaTriCookieDiaChi = URLEncoder.encode(diaChi, "UTF-8");
        String giaTriCookieMaVoucher = URLEncoder.encode(maVoucher, "UTF-8");

        // cookie
        Cookie cookie1 = new Cookie("giaSauGiam", giaTienSauGiamFormatted);
        Cookie cookie2 = new Cookie("soLuong", request.getParameter("soLuong"));
        Cookie cookie3 = new Cookie("tongTien", orderTotalFormatted);
        Cookie cookie4 = new Cookie("tinh", giaTriCookieTinh);
        Cookie cookie5 = new Cookie("huyen", giaTriCookieHuyen);
        Cookie cookie6 = new Cookie("xa", giaTriCookieXa);
        Cookie cookie7 = new Cookie("maChiTietSanPham", maChiTietSanPham);
        Cookie cookie8 = new Cookie("nguoiNhan", giaTriCookieNguoiNhan);
        Cookie cookie10 = new Cookie("sdt", sdt);
        Cookie cookie11 = new Cookie("diaChi", giaTriCookieDiaChi);
        Cookie cookie12 = new Cookie("maVoucher", giaTriCookieMaVoucher);

        cookie1.setMaxAge(3600);
        cookie2.setMaxAge(3600);
        cookie3.setMaxAge(3600);
        cookie4.setMaxAge(3600);
        cookie5.setMaxAge(3600);
        cookie6.setMaxAge(3600);
        cookie7.setMaxAge(3600);
        cookie8.setMaxAge(3600);
        cookie10.setMaxAge(3600);
        cookie11.setMaxAge(3600);
        cookie12.setMaxAge(3600);

        response.addCookie(cookie1);
        response.addCookie(cookie2);
        response.addCookie(cookie3);
        response.addCookie(cookie4);
        response.addCookie(cookie5);
        response.addCookie(cookie6);
        response.addCookie(cookie7);
        response.addCookie(cookie8);
        response.addCookie(cookie10);
        response.addCookie(cookie11);
        response.addCookie(cookie12);

        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        String vnpayUrl = vnpayServiceDN.createOrder(BigDecimal.valueOf(Double.parseDouble(orderTotalFormatted)),
                orderInfo, baseUrl);
        return "redirect:" + vnpayUrl;
    }

    @GetMapping("/vnpay-payment2")
    public String ThanhToanMuaNgayKhiDangNhap(
            @CookieValue(name = "giaSauGiam") BigDecimal giaTienSauGiam1,
            @CookieValue(name = "makhachhang") Long maKhachHang,
            @CookieValue(name = "maChiTietSanPham") Long maChiTietSanPham,
            @CookieValue(name = "tongTien") BigDecimal orderTotal,
            @CookieValue(name = "soLuong") Integer soLuong,
            @CookieValue(name = "tinh") String tinh,
            @CookieValue(name = "huyen") String huyen, @CookieValue(name = "xa") String xa,
            @CookieValue(name = "nguoiNhan") String nguoiNhan,
            @CookieValue(name = "sdt") String sdt, @CookieValue(name = "diaChi") String diaChi

            , HttpServletRequest request, HttpServletResponse response, Model model)
            throws DocumentException, MessagingException, IOException {

        int paymentStatus = vnpayServiceChuaDN.orderReturn(request);
        model.addAttribute("makhachhang", maKhachHang);
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        List<HoaDon> hd = hoaDonService.getAllBykhachHang(khachHangService.getByMa(maKhachHang));
        model.addAttribute("hd", hd);
        model.addAttribute("kh", kh);

        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        model.addAttribute("orderId", orderInfo);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("paymentTime", paymentTime);
        model.addAttribute("transactionId", transactionId);
        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        if (paymentStatus == 1) {
            // Lấy các giá trị từ cookie và giải mã
            String giaTriDaGiaiMaTinh = "", giaTriDaGiaiMaHuyen = "", giaTriDaGiaiMaXa = "",
                    giaTriDaGiaiMaNguoiNhan = "", giaTriDaGiaiMaDiaChi = "", giaTriDaGiaiMaEmail = "",
                    giaTriDaGiaiMaMaVoucher = "";

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    switch (cookie.getName()) {
                        case "tinh":
                            giaTriDaGiaiMaTinh = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "huyen":
                            giaTriDaGiaiMaHuyen = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "xa":
                            giaTriDaGiaiMaXa = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "nguoiNhan":
                            giaTriDaGiaiMaNguoiNhan = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "diaChi":
                            giaTriDaGiaiMaDiaChi = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;
                        case "maVoucher":
                            giaTriDaGiaiMaMaVoucher = URLDecoder.decode(cookie.getValue(), "UTF-8");
                            break;

                    }
                }
            }

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String datenow = dtf.format(now).toLowerCase();
            Long maVoucherLong = null;
            if (giaTriDaGiaiMaMaVoucher != "") {
                maVoucherLong = Long.parseLong(giaTriDaGiaiMaMaVoucher);
            }
            HoaDon hd1 = HoaDon.builder()
                    .nguoiNhan(giaTriDaGiaiMaNguoiNhan)
                    .khachHang(kh)
                    .diaChi(giaTriDaGiaiMaDiaChi)
                    .sdt(kh.getSdt())
                    .trangThai(0)
                    .nhanVien(nhanVienMD)
                    .ngayTao(Date.valueOf(datenow))
                    .ngayThanhToan(Date.valueOf(datenow))
                    .tongTien(orderTotal)
                    .loaiThanhToan(1)
                    .tinh(giaTriDaGiaiMaTinh)
                    .huyen(giaTriDaGiaiMaHuyen)
                    .xa(giaTriDaGiaiMaXa)
                    .maVoucher(maVoucherLong)
                    .build();
            hoaDonRepository.save(hd1);

            ChiTietSanPham chiTietSanPham = chiTietSanPhamService.getByMa(maChiTietSanPham);
            for (int i = 0; i < soLuong; i++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setHoaDon(hd1);
                hoaDonChiTiet.setGiaTien(giaTienSauGiam1);
                hoaDonChiTiet.setSoLuongMua(1);
                hoaDonChiTiet.setTrangThai(1);
                hoaDonChiTiet.setCreatedDate(new java.util.Date());
                hoaDonChiTiet.setLastUpdate(new java.util.Date());
                hoaDonChiTietRepository.save(hoaDonChiTiet);

                chiTietSanPham.setSoLuongBan(chiTietSanPham.getSoLuongBan() + hoaDonChiTiet.getSoLuongMua());
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            if (chiTietSanPham.getSoLuongNhap() <= chiTietSanPham.getSoLuongBan()) {
                chiTietSanPham.setTrangThai(0);
                // SanPham sp =
                // sanPhamRepository.findById(chiTietSanPham.getSanPham().getMaSanPham()).orElse(null);
                // sp.setTrangThai(0);
                // sanPhamRepository.save(sp);
                chiTietSanPhamRepository.save(chiTietSanPham);
            }

            hoaDonService.sendEmailWithAttachment(kh.getEmail());

            Cookie cookie1 = new Cookie("giaSauGiam", null);
            Cookie cookie2 = new Cookie("soLuong", null);
            Cookie cookie3 = new Cookie("tongTien", null);
            Cookie cookie4 = new Cookie("tinh", null);
            Cookie cookie5 = new Cookie("huyen", null);
            Cookie cookie6 = new Cookie("xa", null);
            Cookie cookie7 = new Cookie("maChiTietSanPham", null);
            Cookie cookie8 = new Cookie("nguoiNhan", null);
            Cookie cookie10 = new Cookie("sdt", null);
            Cookie cookie11 = new Cookie("diaChi", null);
            Cookie cookie12 = new Cookie("maVoucher", null);

            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            cookie4.setMaxAge(0);
            cookie5.setMaxAge(0);
            cookie6.setMaxAge(0);
            cookie7.setMaxAge(0);
            cookie8.setMaxAge(0);
            cookie10.setMaxAge(0);
            cookie11.setMaxAge(0);
            cookie12.setMaxAge(0);

            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            response.addCookie(cookie4);
            response.addCookie(cookie5);
            response.addCookie(cookie6);
            response.addCookie(cookie7);
            response.addCookie(cookie8);
            response.addCookie(cookie10);
            response.addCookie(cookie11);
            response.addCookie(cookie12);

            return "/VNP/ordersuccess";
        } else {
            return "/VNP/orderfaildn";
        }

    }

    @GetMapping("/vnpay-payment")
    public String vnpayCallback(
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session,
            Model model) throws MessagingException, UnsupportedEncodingException {
        System.out.println("=== VNPay Callback Debug ===");
        System.out.println("Request URL: " + request.getRequestURL());
        System.out.println("Query String: " + request.getQueryString());

        // Kiểm tra kết quả thanh toán từ VNPay
        int paymentStatus = vnPayService.orderReturn(request);
        System.out.println("Payment Status: " + paymentStatus);
        System.out.println("vnp_ResponseCode: " + request.getParameter("vnp_ResponseCode"));
        System.out.println("vnp_TransactionStatus: " + request.getParameter("vnp_TransactionStatus"));

        // Kiểm tra thanh toán thất bại
        if (paymentStatus != 1) {
            System.out.println("Payment FAILED - Status: " + paymentStatus);
            // Thanh toán thất bại - xóa session
            clearVnpaySessionAttributes(session);
            return "/VNP/orderfaildn";
        }

        // Lấy thông tin từ SESSION thay vì cookie
        String email = (String) session.getAttribute("vnpay_email");
        String nguoiNhan = (String) session.getAttribute("vnpay_nguoiNhan");
        String sdt = (String) session.getAttribute("vnpay_sdt");
        String tinh = (String) session.getAttribute("vnpay_tinh");
        String xa = (String) session.getAttribute("vnpay_xa");
        String diaChi = (String) session.getAttribute("vnpay_diaChi");
        String note = (String) session.getAttribute("vnpay_note");
        String maGHCTs = (String) session.getAttribute("vnpay_maGHCTs");

        System.out.println("=== Session Read Debug ===");
        System.out.println("Email: " + email);
        System.out.println("NguoiNhan: " + nguoiNhan);
        System.out.println("SDT: " + sdt);
        System.out.println("maGHCTs: " + maGHCTs);

        // Kiểm tra dữ liệu
        System.out.println("=== Data Validation ===");
        System.out.println("maGHCTs is null or empty: " + (maGHCTs == null || maGHCTs.isEmpty()));

        if (maGHCTs == null || maGHCTs.isEmpty()) {
            System.out.println("ERROR: maGHCTs is null or empty - returning fail page");
            clearVnpaySessionAttributes(session);
            return "/VNP/orderfaildn";
        }

        List<Long> listMaGHCT = Arrays.stream(maGHCTs.split(","))
                .map(Long::parseLong)
                .collect(Collectors.toList());

        System.out.println("listMaGHCT size: " + listMaGHCT.size());

        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        System.out.println("=== Session Debug ===");
        System.out.println("KhachHang from session: " + (khachHang != null ? khachHang.getMaKhachHang() : "NULL"));

        if (khachHang == null) {
            System.out.println("ERROR: KhachHang is null - redirecting to index");
            clearVnpaySessionAttributes(session);
            return "redirect:/index";
        }

        NhanVien nhanVienMD = nhanVienRepository.getReferenceById(1L);

        // Tạo hóa đơn
        HoaDon hoaDon = HoaDon.builder()
                .khachHang(khachHang)
                .nguoiNhan(nguoiNhan)
                .sdt(sdt)
                .diaChi(diaChi)
                .tinh(tinh)
                .xa(xa)
                .nhanVien(nhanVienMD)
                .ghiChu(note)
                .ngayTao(new java.util.Date())
                .ngayThanhToan(new java.util.Date())
                .createdDate(new java.util.Date())
                .lastUpdate(new java.util.Date())
                .loaiThanhToan(1) // VNPay
                .trangThai(0)
                .build();

        hoaDonRepository.save(hoaDon);
        BigDecimal tongTien = BigDecimal.ZERO;

        // Tạo hóa đơn chi tiết
        for (Long maGHCT : listMaGHCT) {
            GioHangChiTiet ghct = gioHangChiTietService.getByMa(maGHCT);
            if (ghct == null)
                continue;

            ChiTietSanPham ctsp = ghct.getChiTietSanPham();

            // Lấy giá (ưu tiên giảm giá)
            GiamGiaChiTietSanPham gg = giamGiaCTSPRepository.findByChiTietSanPham(ctsp);

            BigDecimal donGia = (gg != null) ? gg.getGiaSauKhiGiam() : ctsp.getGiaBan();

            HoaDonChiTiet hdct = HoaDonChiTiet.builder()
                    .hoaDon(hoaDon)
                    .chiTietSanPham(ctsp)
                    .soLuongMua(ghct.getSoLuong())
                    .createdDate(new java.util.Date())
                    .lastUpdate(new java.util.Date())
                    .giaTien(donGia)
                    .trangThai(1)
                    // .imei("12345678")
                    .build();

            hoaDonChiTietRepository.save(hdct);
            tongTien = tongTien.add(donGia.multiply(BigDecimal.valueOf(ghct.getSoLuong())));

            // Trừ kho
            ctsp.setSoLuongNhap(ctsp.getSoLuongNhap() - ghct.getSoLuong());
            chiTietSanPhamRepository.save(ctsp);

            // Xóa khỏi giỏ
            gioHangChiTietRepository.delete(ghct);
        }

        // Update tổng tiền
        hoaDon.setTongTien(tongTien);
        hoaDonRepository.save(hoaDon);

        // Gửi email xác nhận
        if (email != null && !email.isEmpty()) {
            hoaDonService.sendEmailWithAttachment(email);
        }

        // Xóa session attributes
        clearVnpaySessionAttributes(session);

        System.out.println("Payment SUCCESS - Showing success page");

        // Hiển thị trang thành công (sẽ tự động chuyển về /index sau 2 giây)
        return "/VNP/ordersuccess";
    }

    private void clearVnpayCookies(HttpServletResponse response) {
        String[] cookieNames = { "vnpay_email", "vnpay_nguoiNhan", "vnpay_sdt", "vnpay_tinh",
                "vnpay_xa", "vnpay_diaChi", "vnpay_note", "vnpay_maGHCTs" };
        for (String name : cookieNames) {
            Cookie cookie = new Cookie(name, null);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    private void clearVnpaySessionAttributes(HttpSession session) {
        String[] attributeNames = { "vnpay_email", "vnpay_nguoiNhan", "vnpay_sdt", "vnpay_tinh",
                "vnpay_xa", "vnpay_diaChi", "vnpay_note", "vnpay_maGHCTs" };
        for (String name : attributeNames) {
            session.removeAttribute(name);
        }
        System.out.println("Cleared VNPay session attributes");
    }
}
