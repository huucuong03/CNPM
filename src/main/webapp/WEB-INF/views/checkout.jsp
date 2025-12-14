<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../../../assets/css/toast.css">
<%@ include file="toast.jsp" %>
<div id="toast"></div>
<div  class="super-cart-container" style="padding-top: 15px;">
   <div class="cart-header">
      <div class="go-back">
         <a class="d-flex align-items-center button__back">
            <svg width="20" height="17" viewBox="0 0 20 17" fill="none" xmlns="http://www.w3.org/2000/svg">
               <path d="M19 8.5L1 8.5M1 8.5L8 1M1 8.5L8 16" stroke="#121219" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
            <p></p>
         </a>
         <p class="title">Thông tin</p>
         <div></div>
      </div>
      <!---->
   </div>
   <!----> 
   <div  class="block-info">
      <div  class="block-box">
         <div  class="navCart">
            <div  class="nav__item active"><span >
               1. Thông tin
               </span>
            </div>
            <div  class="nav__item"><span >
               2. Thanh toán
               </span>
            </div>
         </div>
         <div class="view-list">
            <div  class="view-list__wrapper">
               <c:forEach var="item" items="${listghct}">
                  <c:set var="ghct" value="${item['gioHangChiTiet']}"/>
                  <c:set var="giamGia" value="${item['giaGiam']}" />
                  <div class="item" data-maghct="${ghct.magiohangchitiet}">
                     <img src="http://localhost:8080/img/${ghct.chiTietSanPham.hinhAnhURL}" 
                        alt="${ghct.chiTietSanPham.sanPham.tenSanPham}" 
                        loading="lazy" class="item__img">
                     <div class="item__info">
                        <p class="item__name">
                           ${ghct.chiTietSanPham.sanPham.tenSanPham} (${ghct.chiTietSanPham.sanPham.maSanPham}) - ${ghct.chiTietSanPham.mauSac.tenMauSac}
                        </p>
                        <div class="item__price">
                           <div class="block-box-price">
                              <div class="box-info__box-price">
                                 <c:choose>
                                    <c:when test="${giamGia != null && giamGia.giaSauKhiGiam != null && giamGia.giaSauKhiGiam < ghct.chiTietSanPham.giaBan}">
                                       <p class="product__price--show">
                                          <fmt:formatNumber value="${giamGia.giaSauKhiGiam}" type="number" groupingUsed="true"/>
                                          đ
                                       </p>
                                       <p class="product__price--through">
                                          <fmt:formatNumber value="${ghct.chiTietSanPham.giaBan}" type="number" groupingUsed="true"/>
                                          đ
                                       </p>
                                    </c:when>
                                    <c:otherwise>
                                       <p class="product__price--show">
                                          <fmt:formatNumber value="${ghct.chiTietSanPham.giaBan}" type="number" groupingUsed="true"/>
                                          đ
                                       </p>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
                           </div>
                           <p>
                              Số lượng:
                              <span class="text-danger">${ghct.soLuong}</span>
                           </p>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
            <!---->
         </div>
         <form id="myForm" action="/cart/submit-order" method="post">
         <div   class="block-customer">
            <p >Thông tin khách hàng</p>
            <div  class="block-customer__wrapper">
               <div  class="block-customer__main">
                  <div  class="customer-input__1">
                     <div  class="customer-name">
                        <p style="font-size:19px;margin:auto;">${kh.ten}</p>
                        <span data-v-04f8aa41=""  class="level" style="color: rgb(231, 55, 183); border: 1px solid rgb(231, 55, 183); white-space: nowrap;">
                        S-NULL
                        </span>
                     </div>
                     <p  class="customer-phone">${kh.sdt} </p>
                  </div>
                  <div  class="customer-input__2">
                     <div   class="box-input">
                        <input  type="email" placeholder="Email" maxlength="100" autocomplete="off" class="box-input__main" fdprocessedid="ixye7u" name="email"> <label >EMAIL</label> 
                        <div  class="box-input__line"></div>
                        <!---->
                     </div>
                     <!----><br > <span >(*) Hóa đơn VAT sẽ được gửi qua email này</span>
                  </div>
               </div>
               <div  class="block-customer__bottom">
                  <div  class="bottom__item"><input  type="checkbox" name="emailPromo" id="emailPromo"> <label  for="emailPromo">
                     Nhận email thông báo và ưu đãi từ AZURA
                     </label>
                  </div>
               </div>
            </div>
         </div>
         <div   class="block-payment-info">
            <p  class="block-payment-info__title">Thông tin nhận hàng</p>
            <div  class="block-payment-info__main">
               <div  class="payment-info-method">
                  <div style="background-color:#fff">
                     <input  id="payment-info-method-pickup" value="pickup" type="radio" checked>  
                     <label  class="mb-0" style="font-weight: 400;">Giao hàng tận nơi</label>
                  </div>
                  <div style="height: 54px;">
                     <%-- <input  id="payment-info-method-shipping" value="shipping" type="radio"> <label  class="mb-0">Giao hàng tận nơi</label> --%>
                  </div>
               </div>
               <div  class="payment-info-main">
                  <div  class="payment-info-wrapper">
                     <!----> 
                     <div   class="shipping-pre-wrapper">
                        <div  class="field-group">
                           <div   class="box-input">
                              <input  type="text" placeholder="Họ tên người nhận" maxlength="1000" autocomplete="off" class="box-input__main" fdprocessedid="ylt7jb" name="nguoiNhan"> <label >TÊN NGƯỜI NHẬN</label> 
                              <div  class="box-input__line"></div>
                              <!---->
                           </div>
                           <div   class="box-input">
                              <input  type="text" placeholder="Số điện thoại người nhận" maxlength="10" autocomplete="off" class="box-input__main" fdprocessedid="rv67n" name="sdt"> <label >SĐT NGƯỜI NHẬN</label> 
                              <div  class="box-input__line"></div>
                              <!---->
                           </div>
                        </div>
                        <div  class="field-wrapper">
                           <div class="field-group-wrapper">
                              <div class="field-group-wrapper__child-1">
                                 <div class="box-input box-input--hasvalue">
                                    <input type="text" id="provinceInput" placeholder="Tỉnh / Thành phố" autocomplete="off" class="box-input__main" name="tinh" >
                                    <label>Tỉnh / Thành phố</label> 
                                    <div class="box-input__line"></div>
                                    <div class="dropdown" style="display: none;"  id="provinceList"></div>
                                 </div>
                              </div>
                              <div class="box-input box-input--hasvalue">
                                 <input type="text" id="wardInput" placeholder="Phường / Xã" autocomplete="off" class="box-input__main" name="xa">
                                 <label>Phường / Xã</label> 
                                 <div class="box-input__line"></div>
                                 <div class="dropdown" style="display: none;"  id="wardList"></div>
                              </div>
                           </div>
                        </div>
                        <div   class="box-input">
                           <input  type="text" placeholder="Số nhà, tên đường (Vui lòng chọn quận/huyện và phường/xã trước)" autocomplete="off" class="box-input__main" fdprocessedid="8hropf" name="diaChi"> 
                           <label d class="estimated-delivery-time">Giao từ 1-2 ngày</label> 
                           <div  class="box-input__line"></div>
                           <div  class="box-input__arrow">
                              <svg  width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="icon">
                                 <path  d="M8.00004 10.6668C7.84427 10.6671 7.69331 10.6128 7.57337 10.5135L3.57337 7.18012C3.28986 6.94448 3.25106 6.52362 3.4867 6.24012C3.72234 5.95661 4.1432 5.91781 4.4267 6.15345L8.00004 9.14012L11.5734 6.26012C11.7111 6.14827 11.8877 6.09594 12.0642 6.11471C12.2406 6.13348 12.4023 6.2218 12.5134 6.36012C12.6368 6.49869 12.6969 6.68244 12.6792 6.86716C12.6614 7.05188 12.5675 7.22086 12.42 7.33345L8.42004 10.5535C8.29665 10.6371 8.14877 10.677 8.00004 10.6668Z" fill="#717171"></path>
                              </svg>
                           </div>
                           <!---->
                        </div>
                        <!---->
                     </div>
                     <div   class="box-input">
                        <input  type="text" placeholder="Ghi chú khác (nếu có)" maxlength="255" autocomplete="off" class="box-input__main" fdprocessedid="polgh" name="note"> <label >GHI CHÚ</label> 
                        <div  class="box-input__line"></div>
                        <input type="hidden" name="maGHCTs" id="maGHCTsInput">
                        <!---->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         </form>
         <%-- <div  class="block-payment-info__main" style="margin-top: 20px; margin-bottom: 20px; background-color: rgb(255, 255, 255);">
            <div   class="vat-info">
               <div  class="block-payment__checkvat">
                  <div  class="checkvat__checkbox">
                     <div  class="checkvat-confirm">
                        <p >Quý khách có muốn xuất hóa đơn công ty không?</p>
                        <div >
                           <div ><input  id="VAT-Yes" type="radio" name="VAT" value="true"> <label  for="VAT-Yes">Có</label></div>
                           <div ><input  id="VAT-No" type="radio" name="VAT" value="false"> <label  for="VAT-No">Không</label></div>
                        </div>
                     </div>
                     <!----> <!----> <!---->
                  </div>
                  <!---->
               </div>
            </div>
            </div> --%>
         <div  style="margin-top: 20px; margin-bottom: 50px; display: flex; justify-content: center; align-items: center;">
            <!---->
         </div>
      </div>
   </div>
