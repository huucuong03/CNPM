let currentPage = 0;
let currentSort = null; // asc hoặc desc
const tenNsx = $("#tenNsx").text().trim();
$(document).on("click", ".sort-btn", function (e) {
    e.preventDefault();
    currentSort = $(this).data("sort"); // asc hoặc desc
    $(".button__sort").removeClass("active");
    $(this).addClass("active");
    currentPage = 0;
    loadSanPham(false); // load lại từ đầu
   
});
$(document).ready(function () {
    const btn = document.getElementById("btnXemThem");
    if (btn) {
        btn.addEventListener("click", function () {
            currentPage++;
            loadSanPham(true);
        });
    }
});
$(document).on("click", ".submit", function () {
    let minInput = Number($("#min-price").val().replace(/\D/g, "")) || 0;
    let maxInput = Number($("#max-price").val().replace(/\D/g, "")) || 0;

    minVal = minInput * 1000;
    maxVal = maxInput * 1000;

    currentPage = 0;
    loadSanPham(false);
});

function renderProduct(sp) {
    return `
        <div class="product-small col has-hover">
            <div class="col-inner">
                <div class="product-small box">
                    <div class="box-image">
                        <a href="/san-pham/${sp.tenSanPham}">
                            <img src="http://localhost:8080/img/${sp.anh}" width="470">
                        </a>
                    </div>

                    <div class="box-text box-text-products">
                        <p class="name product-title">
                            <a href="/san-pham/${sp.tenSanPham}">${sp.tenSanPham}</a>
                        </p>
                        <span class="price">${renderPrice(sp)}</span>
                    </div>
                </div>
            </div>
        </div>
    `;
}

function loadSanPham(append = false) {
    let url = `/nsx/${tenNsx}/load?page=${currentPage}`;

    // Nếu đang sort
    if (currentSort) url += `&sort=${currentSort}`;

    // Nếu người dùng có nhập khoảng giá
    if (typeof minVal !== "undefined") url += `&min=${minVal}`;
    if (typeof maxVal !== "undefined") url += `&max=${maxVal}`;

    fetch(url)
        .then(res => res.json())
        .then(data => {
            const container = document.getElementById("productContainer");
            let html = "";

            (data.sanPhams || []).forEach(sp => html += renderProduct(sp));

            if (append) {
                container.insertAdjacentHTML("beforeend", html);
            } else {
                container.innerHTML = html;
            }

            // Ẩn nút nếu hết trang
            const btn = document.getElementById("btnXemThem");
            if (currentPage >= data.totalPages - 1) {
                btn.style.display = "none";
            } else {
                btn.style.display = "block";
            }
        })
        .catch(err => console.log(err));
}


function renderPrice(sp) {
    if (sp.giaBanGG != null && sp.giaBanGG < sp.giaBan) {
        return `
            <ins>
                <span class="woocommerce-Price-amount amount">
                    <bdi>${formatMoney(sp.giaBanGG)}<span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                </span>
            </ins>
            <del>
                <span style="display:none;">Giá niêm yết: </span>
                <span class="woocommerce-Price-amount amount">
                    <bdi>${formatMoney(sp.giaBan)}<span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                </span>
            </del>
        `;
    }

    return `
        <span class="woocommerce-Price-amount amount">
            <bdi>${formatMoney(sp.giaBan)}<span class="woocommerce-Price-currencySymbol">₫</span></bdi>
        </span>
    `;
}

