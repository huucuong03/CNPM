package com.example.demo.Service;

import com.example.demo.Dto.KhachHangDTO;
import com.example.demo.Dto.NhanVienDTO;
import com.example.demo.Dto.Request.GioHangRequest;
import com.example.demo.Dto.Request.KhachHangRequest;
import com.example.demo.Dto.Response.HoaDonResponse;
import com.example.demo.Entity.GioHang;
import com.example.demo.Entity.KhachHang;
import com.example.demo.Repository.GioHangRepository;
import com.example.demo.Repository.KhachHangRepository;
import com.example.demo.Utils.Constants;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

@Service
public class KhachHangService {

    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    private KhachHangRepository repository;

    @Autowired
    private GioHangRepository gioHangRepository;

    @Value("${template.path}")
    private String templateFolder;

    @Value("${file.temp.upload.path}")
    private String fileTempUploadPath;

    public List<KhachHangDTO> searchKhachHang(KhachHangRequest request) {
        return repository.searchKhachHang(request.getDiaChi(), request.getTenKhachHang());
    }

    public ResponseEntity<?> add(KhachHangRequest khachHangRequest) {
        KhachHang khachHang = new KhachHang();
        khachHang.setTen(khachHangRequest.getTenKhachHang());
        khachHang.setEmail(khachHangRequest.getEmail());
        khachHang.setMatKhau(khachHangRequest.getMatKhau());
        khachHang.setSdt(khachHangRequest.getSdt());
        khachHang.setDiaChi(khachHangRequest.getDiaChi());
        khachHang.setGioiTinh(khachHangRequest.getGioiTinh());
        khachHang.setTrangThai(khachHangRequest.getTrangThai());
        repository.save(khachHang);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    public KhachHang getByMa(Long maKhachHang) {
        KhachHang khachHang = repository.getReferenceById(maKhachHang);
        return khachHang;
    }

    public ResponseEntity<?> update(KhachHangRequest khachHangRequest) {
        KhachHang khachHang = this.getByMa(khachHangRequest.getMaKhachHang());
        khachHang.setTen(khachHangRequest.getTenKhachHang());
        khachHang.setEmail(khachHangRequest.getEmail());
        khachHang.setMatKhau(khachHangRequest.getMatKhau());
        khachHang.setSdt(khachHangRequest.getSdt());
        khachHang.setDiaChi(khachHangRequest.getDiaChi());
        khachHang.setGioiTinh(khachHangRequest.getGioiTinh());
        khachHang.setTrangThai(khachHangRequest.getTrangThai());
        repository.save(khachHang);
        return new ResponseEntity<>(HttpStatus.OK);

    }

    public ResponseEntity<?> them(KhachHangRequest khachHangRequest) {
        KhachHang khachHang = new KhachHang();
        khachHang.setTen(khachHangRequest.getTenKhachHang());
        khachHang.setEmail(khachHangRequest.getEmail());
        khachHang.setMatKhau(khachHangRequest.getMatKhau());
        khachHang.setSdt(khachHangRequest.getSdt());
        khachHang.setDiaChi(khachHangRequest.getDiaChi());
        khachHang.setGioiTinh(khachHangRequest.getGioiTinh());
        khachHang.setTrangThai(khachHangRequest.getTrangThai());
        repository.save(khachHang);

        GioHang gioHang = new GioHang();
        gioHang.setKhachHang(KhachHang.builder().maKhachHang(khachHang.getMaKhachHang()).build());
        gioHang.setTrangThai(1);
        gioHangRepository.save(gioHang);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    public KhachHang getKhachHangByEmailAndAndMatKhau(String email, String pass) {
        return repository.getByEmailAndMatKhau(email, pass);
    }

    public String buildSearchKhachHangResultFile(KhachHangRequest request) {
        List<KhachHangDTO> khachHangDTOS = repository.searchKhachHang(request.getDiaChi(), request.getTenKhachHang());
        for (KhachHangDTO khachHangDTO : khachHangDTOS) {
            khachHangDTO.convertString();
        }
        String fileName = "template_export_khach_hang.xls";
        String templatePath = this.templateFolder + fileName;

        try {
            // Sử dụng ResourceLoader để load template từ classpath
            Resource resource = resourceLoader.getResource(templatePath);
            InputStream is = resource.getInputStream();

            // Tạo thư mục output nếu chưa tồn tại
            File outputDir = new File(this.fileTempUploadPath);
            if (!outputDir.exists()) {
                outputDir.mkdirs();
            }

            // Tạo file output
            File fileResult = new File(outputDir, fileName);
            OutputStream os = new FileOutputStream(fileResult);

            Context context = new Context();
            context.putVar("khs", khachHangDTOS);
            JxlsHelper.getInstance().processTemplate(is, os, context);

            // Đóng stream
            os.close();
            is.close();

            return fileResult.getAbsolutePath();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public KhachHang themMoi(KhachHangRequest khachHangRequest) {
        KhachHang khachHang = new KhachHang();
        khachHang.setTen(khachHangRequest.getTenKhachHang());
        khachHang.setEmail(khachHangRequest.getEmail());
        khachHang.setSdt(khachHangRequest.getSdt());
        khachHang.setDiaChi(khachHangRequest.getDiaChi());
        khachHang.setGioiTinh(khachHangRequest.getGioiTinh());
        khachHang.setCccd(khachHangRequest.getCccd());
        khachHang.setTrangThai(Constants.ACTIVE);
        repository.save(khachHang);

        return khachHang;
    }
}
