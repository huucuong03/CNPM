$(document).ready(function () {
    const $provinceInput = $("#provinceInput");
    const $wardInput = $("#wardInput");
    const $provinceList = $("#provinceList");
    const $wardList = $("#wardList");

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
        setTimeout(() => { // delay để click dropdown vẫn nhận
            if (!$(this).val()) $(this).val($(this).data('previous') || $(this).attr("placeholder") || "");
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
    communes = [];

    // 1. Lấy xã/phường và render ngay
    fetchCommunes(selectedProvinceCode, function() {
        renderCommunes(); // render toàn bộ communes
        $wardList.show(); // show dropdown
    });

    // 2. focus vào input xã/phường
    $wardInput.focus();
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
    $wardList.on("click", ".dropdown__item", function () {
        $wardInput.val($(this).text());
        $wardList.hide();
    });

    // --- Click ngoài hoặc #ghi-chu ẩn dropdown ---
    $(document).on("click", function (e) {
        if (!$(e.target).closest(".box-input, #ghi-chu").length) hideDropdowns();
    });
});