function formatMoney(number) {
    return new Intl.NumberFormat("vi-VN").format(number);
}
function renderProduct(sp) {
    return `
        <div class="product-small col has-hover product type-product status-publish instock has-post-thumbnail shipping-taxable purchasable product-type-variable">
            <div class="col-inner">
                <div class="badge-container absolute left top z-1"></div>

                <div class="product-small box">
                    <div class="box-image">
                        <div class="image-none">
                            <a href="/san-pham/${sp.tenSanPham}" aria-label="${sp.tenSanPham}">
                                <img loading="lazy" decoding="async" width="470" height="488" 
                                     src="http://localhost:8080/img/${sp.anh}" 
                                     class="attachment-woocommerce_thumbnail" alt="">
                            </a>
                            <div class="item-hotsale"></div>
                        </div>
                    </div>

                    <div class="box-text box-text-products">
                        <div class="title-wrapper">
                            <p class="name product-title">
                                <a href="/san-pham/${sp.tenSanPham}">${sp.tenSanPham}</a>
                            </p>
                        </div>

                        <div class="price-wrapper">
                            <div class="star-rating" title="Rated 5 out of 5">
                                <span style="width:100%"><strong class="rating">5</strong> out of 5</span>
                            </div>

                            <span class="price">
                                ${renderPrice(sp)}
                            </span>

                            <div class="promotion">Thu cũ lên đời - Trợ giá 1 triệu</div>
                            <span class="text-count-review">2 đánh giá</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}
$(document).ready(function() {
    // Khi click vào nút "Xem theo giá"
    $("#btnShowprice").on("click", function() {
        console.log("a");
        const $priceFilter = $("#list-filter-child-price");

        // Kiểm tra opacity hiện tại
        if ($priceFilter.css("opacity") == 1) {
            // Ẩn
            $priceFilter.css({
                "opacity": 0,
                "pointer-events": "none", // tránh click vào khi ẩn
                "transition": "opacity 0.3s"
            });
        } else {
            // Hiển thị
            $priceFilter.css({
                "opacity": 1,
                "display":"block",
                "pointer-events": "auto",
                "transition": "opacity 0.3s",
                "max-width": 450,
                "z-index":100,
                "max-height":220,
            });

            // Focus vào input min giá
            $priceFilter.find("#min-price").focus();
        }
    });

    // Click nút "Đóng" trong khung filter
    $(".button__filter-children-close").on("click", function() {
        const $priceFilter = $(this).closest(".list-filter-child");
        $priceFilter.css({
            "opacity": 0,
            "pointer-events": "none",
            "transition": "opacity 0.3s"
        });
    });
    
});
$(document).ready(function() {
    const $minInput = $("#min-price");
    const $maxInput = $("#max-price");
    const $slider = $(".vue-slider");
    const maxValue = Number($slider.data("max")) || 100000;
    const $dots = $slider.find(".vue-slider-dot"); // index 0 = min, 1 = max
    const $process = $slider.find(".vue-slider-process");

    // Hàm convert % sang giá
    function percentToValue(percent) {
        return Math.round((percent / 100) * maxValue);
    }

    function valueToPercent(value) {
        return (value / maxValue) * 100;
    }

    // --- Khi kéo slider dot ---
        $dots.on("mousedown touchstart", function(e) {
        const $dot = $(this);
        const dotIndex = $dots.index($dot);

        const sliderOffset = $slider.offset().left;
        const sliderWidth = $slider.width();

        $(document).on("mousemove.slider touchmove.slider", function(eMove) {
            let clientX = eMove.clientX;
            if (eMove.originalEvent && eMove.originalEvent.touches) {
                clientX = eMove.originalEvent.touches[0].clientX;
            }
            let percent = ((clientX - sliderOffset) / sliderWidth) * 100;
            percent = Math.max(0, Math.min(100, percent));

            // Cập nhật dot position
            $dot.css("left", percent + "%");

            // Cập nhật input min/max
            const value = percentToValue(percent);
            if (dotIndex === 0) {
                $minInput.val(value.toLocaleString('vi-VN'));
            } else {
                $maxInput.val(value.toLocaleString('vi-VN'));
            }

            // Cập nhật dải màu
            updateSliderProcess();
        });

        $(document).on("mouseup touchend", function() {
            $(document).off(".slider");
        });

        e.preventDefault();
    });
    

    // --- Khi thay đổi input min / max ---
    $minInput.on("input", function() {
        let val = parseInt($(this).val().replace(/\D/g, '')) || 0;
        val = Math.min(val, parseInt($maxInput.val().replace(/\D/g, '')) || maxValue);
        $(this).val(val.toLocaleString('vi-VN'));
        const percent = valueToPercent(val);
        $dots.eq(0).css("left", percent + "%");

        updateSliderProcess();
    });

     $maxInput.on("input", function () {
        let val = parseInt($(this).val().replace(/\D/g, "")) || 0;
        let minVal = parseInt($minInput.val().replace(/\D/g, "")) || 0;

        if (val < minVal) val = minVal;
        if (val > maxValue) val = maxValue;

        $(this).val(val.toLocaleString("vi-VN"));

        const percent = valueToPercent(val);
        $dots.eq(1).css("left", percent + "%");

        updateSliderProcess();
    });

    // --- Khởi tạo lần đầu ---
    updateSliderProcess();
});

function updateSliderProcess() {
    const $slider = $(".vue-slider");
    const $dots = $slider.find(".vue-slider-dot");
    const $process = $slider.find(".vue-slider-process");

    // Nếu không đủ 2 dots → dừng để tránh lỗi
    if ($dots.length < 2) return;

    const sliderWidth = $slider.width();

    const leftPx = $dots.eq(0).position().left;
    const rightPx = $dots.eq(1).position().left;

    const leftPercent = (leftPx / sliderWidth) * 100;
    const rightPercent = (rightPx / sliderWidth) * 100;

    $process.css({
        left: leftPercent + "%",
        width: (rightPercent - leftPercent) + "%",
        backgroundColor: "rgb(215, 16, 8)"
    });
}


$(document).on("click", ".submit", function () {

    let minVal = $("#min-price").val().replace(/\D/g, "");  // bỏ dấu chấm
    let maxVal = $("#max-price").val().replace(/\D/g, "");  // bỏ dấu chấm

    minVal = Number(minVal)*1000;
    maxVal = Number(maxVal)*1000;

    
});


