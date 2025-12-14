<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.example.demo.Service.HoaDonService" %>
<%@ page import="com.example.demo.Entity.KhachHang" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
    // Lấy Spring context
    WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);

    // Lấy bean HoaDonService
    HoaDonService hoaDonService = (HoaDonService) context.getBean(HoaDonService.class);

    // Lấy KhachHang từ session
    KhachHang kh = (KhachHang) session.getAttribute("khachHang");

    // Lấy danh sách hóa đơn
    List<com.example.demo.Entity.HoaDon> listHD = hoaDonService.getAllBykhachHang(kh);

    // Tính tổng tiền
    BigDecimal tongTienDon = BigDecimal.ZERO;
    for (com.example.demo.Entity.HoaDon hd : listHD) {
        if (hd.getTongTien() != null) {
            tongTienDon = tongTienDon.add(hd.getTongTien());
        }
    }
    request.setAttribute("tongTienDon", tongTienDon);
%>

               <div class="w-full px-1x-small tablet:px-0">
                  <div class="bg-pure-white w-full px-small py-small tablet:px-1x-large tablet:py-medium rounded-1x-large mb-small flex flex-col tablet:flex-row tablet:items-center gap-small tablet:gap-medium justify-between">
                     <div class="flex gap-1x-small laptop:gap-small desktop:gap-medium items-center">
                        <div class="w-[65px] tablet:w-[72px] aspect-square rounded-full bg-gradient-peach flex items-center justify-center"><img alt="avatar" title="avatar" loading="lazy" width="44" height="44" decoding="async" data-nimg="1" class="w-[44px] h-[44px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/avata-ant.b574f3e9.svg"></div>
                        <div class="flex flex-col gap-3x-small tablet:gap-2x-small">
                           <div class="text-medium tablet:text-base laptop:text-medium font-bold"><%= kh.getTen() %></div>
                           <div class="text-small font-regular text-neutral-500 gap-1x-small flex items-center">
                              <%= kh.getSdt() %>
                              <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="cursor-pointer" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M10.585 10.587a2 2 0 0 0 2.829 2.828"></path>
                                 <path d="M16.681 16.673a8.717 8.717 0 0 1 -4.681 1.327c-3.6 0 -6.6 -2 -9 -6c1.272 -2.12 2.712 -3.678 4.32 -4.674m2.86 -1.146a9.055 9.055 0 0 1 1.82 -.18c3.6 0 6.6 2 9 6c-.666 1.11 -1.379 2.067 -2.138 2.87"></path>
                                 <path d="M3 3l18 18"></path>
                              </svg>
                           </div>
                           <div class="flex gap-2x-small">
                              <div class="text-small font-bold rounded-full px-1x-small py-3x-small select-none shrink-0 bg-snull text-pure-black">S-NULL</div>
                           </div>
                           <div style="background:linear-gradient(90deg, #F7F7F8 0%, #FFF 100.69%)" class="flex gap-2x-small items-center text-1x-small tablet:text-small font-regular p-2x-small rounded-1x-small">
                              <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="14" width="14" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"></path>
                                 <path d="M12 12h3.5"></path>
                                 <path d="M12 7v5"></path>
                              </svg>
                              Cập nhật lại sau 01/01/<!-- -->2026
                           </div>
                        </div>
                     </div>
                     <div class="flex flex-col gap-1x-small laptop:gap-medium tablet:flex-1 max-w-[400px] tablet:max-w-[600px]">
                        <div class="flex gap-2x-small tablet:gap-medium justify-between">
                           <div class="flex gap-2x-small tablet:gap-1x-small laptop:gap-small desktop:gap-medium items-center">
                              <div class="hidden tablet:block w-[3px] rounded-full h-full bg-primary-500 shrink-0"></div>
                              <div class="w-[34px] h-[34px] laptop:w-[48px] laptop:h-[48px] shrink-0 rounded-full bg-gradient-peach flex items-center justify-center"><img alt="icon-cart" title="icon-cart" loading="lazy" width="28" height="26" decoding="async" data-nimg="1" class="w-[20px] h-[19px] laptop:w-[26px] laptop:h-[28px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/cart-icon.3e4e1d83.svg"></div>
                              <div>
                                 <div class="font-bold text-large tablet:text-1x-large laptop:text-2x-large"><%= listHD.size() %></div>
                                 <div class="text-1x-small text-ellipsis line-clamp-2 tablet:text-small laptop:text-base font-regular text-neutral-500">Tổng số đơn hàng <span class="hidden tablet:inline">đã mua</span></div>
                              </div>
                           </div>
                           <div class="flex gap-2x-small tablet:gap-1x-small laptop:gap-small desktop:gap-medium items-center">
                              <div class="hidden tablet:block w-[3px] rounded-full h-full bg-primary-500 shrink-0"></div>
                              <div class="w-[34px] h-[34px] laptop:w-[48px] shrink-0 laptop:h-[48px] rounded-full bg-gradient-peach flex items-center justify-center"><img alt="icon-cart" title="icon-cart" loading="lazy" width="28" height="28" decoding="async" data-nimg="1" class="w-[20px] h-[19px] laptop:w-[28px] laptop:h-[28px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/money-icon.3e6b67af.svg"></div>
                              <div>
                                 <div class="font-bold text-large tablet:text-1x-large laptop:text-2x-large">
                                    <fmt:formatNumber value="${tongTienDon}" type="number" groupingUsed="true"/> VNĐ
                                 </div>
                                 <div class="text-1x-small tablet:text-small laptop:text-base text-ellipsis line-clamp-2 font-regular text-neutral-500 ">
                                    <span>
                                       Tổng tiền tích lũy<span class="inline-block w-[4px] h-[4px] tablet:w-[7px] tablet:h-[7px] rounded-full bg-neutral-100"></span> <!-- -->Từ 01/01/<!-- -->2024
                                    </span>
                                 </div>
                                 <div style="background:linear-gradient(90deg, #F7F7F8 0%, #FFF 100.69%)" class="hidden tablet:block text-1x-small font-regular p-2x-small rounded-1x-small">
                                    Cần chi tiêu thêm<!-- --> <strong>3.000.000</strong> để lên hạng <strong>S-NEW</strong>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div style="background:linear-gradient(90deg, #F7F7F8 0%, #FFF 100.69%)" class="tablet:hidden text-1x-small font-regular px-1x-small py-2x-small rounded-1x-small">
                           Cần chi tiêu thêm 
                           <strong>
                              3.000.000<!-- -->đ
                           </strong>
                           để lên hạng <strong>S-NEW</strong>
                        </div>
                        <div style="background:linear-gradient(90deg, #F7F7F8 0%, #FFF 100.69%)" class="hidden rounded-1x-small p-2x-small tablet:flex gap-2x-small items-center text-small font-regular">
                           <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="text-medium" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                              <path d="M15 21h-9a3 3 0 0 1 -3 -3v-1h10v2a2 2 0 0 0 4 0v-14a2 2 0 1 1 2 2h-2m2 -4h-11a3 3 0 0 0 -3 3v11"></path>
                              <path d="M9 7l4 0"></path>
                              <path d="M9 11l4 0"></path>
                           </svg>
                           Tổng tiền và số đơn hàng được tính chung từ Azuza và Điện Thoại Vui.
                        </div>
                     </div>
                     <div class="">
                        <div class="hidden tablet:flex flex-col items-end justify-center gap-1x-small">
                           <span class="text-small laptop:text-base font-regular">Bạn đang ở kênh thành viên</span>
                           <div class="hidden tablet:flex gap-2x-small items-center">
                              <a class="inline-block h-[56px] w-[56px]" href=""><img alt="icon-company" title="icon-company" loading="lazy" width="56" height="56" decoding="async" data-nimg="1" class="h-[56px] w-[56px] aspect-square object-contain rounded-base" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/cellphones-icon.1b92082f.svg"></a>
                              <div class="max-w-[180px] flex flex-col gap-2x-small">
                                 <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer w-[180px] !text-base">
                                    <input type="hidden" value="Azuza">
                                    <div aria-controls="radix-«R2dedblhlb»" aria-expanded="false" aria-haspopup="dialog" data-slot="popover-trigger" data-state="closed" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                       <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-small cpsui:min-h-[40px] cpsui:rounded-small cpsui:pl-medium !text-base py-2x-small !h-[32px] !min-h-[32px]">
                                          <input type="text" data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" readonly="" value="CellphoneS" fdprocessedid="otfl1e">
                                          <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square ">
                                             <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z"></path>
                                             </svg>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <a class="w-full pl-medium pr-1x-small py-3x-small text-small font-medium text-primary-500 rounded-small flex gap-2x-small items-center bg-neutral-50" href="">
                                    <span>Azuza.com.vn</span>
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="12" width="12" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M12 6h-6a2 2 0 0 0 -2 2v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-6"></path>
                                       <path d="M11 13l9 -9"></path>
                                       <path d="M15 4h5v5"></path>
                                    </svg>
                                 </a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                <div class="w-full px-1x-small tablet:px-0">
                  <div class="bg-pure-white w-full px-small py-small tablet:px-1x-large tablet:py-medium rounded-1x-large mb-small">
                     <div class="w-full grid grid-cols-4 gap-y-small tablet:flex gap-1x-small tablet:gap-2x-large desktop:gap-3x-large justify-start">
                        <a class="flex flex-col tablet:flex-row items-center gap-1x-small" href="detailKh/promotion">
                           <div class="w-[40px] h-[40px] bg-neutral-50 rounded-full flex items-center justify-center"><img alt="Hạng thành viên" title="Hạng thành viên" loading="lazy" width="24" height="24" decoding="async" data-nimg="1" class="w-[24px] h-[24px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/rank-icon.d0f44c06.svg"></div>
                           <div class="text-1x-small tablet:text-base font-medium text-center tablet:text-left">Hạng thành viên</div>
                        </a>
                        <a class="flex flex-col tablet:flex-row items-center gap-1x-small" href="detailKh/promotion">
                           <div class="w-[40px] h-[40px] bg-neutral-50 rounded-full flex items-center justify-center"><img alt="Mã giảm giá" title="Mã giảm giá" loading="lazy" width="24" height="24" decoding="async" data-nimg="1" class="w-[24px] h-[24px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/promotion-icon.99af272d.svg"></div>
                           <div class="text-1x-small tablet:text-base font-medium text-center tablet:text-left">Mã giảm giá</div>
                        </a>
                        <a class="flex flex-col tablet:flex-row items-center gap-1x-small" href="/detailKh?tab=order" >
                           <div class="w-[40px] h-[40px] bg-neutral-50 rounded-full flex items-center justify-center"><img alt="Lịch sử mua hàng" title="Lịch sử mua hàng" loading="lazy" width="24" height="24" decoding="async" data-nimg="1" class="w-[24px] h-[24px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/history-icon.2ebe1813.svg"></div>
                           <div class="text-1x-small tablet:text-base font-medium text-center tablet:text-left">Lịch sử mua hàng</div>
                        </a>
                        <a class="flex flex-col tablet:flex-row items-center gap-1x-small" href="/detailKh/userinfo">
                           <div class="w-[40px] h-[40px] bg-neutral-50 rounded-full flex items-center justify-center"><img alt="Sổ địa chỉ" title="Sổ địa chỉ" loading="lazy" width="24" height="24" decoding="async" data-nimg="1" class="w-[24px] h-[24px] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/address-icon.169a4d95.svg"></div>
                           <div class="text-1x-small tablet:text-base font-medium text-center tablet:text-left">Sổ địa chỉ</div>
                        </a>
                     </div>
                  </div>
               </div>