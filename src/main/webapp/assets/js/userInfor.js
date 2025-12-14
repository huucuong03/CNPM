const btnCapNhat = document.getElementById("btnCapNhat");
const btnCapNhat1 = document.getElementById("btnCapNhat1");
const modal = document.getElementById("radix-«rq»");
const btnClose = document.getElementById("btnClose");

// Mở modal
function openModal() {
    modal.style.display = "block";
}

// Đóng modal
function closeModal() {
    modal.style.display = "none";
}

// Mở modal
btnCapNhat?.addEventListener("click", openModal);
btnCapNhat1?.addEventListener("click", openModal);

// Đóng modal nút Close
btnClose?.addEventListener("click", closeModal);

let startX, startY;

modal.addEventListener("mousedown", function (event) {
    startX = event.clientX;
    startY = event.clientY;
});

modal.addEventListener("mouseup", function (event) {
    // xác định đây là click hay drag
    const diffX = Math.abs(event.clientX - startX);
    const diffY = Math.abs(event.clientY - startY);

    const isClick = diffX < 5 && diffY < 5; // click thì gần như không di chuyển

    if (isClick && event.target === modal) {
        closeModal();
    }
});


  const fullNameInput = document.getElementById("fullName");
  const originalValue = fullNameInput.value;

  document.getElementById("clearName").addEventListener("click", function() {
    fullNameInput.value = "";
  });

  document.getElementById("resetName").addEventListener("click", function() {
    fullNameInput.value = originalValue;
  });
  const genderSelect = document.getElementById("genderInput");
    const genderOriginal = document.getElementById("genderOriginal").value;

    const resetButton = document.getElementById("resetName"); // nút "Thiết lập lại"

    resetButton.addEventListener("click", function() {
        if (genderOriginal === "true") {
            genderSelect.value = "true";
        } else if (genderOriginal === "false") {
            genderSelect.value = "false";
        } else {
            genderSelect.value = "";
        }
    });
const btnChangePW = document.getElementById("btnChangePW");
const modalChangePW = document.getElementById("radix-«rn»");
const btncloseModalChangePW = document.getElementById("closeModalChangePW");
// Hàm mở modal
function openModalChangePW() {
    modalChangePW.style.display = "block";
}

// Hàm đóng modal
function closeModalChangePW() {
    modalChangePW.style.display = "none";
}

// Mở modal khi click nút
btnChangePW?.addEventListener("click", openModalChangePW);
btncloseModalChangePW?.addEventListener("click", closeModalChangePW);
// Đóng modal khi click ra ngoài (overlay)

let startX_CH, startY_CH;

modalChangePW?.addEventListener("mousedown", function (event) {
    // Lưu vị trí bắt đầu
    startX_CH = event.clientX;
    startY_CH = event.clientY;
});

modalChangePW?.addEventListener("mouseup", function (event) {
    // Tính khoảng cách kéo
    const diffX = Math.abs(event.clientX - startX_CH);
    const diffY = Math.abs(event.clientY - startY_CH);

    // Nếu không di chuyển → click thật
    const isClick = diffX < 5 && diffY < 5;

    // Chỉ đóng modal khi click đúng overlay
    if (isClick && event.target === modalChangePW) {
        closeModalChangePW();
    }
});

document.addEventListener("DOMContentLoaded", () => {
    const formChangePW = document.querySelector("#radix-«rn» form");
    const oldPWInput = document.getElementById("oldPW");
    const borderoldPW = document.getElementById("borderoldPW");
    const oldPWError = document.getElementById("oldPWError");

    const newPWInput = document.getElementById("newPW"); // mật khẩu mới
    const newPWError = document.getElementById("newPWError");
    const bordernewPW = document.getElementById("bordernewPW");

    const confirmPWInput = document.getElementById("confirmPW");
    const confirmPWError = document.getElementById("conformPWError");
    const borderconfirmPW= document.getElementById("borderconfirmPW");
    
    const toggleButtons = formChangePW.querySelectorAll('button[aria-label="Show password"]');
    const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d).{6,}$/;
    // Toggle show/hide password
    toggleButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            const input = btn.previousElementSibling;
            input.type = input.type === "password" ? "text" : "password";
        });
    });
