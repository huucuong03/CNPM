package com.example.demo.Config;

import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController {
    @Autowired
    private AuthService authService;
    @Autowired
    private KhachHangRepository khachHangRepository;

    @PostMapping("/RestorePassword")
    public String restoreSubmit(@RequestParam("account") String account, Model model) {
        try {
            authService.guiMatKhauMoi(account);
            model.addAttribute("message", "Mật khẩu mới đã được gửi vào Email của bạn!");
            return "quenmatkhau";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "quenmatkhau";
        }
    }

    @PostMapping("/RestorePasswordAjax")
    @ResponseBody
    public ResponseEntity<Map<String, String>> restorePasswordAjax(@RequestParam("account") String account) {
        Map<String, String> response = new HashMap<>();
        try {
            authService.guiMatKhauMoi(account);
            response.put("status", "success");
            response.put("message", "Mật khẩu mới đã được gửi vào Email của bạn!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", e.getMessage());
            return ResponseEntity.ok(response);
        }
    }

    @PostMapping("/check-email")
    public ResponseEntity<Map<String, Boolean>> checkEmail(@RequestBody Map<String, String> payload) {
        String email = payload.get("email");
        boolean exists = khachHangRepository.existsByEmail(email);

        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);

        return ResponseEntity.ok(response);
    }
}
