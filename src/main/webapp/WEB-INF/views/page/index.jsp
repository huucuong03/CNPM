<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
   com.example.demo.Entity.KhachHang kh = (com.example.demo.Entity.KhachHang) session.getAttribute("khachHang"); 
   %>
<div class="container" style="margin-top: 15px;">
   <div class="row">
      <div class="col large-3 hide-for-medium box_left">
         <div class="menu-top">
            <div id="nav_menu-2" class="widget_nav_menu">
               <div class="menu-main-menu-container">
                  <ul id="menu-main-menu-1" class="menu">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                        <a href="/apple" class="nav-top-link" aria-expanded="false" aria-haspopup="menu"><img class="ux-menu-icon" width="20" height="20" src="http://localhost:8080/wp-content/uploads/2021/08/menu-icon-1.png" alt="">Điện thoại</a>
                        <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                        <ul class="sub-menu">
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-1289 nav-dropdown-col has-child" aria-expanded="false">
                              <a href="/apple">Apple</a>
                              <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1290"><a href="http://localhost:8080/apple/iphone-11-series/">iPhone 11 Series</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1291"><a href="http://localhost:8080/apple/iphone-12-series/">iPhone 12 Series</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292"><a href="http://localhost:8080/apple/iphone-se/">iPhone SE</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1293"><a href="http://localhost:8080/apple/iphone-13-series/">iPhone 13 Series</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-36"><a href="http://localhost:8080/samsung/">Samsung</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-39"><a href="http://localhost:8080/xiaomi/">Xiaomi</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-33"><a href="http://localhost:8080/oppo/">OPPO</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1283"><a href="http://localhost:8080/nokia/">Nokia</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1286"><a href="http://localhost:8080/realme/">Realme</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1288"><a href="http://localhost:8080/vsmart/">Vsmart</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-29"><a href="http://localhost:8080/asus/">ASUS</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1287"><a href="http://localhost:8080/vivo/">Vivo</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1284"><a href="http://localhost:8080/oneplus/">OnePlus</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1285"><a href="http://localhost:8080/nubia/">Nubia</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1294"><a href="http://localhost:8080/dien-thoai-pho-thong/">Điện thoại phổ thông</a></li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="col slider-top large-7 medium-12 box_center">
         <div class="swiper-container">
            <div class="mySwiper2 swiper-initialized swiper-horizontal swiper-backface-hidden">
               <div class="swiper-wrapper" id="swiper-wrapper-b8945dddd39e32a4" aria-live="off" style="transition-duration: 0ms; transform: translate3d(-3700px, 0px, 0px); transition-delay: 0ms;">
                  <div class="swiper-slide swiper-slide-next" style="width: 740px;" role="group" aria-label="3 / 6" data-swiper-slide-index="2"><a href=""><img src="http://localhost:8080/assets/img/banner/samsung_mua_nhi_u.png"></a></div>
                  <div class="swiper-slide" style="width: 740px;" role="group" aria-label="4 / 6" data-swiper-slide-index="3"><a href=""><img src="http://localhost:8080/assets/img/banner/T3300-new.png"></a></div>
                  <div class="swiper-slide" style="width: 740px;" role="group" aria-label="5 / 6" data-swiper-slide-index="4"><a href=""><img src="http://localhost:8080/assets/img/banner/TV.png"></a></div>
                  <div class="swiper-slide" role="group" aria-label="6 / 6" data-swiper-slide-index="5" style="width: 740px;"><a href=""><img src="http://localhost:8080/assets/img/banner/13ACL6.png"></a></div>
                  <div class="swiper-slide swiper-slide-prev" style="width: 740px;" role="group" aria-label="1 / 6" data-swiper-slide-index="0"><a href=""><img src="http://localhost:8080/assets/img/banner/A73.png"></a></div>
                  <div class="swiper-slide swiper-slide-active" style="width: 740px;" role="group" aria-label="2 / 6" data-swiper-slide-index="1"><a href=""><img src="http://localhost:8080/assets/img/banner/iPhone_11-new.png"></a></div>
               </div>
               <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-b8945dddd39e32a4">
                  <svg class="swiper-navigation-icon" width="11" height="20" viewBox="0 0 11 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path d="M0.38296 20.0762C0.111788 19.805 0.111788 19.3654 0.38296 19.0942L9.19758 10.2796L0.38296 1.46497C0.111788 1.19379 0.111788 0.754138 0.38296 0.482966C0.654131 0.211794 1.09379 0.211794 1.36496 0.482966L10.4341 9.55214C10.8359 9.9539 10.8359 10.6053 10.4341 11.007L1.36496 20.0762C1.09379 20.3474 0.654131 20.3474 0.38296 20.0762Z" fill="currentColor"></path>
                  </svg>
               </div>
               <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-b8945dddd39e32a4">
                  <svg class="swiper-navigation-icon" width="11" height="20" viewBox="0 0 11 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path d="M0.38296 20.0762C0.111788 19.805 0.111788 19.3654 0.38296 19.0942L9.19758 10.2796L0.38296 1.46497C0.111788 1.19379 0.111788 0.754138 0.38296 0.482966C0.654131 0.211794 1.09379 0.211794 1.36496 0.482966L10.4341 9.55214C10.8359 9.9539 10.8359 10.6053 10.4341 11.007L1.36496 20.0762C1.09379 20.3474 0.654131 20.3474 0.38296 20.0762Z" fill="currentColor"></path>
                  </svg>
               </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <div class="mySwiper swiper-initialized swiper-horizontal swiper-watch-progress swiper-backface-hidden swiper-thumbs">
               <div class="swiper-wrapper" id="swiper-wrapper-c6779127d1776670" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms; transition-delay: 0ms;">
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible swiper-slide-active" style="width: 148px;" role="group" aria-label="1 / 6">GALAXY A73<br>Ưu đãi cực lớn</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible swiper-slide-next swiper-slide-thumb-active" style="width: 148px;" role="group" aria-label="2 / 6">IPHONE 11<br>Giảm sâu giá sốc</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="3 / 6">PHỤ KIỆN SAMSUNG<br>Mua nhiều giảm sốc</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="4 / 6">ASUS T3300<br>Nhận ngay quà chất</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="5 / 6">TV SAMSUNG<br>Giảm giá đến 40%</div>
                  <div class="swiper-slide" role="group" aria-label="6 / 6" style="width: 148px;">LENOVO YOGA 6<br>Hiệu năng mạnh mẽ</div>
               </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
            <script>
               var swiper = new Swiper(".mySwiper", {
               spaceBetween: 0,
               slidesPerView: 5,
               freeMode: false,
               allowTouchMove: false,
               watchSlidesVisibility: true,
               watchSlidesProgress: true,
               });
               var swiper2 = new Swiper(".mySwiper2", {
               spaceBetween: 0,
               loop: true,
               autoplay: {
                delay: 2500,
                disableOnInteraction: false,
               },
               navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
               },
               thumbs: {
                swiper: swiper,
               },
               });
            </script>
         </div>
      </div>
      <%
         if (kh == null) { 
         %>
      <div class="col large-3 hide-for-medium box_right">
         <div class="image-ads">
            <div class="item-image-ads">
               <div class="d-none d-md-block shadow rounded-3 bg-white p-3 text-dark">
                  <div class="fw-bold d-flex">
                     Trần Hữu Cường
                     <div class="mt-1 d-flex gap-1" style="margin-left:10px">
                        <div class="badge bg-dark text-uppercase p-1" style="color:#fff;height:1rem">S-Null</div>
                     </div>
                  </div>
                  <div class="d-flex align-items-center gap-1">
                     <div class="text-muted" style="font-size: 12px;">086*****34</div>
                     <button class="btn btn-link p-0 text-muted">
                        <!-- SVG Icon -->
                     </button>
                  </div>
                  <div class="mb-2 d-flex align-items-center gap-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Coin Icon -->
                     </div>
                     <a href="https://smember.com.vn" class="d-flex flex-column text-decoration-none ">
                     <span class="fw-bold" style="font-size:16px;">0đ</span>
                     <span class="text-muted" style="font-size: 10px;">Tổng tiền tích lũy</span>
                     </a>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8"></path>
                     </svg>
                  </div>
                  <a href="https://smember.com.vn/promotion" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Icon -->
                     </div>
                     <span>Xem ưu đãi của bạn</span>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8 mb-2"></path>
                     </svg>
                  </a>
                  <a href="https://smember.com.vn/promotion" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Icon -->
                     </div>
                     <span>Xem ưu đãi của bạn</span>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8"></path>
                     </svg>
                  </a>
                  <a href="https://smember.com.vn/promotion" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Icon -->
                     </div>
                     <span>Xem ưu đãi của bạn</span>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8"></path>
                     </svg>
                  </a>
                  <a href="https://smember.com.vn/promotion" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Icon -->
                     </div>
                     <span>Xem ưu đãi của bạn</span>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8"></path>
                     </svg>
                  </a>
                  <a href="https://smember.com.vn/promotion" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <!-- SVG Icon -->
                     </div>
                     <span>Xem ưu đãi của bạn</span>
                     <svg class="ms-auto" width="16" height="16" fill="currentColor">
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m4 4 8 8-8 8"></path>
                     </svg>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <% 
         } else { 
         %>
      <!-- Container chính -->
      <div class="d-flex flex-column w-100 col large-3 " style="max-height: 496px; min-width: 224px; gap: 8px;">
         <!-- Mobile Scrollable Menu -->
         <div class="d-block d-md-none mb-0">
            <div class="overflow-auto" style="white-space: nowrap;">
               <a href="/danh-sach-khuyen-mai" class="d-inline-flex flex-column align-items-center justify-content-center text-center me-2" style="width: 25%;">
                  <div class="d-flex align-items-center justify-content-center rounded-circle bg-light mb-1" style="width: 40px; height: 40px;">
                     <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:32:32/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_hot_deal_home_190825.png" alt="Deal siêu HOT" width="32" height="32" class="img-fluid">
                  </div>
                  <p class="mb-0" style="font-size: 12px; line-height: 1.2;">Deal<br>siêu HOT</p>
               </a>
               <a href="/uu-dai-sinh-vien-hoc-sinh" class="d-inline-flex flex-column align-items-center justify-content-center text-center me-2" style="width: 25%;">
                  <div class="d-flex align-items-center justify-content-center rounded-circle bg-light mb-1" style="width: 40px; height: 40px;">
                     <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:32:32/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_edu_promotion_home_190825.png" alt="Ưu đãi cho giáo dục" width="32" height="32" class="img-fluid">
                  </div>
                  <p class="mb-0" style="font-size: 12px; line-height: 1.2;">Ưu đãi<br>cho giáo dục</p>
               </a>
               <!-- Thêm các items khác tương tự -->
            </div>
         </div>
         <!-- Desktop User Card -->
         <!-- Desktop Menu List -->
         <div class="d-none d-md-block overflow-auto shadow rounded-3 bg-white p-3" style="max-height: 50vh; font-size: 12px;">
            <div class="mb-2">
               <a href="/uu-dai-sinh-vien-hoc-sinh" class="d-block text-center mb-1 py-1 rounded" style="background-color: rgba(0,0,0,0.05); text-decoration: none;">Ưu đãi cho giáo dục</a>
               <a href="https://smember.com.vn/promotion/s-edu" class="d-flex align-items-center gap-2 text-decoration-none mb-1">
               <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:18:18/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_student_home_190825.png" width="18" height="18">
               <span>Đăng ký <b>nhận ưu đãi</b></span>
               </a>
               <!-- Thêm các items khác tương tự -->
            </div>
         </div>
      </div>
      <% 
         } 
         %>
   </div>
   <section class="section" id="section_804548742">
      <div class="section-bg fill">
      </div>
      <div class="section-content relative">
         <div class="row pdb-0" id="row-1814045731">
            <div id="col-852212811" class="col small-12 large-12">
               <div class="col-inner">
                  <div class="img has-hover hide-for-medium x md-x lg-x y md-y lg-y" id="image_938452842">
                     <a class="" href="#">
                        <div class="img-inner dark">
                           <img fetchpriority="high" decoding="async" width="1200" height="75" src="http://localhost:8080/assets/img/banner/km-o-Special_Banner_1200x75_6.jpg" class="attachment-original size-original" alt="">						
                        </div>
                     </a>
                     <style>
                        #image_938452842 {
                        width: 100%;
                        }
                     </style>
                  </div>
                  <div class="img has-hover show-for-medium x md-x lg-x y md-y lg-y" id="image_975644744">
                     <div class="img-inner dark" style="margin:0px 0px 10px 0px;">
                        <img decoding="async" width="800" height="150" src="http://localhost:8080/wp-content/uploads/2021/08/banner-ads-mobile.png" class="attachment-original size-original" alt="">						
                     </div>
                     <style>
                        #image_975644744 {
                        width: 100%;
                        }
                     </style>
                  </div>
               </div>
            </div>
            <style>
               #row-1814045731 > .col > .col-inner {
               background-color: rgb(255, 255, 255);
               }
            </style>
         </div>
      </div>
      <style>
         #section_804548742 {
         padding-top: 0px;
         padding-bottom: 0px;
         }
      </style>
   </section>
   <section class="section" id="section_629166640">
      <div class="section-bg fill">
      </div>
      <div class="section-content relative">
         <div class="row align-middle pdb-0" id="row-1339189191">
            <div id="col-703424715" class="col medium-12 small-12 large-3">
               <div class="col-inner" style="width: 102%;">
                  <h3>ĐIỆN THOẠI NỔI BẬT NHẤT</h3>
                  <a href="/" class="button primary is-link btn-read-more show-for-medium" style="border-radius:99px;">
                  <span>Xem tất cả</span>
                  </a>
               </div>
            </div>
            <div id="col-68942984" class="col brand-items medium-12 small-12 large-9">
               <div class="col-inner text-left">
                  <div class="list-brand-items2">
                     <a title="Apple" href="/apple">Apple</a>
                     <a title="Samsung" href="/samsung">Samsung</a>
                     <a title="Xiaomi" href="/xiaomi">Xiaomi</a>
                     <a title="OPPO" href="/oppo">OPPO</a>
                     <a title="Realme" href="/realme">Realme</a>
                     <a title="Xem tất cả" href="/">Xem tất cả</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="row list-product-home" id="row-1861442257">
            <div id="col-621881846" class="col small-12 large-12">
               <div class="col-inner">
                  <div class="row large-columns-5 medium-columns-3 small-columns-2 row-small">
                     <c:forEach var="sp" items="${products}">
                        <div class="product-small col has-hover product type-product post-1693 status-publish first instock product_cat-apple product_cat-hot-sale product_cat-ipad-pro has-post-thumbnail shipping-taxable purchasable product-type-variable has-default-attributes">
                           <div class="col-inner">
                              <div class="badge-container absolute left top z-1">
                              </div>
                              <div class="product-small box ">
                                 <div class="box-image">
                                    <div class="image-none">
                                       <a href="/san-pham/${sp.tenSanPham}" aria-label="${sp.tenSanPham}">
                                       <img loading="lazy" decoding="async" width="470" height="488" src="http://localhost:8080/img/${sp.anh}" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="">				</a>
                                       <div class="item-hotsale"></div>
                                    </div>
                                    <div class="image-tools is-small top right show-on-hover">
                                    </div>
                                    <div class="image-tools is-small hide-for-small bottom left show-on-hover">
                                    </div>
                                    <div class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
                                    </div>
                                 </div>
                                 <div class="box-text box-text-products">
                                    <div class="title-wrapper">
                                       <p class="name product-title woocommerce-loop-product__title"><a href="/san-pham/${sp.tenSanPham}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">${sp.tenSanPham}</a></p>
                                    </div>
                                    <div class="price-wrapper">
                                       <div class="star-rating" title="Rated 5 out of 5">
                                          <span style="width:100%">
                                          <strong class="rating">5</strong> out of 5</span>
                                       </div>
                                       <span class="price">
                                          <%-- Nếu có giá khuyến mãi và nhỏ hơn giá gốc --%>
                                          <c:choose>
                                             <c:when test="${sp.giaBanGG != null && sp.giaBanGG < sp.giaBan}">
                                                <ins>
                                                   <span class="woocommerce-Price-amount amount">
                                                      <bdi>
                                                         <fmt:formatNumber value="${sp.giaBanGG}" type="number" minFractionDigits="0"/>
                                                         <span class="woocommerce-Price-currencySymbol">₫</span>
                                                      </bdi>
                                                   </span>
                                                </ins>
                                                <del>
                                                   <span style="display:none;">Giá niêm yết: </span>
                                                   <span class="woocommerce-Price-amount amount">
                                                      <bdi>
                                                         <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                                         <span class="woocommerce-Price-currencySymbol">₫</span>
                                                      </bdi>
                                                   </span>
                                                </del>
                                             </c:when>
                                             <c:otherwise>
                                                <span class="woocommerce-Price-amount amount">
                                                   <bdi>
                                                      <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                                      <span class="woocommerce-Price-currencySymbol">₫</span>
                                                   </bdi>
                                                </span>
                                             </c:otherwise>
                                          </c:choose>
                                       </span>
                                       <div class="promotion">Thu cũ lên đời - Trợ giá 1 triệu</div>
                                       <span class="text-count-review">2 đánh giá</span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <style>
         #section_629166640 {
         padding-top: 0px;
         padding-bottom: 0px;
         }
      </style>
   </section>
   <section class="section pk-home" id="section_512847781">
      <div class="section-bg fill">
      </div>
      <div class="section-content relative">
         <div class="row align-middle pdb-0" id="row-94458386">
            <div id="col-1368762419" class="col medium-12 small-12 large-3">
               <div class="col-inner">
                  <h3>DANH MỤC PHỤ KIỆN</h3>
                  <a href="/danh-muc-san-pham/phu-kien/" class="button primary is-link btn-read-more show-for-medium">
                  <span>Xem tất cả</span>
                  </a>
               </div>
            </div>
         </div>
         <div class="row" id="row-2134507371">
            <div id="col-139258056" class="col phu-kien small-12 large-12">
               <div class="col-inner">
                  <a class="plain" href="http://danh-muc-san-pham/phu-kien/phu-kien-apple/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/phu-kien-apple.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Phụ kiện Apple</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/pin-du-phong/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/pin-du-phong.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Pin dự phòng</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/dan-dien-thoai-laptop/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/dan-man-hinh.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Dán màn hình</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/day-deo-dong-ho/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/day-deo-dong-ho.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Dây đồng hồ</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/the-nho-usb/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/the-nho-usb.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Thẻ nhớ</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/camera/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/camera.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Camera</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/thiet-bi-mang/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/thiet-bi-mang.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Thiết bị mạng</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/balo.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Balo, Túi xách</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/cap-sac/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/cap-sac.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Cáp sạc</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/op-lung-bao-da-op-airpods/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/bao-da-op-lung.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Ốp bao da</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/o-cung.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Ổ cứng</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/chuot-ban-phim.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Chuột, bàn phím</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/gaming-gear.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Gaming Gear</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/quat-mini.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Quạt</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/phu-kien-chup-anh.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Phụ kiện chụp ảnh</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="/danh-muc-san-pham/phu-kien/phu-kien-may-tinh-laptop/">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/phu-kien-laptop.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Phụ kiện laptop</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/ram.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>RAM</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/cpu.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>CPU</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/card-man-hinh.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Card màn hình</p>
                        </div>
                     </div>
                  </a>
                  <a class="plain" href="#">
                     <div class="icon-box featured-box icon-box-center text-center">
                        <div class="icon-box-img" style="width: 110px">
                           <div class="icon">
                              <div class="icon-inner">
                                 <img loading="lazy" decoding="async" width="262" height="300" src="http://localhost:8080/wp-content/uploads/2022/04/mainbroad.png" class="attachment-medium size-medium" alt="">					
                              </div>
                           </div>
                        </div>
                        <div class="icon-box-text last-reset">
                           <p>Mainbroad</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
</div>
<style>
#section_512847781 {
padding-top: 0px;
padding-bottom: 0px;
}
</style>
</section>