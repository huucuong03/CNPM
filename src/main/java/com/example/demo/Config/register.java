package com.example.demo.Config;

import com.example.demo.Dto.HoaDonChiTietDTO;
import com.example.demo.Dto.Request.KhachHangRequest;
import com.example.demo.Dto.SupportOrderItemDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Repository.vi.GiaoDichViRepository;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.*;
import com.oracle.wls.shaded.org.apache.xpath.operations.Equals;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

//@RestController
@Controller
//@RequestMapping("/dang-ky")
public class register {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private SupportService supportService;

    @Autowired
    private WarrantyImageRepository warrantyImageRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private GioHangService gioHangService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private GiaoDichViRepository giaoDichViRepository;

    @Autowired
    private WarrantyRequestRepository warrantyRequestRepository;

    @Autowired
    private WarrantyRequestLogRepository warrantyRequestLogRepository;
    @Autowired
    private WarrantyStatusRepository warrantyStatusRepository;
    @Autowired
    private HoaDonChiTietService hoaDonChiTietService;

    @Autowired
    private ViShopRepository viShopRepository;
    @Autowired
    private DiaChiService diaChiService;

    @PostMapping("/them")
    public ResponseEntity<?> them(@RequestBody
                                          KhachHangRequest khachHangRequest) {
        return khachHangService.them(khachHangRequest);
    }

    @GetMapping("/dang-ky")
    public String dang_ky() {
        return "/dangky";
    }

    @PostMapping("/RegistrationForm")
    public String dangKy(Model model, HttpServletRequest request, HttpSession session) {

        String ten = request.getParameter("nguoiNhan");
        String diaChi = "";
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String cccd = "";

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate parsedDate = LocalDate.parse(request.getParameter("ngaySinh"), dtf);
        java.sql.Date sqlDate = java.sql.Date.valueOf(parsedDate);

        KhachHang khachHang = new KhachHang();
        khachHang.setTen(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(matKhau);
        khachHang.setCccd(cccd);
        khachHang.setNgaySinh(sqlDate);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
        khachHang.setTrangThai(1);
        khachHang.setGioiTinh(true);

        // Ngày tạo tài khoản = thời gian hiện tại
        khachHang.setCreatedDate(new Timestamp(System.currentTimeMillis()));

        // Lưu DB
        khachHangRepository.save(khachHang);

        // Gửi mail
        emailService.sendRegistrationSuccessEmail(email);

        // Tạo giỏ hàng
        GioHang gioHang = new GioHang();
        gioHang.setKhachHang(KhachHang.builder().maKhachHang(khachHang.getMaKhachHang()).build());
        gioHang.setTrangThai(1);
        gioHangRepository.save(gioHang);

        // Tạo ví
        ViShop viShop = new ViShop();
        viShop.setKhachHang(KhachHang.builder().maKhachHang(khachHang.getMaKhachHang()).build());
        viShop.setTongTien(BigDecimal.ZERO);
        viShop.setTrangThai(1);
        viShopRepository.save(viShop);

        // 👉 Lưu session đăng nhập ngay sau khi đăng ký
        session.setAttribute("khachHang", khachHang);

        // 👉 Chuyển sang trang Index (Trang chủ)
        return "redirect:/index";
    }


    @GetMapping("/detailKh")
    public String detailKhSession(Model model, HttpSession session) {
    KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");

    if (khachHang == null) {
        return "redirect:/loginView";
    }

    model.addAttribute("kh", khachHang);
    model.addAttribute("ngaySinh", khachHang.getNgaySinh());

    List<HoaDon> listHD = hoaDonService.getAllBykhachHang(khachHang);
    model.addAttribute("listHD", listHD);

    Map<Integer, List<HoaDon>> hoaDonTheoTrangThai = new HashMap<>();
    for (int trangThai = 0; trangThai <= 3; trangThai++) {
        List<HoaDon> ds = hoaDonService.findByKhachHangAndTrangThai(khachHang.getMaKhachHang(), trangThai);
        hoaDonTheoTrangThai.put(trangThai, ds);
    }
    model.addAttribute("hoaDonTheoTrangThai", hoaDonTheoTrangThai);

    // Lấy chi tiết sản phẩm đắt nhất của từng hóa đơn
     Map<Long, HoaDonChiTiet> sanPhamDacNhat = new HashMap<>();
     for (HoaDon hd : listHD) {
         List<HoaDonChiTiet> chiTiets = hoaDonChiTietService.getByHoaDon(hd);
         HoaDonChiTiet maxCt = chiTiets.stream()
                 .max(Comparator.comparing(HoaDonChiTiet::getGiaTien))
                 .orElse(null);
         sanPhamDacNhat.put(hd.getMaHoaDon(), maxCt);
     }
     model.addAttribute("sanPhamDacNhat", sanPhamDacNhat);
    // Lấy chi tiết tất cả sản phẩm (nếu cần)
    Map<Long, Integer> DSSP = new HashMap<>();
    List<SanPham> listSanPham = new ArrayList<>();
    for (HoaDon hd : listHD) {
        List<HoaDonChiTiet> chiTiets = hoaDonChiTietService.getByHoaDon(hd);
        for (HoaDonChiTiet ct : chiTiets) {
            listSanPham.add(ct.getChiTietSanPham().getSanPham());
            DSSP.put(ct.getChiTietSanPham().getMaChiTietSanPham(), ct.getSoLuongMua());
        }
    }
    model.addAttribute("listSanPhamHoaDon", listSanPham);
    model.addAttribute("DSSP", DSSP);

    ViShop viShop = viShopRepository.getByKhachHang(khachHang);
    model.addAttribute("viShop", viShop);
    if (viShop != null) {
        model.addAttribute("gdVi", giaoDichViRepository.getByViShopAndTrangThai(viShop, 1));
    }

    String addThanhCong = (String) session.getAttribute("napThanhCong");
    String addThatBai = (String) session.getAttribute("napThatBai");
    if (addThanhCong != null) model.addAttribute("themThanhCong", "2");
    if (addThatBai != null) model.addAttribute("themThatBai", "2");
    session.removeAttribute("napThanhCong");
    session.removeAttribute("napThatBai");

    model.addAttribute("currentTab", "default");
    model.addAttribute("bodyPage", "/WEB-INF/views/detail/body/bodyDefault.jsp");
    return "detail/detailKH";
}

    @GetMapping("/detailKh/order")
    public String detailKhOrder(
            Model model,
            HttpSession session,
            @RequestParam(value = "trangThai", required = false, defaultValue = "4") int trangThai,
            @RequestParam(value = "startDate", required = false, defaultValue = "01/12/2020") String startDateStr,
            @RequestParam(value = "endDate", required = false) String endDateStr
    ) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) return "redirect:/loginView";