</div>
<!----> 
<div  >
   <!----> <!---->
</div>
<div >
   <div class="bottom-bar container mt-auto">
      <div class="total-box d-flex justify-content-between align-items-start">
         <p class="title-temp" style="font-size:16px;margin: 0;">Tổng tiền tạm tính:</p>
         <div class="price d-flex flex-column align-items-end">
            <span class="total">
               <fmt:formatNumber value="${tongTien}" type="number" groupingUsed="true"/>
               đ
            </span>
         </div>
      </div>
      <div class="btn-submit mt-2">
         <button id="submitBtn" class="button__go-next btn btn-danger d-flex flex-column justify-content-center align-items-center w-100" style="font-size: 1rem;margin: 0;border-radius: .25rem;padding: .375rem .75rem;" fdprocessedid="z9vl9k">
         Đặt Hàng
         </button> <!---->
      </div>
   </div>
   <div class="clear"></div>
</div>
</div>
   <script src="/assets/js/toast.js"></script>
   <% if (request.getAttribute("error") != null) { %>
<script>
    showErrorToast("<%= request.getAttribute("error") %>");
</script>
<% } %>
<script>
document.getElementById('submitBtn').addEventListener('click', function() {
   const maGHCTs = getMaGHCTs(); // "1,2,3"

    if (!maGHCTs) {
        alert("Không có sản phẩm để thanh toán");
        return;
    }
   document.getElementById('maGHCTsInput').value = maGHCTs;
  document.getElementById('myForm').submit();
});
function getMaGHCTs() {
    const items = document.querySelectorAll(".item[data-maghct]");
    const ids = [];

    items.forEach(item => {
        const id = item.getAttribute("data-maghct");
        if (id) {
            ids.push(id);
        }
    });

    return ids.join(",");
}
</script>