<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="../../../assets/css/bodyHoaDon.css">
<div class="flex-auto min-w-0">
   <div class="w-full h-full">
      <div class="relative flex justify-center items-center w-full h-[50px] tablet:hidden bg-pure-white">
         <div class="flex items-center gap-2x-small"><span class="text-medium font-bold">Lịch sử mua hàng</span></div>
      </div>
      <div class="h-full px-0 tablet:px-medium tablet:bg-pure-white tablet:rounded-1x-large relative">
         <div class="w-full sticky top-0 left-0 z-10">
            <div dir="ltr" data-slot="scroll-area" class="cpsui:relative w-full bg-pure-white border border-neutral-200 tablet:border-none" style="position: relative; --radix-scroll-area-corner-width: 0px; --radix-scroll-area-corner-height: 0px;">
               <div>
                  <div style="min-width: 100%; display: table;">
                    <div class="w-full flex">
    <a href="/detailKh/order?trangThai=4" data-value="4" class="relative shrink-0 select-none cursor-pointer min-w-[125px] text-base py-small px-small flex items-center justify-center ${trangThai == 4 ? 'trangthai-active text-primary-500 font-semi-bold after:absolute after:bottom-0 after:left-0 after:right-0 after:w-full after:h-[2px] after:bg-primary-500' : 'text-neutral-500 font-regular'}">Tất cả</a>
    
    <a href="/detailKh/order?trangThai=0" data-value="0" class="relative shrink-0 select-none cursor-pointer min-w-[125px] text-base py-small px-small flex items-center justify-center ${trangThai == 0 ? 'trangthai-active text-primary-500 font-semi-bold after:absolute after:bottom-0 after:left-0 after:right-0 after:w-full after:h-[2px] after:bg-primary-500' : 'text-neutral-500 font-regular'}">Chờ xác nhận</a>
    
    <a href="/detailKh/order?trangThai=1" data-value="1" class="relative shrink-0 select-none cursor-pointer min-w-[125px] text-base py-small px-small flex items-center justify-center ${trangThai == 1 ? 'trangthai-active text-primary-500 font-semi-bold after:absolute after:bottom-0 after:left-0 after:right-0 after:w-full after:h-[2px] after:bg-primary-500' : 'text-neutral-500 font-regular'}">Đang vận chuyển</a>
    
    <a href="/detailKh/order?trangThai=2" data-value="2" class="relative shrink-0 select-none cursor-pointer min-w-[125px] text-base py-small px-small flex items-center justify-center ${trangThai == 2 ? 'trangthai-active text-primary-500 font-semi-bold after:absolute after:bottom-0 after:left-0 after:right-0 after:w-full after:h-[2px] after:bg-primary-500' : 'text-neutral-500 font-regular'}">Đã giao hàng</a>
    
    <a href="/detailKh/order?trangThai=3" data-value="0" class="relative shrink-0 select-none cursor-pointer min-w-[125px] text-base py-small px-small flex items-center justify-center ${trangThai == 3 ? 'trangthai-active text-primary-500 font-semi-bold after:absolute after:bottom-0 after:left-0 after:right-0 after:w-full after:h-[2px] after:bg-primary-500' : 'text-neutral-500 font-regular'}">Đã huỷ</a>
