<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   .notification-panel {
   position: absolute !important;   /* cố định trên viewport */
   top: 80px;                     /* luôn ở 80px từ trên */
   left: 0;                       /* sẽ tính bằng JS */
   min-width: max-content;
   max-height: 70vh;
   z-index: 1050;
   display: none;
   transition: opacity 0.2s ease, transform 0.2s ease;
   transform: scale(0.9);
   }
   .notification-panel.show {
   display: flex;
   transform: scale(1);
   }
</style>
<% 
   com.example.demo.Entity.KhachHang kh = (com.example.demo.Entity.KhachHang) session.getAttribute("khachHang"); 
   %>
<!-- Header area -->
<header id="header" class="header has-sticky sticky-fade">
   <div class="header-wrapper stuck">
      <div id="masthead" class="header-main has-sticky-logo">
         <div class="header-inner justify-content-between container logo-left medium-logo-left" role="navigation">
            <div class="d-flex justify-content-between">
               <!-- Logo -->
               <div class="logo">
                  <a href="/home">
                  <img src="../../../assets/img/logo/AZURA.png" alt="" style="height: 80px;width: 90px">
                  </a>
               </div>
               <div class="flex-col hide-for-medium flex-right my-auto">
                  <ul class="header-nav header-nav-main nav nav-right">
                     <li class="header-search-form search-form html relative has-icon">
                        <div class="header-search-form-wrapper">
                           <div class="searchform-wrapper ux-search-box relative is-normal">
                              <form role="search" method="get" class="searchform" action="/hien-thi-shop">
                                 <div class="flex-row relative">
                                    <div class="flex-col flex-grow">
                                       <label class="screen-reader-text"
                                          for="searchInput">Tìm kiếm:</label>
                                       <input type="search" id="searchInput" class="search-field mb-0" placeholder="Bạn cần tìm gì?" value="${keytimkiem}"
                                          name="tenSanPham" autocomplete="off">
                                       <input type="hidden" name="post_type" value="product">
                                    </div>
                                    <div class="flex-col">
                                       <button type="submit" value="Tìm kiếm"
                                          class="ux-search-submit submit-button secondary button icon mb-0"
                                          aria-label="Gửi">
                                       <i class="bi bi-search" style="font-size: 14px;"></i>
                                       </button>
                                    </div>
                                 </div>
                                 <div class="live-search-results text-left z-top">
                                    <div class="autocomplete-suggestions"
                                       style="position: absolute; display: none; max-height: 303px; z-index: 9999; background-color: #fff;width: 340px;">
                                    </div>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </li>
                     <%-- <li class="html custom html_topbar_left">
                        <img class="call-img-icon" src="../../assets/img/nav/call-icon.png" style="margin-top: 20px;">
                            <a href="tel:18002097" style="color: white;font-size: 12px;">
                                <p>Gọi mua hàng:<br><strong >1800.2097</strong></p>
                            </a>
                        </li> --%>
                     <li class="cart-item has-icon">
                        <!-- Button Giỏ hàng Bootstrap -->
                        <button type="button"  id="btn-gio"
                           class="d-none d-md-flex align-items-center justify-content-center gap-2 text-white rounded btn-gio"
                           style="min-height:40px;">
                           <span class="d-none d-lg-inline">Giỏ hàng</span>
                           <span class="ms-2 image-icon header-cart-icon" id="cart-count" data-icon-label="">
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" style="width:1.5rem; height:1.5rem;margin: 10px 0 0 10px">
                                 <circle cx="176" cy="416" r="16" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></circle>
                                 <circle cx="400" cy="416" r="16" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></circle>
                                 <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M48 80h64l48 272h256"></path>
                                 <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M160 288h249.44a8 8 0 0 0 7.85-6.43l28.8-144a8 8 0 0 0-7.85-9.57H128"></path>
                              </svg>
                           </span>
                        </button>
                        <%-- <div class="cart-popup-inner inner-padding">
                           <div class="cart-popup-title text-center">
                               <h4 class="uppercase">Giỏ hàng</h4>
                               <div class="is-divider"></div>
                           </div>
                           <div class="widget_shopping_cart_content">
                               <div class="ux-mini-cart-empty flex flex-row-col text-center pt pb">
                                   <div class="ux-mini-cart-empty-icon">
                                       <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                            viewBox="0 0 17 19" style="opacity:.1;height:80px;">
                                           <path d="M8.5 0C6.7 0 5.3 1.2 5.3 2.7v2H2.1c-.3 0-.6.3-.7.7L0 18.2c0 .4.2.8.6.8h15.7c.4 0 .7-.3.7-.7v-.1L15.6 5.4c0-.3-.3-.6-.7-.6h-3.2v-2c0-1.6-1.4-2.8-3.2-2.8zM6.7 2.7c0-.8.8-1.4 1.8-1.4s1.8.6 1.8 1.4v2H6.7v-2zm7.5 3.4 1.3 11.5h-14L2.8 6.1h2.5v1.4c0 .4.3.7.7.7.4 0 .7-.3.7-.7V6.1h3.5v1.4c0 .4.3.7.7.7s.7-.3.7-.7V6.1h2.6z"
                                                 fill-rule="evenodd" clip-rule="evenodd" fill="currentColor"></path>
                                       </svg>
                                   </div>
                                   <p class="woocommerce-mini-cart__empty-message empty">Chưa có sản phẩm trong giỏ hàng.</p>
                                   <p class="return-to-shop">
                                       <a class="button primary wc-backward"
                                          href="https://cellphones.mauthemewp.com/cua-hang/">
                                           Quay trở lại cửa hàng
                                       </a>
                                   </p>
                               </div>
                           </div>
                           </div> 
                           </div> --%>
                     </li>
                     <li class="html custom html_topbar_right">
                        <%
                           if (kh != null) { 
                           %>
                        <button id="openNotificationBtn" class="d-none d-md-flex align-items-center justify-content-center gap-2 btn btn-login " >
                           <%= kh.getTen() %>
                           <span class="ms-2 ml-2" >
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 496 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" style="width:1.5rem; height:1.5rem;margin: 10px 0 0 10px">
                                 <path d="M248 104c-53 0-96 43-96 96s43 96 96 96 96-43 96-96-43-96-96-96zm0 144c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm0-240C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm0 448c-49.7 0-95.1-18.3-130.1-48.4 14.9-23 40.4-38.6 69.6-39.5 20.8 6.4 40.6 9.6 60.5 9.6s39.7-3.1 60.5-9.6c29.2 1 54.7 16.5 69.6 39.5-35 30.1-80.4 48.4-130.1 48.4zm162.7-84.1c-24.4-31.4-62.1-51.9-105.1-51.9-10.2 0-26 9.6-57.6 9.6-31.5 0-47.4-9.6-57.6-9.6-42.9 0-80.6 20.5-105.1 51.9C61.9 339.2 48 299.2 48 256c0-110.3 89.7-200 200-200s200 89.7 200 200c0 43.2-13.9 83.2-37.3 115.9z"></path>
                              </svg>
                           </span>
                        </button>
                        <% 
                           } else { 
                           %>
                        <button class="d-none d-md-flex align-items-center justify-content-center gap-2 btn btn-login "onclick="window.location.href='/loginView'" >
                           <span>Đăng Nhập</span>
                           <span class="ms-2 ml-2" >
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 496 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" style="width:1.5rem; height:1.5rem;margin: 10px 0 0 10px">
                                 <path d="M248 104c-53 0-96 43-96 96s43 96 96 96 96-43 96-96-43-96-96-96zm0 144c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm0-240C111 8 0 119 0 256s111 248 248 248 248-111 248-248S385 8 248 8zm0 448c-49.7 0-95.1-18.3-130.1-48.4 14.9-23 40.4-38.6 69.6-39.5 20.8 6.4 40.6 9.6 60.5 9.6s39.7-3.1 60.5-9.6c29.2 1 54.7 16.5 69.6 39.5-35 30.1-80.4 48.4-130.1 48.4zm162.7-84.1c-24.4-31.4-62.1-51.9-105.1-51.9-10.2 0-26 9.6-57.6 9.6-31.5 0-47.4-9.6-57.6-9.6-42.9 0-80.6 20.5-105.1 51.9C61.9 339.2 48 299.2 48 256c0-110.3 89.7-200 200-200s200 89.7 200 200c0 43.2-13.9 83.2-37.3 115.9z"></path>
                              </svg>
                           </span>
                        </button>
                        <% 
                           } 
                           %>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="header-bg-container fill">
         <div class="header-bg-image fill"></div>
         <div class="header-bg-color fill" style="background-color: #e0052b;"></div>
      </div>
   </div>
   <!-- Khung thông báo ẩn ban đầu -->
   <!-- Panel thông báo -->
   <div id="notificationPanel" class="notification-panel card shadow">
      <div class="card-body d-flex flex-column p-0">
         <!--  link -->
         <a href="/detailKh"
            class="d-flex align-items-center gap-2 border rounded m-2 p-2 text-decoration-none text-primary"
            style="justify-content: space-between;border: 1px solid #d70018 !important; color:#d70018 !important;">
            <img src="https://cdn2.cellphones.com.vn/x/media/wysiwyg/smember230625.png"
               alt="" width="50" height="50" class="img-fluid">
            Truy cập Quản lý tài khoản
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ms-auto" width="20" height="20">
               <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
            </svg>
         </a>
         <!-- Header thông báo -->
         <div class="d-flex justify-content-between align-items-center border-bottom p-2">
            <strong>Thông báo</strong>
            <span class="text-success small d-flex align-items-center gap-1">
               Bạn đã đọc tất cả thông báo
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                  <path d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0"/>
                  <path d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708"/>
               </svg>
            </span>
         </div>
         <!-- Body thông báo -->
         <div class="d-flex flex-column align-items-center justify-content-center gap-3 p-4 text-center">
            <div class="text-center text-muted mt-3 ">
               <img src="https://cdn2.cellphones.com.vn/x/media/wysiwyg/empty230625.png"
                  alt="Không có thông báo" class="img-fluid mb-2" style="max-width: 150px;">
               <p class="fw-semibold mb-1">Ở đây hơi trống trải.</p>
               <p class="mb-0">S-Ant sẽ gửi cho bạn những thông báo mới nhất tại đây nhé!</p>
            </div>
         </div>
         <!-- Footer -->
         <div class="border-top p-2">
            <button id="closeNotificationBtn" class="btn btn-outline-primary w-100">Đóng</button>
         </div>
      </div>
   </div>
   <div id="modalBackdrop" style="
    display:none; 
    position:fixed; 
    top:0; left:0; 
    width:100%; height:100%; 
    background-color:rgba(0,0,0,0.5); 
    z-index:9999;">