function validateInput(val, errorElement,input) {
    const value = val.value.trim();
     if (value.length === 0) {
        errorElement.style.display = "none";
        input.classList.remove("input-error");
        return;
    }

    if (!passwordPattern.test(val.value.trim())) {
        errorElement.style.display = "flex";
        input.classList.add("input-error");
    } else{
        errorElement.style.display = "none";
         input.classList.remove("input-error");
    }
}
function checkiput(value1,value2){
    if(value1===value2){
        return true;
    }
    return false;
}
    oldPWInput.addEventListener("input", (event) => {
    validateInput(event.target, oldPWError,borderoldPW);
});
    newPWInput.addEventListener("input", (event) => {
        validateInput(event.target, newPWError,bordernewPW);
        confirmPWInput.addEventListener("input", (event2) => {
        var i=checkiput(event.target.value.trim(),event2.target.value.trim())
        console.log(i)
        if (!i) {
            confirmPWError.style.display = "flex";
            borderconfirmPW.classList.add("input-error");
        } else {
            confirmPWError.style.display = "none";
            borderconfirmPW.classList.remove("input-text");
        }
    })
    });
});
$(document).ready(function () {
    const $provinceInput = $("#provinceInput");
    const $wardInput = $("#wardInput");
    const $provinceList = $("#provinceList");
    const $wardList = $("#wardList");
    const provineceWrapper = document.getElementById("provinceWrapper");
    const wardWrapper = document.getElementById("wardWrapper");
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
        return name.replace(/^(Tỉnh|Thành phố|Quận|Huyện|)\s+/i, "");
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

    /** Render danh sách tỉnh */
    function renderProvinces(filter = "") {
        $provinceList.empty();
        const filtered = provinces.filter(p =>
            stripTypePrefix(p.name).toLowerCase().includes(filter.toLowerCase())
        );
        if (!filtered.length) return $provinceList.append('<div class="no-data">Không tìm thấy tỉnh</div>');
        provineceWrapper.style.display="block";
        filtered.forEach(p => $provinceList.append(`<div class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small" data-code="${p.code}">${stripTypePrefix(p.name)}</div>`));
    }

    /** Render danh sách xã/phường */
    function renderCommunes(filter = "") {
        $wardList.empty();
        const filtered = communes.filter(c =>
            stripTypePrefix(c.name).toLowerCase().includes(filter.toLowerCase())
        );
        if (!filtered.length) return $wardList.append('<div class="no-data">Không tìm thấy xã/phường</div>');
        provineceWrapper.style.display="none";
        wardWrapper.style.display="block";
        filtered.forEach(c => $wardList.append(`<div class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small" data-code="${c.code}">${stripTypePrefix(c.name)}</div>`));
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
        setTimeout(() => { // delay để click dropdown vẫn nhận
            if (!$(this).val()) $(this).val($(this).data('previous') || $(this).attr("placeholder") || "");
            $provinceList.hide();
        }, 150);
    });

   // --- Chọn tỉnh ---
$provinceList.on("mousedown", ".dropdown__item", function () {
    selectedProvinceCode = $(this).data("code");
    $provinceInput.val($(this).text());
    $provinceList.hide();

    // update hidden
    $("input[name='province']").val(selectedProvinceCode);

    // reset xã/phường
    $wardInput.val("").attr("placeholder", "Chọn xã / phường");
    communes = [];

    fetchCommunes(selectedProvinceCode, function () {
        renderCommunes();
        $wardList.show();
    });

    // focus lại input xã
    setTimeout(() => $wardInput.focus(), 0);
});


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
            if (!$(this).val()) $(this).val($(this).data('previous') || $(this).attr("placeholder") || "");
            $wardList.hide();
        }, 150);
    });

    // --- Chọn xã/phường ---
$wardList.on("mousedown", ".dropdown__item", function () {
    wardWrapper.style.display="none";
    $wardInput.val($(this).text());
    $("input[name='ward']").val($(this).data("code"));
    $wardList.hide();
});

    // --- Click ngoài hoặc #ghi-chu ẩn dropdown ---
$(document).on("click", function (e) {
    if (!$(e.target).closest("#provinceInput, #wardInput, #provinceList, #wardList").length) {
        hideDropdowns();
    }
});
});
const btnopenModalAddDC = document.getElementById("btnopenModalAddDC");
const modalAddDC = document.getElementById("radix-«rk»");
const btncloseModalAddDC = document.getElementById("closeModalAddDC");

