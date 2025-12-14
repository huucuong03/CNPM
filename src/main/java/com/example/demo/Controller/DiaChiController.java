package com.example.demo.Controller;

import com.example.demo.Entity.DiaChi;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Service.DiaChiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/diachi")
public class DiaChiController {

    @Autowired
    private DiaChiService diaChiService;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @PostMapping("/add")
    public String themDiaChi(
            @RequestParam String tinh,
            @RequestParam String xa,
            @RequestParam String diaChiNha,
            @RequestParam String tenDiaChi,
            @RequestParam Boolean loaiDiaChi,
            @RequestParam Boolean macDinh,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        if (kh == null) return "redirect:/loginView";
        DiaChi dc = new DiaChi();
        dc.setKhachHang(kh);
        dc.setTinh(tinh);
        dc.setXa(xa);
        dc.setDiaChiNha(diaChiNha);
        dc.setTenDiaChi(tenDiaChi);
        dc.setLoaiDiaChi(loaiDiaChi);
        dc.setMacDinh(false); // mặc định lúc thêm mới
        diaChiService.save(dc);

        redirectAttributes.addFlashAttribute("message", "Thêm địa chỉ thành công!");
        return "redirect:/detailKh/user-info";
    }

    @PostMapping("/set-default")
    public String setMacDinh(
            @RequestParam Long maDiaChi,
            HttpSession session
    ) {
        KhachHang kh = (KhachHang) session.getAttribute("khachHang");
        if (kh == null) return "redirect:/loginView";

        diaChiService.setMacDinh(kh.getMaKhachHang(), maDiaChi);

        return "redirect:/detailKh/user-info";
    }
}