</div>
   <div id="modalchecklogin" class="position-absolute translate-middle" onclick="event.stopPropagation()"
     style="display:none; z-index:10000; max-width:350px; top:300%; left:41%; width:100%; pointer-events:auto;">
  <div class="bg-white rounded shadow p-3 d-flex flex-column align-items-center position-relative"
       style="animation:fadeInScale 0.2s ease-out;">
       
    <!-- Header -->
    <div class="text-center mb-3">
      <h2 class="fw-semibold text-primary" style="font-size:23px;">Thông báo</h2>
      <p class="small text-muted mb-0" style="font-size:18px;">Vui lòng đăng nhập tài khoản để xem ưu đãi và thanh toán dễ dàng hơn.</p>
    </div>

    <!-- Body -->
    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:80/q:90/plain/https://cellphones.com.vn/media/wysiwyg/chibi2.png" 
         alt="Loading" width="46" height="80" class="mb-3">

    <!-- Buttons -->
    <div class="d-grid gap-2 d-sm-flex">
      <button type="button" onclick="window.location.href='/dang-ky'" class="btn btn-outline-danger flex-fill" style="font-size:17px; border-radius:5%;">Đăng ký</button>
      <button type="button"  onclick="window.location.href='/loginView'" class="btn btn-danger flex-fill" style="font-size:17px; border-radius:5%;">Đăng nhập</button>
    </div>

    <!-- Close Button -->
    <button type="button" id="closechecklogin" class="btn-close position-absolute top-2 end-2"
            style="position:absolute; top:5px; right:0px; width:20px; height:20px;" aria-label="Close">
      <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 32 32" height="30" width="30" xmlns="http://www.w3.org/2000/svg">
        <path fill="none" d="M0 0h24v24H0z"></path>
        <path d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
      </svg>
    </button>
  </div>