// Mở modal
function openModalAddDC() {
    // Reset form
    const form = modalAddDC.querySelector("form");
    form.reset();
    $('#provinceInput').val('');
    $('#wardInput').val('');
    $('input[name="diaChiNha"]').val('');
    $('input[name="tenDiaChi"]').val('');
    $('#addressType').val('');

    // Reset loại địa chỉ
    const typeOptions = document.querySelectorAll(".address-type-option");
    typeOptions.forEach(o => {
        o.classList.remove("active", "outline-primary-500");
        o.querySelector("div.check-icon")?.classList.add("hidden");
    });

    // Reset địa chỉ mặc định
    $('#isDefault').val('false');
    $('[data-slot="switch"]').attr('data-state','unchecked');
    $('#isDefaultState').attr('data-state','unchecked');

    // Thay tiêu đề modal
    $('#radix-«rl»').text('Thêm địa chỉ');

    // Thay nút modal: chỉ có "Thêm địa chỉ"
    $('.shadow-group-button').html(`
        <button type="submit" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" id="btnThemModal">Thêm địa chỉ</button>
    `);

    // Set action form cho Add
    form.setAttribute('action', '/detailKh/userinfo/diachi/add');

    // Mở modal
    modalAddDC.style.display = "block";
}


// Đóng modal
function closeModalAddDC() {
    modalAddDC.style.display = "none";
}

// Gán sự kiện mở / đóng modal
btnopenModalAddDC?.addEventListener("click", openModalAddDC);
btncloseModalAddDC?.addEventListener("click", closeModalAddDC);

// ------- Anti-drag close overlay fix -------
let startX_DC = 0;
let startY_DC = 0;

modalAddDC?.addEventListener("mousedown", (event) => {
    // Lưu vị trí bắt đầu nhấp chuột
    startX_DC = event.clientX;
    startY_DC = event.clientY;
});

modalAddDC?.addEventListener("mouseup", (event) => {
    // Tính độ lệch di chuyển
    const moveX = Math.abs(event.clientX - startX_DC);
    const moveY = Math.abs(event.clientY - startY_DC);

    // Điều kiện click (không phải kéo)
    const isClick = moveX < 5 && moveY < 5;

    // Đúng overlay → đóng modal
    if (isClick && event.target === modalAddDC) {
        closeModalAddDC();
    }
});
const typeOptions = document.querySelectorAll(".address-type-option");

// Ban đầu: xoá active + xoá tick
typeOptions.forEach(o => {
    o.classList.remove("active", "outline-primary-500");
    o.querySelector("div.absolute")?.classList.add("hidden");
});

typeOptions.forEach(option => {
    option.addEventListener("click", () => {

        // Reset tất cả
        typeOptions.forEach(o => {
            o.classList.remove("active", "outline-primary-500");
            o.querySelector("div.absolute")?.classList.add("hidden");
        });

        // Kích hoạt option đang click
        option.classList.add("active", "outline-primary-500");
        option.querySelector("div.absolute")?.classList.remove("hidden");
    });
});
const addressTypeInput = document.getElementById("addressType");

typeOptions.forEach(option => {
    option.addEventListener("click", () => {
        typeOptions.forEach(o => o.classList.remove("active"));
        option.classList.add("active");
        addressTypeInput.value = option.dataset.type;
    });
});
const switchBtn = document.querySelector("[data-slot='switch']");
const switchThumb = switchBtn.querySelector("[data-slot='switch-thumb']");
const isDefaultInput = document.getElementById("isDefault");

switchBtn.addEventListener("click", () => {
    const isChecked = switchBtn.getAttribute("data-state") === "checked";

    if (isChecked) {
        // TẮT
        switchBtn.setAttribute("data-state", "unchecked");
        switchThumb.setAttribute("data-state", "unchecked");
        isDefaultInput.value = "false";
    } else {
        // BẬT
        switchBtn.setAttribute("data-state", "checked");
        switchThumb.setAttribute("data-state", "checked");
        isDefaultInput.value = "true";
    }
});
let deleteId = null; // Lưu ID của địa chỉ muốn xóa
const modalDelete = document.getElementById("radix-«r1l»"); // Mở modal
// Khi click nút Xóa, mở modal
$(document).on('click', '#btnXoa', function() {
    deleteId = $(this).data('id'); // Lấy id từ data-id
    console.log(deleteId);
    modalDelete.style.display="block";
});
$(document).on('click','#btnSuyNghiLai',function(){
    modalDelete.style.display="none";
})

