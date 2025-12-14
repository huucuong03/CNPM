document.addEventListener("DOMContentLoaded", function() {
    const selectAllCheckbox = document.querySelector("#__BVID__29");
    const productCheckboxes = document.querySelectorAll(".custom-control-input[id^='chk_']");
    const buyButton = document.querySelector(".btn-action");
    const totalSpan = document.querySelector(".price-temp span");

    function formatPrice(number) {
        return number.toLocaleString('vi-VN'); // định dạng kiểu Việt Nam: 1.000.000
    }

document.querySelectorAll(".plus, .minus").forEach(btn => {
    btn.addEventListener("click", function() {
        const id = this.getAttribute("data-id");
        const input = document.getElementById("qty_" + id);
        const productItem = input.closest(".block__product-item"); // lấy container

        let currentQty = parseInt(input.value, 10);
        let newQty = currentQty;

        if (this.classList.contains("plus")) {
            newQty = currentQty + 1;
        } else if (this.classList.contains("minus") && currentQty > 1) {
            newQty = currentQty - 1;
        }

        input.value = newQty;

        // cập nhật subtotal
        const priceEl = productItem.querySelector(".product__price--show");
        const unitPrice = parseInt(priceEl.getAttribute("data-price"), 10);
        priceEl.textContent = formatPrice(unitPrice * newQty) + "đ";

        // cập nhật tổng
        updateTotal();


            // Gửi AJAX update số lượng lên server
            fetch('/cart/updateQuantity', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: id, quantity: newQty })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    input.value = newQty; // cập nhật input
                } else {
                    alert(data.message || "Cập nhật số lượng thất bại");
                }
            })
            .catch(err => console.error(err));
        });
    });
    // Checkbox "Chọn tất cả"
    selectAllCheckbox.addEventListener("change", function() {
        productCheckboxes.forEach(cb => cb.checked = selectAllCheckbox.checked);
        updateTotal();
    });

    // Checkbox sản phẩm
    productCheckboxes.forEach(cb => {
        cb.addEventListener("change", function() {
            const allChecked = Array.from(productCheckboxes).every(cb => cb.checked);
            selectAllCheckbox.checked = allChecked;
            updateTotal();
        });
    });

    // Tính tổng lần đầu khi load
    updateTotal();
});
let maGHCT = null;
let maCTSP = null;
function getSelectedMaGHCT() {
    // Lấy tất cả checkbox sản phẩm đang check
    return Array.from(document.querySelectorAll(".custom-control-input[id^='chk_']:checked"))
        .map(cb => cb.id.replace("chk_", ""));
}

function updateTotal() {
    const selectedMaGHCT = getSelectedMaGHCT(); // danh sách sản phẩm được tick
    let total = 0;

    selectedMaGHCT.forEach(maGHCT => {
        const productItem = document.querySelector(`#ProductId-${maGHCT}`);
        if (!productItem) return;

        const priceEl = productItem.querySelector(".product__price--show");
        const qtyInput = productItem.querySelector("input[id^='qty_']");
        const qty = parseInt(qtyInput.value, 10) || 1;
        const unitPrice = parseInt(priceEl.getAttribute("data-price"), 10);

        total += unitPrice * qty;

        // Cập nhật subtotal cho từng sản phẩm
        priceEl.textContent = (unitPrice * qty).toLocaleString('vi-VN') + "đ";
    });

    // Cập nhật tổng tạm tính ở stickyBottomBar
    const totalSpan = document.querySelector("#stickyBottomBar .price-temp span");
    totalSpan.textContent = total.toLocaleString('vi-VN') + "đ";

    // Bật/tắt nút Mua ngay
    const buyButton = document.querySelector("#stickyBottomBar .btn-action");
    if (total > 0) {
        buyButton.disabled = false;
        buyButton.classList.remove("disabled");
    } else {
        buyButton.disabled = true;
        buyButton.classList.add("disabled");
    }
}
$(document).on("click", ".btnXoa", function () {
    console.log("a")
    maCTSP = $(this).data("ctsp");
    maGHCT = $(this).data("ghct");
    $("#confirmDeleteModal").css("display", "flex");
});


// Cancel
$("#confirmNo").click(function () {
    maCTSP = null;
    maGHCT = null;
    $("#confirmDeleteModal").hide();
});

// Confirm Delete
$("#confirmYes").click(function () {
    if (!maCTSP || !maGHCT) return;
    $.ajax({
        url: `/cart/xoaSanPham/${maGHCT}/${maCTSP}`, // gửi 2 tham số
        type: "Delete",
        success: (data) => {
        $(`#ProductId-${data.maGHCT}`).fadeOut(200, function() {
                    $(this).remove();

                    // Cập nhật tổng dựa trên checkbox còn lại
                    updateTotal();
                });
            showSuccessToast(data.message);
            updateCartCount();
            $("#confirmDeleteModal").hide();
        },
        error: () => alert("Xoá thất bại!")
    });

    maCTSP = null;
    maGHCT = null;
});


document.querySelector("#btn-thanh-toan").addEventListener("click", function () {
    const selectedMaGHCT = getSelectedMaGHCT();
    console.log(selectedMaGHCT);
    if (selectedMaGHCT.length === 0) {
        alert("Vui lòng chọn sản phẩm trước khi thanh toán!");
        return;
    }
    const iput=document.getElementById("maGHCTs");
    iput.value = selectedMaGHCT.join(",");
     document.getElementById("checkoutForm").submit();
});



$(document).ready(function() {
    updateCartCount();
});

