
document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("radix-«rk»");
    const productListContainer = document.getElementById("productListContainer");
    const productInput = document.getElementById("productInput");
    const productLabel = document.getElementById("productLabel");
    const maHoaDonChiTietInput = document.getElementById("maHoaDonChiTiet");
    const maChiTietSanPhamInput = document.getElementById("maChiTietSanPham"); 
    const reasonLabel = modal.querySelector("#reasonLabel");
    const reasonWrapper = modal.querySelector("#reasonWrapper");
    const reasonInput = modal.querySelector("#reasonInput");
    reasonLabel.addEventListener("click", () => {
           reasonWrapper.style.display = "block";
    });
    async function loadReasons(type) {
    const res = await fetch(`/api/getReasons?type=${type}`);
    const reasons = await res.json();

    const reasonWrapper = document.getElementById("reasonWrapper"); // dùng chung
    const reasonList = reasonWrapper.querySelector(".dropdown");

    // Xóa list cũ
    reasonList.innerHTML = "";

    // Thêm items mới
    reasons.forEach(r => {
        const item = document.createElement("div");
        item.className = "dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small";
        item.textContent = r;

        item.addEventListener("click", () => {
            reasonInput.value = r;
            reasonWrapper.style.display = "none"; // ẩn dropdown sau khi chọn
        });

        reasonList.appendChild(item);
    });
    // Hiện dropdown
    reasonWrapper.style.display = "none";
}

    document.querySelectorAll(".btnOpenModal").forEach(btn => {
        btn.addEventListener("click", async () => {
            const label = document.getElementById("radix-«rl»");   
            const maHoaDon = btn.dataset.maHoaDon;
            const type2 = document.getElementById("type");
            try {
                const res = await fetch(`/api/getProductsByHoaDon?maHoaDon=${maHoaDon}`);
                const products = await res.json();
                // Xóa hết item cũ
                productListContainer.innerHTML = "";
                const type = btn.dataset.type;
            
                if(type === "return") {
                 label.textContent = "Yêu cầu đổi trả sản phẩm";
                 type2.value=1;
                 loadReasons("return");
                } else if(type === "warranty") {
                label.textContent = "Yêu cầu đổi bảo hành";
                  loadReasons("warranty");
                   type2.value=2;
                }
                if (products.length === 0) {
                    productInput.value = "";
                    maHoaDonChiTietInput.value = "";
                    maChiTietSanPhamInput.value = "";
                    productListContainer.style.display = "none";
                    modal.style.display = "block";
                    return;
                }

                // Nếu chỉ có 1 sản phẩm, chọn luôn
                if (products.length === 1) {
                    productInput.value = `${products[0].chiTietSanPham.tenSanPham} - ${products[0].chiTietSanPham.dungLuong} - ${products[0].chiTietSanPham.mauSac} -  ${products[0].giaTien}`;
                    maHoaDonChiTietInput.value = products[0].maHoaDonChiTiet;
                    maChiTietSanPhamInput.value = products[0].chiTietSanPham.id;
                    productListContainer.style.display = "none";
                } else {
                    // Tạo list cho nhiều sản phẩm
                    products.forEach(p => {
                        const item = document.createElement("div");
                        item.className = "dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small";

                        // Thêm hình ảnh
                        const img = document.createElement("img");
                        img.src = `../../../img/${p.hinhAnhURL || "default.png"}`;
                        img.alt = p.chiTietSanPham.tenSanPham;
                        img.style.width = "40px";
                        img.style.height = "40px";
                        img.style.objectFit = "cover";
                        img.className = "rounded-sm";

                        // Thông tin sản phẩm
                        const info = document.createElement("span");
                        info.textContent = `${p.chiTietSanPham.tenSanPham} - ${p.chiTietSanPham.dungLuong} - ${p.chiTietSanPham.mauSac} -  ${p.giaTien}`;

                        item.appendChild(img);
                        item.appendChild(info);

                        item.addEventListener("click", () => {
                            productInput.value = `${p.chiTietSanPham.tenSanPham} - ${p.chiTietSanPham.dungLuong} - ${p.chiTietSanPham.mauSac} -  ${p.giaTien}`;
                            maHoaDonChiTietInput.value = p.maHoaDonChiTiet;
                            maChiTietSanPhamInput.value = p.chiTietSanPham.id;
                            productListContainer.style.display = "none";
                        });

                        productListContainer.appendChild(item);
                    });

                    // Hiển thị list ngay khi mở modal
                    productListContainer.style.display = "none";
                }

                // Hiện modal
                modal.style.display = "block";

            } catch (err) {
                console.error("Lấy sản phẩm thất bại", err);
            }
        });
        productLabel.addEventListener("click", e => {
        productListContainer.style.display = "block";
    });
    // Đóng modal
modal.querySelectorAll(".btnclose").forEach(btn => {
    btn.addEventListener("click", () => {
        modal.style.display = "none";
    });
});

let startX = 0, startY = 0;

modal.addEventListener("mousedown", (e) => {
    startX = e.clientX;
    startY = e.clientY;
});

modal.addEventListener("mouseup", (e) => {
    const diffX = Math.abs(e.clientX - startX);
    const diffY = Math.abs(e.clientY - startY);

    const isClick = diffX < 5 && diffY < 5;

    // CLICK NGOÀI MODAL CONTENT
    if (isClick && e.target === e.currentTarget) {
        modal.style.display = "none";
    }
});

    
});
})




