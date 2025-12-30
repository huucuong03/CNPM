let isProvinceValid = false;
let isWardValid = false;
const provinceInput = document.getElementById("provinceInput");
const wardInput = document.getElementById("wardInput");
$(document).ready(function () {
    const $provinceInput = $("#provinceInput");
    const $wardInput = $("#wardInput");
    const $provinceList = $("#provinceList");
    const $wardList = $("#wardList");
    const $provinceBox = $provinceInput.closest(".box-input");
    const $wardBox = $wardInput.closest(".box-input");
    let provinces = [];
    let communes = [];
    let selectedProvinceCode = null;

    /** Ẩn tất cả dropdown trừ ngoại lệ */
    function hideDropdowns(except = null) {
        if (!$provinceList.is(except)) $provinceList.hide();
        if (!$wardList.is(except)) $wardList.hide();
    }

    /** Loại bỏ tiền tố */
    function stripTypePrefix(name) {
        return name.replace(/^(Tỉnh|Thành phố|Quận|Huyện|Phường|Xã)\s+/i, "");
    }

    /** Lấy danh sách tỉnh */
    function fetchProvinces(callback) {
        if (provinces.length) return callback(provinces);

        $provinceList.html('<div class="loading">Đang tải...</div>').show();

        $.getJSON("/api/provinces")
            .done(function (data) {
                const list = data.provinces || data;
                if (!Array.isArray(list)) return $provinceList.html('<div class="no-data">Dữ liệu lỗi</div>');

                provinces = list.sort((a, b) =>
                    stripTypePrefix(a.name).localeCompare(stripTypePrefix(b.name), "vi")
                );
                callback(provinces);
            })
            .fail(function () {
                $provinceList.html('<div class="no-data">Không lấy được tỉnh</div>');
            });
    }

    /** Lấy danh sách xã/phường theo tỉnh */
    function fetchCommunes(provinceCode, callback) {
        $wardList.html('<div class="loading">Đang tải...</div>').show();

        $.getJSON(`/api/provinces/${provinceCode}/communes`)
            .done(function (data) {
                if (!data || !Array.isArray(data.communes)) {
                    $wardList.html('<div class="no-data">Không có dữ liệu xã/phường</div>');
                    return;
                }
                communes = data.communes.sort((a, b) =>
                    stripTypePrefix(a.name).localeCompare(stripTypePrefix(b.name), "vi")
                );
                callback(communes);
            })
            .fail(function () {
                $wardList.html('<div class="no-data">Không lấy được xã/phường</div>');
            });
    }
    function validateProvince() {
    if (!$provinceInput.val().trim()) {
        $provinceBox.addClass("error");
        isProvinceValid = false;
        return false;
    }
    $provinceBox.removeClass("error");
    isProvinceValid = true;
    return true;
}

    /** Render danh sách tỉnh */
    function renderProvinces(filter = "") {
        $provinceList.empty();
        const filtered = provinces.filter(p =>
            stripTypePrefix(p.name).toLowerCase().includes(filter.toLowerCase())
        );
        if (!filtered.length) return $provinceList.append('<div class="no-data">Không tìm thấy tỉnh</div>');
        filtered.forEach(p => $provinceList.append(`<div class="dropdown__item" data-code="${p.code}">${stripTypePrefix(p.name)}</div>`));
    }

    /** Render danh sách xã/phường */
    function renderCommunes(filter = "") {
        $wardList.empty();
        const filtered = communes.filter(c =>
            stripTypePrefix(c.name).toLowerCase().includes(filter.toLowerCase())
        );
        if (!filtered.length) return $wardList.append('<div class="no-data">Không tìm thấy xã/phường</div>');
        filtered.forEach(c => $wardList.append(`<div class="dropdown__item" data-code="${c.code}">${stripTypePrefix(c.name)}</div>`));
    }

    // --- Input tỉnh ---
    $provinceInput.on("focus", function () {
        hideDropdowns();
        $(this).data('previous', $(this).val()); // lưu giá trị trước
        $(this).val(''); // xóa value khi focus
        fetchProvinces(() => {
            renderProvinces();
            $provinceList.show();
        });
    });
    $provinceInput.on("blur", function () {
        setTimeout(() => { 
            validateProvince();
            $provinceList.hide();
        }, 150);
    });

   // --- Chọn tỉnh ---
$provinceList.on("click", ".dropdown__item", function () {
    selectedProvinceCode = $(this).data("code");
    $provinceInput.val($(this).text());
    $provinceList.hide();

    // Reset xã/phường
    $wardInput.val("").attr("placeholder", "Chọn xã / phường");
    $wardBox.addClass("error");
    isWardValid = false;
    communes = [];

    // 1. Lấy xã/phường và render ngay
    fetchCommunes(selectedProvinceCode, function() {
        renderCommunes(); // render toàn bộ communes
        $wardList.show(); // show dropdown
    });

    // 2. focus vào input xã/phường
    $wardInput.focus();
});
function validateWard() {
    if (!$wardInput.val().trim()) {
        $wardBox.addClass("error");
        isWardValid = false;
        return false;
    }
    $wardBox.removeClass("error");
    isWardValid = true;
    return true;
}


    // --- Input xã/phường ---
    $wardInput.on("focus", function () {
        hideDropdowns();
        if (!selectedProvinceCode) {
            $wardList.html('<div class="no-data">Chọn tỉnh trước</div>').show();
            return;
        }
        $(this).data('previous', $(this).val());
        $(this).val('');
        renderCommunes();
        $wardList.show();
    });
    $wardInput.on("blur", function () {
        setTimeout(() => {
           validateWard();
            $wardList.hide();
        }, 150);
    });

    // --- Chọn xã/phường ---
    $wardList.on("click", ".dropdown__item", function () {
        $wardInput.val($(this).text());
        $wardList.hide();
    });

    // --- Click ngoài hoặc #ghi-chu ẩn dropdown ---
    $(document).on("click", function (e) {
        if (!$(e.target).closest(".box-input, #ghi-chu").length) hideDropdowns();
    });
function setBuyNow() {
    const form = document.getElementById('myForm');
    const btn  = document.getElementById('submitBtn');
    form.action = '/cart/buy-now'; // action mới
    btn.innerText = 'Mua Ngay';
}

function setCheckout() {
    const form = document.getElementById('myForm');
    const btn  = document.getElementById('submitBtn');
    form.action = '/cart/submit-order'; 
    btn.innerText = 'Đặt Hàng';
}
    document.querySelectorAll('input[name="delivery"]').forEach(radio => {
    radio.addEventListener('change', function () {
         if (this.value === 'pickup') {
            setBuyNow();   
        } else {
            setCheckout(); 
        }
    });
});
});
const emailInput = document.getElementById("email");
const emailBox   = emailInput.closest(".box-input");
const emailError = document.getElementById("emailError");

