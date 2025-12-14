<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<div class="cps-container cps-body">
<div style="display: none;">
   <div id="page_loader">
      <div class="logo"></div>
      <div class="loader"></div>
   </div>
</div>
<div id="search-catalog-page">
   <div id="breadcrumbs" class="bannerTopHead">
      <div class="block-breadcrumbs">
         <div class="cps-container">
            <ul>
               <li>
                  <div>
                     <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_2841_7864)">
                           <path d="M3.33333 8H2L8 2L14 8H12.6667" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                           <path d="M3.3335 8V12.6667C3.3335 13.0203 3.47397 13.3594 3.72402 13.6095C3.97407 13.8595 4.31321 14 4.66683 14H11.3335C11.6871 14 12.0263 13.8595 12.2763 13.6095C12.5264 13.3594 12.6668 13.0203 12.6668 12.6667V8" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                           <path d="M6 14V9.99996C6 9.64634 6.14048 9.3072 6.39052 9.05715C6.64057 8.8071 6.97971 8.66663 7.33333 8.66663H8.66667C9.02029 8.66663 9.35943 8.8071 9.60948 9.05715C9.85952 9.3072 10 9.64634 10 9.99996V14" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                        </g>
                        <defs>
                           <clipPath id="clip0_2841_7864">
                              <rect width="16" height="16" fill="white"></rect>
                           </clipPath>
                        </defs>
                     </svg>
                  </div>
                  <a href="http://localhost:8080/index" class="button__home">Trang chủ</a>
               </li>
               <li>
                  <div class="separator">/</div>
                  <p>
                     Kết quả tìm kiếm cho: '${keytimkiem}'
                  </p>
               </li>
            </ul>
         </div>
      </div>
      <div class="clear"></div>
   </div>
   <div class="search-sort mb-2" id="sortSearch" style="">
      <div class="d-flex">
         <p style="margin:0;width: 9%;">Sắp xếp theo</p>
         <h1 class="search-result-count has-text-centered mb-0" style="">Tìm thấy
            <strong>${totalCount}</strong> sản phẩm cho từ
            khoá
            <strong id="keytimkiem">${keytimkiem}</strong>
         </h1>
      </div>
      <div class="search-sort-list is-flex my-2">
         <div class="search-sort-item is-flex is-active">
            <!---->
            Liên quan
         </div>
         <div class="search-sort-item is-flex">
            <div class="icon">
               <svg height="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                  <path d="M416 288h-95.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H416c17.67 0 32-14.33 32-32S433.7 288 416 288zM544 32h-223.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H544c17.67 0 32-14.33 32-32S561.7 32 544 32zM352 416h-32c-17.67 0-32 14.33-32 32s14.33 32 32 32h32c17.67 0 31.1-14.33 31.1-32S369.7 416 352 416zM480 160h-159.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H480c17.67 0 32-14.33 32-32S497.7 160 480 160zM192.4 330.7L160 366.1V64.03C160 46.33 145.7 32 128 32S96 46.33 96 64.03v302L63.6 330.7c-6.312-6.883-14.94-10.38-23.61-10.38c-7.719 0-15.47 2.781-21.61 8.414c-13.03 11.95-13.9 32.22-1.969 45.27l87.1 96.09c12.12 13.26 35.06 13.26 47.19 0l87.1-96.09c11.94-13.05 11.06-33.31-1.969-45.27C224.6 316.8 204.4 317.7 192.4 330.7z"></path>
               </svg>
            </div>
            Giá cao
         </div>
         <div class="search-sort-item is-flex">
            <div class="icon">
               <svg height="15" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                  <path d="M320 224H416c17.67 0 32-14.33 32-32s-14.33-32-32-32h-95.1c-17.67 0-32 14.33-32 32S302.3 224 320 224zM320 352H480c17.67 0 32-14.33 32-32s-14.33-32-32-32h-159.1c-17.67 0-32 14.33-32 32S302.3 352 320 352zM320 96h32c17.67 0 31.1-14.33 31.1-32s-14.33-32-31.1-32h-32c-17.67 0-32 14.33-32 32S302.3 96 320 96zM544 416h-223.1c-17.67 0-32 14.33-32 32s14.33 32 32 32H544c17.67 0 32-14.33 32-32S561.7 416 544 416zM192.4 330.7L160 366.1V64.03C160 46.33 145.7 32 128 32S96 46.33 96 64.03v302L63.6 330.7c-6.312-6.883-14.94-10.38-23.61-10.38c-7.719 0-15.47 2.781-21.61 8.414c-13.03 11.95-13.9 32.22-1.969 45.27l87.1 96.09c12.12 13.26 35.06 13.26 47.19 0l87.1-96.09c11.94-13.05 11.06-33.31-1.969-45.27C224.6 316.8 204.4 317.7 192.4 330.7z"></path>
               </svg>
            </div>
            Giá thấp
         </div>
      </div>
   </div>
   <div class="search-result-content">
      <div id="productListSearch col-inner" class="block-product-list-filter">
         <div class="product-list-filter is-flex is-flex-wrap-wrap row">
            <c:forEach var="sp" items="${ctsps}">
               <div class="product-info-container product-item">
                  <div class="product-info">
                     <a rel="" href="/san-pham/${sp.tenSanPham}" class="product__link button__link">
                        <!-- Hình ảnh -->
                        <div class="product__image">
                           <img 
                              src="http://localhost:8080/img/${sp.hinhAnhURL}" 
                              width="358" 
                              height="358" 
                              alt="${sp.tenSanPham}" 
                              class="product__img">
                        </div>
                        <!-- Tên sản phẩm -->
                        <div class="product__name">
                           <h3>${sp.tenSanPham} ${sp.dungLuong} ${sp.tenMau} | Chính hãng</h3>
                        </div>
                        <!-- Giá -->
                        <div class="block-box-price">
                           <div class="box-info__installment" style="display: none;">Trả góp 0%</div>
                           <div class="box-info__box-price">
                              <c:choose>
                                 <c:when test="${sp.giaSauKhiGiam != null}">
                                    <!-- Giá sau giảm -->
                                    <p class="product__price--show" >
                                       <bdi>
                                          <fmt:formatNumber value="${sp.giaSauKhiGiam}" type="number"/>
                                          <span class="woocommerce-Price-currencySymbol">₫</span>
                                       </bdi>
                                    </p>
                                    <!-- Giá gạch -->
                                    <p class="product__price--through">
                                       <bdi>
                                          <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                          <span class="woocommerce-Price-currencySymbol">₫</span>
                                       </bdi>
                                    </p>
                                    <div class="product__price--percent">
                                       <p class="product__price--percent-detail">
                                          Giảm&nbsp;<span>${sp.phanTramGiam}%</span>
                                       </p>
                                    </div>
                                 </c:when>
                                 <c:otherwise>
                                    <!-- Giá thường -->
                                    <p class="product__price--show">
                                       <bdi>
                                          <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                          <span class="woocommerce-Price-currencySymbol">₫</span>
                                       </bdi>
                                    </p>
                                 </c:otherwise>
                              </c:choose>
                           </div>
                        </div>
                        <!-- Khuyến mãi -->
                        <div class="product__promotions">
                           <div class="promotion">
                              <p class="coupon-price">
                                 ${sp.moTa}
                              </p>
                           </div>
                        </div>
                     </a>
                  </div>
                  <div class="bottom-div"></div>
                  <div class="install-0-tag">
                     <span>Trả góp <strong>0%</strong></span>
                  </div>
               </div>
            </c:forEach>
         </div>
         <c:if test="${remaining > 0}">
            <div class="has-text-centered">
               <button class="button load-more-btn" id="loadMoreBtn">
                  Xem thêm ${remaining} sản phẩm
                  <svg width="24" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path d="M6.5 9L12.5 15L18.5 9" stroke="#3B82F6" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>
               </button>
            </div>
         </c:if>
         <!---->
      </div>
   </div>
   <div>
   </div>
</div>