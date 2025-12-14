$(document).ready(function () {

   $("#searchInput").on("keyup", function () {
      let keyword = $(this).val().trim();

      if (keyword.length === 0) {
         $(".autocomplete-suggestions").hide().html("");
         return;
      }

      $.ajax({
         url: "/api/tim-kiem-san-pham",
         method: "GET",
         data: {
            keyword: keyword
         },
         success: function (res) {
            let html = "";
            console.log(res)
            if (res.length === 0) {
               html = `<div class='p-2'>Không có kết quả</div>`;
            } else {
               res.forEach(item => {
                  html += `
                       <a href="/san-pham/${item.tenSanPham}">
<div class="autocomplete-suggestion" data-index="${item.maSanPham}">
    <img class="search-image" src="http://localhost:8080/img/${item.hinhAnhURL}">
    <div class="search-name">${item.tenSanPham}</div>

    <span class="search-price">

        ${
            // Nếu có giảm giá
            item.giaSauKhiGiam > 0
            ?
            `
            <ins>
                <span class="woocommerce-Price-amount amount">
                    <bdi>${formatCurrency(item.giaSauKhiGiam)}
                        <span class="woocommerce-Price-currencySymbol">₫</span>
                    </bdi>
                </span>
            </ins>

            <del>
                <span>Giá gốc: </span>
                <span class="woocommerce-Price-amount amount">
                    <bdi>${formatCurrency(item.giaBan)}
                        <span class="woocommerce-Price-currencySymbol">₫</span>
                    </bdi>
                </span>
            </del>
            `
            :
            // Nếu KHÔNG giảm giá
            `
            <ins>
                <span class="woocommerce-Price-amount amount">
                    <bdi>${formatCurrency(item.giaBan)}
                        <span class="woocommerce-Price-currencySymbol">₫</span>
                    </bdi>
                </span>
            </ins>
            `
        }

    </span>
</div>
</a>
`;

               });
            }

            $(".autocomplete-suggestions")
               .html(html)
               .show();
         }
      });
   });

});

function formatCurrency(number) {
   return Number(number).toLocaleString("vi-VN");
}