let isEmailValid = false;

// Regex email chuẩn
const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

emailInput.addEventListener("input", function () {
    const value = this.value.trim();

    // ❌ rỗng
    if (value === "") {
        emailBox.classList.add("error");
        emailError.style.display = "flex";
        isEmailValid = false;
        return;
    }

    // ❌ sai định dạng
    if (!emailRegex.test(value)) {
        emailBox.classList.add("error");
        emailError.style.display = "flex";
        isEmailValid = false;
    }
    // ✅ đúng
    else {
        emailBox.classList.remove("error");
        emailError.style.display = "none";
        isEmailValid = true;
    }
});


const nguoiNhanInput = document.getElementById("nguoiNhan");
const nguoiNhanBox = nguoiNhanInput.closest(".box-input");

// Regex: chỉ chữ + khoảng trắng (có tiếng Việt)
const nameRegex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/;

nguoiNhanInput.addEventListener("input", function () {
    const value = this.value.trim();

    // ❌ Rỗng
    if (value === "") {
        nguoiNhanBox.classList.add("error");
        return;
    }

    // ❌ Sai ký tự
    if (!nameRegex.test(value)) {
        nguoiNhanBox.classList.add("error");
    }
    // ✅ Hợp lệ
    else {
        nguoiNhanBox.classList.remove("error");
    }
});
const sdtInput = document.getElementById("sdtNguoiNhan");
const sdtBox = sdtInput.closest(".box-input");

let isPhoneValid = false;

// Regex SĐT VN
const phoneRegex = /^(03|05|07|08|09)\d{8}$/;