document.addEventListener("DOMContentLoaded", () => {

    const phuongThuclabel = document.getElementById("phuongThuclabel");
    const phuongThucInput = document.getElementById("phuongThucInput");
    const phuongThucWrapper = document.getElementById("phuongThucWrapper");
    const phuongThucList = document.getElementById("phuongThucList");
     phuongThuclabel.addEventListener("click", () => {
        phuongThucWrapper.style.display = phuongThucWrapper.style.display === "block" ? "none" : "block";
    });

    phuongThucList.querySelectorAll(".dropdown__item").forEach(item => {
        item.addEventListener("click", () => {
            phuongThucInput.value = item.textContent; // điền vào input
            phuongThucWrapper.style.display = "none"; // ẩn danh sách
        });
    });

    // Click ra ngoài sẽ đóng danh sách
    document.addEventListener("click", (e) => {
        if (!phuongThucWrapper.contains(e.target) && e.target !== phuongThucInput) {
            phuongThucWrapper.style.display = "none";
        }
    });
    const addressInput = document.getElementById("addressInput");
    const addressWrapper = document.getElementById("addressWrapper");
    const addressList = document.getElementById("addressList");
    const maDiaChi = document.getElementById("maDiaChi");
    const nguoiNhanInput = document.querySelector('input[name="tenKhachHang"]');
    const sdtInput = document.querySelector('input[name="sdtKhachHang"]');
    // Khi click input thì mở danh sách
    addressInput.addEventListener("click", () => {
        addressWrapper.style.display = addressWrapper.style.display === "block" ? "none" : "block";
    });
    // Lấy danh sách địa chỉ bằng AJAX
    function loadAddresses() {
    fetch(`/api/getDiaChiByCustomer`)
        .then(res => res.json())
        .then(addresses => {
            addressList.innerHTML = ""; // Xóa cũ
            console.log(addresses);

            addresses.forEach(addr => {
                const item = document.createElement("div");
                item.className = "dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:justify-between cpsui:gap-2x-small";

                // Span chứa text địa chỉ
                const textSpan = document.createElement("span");
                textSpan.textContent = `${addr.tenDiaChi}, ${addr.diaChiNha}, ${addr.xa}, ${addr.tinh}`;
                item.appendChild(textSpan);

                // Nếu đây là địa chỉ mặc định, chọn luôn
                if (addr.macDinh) {
                    addressInput.value = textSpan.textContent;
                    nguoiNhanInput.value = addr.khachHang.ten || '';
                    sdtInput.value = addr.khachHang.sdt || '';
                    const defaultSpan = document.createElement("span");
                    defaultSpan.className = "px-2x-small py-1x-small text-small text-info-900 font-medium bg-info-100 rounded-1x-small";
                    defaultSpan.textContent = "Mặc định";
                    maDiaChi.value=addr.maDiaChi;
                    // Thêm ở cuối dòng
                    item.appendChild(defaultSpan);
                }

                // Khi click chọn địa chỉ
                item.addEventListener("click", () => {
                    addressInput.value = textSpan.textContent;
                    addressWrapper.style.display = "none";
                    maDiaChi.value=addr.maDiaChi;
                });

                addressList.appendChild(item);
                
            });

            // Nếu chỉ có 1 địa chỉ thì chọn luôn
            if (addresses.length === 1) {
                const addr = addresses[0];
                addressInput.value = `${addr.phuong}, ${addr.quan}, ${addr.tinh}`;
                addressWrapper.style.display = "none";
            } else {
                addressWrapper.style.display = "block";
            }
        })
        .catch(err => console.error("Lấy địa chỉ thất bại", err));
}



const imgErrorInput = document.getElementById("imgErrorInput");
const imgErrorWrapper = document.getElementById("imgErrorWrapper");

imgErrorInput.addEventListener("change", () => {
    imgErrorWrapper.innerHTML = ""; // Xóa ảnh cũ nếu có
    const files = imgErrorInput.files;

    if (files.length === 0) {
        imgErrorWrapper.style.display = "none";
        return;
    }
    if (files.length > 5) {
        showErrorToast("Chỉ được chọn tối đa 5 ảnh");
        input.value = ""; // reset input
        preview.innerHTML = "";
        return;
    }
    Array.from(files).forEach(file => {
        const reader = new FileReader();
        reader.onload = (e) => {
            const img = document.createElement("img");
            img.src = e.target.result;
            img.style.width = "80px";
            img.style.height = "80px";
            img.style.margin = "0 5px";
            img.style.objectFit = "cover";
            img.className = "rounded-sm border cpsui:border-neutral-300";
            imgErrorWrapper.appendChild(img);
        }
        reader.readAsDataURL(file);
    });

    // Hiển thị wrapper
    imgErrorWrapper.style.display = "flex";
});

// Click ra ngoài đóng dropdown
document.addEventListener("click", (e) => {
    if (!addressWrapper.contains(e.target) && e.target !== addressInput) {
        addressWrapper.style.display = "none";
    }
});

loadAddresses();
});

