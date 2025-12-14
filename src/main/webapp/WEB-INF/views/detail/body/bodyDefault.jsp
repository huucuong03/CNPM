<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
                  <div class="flex-auto min-w-0">
                     <div class="w-full grid grid-cols-6 gap-small">
                        <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large col-span-6 order-2 tablet:order-3 laptop:col-span-3 w1200:col-span-4">
                           <div class="w-full">
                              <div class="text-medium font-bold">Đơn hàng gần đây</div>
                              <c:choose>
                                 <c:when test="${not empty listHD}">
                                    <ul class="recent-orders">
                                       <c:forEach var="hd" items="${listHD}">
                                          <li class="order-item border rounded p-2 mb-2 " style="border: 1px #e1d7d7 solid;margin: 15px 0px;height: 150px;">
                                             <div class="w-full" style="padding: 0 5px;">
                                                <div class="flex justify-between w-full mb-4" style="margin:1px 0 15px 0">
                                                   <div><span class="ml-3">Mã đơn:</span> ${hd.maHoaDon}</div>
                                                   <div><span class="ml-3">Ngày đặt:</span> 
                                                   <fmt:formatDate value="${hd.ngayTao}" pattern="yyyy/MM/dd"/>
                                                   </div>
                                                   <div class="flex">
                                                   <span class="ml-3">Trang thái: </span>
                                                   <c:choose>
                                                      <c:when test="${hd.trangThai == 0}"><div style="color: #141414ff;width: 85px;text-align: center;background-color: yellow;border-radius: 8%;">Chờ xử lý</div></c:when>
                                                      <c:when test="${hd.trangThai == 1}"><div style="color: #0e0ebd;width: 85px;text-align: center;background-color: #d2d2ff;border-radius: 8%;">Đang giao</div></c:when>
                                                      <c:when test="${hd.trangThai == 2}"><div style="color:green">Đã giao</div></c:when>
                                                      <c:otherwise> <span style="color:red;">Hủy</span></c:otherwise>
                                                   </c:choose>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="flex justify-between"  style="padding: 0 5px;">
                                                <c:set var="maxCt" value="${sanPhamDacNhat[hd.maHoaDon]}" />
                                                <c:if test="${not empty maxCt}">
                                                   <div class="flex items-center gap-2 mt-2">
                                                        <div style=" width: 80px;height: 78px;overflow: hidden;border-radius: 8px;display: flex;justify-content: center;align-items: center;">
                                                            <img src="http://localhost:8080/img/${maxCt.chiTietSanPham.hinhAnhURL}" style="width: 100%;height: 100%;object-fit: cover; "
                                                         width="80" height="78" alt="${maxCt.chiTietSanPham.sanPham.tenSanPham}" />
                                                        </div>
                                                      <div style="margin-top: -25px;">
                                                         <div class="font-bold">${maxCt.chiTietSanPham.sanPham.tenSanPham} ${maxCt.chiTietSanPham.dungLuong.tenDungLuong} ${maxCt.chiTietSanPham.mauSac.tenMauSac}</div>
                                                         <div class="text-red-500 font-semibold font-bold " style="font-size:12px;color:red"> <bdi>
                                                      <fmt:formatNumber value="${maxCt.giaTien}" type="number"/>
                                                      <span class="woocommerce-Price-currencySymbol">₫</span>
                                                   </bdi></div>
                                                         <div  style="font-size:12px">Số lượng: ${maxCt.soLuongMua}</div>
                                                      </div>
                                                   </div>
                                                   <div style="margin: auto 0;text-align: end;">
                                                    <p>Tổng thanh toán: 
                                                    <span style="color:red">
                                                    <bdi>
                                                      <fmt:formatNumber value="${hd.tongTien}" type="number"/>
                                                      <span class="woocommerce-Price-currencySymbol">₫</span>
                                                   </bdi>
                                                    </span>
                                                   </p>
                                                    <a href="detailKh/hoadon/${hd.maHoaDon}">Xem chi tiết ></a>
                                                   </div>
                                                </c:if>
                                             </div>
                                          </li>
                                       </c:forEach>
                                    </ul>
                                    <a class="link-action flex shrink-0 items-center gap-2x-small font-regular text-small text-info-500" href="/detailKh/order">
                                       Xem tất cả
                                       <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
                                          <path d="M9 6l6 6l-6 6"></path>
                                       </svg>
                                    </a>
                                 </c:when>
                                 <c:otherwise>
                                    <div class="w-full mt-1x-small tablet:mt-small">
                                       <div class="w-full h-full flex flex-col gap-1x-small tablet:gap-small overflow-hidden" style="height:73%">
                                          <div class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base h-full">
                                             <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async"
                                                class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain"
                                                src="https://cdn-static.Smember.com.vn/_next/static/media/empty.f8088c4d.png">
                                             <div class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400 mt-2">
                                                <span class="mr-1x-small">Bạn chưa có đơn hàng nào gần đây? Hãy bắt đầu mua sắm ngay nào!</span>
                                                <a class="text-primary-500 hover:underline shrink-0" href="">Mua sắm ngay</a>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </c:otherwise>
                              </c:choose>
                           </div>
                        </div>
                        <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large col-span-6 order-3 tablet:order-4 laptop:col-span-3 w1200:col-span-2 ">
                           <div class="w-full flex justify-between items-center">
                              <div class="text-medium font-bold">Ưu đãi của bạn</div>
                              <a class="link-action flex shrink-0 items-center gap-2x-small font-regular text-small text-info-500" href="/promotion" style="display: none;">
                                 Xem tất cả
                                 <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 6l6 6l-6 6"></path>
                                 </svg>
                              </a>
                           </div>
                           <div class="w-full mt-1x-small tablet:mt-small">
                              <div class="flex flex-col gap-1x-small tablet:gap-small w-full mt-1x-small tablet:mt-small">
                                 <div class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base">
                                    <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async" data-nimg="1" class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain" src="https://cdn-static.Smember.com.vn/_next/static/media/empty.f8088c4d.png" style="color: transparent;">
                                    <div class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400"><span class="mr-1x-small">Bạn chưa có ưu đãi nào.</span><a class="text-primary-500 hover:underline shrink-0 " href="https://cellphones.com.vn">Xem sản phẩm</a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="w-full mt-1x-small tablet:mt-small">
                        <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large col-span-6 order-4 tablet:order-2 laptop:col-span-3 w1200:col-span-4">
                           <div class="w-full flex justify-between items-center">
                              <div class="text-medium font-bold">Sản phẩm yêu thích</div>
                              <button class="button-action flex shrink-0 cursor-pointer select-none items-center gap-2x-small font-regular text-small text-info-500" style="display: none;">
                                 Xem tất cả
                                 <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9 6l6 6l-6 6"></path>
                                 </svg>
                              </button>
                           </div>
                           <div class="w-full mt-1x-small tablet:mt-small" style="max-height:230px">
                              <div dir="ltr" data-slot="scroll-area" class="cpsui:relative w-full" style="position:relative;--radix-scroll-area-corner-width:0px;--radix-scroll-area-corner-height:0px">
                                 <style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}</style>
                                 <div data-radix-scroll-area-viewport="" style="max-height:230px"data-slot="scroll-area-viewport" class="cpsui:size-full cpsui:rounded-[inherit] cpsui:outline-none cpsui:transition-[color,box-shadow] cpsui:focus-visible:ring-[3px] cpsui:focus-visible:outline-1 cpsui:focus-visible:ring-ring/50" style="overflow: scroll hidden;">
                                    <div style="min-width:100%;display:table">
                                       <div class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base w-full h-full">
                                          <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async" data-nimg="1" class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain" src="https://cdn-static.Smember.com.vn/_next/static/media/empty.f8088c4d.png" style="color: transparent;">
                                          <div class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400"><span class="mr-1x-small">Bạn chưa có sản phẩm nào yêu thích? Hãy bắt đầu mua sắm ngay nào!</span><a class="text-primary-500 hover:underline shrink-0 " href="https://cellphones.com.vn">Mua sắm ngay</a></div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>