sdtInput.addEventListener("input", function () {
    // chỉ cho nhập số
    this.value = this.value.replace(/\D/g, "");

    // giới hạn 10 số
    if (this.value.length > 10) {
        this.value = this.value.slice(0, 10);
    }

    const value = this.value.trim();

    // ❌ rỗng
    if (value === "") {
        sdtBox.classList.add("error");
        isPhoneValid = false;
        return;
    }

    // ❌ sai định dạng
    if (!phoneRegex.test(value)) {
        sdtBox.classList.add("error");
        isPhoneValid = false;
    }
    // ✅ đúng
    else {
        sdtBox.classList.remove("error");
        isPhoneValid = true;
    }
});
const diaChiInput = document.getElementById("diaChiInput");
const diaChiBox = diaChiInput.closest(".box-input");

let isAddressValid = false;

diaChiInput.addEventListener("input", function () {
    const value = this.value.trim();


    // ❌ rỗng
    if (value === "") {
        diaChiBox.classList.add("error");
        isAddressValid = false;
        return;
    }
    // ❌ quá ngắn
    if (value.length < 3) {
        diaChiBox.classList.add("error");
        isAddressValid = false;
        return;
    }

    // ✅ hợp lệ
    diaChiBox.classList.remove("error");
    isAddressValid = true;
});
function addError(input) {
    input.closest(".box-input").classList.add("error");
}

function removeError(input) {
    input.closest(".box-input").classList.remove("error");
}


 document.getElementById('submitBtn').addEventListener('click', function () {
                     const maGHCTs = getMaGHCTs(); // "1,2,3"

                     if (!maGHCTs) {
                        alert("Không có sản phẩm để thanh toán");
                        return;
                     }
if (!emailInput.value.trim()) {
    emailBox.classList.add("error");
    emailError.style.display = "flex";
    emailInput.focus();
    e.preventDefault();
    return;
}

if (!emailRegex.test(emailInput.value)) {
    emailBox.classList.add("error");
    emailError.style.display = "flex";
    emailInput.focus();
    e.preventDefault();
    return;
}

    if (!nguoiNhanInput.value.trim() || !nameRegex.test(nguoiNhanInput.value)) {
        addError(nguoiNhanInput);
        nguoiNhanInput.focus();
        e.preventDefault();
        return;
    }

    // SỐ ĐIỆN THOẠI
    if (!phoneRegex.test(sdtInput.value)) {
        addError(sdtInput);
        sdtInput.focus();
        e.preventDefault();
        return;
    }

    // TỈNH
    if (!provinceInput.value || provinceInput.value === provinceInput.placeholder) {
        addError(provinceInput);
        provinceInput.focus();
        e.preventDefault();
        return;
    }

    // XÃ / PHƯỜNG
    if (!wardInput.value || wardInput.value === wardInput.placeholder) {
        addError(wardInput);
        wardInput.focus();
        e.preventDefault();
        return;
    }

    // ĐỊA CHỈ
    if (!diaChiInput.value.trim()) {
        addError(diaChiInput);
        diaChiInput.focus();
        e.preventDefault();
        return;
    }

    // EMAIL (KHÔNG BẮT BUỘC)
    if (emailInput.value && !emailRegex.test(emailInput.value)) {
        addError(emailInput);
        emailInput.focus();
        e.preventDefault();
        return;
    }

                     // Kiểm tra phương thức thanh toán được chọn
                     const paymentMethod = document.querySelector('input[name="delivery"]:checked').value;
                     const form = document.getElementById('myForm');

                     document.getElementById('maGHCTsInput').value = maGHCTs;

                     // Nếu chọn thanh toán trực tuyến (pickup) -> chuyển đến VNPay
                     if (paymentMethod === 'pickup') {
                        form.action = '/cart/submit-order-vnpay';
                     } else {
                        // Thanh toán khi nhận hàng (shipping) -> xử lý trực tiếp
                        form.action = '/cart/submit-order';
                     }

                     form.submit();
                  });

                  function getMaGHCTs() {
                     const items = document.querySelectorAll(".item[data-maghct]");
                     const ids = [];

                     items.forEach(item => {
                        const id = item.getAttribute("data-maghct");
                        if (id) {
                           ids.push(id);
                        }
                     });

                     return ids.join(",");
                  }
