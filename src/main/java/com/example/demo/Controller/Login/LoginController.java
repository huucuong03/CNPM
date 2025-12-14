package com.example.demo.Controller.Login;

import com.example.demo.Dto.ChiTietSanPhamDTO;
import com.example.demo.Dto.SanPhamGiamGiaDTO;
import com.example.demo.Dto.SanPhamHTDTO;
import com.example.demo.Entity.*;
import com.example.demo.Repository.*;
import com.example.demo.Repository.vi.ViShopRepository;
import com.example.demo.Service.ChiTietSanPhamService;
import com.example.demo.Service.KhachHangService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("")
public class LoginController {

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private ChiTietSanPhamService chiTietSanPhamService;
    @Autowired
    private NhanVienRepository nhanVienRepository;

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private ChucVuRepository chucVuRepository;

    @Autowired
    private DanhGiaRepository danhGiaRepository;

    @Autowired
    private ViShopRepository viShopRepository;

    @GetMapping("/loginView")
    public String clientLogin(HttpServletResponse response) {
        Cookie cookie = new Cookie("makhachhang", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "login";
    }
    @PostMapping("/login")
    public String loginSubmit(@RequestParam("Email") String email,
                              @RequestParam("Password") String pass,
                              Model model,
                              HttpSession session) {

        try {
            if(email == null || email.trim().isEmpty() || pass == null || pass.trim().isEmpty()) {
                model.addAttribute("error", "Email hoặc mật khẩu không được để trống!");
                return "login"; // Trở lại trang login + hiển thị lỗi
            }
            KhachHang kh = khachHangService.getKhachHangByEmailAndAndMatKhau(email, pass);

            if (kh == null) {
                model.addAttribute("error", "Email hoặc mật khẩu không đúng!");
                return "login"; // Trở lại trang login + hiển thị lỗi
            }

            // Lưu thông tin khách hàng vào session
            session.setAttribute("khachHang", kh);
            model.addAttribute("message", "Đăng nhập thành công!");
            return "redirect:/index"; // Đăng nhập thành công
        }
        catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra, vui lòng thử lại!");
            return "login";
        }
    }

    //Chưa đăng nhập
    @GetMapping("/home")
    public String home(Model model) {
        List<ChiTietSanPhamDTO> ctsp = chiTietSanPhamRepository.findAllNotGiamGiaTrangChu();
        List<SanPhamHTDTO> listgg = chiTietSanPhamRepository.findAllSanPhamGiamGia();
        model.addAttribute("ctsp", ctsp);
        model.addAttribute("ctsps", listgg);
        return "page/home";
    }


    //Đã đăng nhập
    @GetMapping("/home_clients/{maKhachHang}")
    public String home(@PathVariable("maKhachHang") Long maKhachHang, Model model) {
        KhachHang kh = khachHangService.getByMa(maKhachHang);
        ViShop viShop = viShopRepository.getByKhachHang(kh);
        List<ChiTietSanPhamDTO> ctsp = chiTietSanPhamRepository.findAllNotGiamGiaTrangChu();
        List<SanPhamHTDTO> listgg = chiTietSanPhamRepository.findAllSanPhamGiamGia();
        model.addAttribute("ctsp", ctsp);
        model.addAttribute("ctspgg", listgg);
        model.addAttribute("viShop", viShop);
        model.addAttribute("kh", kh);
//        model.addAttribute("ctsp", ctsp);
        return "page/home";
    }


    @PostMapping("/ClientLogin")
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("userName");
        String pass = request.getParameter("passWord");
        KhachHang khachHang = khachHangService.getKhachHangByEmailAndAndMatKhau(email, pass);
        NhanVien nhanVien = nhanVienRepository.getByEmailAndMatKhau(email, pass);

        if (khachHang == null && nhanVien == null) {
            model.addAttribute("checkLogin", 1);
            return "/login";
        } else {
            if (khachHang != null) {
                // Lưu thông tin khách hàng vào cookie
                Cookie cookie = new Cookie("makhachhang", String.valueOf(khachHang.getMaKhachHang()));
                cookie.setMaxAge(36000); // Thời gian sống của cookie (đơn vị là giây), ở đây là 1 giờ
                response.addCookie(cookie);
                request.getSession().setAttribute("khachHang", khachHang);
                List<ChiTietSanPhamDTO> ctsp = chiTietSanPhamRepository.findAllNotGiamGiaTrangChu();
                List<SanPhamHTDTO> listgg = chiTietSanPhamRepository.findAllSanPhamGiamGia();
                model.addAttribute("ctsp", ctsp);
                model.addAttribute("ctspgg", listgg);
                return "page/index";
            } else {
                // Lưu thông tin nhân viên vào cookie (adjust the attributes accordingly)
                Cookie cookie = new Cookie("manhanvien", String.valueOf(nhanVien.getMaNhanVien()));
                cookie.setMaxAge(36000); // Thời gian sống của cookie (đơn vị là giây), ở đây là 1 giờ
                response.addCookie(cookie);

                model.addAttribute("nhanVien", nhanVien);
                if (nhanVien.getChucVu().getMaChucVu() == 1) {
                    return "Admin/doc/phan-mem-ban-hang";
                }
                return "Admin/doc/Home";
            }
        }
    }
}
