<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
 <%@ include file="toast.jsp" %>
 <div id="toast"></div>
<div id="indexSuperCart" data-fetch-key="IndexSuperCart:0"style="font-size:17px;background: #f4f6f8;" class="super-cart-container" data-v-a1a2603a="">
   <div class="cart-header" data-v-5273d083="">
      <div class="go-back" data-v-5273d083="">
         <a href="javascript:history.back()" class="d-flex align-items-center button__back" data-v-5273d083="">
            <svg width="20" height="17" viewBox="0 0 20 17" fill="none" xmlns="http://www.w3.org/2000/svg" data-v-5273d083="">
               <path d="M19 8.5L1 8.5M1 8.5L8 1M1 8.5L8 16" stroke="#121219" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" data-v-5273d083=""></path>
            </svg>
            <p data-v-5273d083=""></p>
         </a>
         <p class="title" data-v-5273d083=""  style="font-size:18px;">Giỏ hàng của bạn</p>
         <div data-v-5273d083=""></div>
      </div>
      <!---->
   </div>
   <!----> 
   <div class="container tabs-cart-type mt-3">
      <button data-type="1" class="tab-item active" fdprocessedid="wouhpc"  style="font-size:14px;">
      Giỏ hàng
      </button><!----><!----><!----><!----><!---->
   </div>
   <div class="container block-info mt-3">
      <div id="listItemSuperCart">
         <div class="header-action d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center justify-content-center">
               <div class="select-product-action custom-control custom-checkbox" style="min-height:2.5em"><input type="checkbox" value="true" class="custom-control-input" id="__BVID__29"><label class="custom-control-label" for="__BVID__29"></label></div>
               <p style="font-size:18px;">Chọn tất cả</p>
            </div>
            <div></div>
         </div>
         <!----> 
<c:forEach var="item" items="${cart}">
    <div class="block__product-item__outer" id="ProductId-${item.magiohangchitiet}">
        <div class="block__product-item">
            <!-- Checkbox và hình ảnh -->
            <div class="checkbox-product">
                <div class="select-product-action custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="chk_${item.magiohangchitiet}">
                    <label class="custom-control-label"style="display: inline-block;margin-bottom: 0;position: relative;vertical-align: top;" for="chk_${item.magiohangchitiet}">
                        <img src="http://localhost:8080/img/${item.chiTietSanPham.hinhAnhURL}" 
                             width="350" 
                             alt="${item.chiTietSanPham.sanPham.tenSanPham} | ${item.chiTietSanPham.mauSac.tenMauSac} | ${item.chiTietSanPham.dungLuong.tenDungLuong}" 
                             loading="lazy" 
                             class="product-img">
                    </label>
                </div>
            </div>

            <!-- Thông tin sản phẩm -->
            <div class="product-info">
                <div class="d-flex justify-content-between align-items-start">
                    <div class="product-name" style="font-size:18px">
                        <a href="/san-pham/${item.chiTietSanPham.sanPham.tenSanPham}"  style="font-size:18px;">
                            ${item.chiTietSanPham.sanPham.tenSanPham} | Chính hãng VN/A - ${item.chiTietSanPham.mauSac.tenMauSac} | ${item.chiTietSanPham.dungLuong.tenDungLuong}
                        </a>
                    </div>
                    <button class="remove-item" data-id="${item.magiohangchitiet}">
                        <!-- SVG icon delete -->
                        <svg width="20" height="20" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <!-- ... path của SVG ... -->
                        </svg>
                    </button>
                </div>

                <!-- Giá sản phẩm -->
                <div class="d-flex justify-content-between align-items-center" style="gap: 5px;">
                    <div class="block-box-price">
                        <div class="box-info__box-price">
                            <c:choose>
    <c:when test="${item.giaSauKhiGiam != null && item.giaSauKhiGiam < item.chiTietSanPham.giaBan}">
        <p class="product__price--show" data-price="${item.giaSauKhiGiam}">
            <fmt:formatNumber value="${item.giaSauKhiGiam*item.soLuong}" type="number" groupingUsed="true"/>đ
        </p>
        <p class="product__price--through">
            <fmt:formatNumber value="${item.chiTietSanPham.giaBan*item.soLuong}" type="number" groupingUsed="true"/>đ
        </p>
    </c:when>
    <c:otherwise>
        <p class="product__price--show" data-price="${item.chiTietSanPham.giaBan}">
            <fmt:formatNumber value="${item.chiTietSanPham.giaBan*item.soLuong}" type="number" groupingUsed="true"/>đ
        </p>
    </c:otherwise>
</c:choose>
                        </div>
                    </div>

                    <!-- Số lượng -->
                    <div class="action d-flex">
                        <span class="minus d-flex justify-content-center align-items-center" data-id="${item.magiohangchitiet}">-</span>
                        <input type="text" readonly="readonly"style="height: 30px;width: 30px;margin: 0;" value="${item.soLuong}" id="qty_${item.magiohangchitiet}">
                        <span class="plus d-flex justify-content-center align-items-center" data-id="${item.magiohangchitiet}">+</span>
                    </div>
                </div>

                <div class="discount-tag">
                  
                </div>
                <div class="btnXoa" data-ctsp="${item.chiTietSanPham.maChiTietSanPham}" data-ghct="${item.magiohangchitiet}">
                <i class="bi bi-trash3-fill"></i>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

         <!---->
      </div>
   </div>
   <div>
      <div id="stickyBottomBar">
         <div class="temp-info d-flex flex-column">
            <div class="price-temp">
               <p>Tạm tính: <span>${tongTien}đ</span></p>
            </div>
         </div>
        <form id="checkoutForm" method="post" action="/cart/check-out">
        <input type="hidden" name="maGHCTs" id="maGHCTs">
        </form>
         <button disabled="disabled" class="btn-action disabled" data-id="" id="btn-thanh-toan">
         Mua ngay
         </button>
      </div>
      <div id="viewProductStudent" style="display:none;">
         <!---->
      </div>
      <div id="listConfirmedBMSMModal" style="display:none;">
         <!---->
      </div>
      <div class="clear"></div>
   </div>
   <!----> 
   <div></div>
</div>
<div id="confirmDeleteModal" class="confirm-modal">
    <div class="confirm-box">
        <p>Bạn có chắc muốn xoá sản phẩm này?</p>
        <div class="confirm-actions">
            <button id="confirmYes" class="yes-btn">Xoá</button>
            <button id="confirmNo" class="no-btn">Hủy</button>
        </div>
    </div>
</div>
<script src="/assets/js/cart.js"></script>