</div>

                  </div>
               </div>
            </div>
            <div class="flex w-full items-center gap-medium bg-pure-white p-small tablet:p-0 tablet:pt-small"   >
               <span class="hidden tablet:block font-medium text-medium">Lịch sử mua hàng</span>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col w-full tablet:w-auto tablet:max-w-[300px]">
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:pl-medium cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base">
                        <input placeholder="Từ ngày" data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                         id="startDate" type="text" value="${startDate}" fdprocessedid="25hw5">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="cpsui:shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                           <path d="M5 12l14 0"></path>
                           <path d="M13 18l6 -6"></path>
                           <path d="M13 6l6 6"></path>
                        </svg>
                        <input placeholder="Đến ngày" data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" 
                        id="endDate" type="text" value="${endDate}" fdprocessedid="hy4lla">
                        <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square " id="btnDate">
                           <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:select-none cpsui:cursor-pointer cpsui:rounded-base cpsui:hover:bg-neutral-100 cpsui:h-[30px] cpsui:w-[30px]" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«rs»" data-state="closed" data-slot="popover-trigger">
                              <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="cpsui:text-neutral-600" height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M8 2v4"></path>
                                 <path d="M16 2v4"></path>
                                 <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                                 <path d="M3 10h18"></path>
                              </svg>
                           </div>
                        </div>
                     </div>
                     <div style="display:none" id="calendarContainer"></div>
                     <div id="dateError" style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path></svg>Định dạng ngày không hợp lệ</div>
                  </div>
               </div>
            </div>
         </div>
         <div id="orderList">
         <c:choose>
            <c:when test="${not empty listHD}">
               <c:forEach var="hd" items="${listHD}">
                  <div class="YL_VlX">
                     <div>
                        <div class="J632se">
                           <div class="kG_yF0">
                              <div class="ylYzwa" tabindex="0">
                                 <div class="LY5oll">
                                    <div class="RBPP9y">
                                       <div class="UDaMW3" tabindex="0">
                                          Thời gian đặt hàng:  
                                          <fmt:formatDate value="${hd.ngayTao}" pattern="yyyy/MM/dd"/>
                                       </div>
                                    </div>
                                    <div>
                                       <span class="O2yAdQ">
                                          <c:choose>
                                             <c:when test="${hd.trangThai == 0}">
                                                <div  style="color: #141414ff;width: 85px;text-align: center;background-color: yellow;border-radius: 8%;">Chờ xử lý</div>
                                             </c:when>
                                             <c:when test="${hd.trangThai == 1}">
                                                <div  style="color: #0e0ebd;width: 85px;text-align: center;background-color: #d2d2ff;border-radius: 8%;">Đang giao</div>
                                             </c:when>
                                             <c:when test="${hd.trangThai == 2}">
                                                <div style="color:green">Đã giao</div>
                                             </c:when>
                                             <c:otherwise> <span style="color:red;">Đã Hủy</span></c:otherwise>
                                          </c:choose>
                                       </span>
                                    </div>
                                 </div>
                              </div>
                                 <h3 class="a11y-hidden"></h3>
                                 <a aria-label="" href="/detailKh/hoadon/${hd.maHoaDon}">
                                    <div>
                                       <div class="bdAfgU">
                                          <div class="FNHV0p">
                                             <div>
                                                   <c:set var="maxCt" value="${sanPhamDacNhat[hd.maHoaDon]}"/>
                                                   <c:if test="${not empty maxCt}">
                                                      <div class="mZ1OWk">
                                                         <div class="dJaa92">
                                                            <div class="divimg">
                                                               <img src="http://localhost:8080/img/${maxCt.chiTietSanPham.hinhAnhURL}" class="gQuHsZ" style="object-fit: cover;" alt="" tabindex="0" elementtiming="shopee:heroComponentPaint">
                                                            </div>
                                                            <div class="nmdHRf">
                                                               <div>
                                                                  <div class="zWrp4w"><span class="DWVWOJ" tabindex="0">${maxCt.chiTietSanPham.sanPham.tenSanPham} ${maxCt.chiTietSanPham.dungLuong.tenDungLuong} ${maxCt.chiTietSanPham.mauSac.tenMauSac}</span></div>
                                                               </div>
                                                               <div>
                                                                  <div class="rsautk" tabindex="0">Phân loại: ${maxCt.chiTietSanPham.nsx.tenNSX}</div>
                                                                  <div class="j3I_Nh" tabindex="0">x${maxCt.soLuongMua}</div>
                                                               </div>
                                                            </div>
                                                         </div>
                                                         <div>
                                                            <div class="NWUSQP" style="margin-bottom: 10px;">
                                                               <label class="juCcT0">Thành tiền:</label>
                                                               <div class="t7TQaf" tabindex="0" aria-label="Thành tiền: ${hd.tongTien}">
                                                                  <bdi>
                                                                     <fmt:formatNumber value="${hd.tongTien}" type="number"/>
                                                                     <span class="woocommerce-Price-currencySymbol">₫</span>
                                                                  </bdi>
                                                               </div>
                                                            </div>
                                                            <div class="aAXjeK" style="margin: 0 30px;">
                                                               <div>
                                                               <form id="checkoutForm" action="/cart/check-out" method="post">
                                                                  <input type="hidden" name="maGHCTs" id="checkoutMaGHCTs">
                                                               </form>
                                                               <button id="btnMuaLai" class="stardust-button stardust-button--primary QY7kZh" fdprocessedid="u71h1b">Mua lại</button>
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                             </div>
                                             </c:if>
                                          </div>
                                       </div>
                                    </div>
                           </div>
                           </a>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <div class="w-full px-small tablet:px-0 py-small tablet:py-medium flex flex-col gap-1x-small tablet:gap-medium">
                  <div class="w-full">
                     <div class="w-full flex flex-col gap-1x-small tablet:gap-medium">
                        <div class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base">
                           <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async" data-nimg="1" class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain" src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/orderlist/4751043c866ed52f9661.png" style="color: transparent;">
                           <div class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400"><span class="mr-1x-small">Bạn chưa có đơn hàng nào</span><a class="text-primary-500 hover:underline shrink-0 " href="/">Trang chủ</a></div>
                        </div>
                     </div>
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
         </div>
      </div>
   </div>
</div>
<script src="/assets/js/bodyHoaDon.js"></script>