        // Set endDate = hôm nay nếu không truyền vào
        if (endDateStr == null || endDateStr.isEmpty()) {
            endDateStr = LocalDate.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        // Lấy tất cả hóa đơn
        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(khachHang);

        // Lọc theo trạng thái (4 = tất cả)
        if (trangThai != 4) {
            listHD = listHD.stream()
                    .filter(hd -> hd.getTrangThai() == trangThai)
                    .collect(Collectors.toList());
        }

        // Lọc theo ngày
        listHD = listHD.stream()
                .filter(hd -> {
                    LocalDate ngayTao = hd.getNgayTao().toInstant()
                            .atZone(ZoneId.systemDefault())
                            .toLocalDate();
                    return (ngayTao.isEqual(startDate) || ngayTao.isAfter(startDate))
                            && (ngayTao.isEqual(endDate) || ngayTao.isBefore(endDate));
                })
                .collect(Collectors.toList());

        // Lấy sản phẩm đặc nhất trong mỗi hóa đơn
        Map<Long, HoaDonChiTiet> sanPhamDacNhat = new HashMap<>();
        for (HoaDon hd : listHD) {
            List<HoaDonChiTiet> chiTiets = hoaDonChiTietService.getByHoaDon(hd);
            HoaDonChiTiet maxCt = chiTiets.stream()
                    .max(Comparator.comparing(HoaDonChiTiet::getGiaTien))
                    .orElse(null);
            sanPhamDacNhat.put(hd.getMaHoaDon(), maxCt);
        }

        model.addAttribute("sanPhamDacNhat", sanPhamDacNhat);
        model.addAttribute("listHD", listHD);
        model.addAttribute("bodyPage", "/WEB-INF/views/detail/body/bodyHoaDon.jsp");
        model.addAttribute("currentTab", "order");
        model.addAttribute("trangThai", trangThai);

        // Gửi giá trị lại lên view để hiển thị trong input
        model.addAttribute("startDate", startDateStr);
        model.addAttribute("endDate", endDateStr);

        return "detail/detailKH";
    }

