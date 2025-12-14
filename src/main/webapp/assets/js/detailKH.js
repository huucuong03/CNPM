         document.addEventListener("DOMContentLoaded", updateCartCount);
          function updateCartCount() {
     const cartCountEl = document.getElementById("countGH");
    $.ajax({
        url: "/cart/get-count",
        method: "GET",
        dataType: "json",
        success: function(data) {
            if (data.success) {
                const cartSize =data.cartSize
                cartCountEl.textContent  = cartSize;
            }
        },
        error: function(xhr) {
            console.error("Lỗi lấy số lượng giỏ hàng:", xhr.responseText);
        }
    });
}