</div>

   <script>
      function checkLogin(e) {
          if (e) e.preventDefault();
      
          $.ajax({
              url: "/api/account/check-login",
              type: "GET",
              dataType: "json",
              success: function(data) {
                  if (data.loggedIn) {
                      window.location.href = "/cart"; // đã đăng nhập → chuyển giỏ hàng
                  } else {
      
                      const loginModalEl = document.getElementById("modalchecklogin");
                       const modalBackdrop = document.getElementById("modalBackdrop");
                     loginModalEl.style.display = "block"; 
                     modalBackdrop.style.display = "block"; 
                  }
              },
              error: function() {
                  console.error("Lỗi kiểm tra đăng nhập");
              }
          });
      }
      function closecheckLogin(e) {
          if (e) e.preventDefault();
            const loginModalEl = document.getElementById("modalchecklogin");
            const modalBackdrop = document.getElementById("modalBackdrop");
            modalBackdrop.style.display = "none"; 
            loginModalEl.style.display = "none"; 
           
      }
      function updateCartCount() {
     const cartCountEl = document.getElementById("cart-count");
    $.ajax({
        url: "/cart/get-count",
        method: "GET",
        dataType: "json",
        success: function(data) {
            if (data.success) {
                const cartSize =data.cartSize
                cartCountEl.dataset.iconLabel = cartSize;
            }
        },
        error: function(xhr) {
            console.error("Lỗi lấy số lượng giỏ hàng:", xhr.responseText);
        }
    });
}
      // Gắn event
      document.getElementById("btn-gio").addEventListener("click", checkLogin);
        document.getElementById("closechecklogin").addEventListener("click", closecheckLogin);
      document.getElementById("modalBackdrop").addEventListener("click", closecheckLogin);
      
       document.addEventListener("DOMContentLoaded", updateCartCount);
      const panel = document.getElementById('notificationPanel');
      const openBtn = document.getElementById('openNotificationBtn');
      const closeBtn = document.getElementById('closeNotificationBtn');
      
      function updatePanelPosition(panel, anchor) {
          const panelRect = panel.getBoundingClientRect();
          const rect = anchor.getBoundingClientRect();
          
          // top cố định
          const top = 80; 
          
          // left căn phải button nhưng không vượt quá 1200px
          let left = rect.right - panelRect.width;
          if (left > 1200) left = 1200;
      
          panel.style.top = top + 'px';
          panel.style.left = left + 'px';
      }
      
      // Mở panel
      openBtn.addEventListener('click', (e) => {
          e.stopPropagation();
          console.log("a")
          updatePanelPosition(panel, openBtn);
          panel.style.display = 'flex';      // hiện panel trước animation
          panel.classList.add('show');
      });
      
      // Đóng panel
      function closePanel() {
          panel.classList.remove('show');
          // Sau thời gian animation (~200ms), ẩn panel hoàn toàn
          setTimeout(() => {
              if (!panel.classList.contains('show')) {
                  panel.style.display = 'none';
              }
          }, 200);
      }
      
      closeBtn.addEventListener('click', closePanel);
      
      // Click ngoài để đóng
      document.addEventListener('click', (e) => {
          if (!panel.contains(e.target) && e.target !== openBtn) {
              closePanel();
          }
      });
      
   </script>
</header>