    @GetMapping("detailKh/warranty")
    public String hoTroSauMua(HttpSession session, Model model,
                              @RequestParam(defaultValue = "0") int page,       // trang hiện tại
                              @RequestParam(defaultValue = "15") int size ) {

        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        if (kh == null) {
            return "redirect:/login";
        }
        Pageable pageable = PageRequest.of(0, 15, Sort.by("hoaDon.ngayTao").descending());
        List<SupportOrderItemDTO> items = supportService.getHoTro(kh.getMaKhachHang(),pageable);


        for (SupportOrderItemDTO item : items) {

            boolean daGuiDoiTra =
                    warrantyRequestRepository.existsByMaHoaDonChiTietAndMaType(
                            item.getMaHoaDonChiTiet(), 1L
                    );

            boolean daGuiBaoHanh =
                    warrantyRequestRepository.existsByMaHoaDonChiTietAndMaType(
                            item.getMaHoaDonChiTiet(), 2L
                    );
            WarrantyRequest doiTra = warrantyRequestRepository
                    .findByMaHoaDonChiTietAndMaType(item.getMaHoaDonChiTiet(), 1L)
                    .orElse(null);

            WarrantyRequest baoHanh = warrantyRequestRepository
                    .findByMaHoaDonChiTietAndMaType(item.getMaHoaDonChiTiet(), 2L)
                    .orElse(null);

            item.setMoTaTrangThaiDoiTra(doiTra != null ? doiTra.getTrangThai().getMoTa() : null);
            item.setMoTaTrangThaiBaoHanh(baoHanh != null ? baoHanh.getTrangThai().getMoTa() : null);

            // QUYỀN CUỐI CÙNG
            item.setDaGuiDoiTra(daGuiDoiTra);
            item.setDaGuiBaoHanh(daGuiBaoHanh);
        }
        // Nhóm theo hóa đơn
        Map<Long, List<SupportOrderItemDTO>> mapHD = items.stream()
                .collect(Collectors.groupingBy(SupportOrderItemDTO::getMaHoaDon));

        model.addAttribute("mapHD", mapHD);
        model.addAttribute("currentTab", "warranty");
        model.addAttribute("bodyPage","/WEB-INF/views/detail/body/bodyWarranty.jsp");

        return "detail/detailKH";
    }

    @PostMapping("/detailKh/warranty/return")
    public String createWarrantyRequest(
            @RequestParam Long maHoaDonChiTiet,
            @RequestParam Long maChiTietSanPham,
            @RequestParam Long maDiaChi,
            @RequestParam Long type,
            @RequestParam String phuongThuc,
            @RequestParam String tenKhachHang,
            @RequestParam String sdtKhachHang,
            @RequestParam String reason,
            HttpSession session,
            RedirectAttributes redirectAttributes,
            @RequestParam("images") MultipartFile[] images
    ) {
        boolean existed = warrantyRequestRepository
                .existsByMaHoaDonChiTietAndMaType(maHoaDonChiTiet, type);

        if (existed) {
            redirectAttributes.addFlashAttribute("errorMessage", "Yêu cầu đã được gửi trước đó");
            return "redirect:/detailKh/warranty";
        }
        if (tenKhachHang == null || tenKhachHang.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Tên khách hàng không được để trống");
            return "redirect:/detailKh/warranty";
        }
        if (images == null || images.length == 0) {
            redirectAttributes.addFlashAttribute("errorMessage", "Vui lòng chọn ảnh sản phẩm lỗi");
            return "redirect:/detailKh/warranty";
        }
        if (sdtKhachHang == null || sdtKhachHang.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "So dien thoai hàng không được để trống");
            return "redirect:/detailKh/warranty";
        }
        if (phuongThuc == null || phuongThuc.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Phương thức không được để trống");
            return "redirect:/detailKh/warranty";
        }
        if (reason == null || reason.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Lý do không được để trống");
            return "redirect:/detailKh/warranty";
        }

