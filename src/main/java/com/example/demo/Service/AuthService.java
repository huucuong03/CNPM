package com.example.demo.Service;

import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Service
public class AuthService {
    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private EmailService emailService;

    public void guiMatKhauMoi(String account) {
        KhachHang khachHang = khachHangRepository.findByEmailAndMatKhauIsNotNull(account);

        if (khachHang == null) {
            khachHang = khachHangRepository.findBySdtAndMatKhauIsNotNull(account);
        }

        if (khachHang != null) {
            if (khachHang.getEmail() == null || khachHang.getEmail().isEmpty()) {
                throw new RuntimeException("Tài khoản này chưa đăng ký Email để nhận mật khẩu");
            }
            String matKhauMoi = generateRandomNumericPassword(8);

            khachHang.setMatKhau(matKhauMoi);
            khachHangRepository.save(khachHang);

            emailService.sendPasswordResetEmail(khachHang.getEmail(), matKhauMoi);
        } else {
            throw new RuntimeException("Tài khoản hoặc Email không tồn tại");
        }
    }

    private String generateRandomNumericPassword(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = secureRandom.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }

        return sb.toString();
    }
}