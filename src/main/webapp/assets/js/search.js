$(document).ready(function() {
    let tenSanPham = document.getElementById("keytimkiem").innerText;
    let page = 1; // trang hiện tại
    let size = 20; // số sản phẩm mỗi lần load
    let sort = ''; // '', 'asc', 'desc'

    // Hàm load sản phẩm
    function loadProducts(reset = false) {
        if (reset) {
            page = 0;
            $('.product-list-filter').empty();
            $('#loadMoreBtn').show();
        }

        $.ajax({
            url: '/hien-thi-shop/load-more',
            method: 'GET',
            data: { tenSanPham: tenSanPham, page: page, size: size, sort: sort },
            success: function(response) {
                const products = response.products || [];
                const remaining = response.remaining;

                products.forEach(sp => {
                    let html = `
                        <div class="product-info-container product-item">
                            <div class="product-info">
                                <a href="/san-pham/${sp.tenSanPham}" class="product__link button__link">
                                    <div class="product__image">
                                        <img src="http://localhost:8080/img/${sp.hinhAnhURL}" 
                                             width="358" height="358" alt="${sp.tenSanPham}" class="product__img">
                                    </div>
                                    <div class="product__name">
                                        <h3>${sp.tenSanPham} ${sp.dungLuong} ${sp.tenMau} | Chính hãng</h3>
                                    </div>
                                    <div class="block-box-price">
                                        <div class="box-info__box-price">
                                            ${sp.giaSauKhiGiam ? `
                                                <p class="product__price--show">
                                                    <bdi>${sp.giaSauKhiGiam.toLocaleString()}₫</bdi>
                                                </p>
                                                <p class="product__price--through">
                                                    <bdi>${sp.giaBan.toLocaleString()}₫</bdi>
                                                </p>
                                                <div class="product__price--percent">
                                                    <p class="product__price--percent-detail">
                                                        Giảm&nbsp;<span>${sp.phanTramGiam}%</span>
                                                    </p>
                                                </div>` 
                                            : `<p class="product__price--show">
                                                <bdi>${sp.giaBan.toLocaleString()}₫</bdi>
                                            </p>`}
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    `;
                    $('.product-list-filter').append(html);
                });

                // Cập nhật nút load-more
                if (remaining <= 0) {
                    $('#loadMoreBtn').hide();
                } else {
                    $('#loadMoreBtn').text(`Xem thêm ${remaining} sản phẩm`);
                    page += 1; // tăng trang cho lần load tiếp theo
                }
            },
            error: function(err) {
                console.error(err);
                alert('Không thể tải thêm sản phẩm!');
            }
        });
    }

    // Click load-more
    $('#loadMoreBtn').click(function() {
        loadProducts();
    });

    // Click sắp xếp giá
    $('.search-sort-item').click(function() {
        const sortType = $(this).text().trim();
        if (sortType === 'Giá cao') {
            sort = 'desc';
        } else if (sortType === 'Giá thấp') {
            sort = 'asc';
        } else {
            sort = '';
        }
        loadProducts(true); // reset = true => xóa sản phẩm cũ và load mới theo sort
    });

});