$('#confirmDeleteBtn').click(function() {
    if (!deleteId) return;
    $.ajax({
        url: '/detailKh/userinfo/diachi/delete', // API xóa
        type: 'POST', // Hoặc DELETE
        data: { maDiaChi: deleteId },
        success: function(response) {
            // 1. Đóng modal
            console.log(response);
               showSuccessToast('<%= request.getAttribute("successMessage") %>');
           modalDelete.style.display="none";
            $(`#btnXoa[data-id="${deleteId}"]`).closest('.address-container').remove();
            deleteId = null;
        },
        error: function(err) {
            showErrorToast('<%= request.getAttribute("errorMessage") %>');
        }
    });
});
$(document).on('click', '#btnEdit', function() {
    const maDiaChi = $(this).data('id'); // lấy id từ data-id
    $.ajax({
        url: '/detailKh/userinfo/diachi/get', // API backend trả về 1 DiaChi theo id
        type: 'GET',
        data: { maDiaChi: maDiaChi },
        success: function(res) {
            // Điền dữ liệu vào modal
            $('#provinceInput').val(res.tinh);
            $('#wardInput').val(res.xa);
            $('input[name="diaChiNha"]').val(res.diaChiNha);
            $('input[name="tenDiaChi"]').val(res.tenDiaChi);
            // Set loại địa chỉ active dựa trên res.loaiDiaChi
// Map số sang string tương ứng với data-type
const typeMap = {
    false: 'home',
    true: 'office'
};
const loaiDiaChiType = typeMap[res.loaiDiaChi];

// Set loại địa chỉ active dựa trên loaiDiaChiType
const typeOptions = document.querySelectorAll(".address-type-option");
typeOptions.forEach(o => {
    o.classList.remove("active", "outline-primary-500");
    o.querySelector("div.check-icon")?.classList.add("hidden");
    if(o.dataset.type === loaiDiaChiType){
        o.classList.add("active", "outline-primary-500");
        o.querySelector("div.check-icon")?.classList.remove("hidden");
    }
});

// Set input hidden
$('#addressType').val(loaiDiaChiType);

            $('#radix-«rl»').text('Sửa thông tin địa chỉ');

            if(res.macDinh){
                $('#isDefault').val('true');
                $('[data-slot="switch"]').attr('data-state','checked');
                $('#isDefaultState').attr('data-state','checked')
            } else {
                $('#isDefault').val('false');
                $('[data-slot="switch"]').attr('data-state','unchecked');
                $('#isDefaultState').attr('data-state','unchecked')
            }
            // Giả sử maDiaChi là id của địa chỉ đang sửa
            $('#radix-«rk» form').attr('action', `/detailKh/userinfo/diachi/edit/${maDiaChi}`);

            // Thay nút modal: Xoá + Cập nhật
            $('.shadow-group-button').html(`
                <button type="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-neutral-300 cpsui:text-neutral-800 cpsui:bg-pure-white cpsui:hover:border-neutral-400 cpsui:hover:bg-neutral-50 cpsui:disabled:border-black-300 cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white w-full px-0 tablet:px-medium" id="btnXoaModal">Xoá địa chỉ</button>
                <button type="submit" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" id="btnCapNhatModal">Cập nhật địa chỉ</button>
            `);

            // Set action của form để submit cập nhật
            $('#radix-«rk» form').attr('action', `/detailKh/userinfo/diachi/edit/${maDiaChi}`);

            // Mở modal
            $('#radix-«rk»').show(); 
        },
        error: function(err) {
            console.error(err);
            alert('Lỗi lấy địa chỉ!');
        }
    });
});

// Xử lý nút Xoá trong modal
$(document).on('click', '#btnXoaModal', function() {
    if(confirm('Bạn có chắc chắn muốn xóa địa chỉ này?')) {
        const formAction = $('#radix-«rk» form').attr('action').replace('/edit/', '/delete/');
        $.post(formAction, function() {
            $('#radix-«rk»').hide();
            $(`#btnEdit[data-id="${maDiaChi}"]`).closest('.flex.flex-1.flex-col.gap-2x-small').remove();
        });
    }
});
