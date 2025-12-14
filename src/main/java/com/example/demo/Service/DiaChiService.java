package com.example.demo.Service;

import com.example.demo.Entity.DiaChi;
import com.example.demo.Repository.DiaChiRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DiaChiService {

    private final DiaChiRepository diaChiRepository;

    public DiaChiService(DiaChiRepository repo) {
        this.diaChiRepository = repo;
    }

    public List<DiaChi> getAllByKhachHang(Long maKhachHang) {
        return diaChiRepository.findByKhachHang_MaKhachHang(maKhachHang);
    }

    public DiaChi save(DiaChi diaChi) {
        return diaChiRepository.save(diaChi);
    }

    public void setMacDinh(Long maKhachHang, Long maDiaChi) {
        DiaChi current = diaChiRepository.findByKhachHang_MaKhachHangAndMacDinh(maKhachHang, true);
        if (current != null) {
            current.setMacDinh(false);
            diaChiRepository.save(current);
        }

        DiaChi newDefault = diaChiRepository.findById(maDiaChi).orElse(null);
        if (newDefault != null) {
            newDefault.setMacDinh(true);
            diaChiRepository.save(newDefault);
        }
    }

    public void unsetAllDefaultByKhachHang(Long maKhachHang) {
        diaChiRepository.unsetAllDefaultByKhachHang(maKhachHang);
    }

    public void delete(Long maDiaChi) {
        // Kiểm tra xem có tồn tại địa chỉ không
        if (diaChiRepository.existsById(maDiaChi)) {
            diaChiRepository.deleteById(maDiaChi);
        } else {
            throw new RuntimeException("Địa chỉ không tồn tại");
        }
    }

    public DiaChi findById(Long maDiaChi) {
        return diaChiRepository.findById(maDiaChi)
                .orElseThrow(() -> new RuntimeException("Địa chỉ không tồn tại với id: " + maDiaChi));
    }

}