        try {
            KhachHang kh = (KhachHang) session.getAttribute("khachHang");
            WarrantyStatus status = warrantyStatusRepository.findById(1L).orElseThrow(() -> new RuntimeException("Không tìm thấy trạng thái với id 1"));
            // 1️⃣ Tạo đối tượng WarrantyRequest
            WarrantyRequest wr = new WarrantyRequest();
            wr.setMaHoaDonChiTiet(maHoaDonChiTiet);
            wr.setMaChiTietSanPham(maChiTietSanPham);
            wr.setMaKhachHang(kh.getMaKhachHang());
            wr.setMaType(type); // 1 = đổi trả
            wr.setTrangThai(status);
            wr.setMaDiaChi(maDiaChi);
            wr.setPhuongThuc(phuongThuc);
            wr.setTenKhachHang(tenKhachHang);
            wr.setSdtKhachHang(sdtKhachHang);
            wr.setReason(reason);
            WarrantyRequest savedWr = warrantyRequestRepository.save(wr);
            if (images != null && images.length > 0) {
                for (MultipartFile file : images) {
                    if (file.isEmpty()) continue;

                    // 1️⃣ Tạo tên file
                    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

                    // 2️⃣ Xác định thư mục lưu (theo type)
                    String folder = (type == 1) ? "return" : "";
                    Path uploadPath = Paths.get("uploads/warranty", folder);

                    // 3️⃣ Tạo thư mục nếu chưa tồn tại
                    if (!Files.exists(uploadPath)) {
                        Files.createDirectories(uploadPath);
                    }

                    // 4️⃣ Copy file vào thư mục
                    Path filePath = uploadPath.resolve(fileName);
                    Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                    // 5️⃣ Tạo entity ảnh và lưu vào DB
                    WarrantyImage img = new WarrantyImage();
                    img.setDuongDan("src/main/webapp/img/uploads/warranty/" + (folder.isEmpty() ? "" : folder + "/") + fileName);
                    img.setWarrantyRequest(wr); // wr là đối tượng WarrantyRequest
                    warrantyImageRepository.save(img);
                }
            }
            // 4️⃣ Tạo log sau khi đã có MaBaoHanh
            WarrantyRequestLog log = new WarrantyRequestLog();
            log.setWarrantyRequest(savedWr); // savedWr là entity đã save
            log.setOldTrangThai(null); // lần đầu tạo
            log.setNewTrangThai(savedWr.getTrangThai()); // lấy từ WarrantyRequest
            if(type==1){
                log.setGhiChu("Khách hàng tạo yêu cầu đổi trả");
                redirectAttributes.addFlashAttribute("successMessage", "Tạo yêu cầu đổi trả thành công!");
            }
            else {
                log.setGhiChu("Khách hàng tạo yêu cầu bảo hành");
                redirectAttributes.addFlashAttribute("successMessage", "Tạo yêu cầu bảo hành thành công!");
            }
            log.setLoaiNguoiXuLy("KHACHHANG");
            log.setMaNguoiXuLy(savedWr.getMaKhachHang());
            warrantyRequestLogRepository.save(log);

            return "redirect:/detailKh/warranty";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Tạo yêu cầu đổi trả thất bại!");
            return "redirect:/detailKh/warranty";
        }
    }



    @GetMapping("/detailKh/hoadon/{maHoaDon}")
    public String chiTietHoaDon(@PathVariable("maHoaDon") Long maHoaDon, Model model) {
        HoaDonChiTietDTO hoaDonChiTiet = hoaDonService.detailHoaDon(maHoaDon);
        System.out.println(hoaDonChiTiet);
        model.addAttribute("hoaDonChiTiet", hoaDonChiTiet);
        model.addAttribute("bodyPage", "/WEB-INF/views/detail/body/bodyHoaDonChiTiet.jsp");
        return "detail/detailKH";
    }
    @GetMapping("/detailKh/userinfo")
    public String chiTietKhachHang( Model model,
                                    HttpSession session) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) return "redirect:/loginView";
        List<DiaChi> listDiaChi = diaChiService.getAllByKhachHang(khachHang.getMaKhachHang());
        model.addAttribute("khanhHang", khachHang);
        model.addAttribute("listDiaChi", listDiaChi);
        model.addAttribute("currentTab", "userinfo");
        model.addAttribute("bodyPage", "/WEB-INF/views/detail/body/bodyUserInfor.jsp");
        return "detail/detailKH";
    }

    @PostMapping("/detailKh/userinfo")
    public String capNhatThongTinKhachHang(
            @RequestParam("name") String tenKhachHang,
            @RequestParam("gender") String gioiTinhStr,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes
    ) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) {
            return "redirect:/loginView";
        }

        khachHang.setTen(tenKhachHang);

        // Chuyển string sang Boolean
        if (",1".equals(gioiTinhStr)) {
            khachHang.setGioiTinh(true);
        } else if ("true,0".equals(gioiTinhStr)) {
            khachHang.setGioiTinh(false);
        } else {
            khachHang.setGioiTinh(null); // nếu chưa chọn
        }
        khachHang.setLastUpdate(new Date());
        khachHangRepository.save(khachHang);
        session.setAttribute("khachHang", khachHang);
        model.addAttribute("currentTab", "userinfo");
        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công!");
        return "redirect:/detailKh/userinfo";
    }
    @PostMapping("/detailKh/userinfo/change-password")
    public String  changePassword(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {

        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");

        if (!oldPassword.equals(khachHang.getMatKhau())) {
            model.addAttribute("currentTab", "userinfo");
            redirectAttributes.addFlashAttribute("errorMessage", "Mật khẩu cũ không đúng!");
            return "redirect:/detailKh/userinfo";
        }

        // Kiểm tra mật khẩu mới hợp lệ
        if (!newPassword.matches("^(?=.*[A-Za-z])(?=.*\\d).{6,}$")) {
            model.addAttribute("currentTab", "userinfo");
            redirectAttributes.addFlashAttribute("errorMessage", "Mật khẩu mới không hợp lệ!");
            return "redirect:/detailKh/userinfo";
        }

        // Kiểm tra nhập lại mật khẩu
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("currentTab", "userinfo");
            redirectAttributes.addFlashAttribute("errorMessage", "Mật khẩu mới không khớp!");
            return "redirect:/detailKh/userinfo";
        }

        khachHang.setMatKhau(newPassword);
        khachHangRepository.save(khachHang);
        model.addAttribute("currentTab", "userinfo");
        redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công!");
        session.setAttribute("khachHang", khachHang);
        return "redirect:/detailKh/userinfo";
    }
    @PostMapping("/detailKh/userinfo/diachi/add")
    public String themDiaChi(
            @RequestParam String tinh,
            @RequestParam String xa,
            @RequestParam String diaChiNha,
            @RequestParam String tenDiaChi,
            @RequestParam String loaiDiaChi,
            @RequestParam Boolean macDinh,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes
    ) {
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        if (kh == null) return "redirect:/loginView";
        DiaChi dc = new DiaChi();
        dc.setCreateDate(new Date());
        dc.setDiaChiNha(diaChiNha);
        dc.setKhachHang(kh);
        dc.setLastUpdate(new Date());
        boolean typeValue = loaiDiaChi.equals("home") ? false : true;
        dc.setLoaiDiaChi(typeValue);
        dc.setMacDinh(macDinh);
        if (macDinh) {
            diaChiService.unsetAllDefaultByKhachHang(kh.getMaKhachHang());
            String fullDiaChi = diaChiNha + ", "
                    + xa + ", "
                    + tinh;
            kh.setDiaChi(fullDiaChi);
            khachHangRepository.save(kh);
            dc.setMacDinh(true);
        } else {
            dc.setMacDinh(false);
        }

        dc.setTenDiaChi(tenDiaChi);
        dc.setTinh(tinh);
        dc.setXa(xa);
        diaChiService.save(dc);
        model.addAttribute("currentTab", "userinfo");
        redirectAttributes.addFlashAttribute("successMessage", "Thêm địa chỉ thành công!");
        return "redirect:/detailKh/userinfo";
    }
    @PostMapping("/detailKh/userinfo/diachi/delete")
    @ResponseBody
    public Map<String, Object> xoaDiaChi(@RequestParam Long maDiaChi, HttpSession session,RedirectAttributes redirectAttributes) {
        Map<String, Object> result = new HashMap<>();

        // Lấy Khách hàng từ session
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");

        try {
            // Kiểm tra địa chỉ có thuộc khách hàng này không
            DiaChi diaChi = diaChiService.findById(maDiaChi);
            if (diaChi == null || !diaChi.getKhachHang().getMaKhachHang().equals(kh.getMaKhachHang())) {
                redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy địa chỉ hoặc không thuộc bạn!");
                return result;
            }
            diaChiService.delete(maDiaChi);
            redirectAttributes.addFlashAttribute("successMessage", "Thêm địa chỉ thành công!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Xảy ra lỗi khi xóa địa chỉ!");
            e.printStackTrace();
        }
        return result;
    }

    @GetMapping("/detailKh/userinfo/diachi/get")
    public ResponseEntity<DiaChi> getDiaChiById(@RequestParam Long maDiaChi) {
        DiaChi diaChi = diaChiService.findById(maDiaChi);
        if(diaChi == null){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(diaChi);
    }
    @PostMapping("/detailKh/userinfo/diachi/edit/{maDiaChi}")
    public String suaDiaChi(
            @PathVariable("maDiaChi") Long maDiaChi,
            @RequestParam String tinh,
            @RequestParam String xa,
            @RequestParam String diaChiNha,
            @RequestParam String tenDiaChi,
            @RequestParam String loaiDiaChi,
            @RequestParam Boolean macDinh,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes
    ) {
        DiaChi dc = diaChiService.findById(maDiaChi);
        if(dc == null) {
            return "redirect:/detailKh/userinfo/diachi?error=notfound";
        }
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        dc.setCreateDate(new Date());
        dc.setDiaChiNha(diaChiNha);
        dc.setLastUpdate(new Date());
        boolean typeValue = loaiDiaChi.equals("home") ? false : true;
        dc.setLoaiDiaChi(typeValue);
        dc.setMacDinh(macDinh);
        if (macDinh) {
            diaChiService.unsetAllDefaultByKhachHang(kh.getMaKhachHang());
            String fullDiaChi = diaChiNha + ", "
                    + xa + ", "
                    + tinh;
            kh.setDiaChi(fullDiaChi);
            khachHangRepository.save(kh);
            dc.setMacDinh(true);
        } else {
            dc.setMacDinh(false);
        }

        dc.setTenDiaChi(tenDiaChi);
        dc.setTinh(tinh);
        dc.setXa(xa);
        diaChiService.save(dc);
        model.addAttribute("currentTab", "userinfo");
        redirectAttributes.addFlashAttribute("successMessage", "Sửa địa chỉ thành công!");
        return "redirect:/detailKh/userinfo";
    }

    @PostMapping("/api/detailKh/order")
    @ResponseBody
    public Map<String, Object> filterOrdersAjax(
            HttpSession session,
            @RequestBody Map<String, String> params
    ) {
        KhachHang khachHang = (KhachHang) session.getAttribute("khachHang");
        if (khachHang == null) return Map.of("error", "unauthorized");

        int trangThai = Integer.parseInt(params.get("trangThai"));
        String startDateStr = params.get("startDate");
        String endDateStr = params.get("endDate");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDate startDate = LocalDate.parse(startDateStr, formatter);
        LocalDate endDate = LocalDate.parse(endDateStr, formatter);

        List<HoaDon> listHD = hoaDonService.getAllBykhachHang(khachHang);

        // lọc trạng thái
        if (trangThai != 4) {
            listHD = listHD.stream()
                    .filter(hd -> hd.getTrangThai() == trangThai)
                    .collect(Collectors.toList());
        }

        // lọc ngày
        listHD = listHD.stream()
                .filter(hd -> {
                    LocalDate ngayTao = hd.getNgayTao().toInstant()
                            .atZone(ZoneId.systemDefault())
                            .toLocalDate();
                    return !ngayTao.isBefore(startDate) && !ngayTao.isAfter(endDate);
                })
                .collect(Collectors.toList());

        // ⭐ Lấy SP có giá cao nhất trong từng hóa đơn
        Map<Long, HoaDonChiTiet> sanPhamDacNhat = new HashMap<>();
        for (HoaDon hd : listHD) {
            List<HoaDonChiTiet> chiTiets = hoaDonChiTietService.getByHoaDon(hd);
            HoaDonChiTiet maxCt = chiTiets.stream()
                    .max(Comparator.comparing(HoaDonChiTiet::getGiaTien))
                    .orElse(null);

            sanPhamDacNhat.put(hd.getMaHoaDon(), maxCt);
        }

        // ⭐ Trả về cả hóa đơn và sản phẩm max của từng hóa đơn
        return Map.of(
                "data", listHD,
                "sanPhamMax", sanPhamDacNhat
        );
    }

//    @PostMapping("/order/buy-again")
//    @ResponseBody
//    public ResponseEntity<?> buyAgain(
//            @RequestBody Map<String, Object> payload,
//            HttpSession session
//    ) {
//        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
//        if (kh == null) {
//            return ResponseEntity.status(401)
//                    .body(Map.of("success", false, "message", "Vui lòng đăng nhập"));
//        }
//
//        Long maDonHang = Long.valueOf(payload.get("maDonHang").toString());
//
//        HoaDon donHang = hoaDonService.getByMa(maDonHang);
//        if (donHang == null || !donHang.getKhachHang().getMaKhachHang().equals(kh.getMaKhachHang())) {
//            return ResponseEntity.badRequest()
//                    .body(Map.of("success", false, "message", "Đơn hàng không hợp lệ"));
//        }
//
//        GioHang gioHang = gioHangService.getByKhachHang(kh);
//        List<Long> maGHCTs = new ArrayList<>();
//
//        for (HoaDonChiTiet dhct : donHang) {
//
//            ChiTietSanPham ctsp = dhct.getChiTietSanPham();
//
//            // ❗ check còn bán / còn tồn
//            if (ctsp.getTrangThai() != 1) continue;
//
//            GioHangChiTiet ghct = gioHangChiTietRepository.getByChiTietSanPhamAndGioHang(ctsp, gioHang);
//
//            if (ghct == null) {
//                ghct = new GioHangChiTiet();
//                ghct.setChiTietSanPham(ctsp);
//                ghct.setGioHang(gioHang);
//                ghct.setSoLuong(dhct.getSoLuong());
//                ghct.setTrangThai(1);
//            } else {
//                ghct.setSoLuong(ghct.getSoLuong() + dhct.getSoLuong());
//            }
//
//            gioHangChiTietRepository.save(ghct);
//            maGHCTs.add(ghct.getMaGHCT());
//        }
//
//        return ResponseEntity.ok(Map.of(
//                "success", true,
//                "maGHCTs", maGHCTs
//        ));
//    }


    @PostMapping("/update/{maKhachHang}")
    public String update(Model model, @PathVariable(name = "maKhachHang") Long maKhachHang, HttpServletRequest request) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        String ten = request.getParameter("nguoiNhan");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");
        String cccd = request.getParameter("cccd");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String ns = request.getParameter("ngaySinh");
        LocalDate parsedDate = LocalDate.parse(ns, dtf);
        java.sql.Date sqlDate = java.sql.Date.valueOf(parsedDate);

        khachHang.setTen(ten);
        khachHang.setEmail(email);
        khachHang.setMatKhau(matKhau);
        khachHang.setCccd(cccd);
        khachHang.setNgaySinh(sqlDate);
        khachHang.setSdt(sdt);
        khachHang.setDiaChi(diaChi);
        khachHang.setTrangThai(1);
        khachHangRepository.save(khachHang);
        model.addAttribute("kh", khachHang);
        return "/login";
    }

    @GetMapping("contact")
    public String hienthiContent() {
        return "contact";
    }

    @GetMapping("blog")
    public String hienthiBlog() {
        return "blog";
    }

    @GetMapping("contact1/{maKhachHang}")
    public String hienthiContentDN(Model model,@PathVariable(name = "maKhachHang") Long maKhachHang) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHang);
        return "contactDN";
    }

    @GetMapping("blog1/{maKhachHang}")
    public String hienthiBlogDN(Model model,@PathVariable(name = "maKhachHang") Long maKhachHang) {
        KhachHang khachHang = khachHangService.getByMa(maKhachHang);
        model.addAttribute("kh", khachHang);
        return "blogDN";
    }


    @PostMapping("/check-email")
    public ResponseEntity<Map<String, Boolean>> checkEmail(@RequestBody Map<String, String> payload) {
        String email = payload.get("email");
        boolean exists = khachHangRepository.existsByEmail(email);

        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);

        return ResponseEntity.ok(response);
    }

    @GetMapping("test")
    public String hienthiT() {
        return "VNP/orderfail";
    }
}
