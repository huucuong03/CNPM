<%@ page contentType="text/html; charset=UTF-8" language="java" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
         <link rel="stylesheet" href="../../../assets/css/bodyHoaDon.css">
         <link rel="stylesheet" href="../../../assets/css/checkout.css">
         <link rel="stylesheet" href="../../../assets/css/toast.css">
         <style>
            #radix-«rq»,
            #radix-«rn»,
            #radix-«rk» {
               position: fixed;
               top: 0;
               left: 0;
               width: 100vw;
               height: 100vh;
               background: rgba(0, 0, 0, 0);
               /* overlay mờ */
               display: none;
               z-index: 1000;
            }

            #radix-«rq»>div:first-child,
            #radix-«rn»>div:first-child,
            #radix-«rk»>div:first-child {
               position: absolute;
               right: 0;
               top: 0;
               height: 100%;
               max-width: 568px;
               /* hoặc tùy ý */
               background: #fff;
            }
         </style>
         <jsp:include page="/WEB-INF/views/toast.jsp" />
         <div id="toast"></div>
         <div class="flex-auto min-w-0">
            <div class="w-full h-full">
               <div class="relative flex justify-center items-center w-full h-[50px] tablet:hidden bg-pure-white">
                  <div class="flex items-center gap-2x-small"><span class="text-medium font-bold">Lịch sử mua
                        hàng</span></div>
               </div>
               <div class="h-full px-0 tablet:px-medium tablet:bg-pure-white tablet:rounded-1x-large relative">
                  <div class="w-full sticky top-0 left-0 z-10">
                     <div dir="ltr" data-slot="scroll-area"
                        class="cpsui:relative w-full bg-pure-white border border-neutral-200 tablet:border-none"
                        style="position: relative; --radix-scroll-area-corner-width: 0px; --radix-scroll-area-corner-height: 0px;">
                     </div>
                     <div class="flex w-full items-center gap-medium bg-pure-white p-small tablet:p-0 tablet:pt-small">
                        <span class="hidden tablet:block font-medium text-medium">Lịch sử mua hàng</span>
                        <div
                           class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col w-full tablet:w-auto tablet:max-w-[300px]">
                           <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                              <div
                                 class="cpsui:p-1x-small cpsui:pl-medium cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base">
                                 <input placeholder="Từ ngày" data-slot="input"
                                    class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                    id="startDate" type="text" value="" fdprocessedid="25hw5">
                                 <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24"
                                    stroke-linecap="round" stroke-linejoin="round" class="cpsui:shrink-0" height="18"
                                    width="18" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 12l14 0"></path>
                                    <path d="M13 18l6 -6"></path>
                                    <path d="M13 6l6 6"></path>
                                 </svg>
                                 <input placeholder="Đến ngày" data-slot="input"
                                    class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                    id="endDate" type="text" value="" fdprocessedid="hy4lla">
                                 <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square "
                                    id="btnDate">
                                    <div
                                       class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:select-none cpsui:cursor-pointer cpsui:rounded-base cpsui:hover:bg-neutral-100 cpsui:h-[30px] cpsui:w-[30px]"
                                       type="button" aria-haspopup="dialog" aria-expanded="false"
                                       aria-controls="radix-«rs»" data-state="closed" data-slot="popover-trigger">
                                       <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24"
                                          stroke-linecap="round" stroke-linejoin="round" class="cpsui:text-neutral-600"
                                          height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                          <path d="M8 2v4"></path>
                                          <path d="M16 2v4"></path>
                                          <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                                          <path d="M3 10h18"></path>
                                       </svg>
                                    </div>
                                 </div>
                              </div>
                              <div style="display:none" id="calendarContainer"></div>
                              <div id="dateError" style="display:none"
                                 class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small">
                                 <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512"
                                    class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                       d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z">
                                    </path>
                                 </svg>
                                 Định dạng ngày không hợp lệ
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div id="orderList">
                     <c:choose>
                        <c:when test="${not empty mapHD}">
                           <c:forEach var="entry" items="${mapHD.entrySet()}">
                              <c:set var="maHD" value="${entry.key}" />
                              <c:set var="products" value="${entry.value}" />
                              <!-- Tính tổng tiền -->
                              <c:set var="tongTien" value="0" />
                              <c:set var="coTheDoiTra" value="false" />
                              <c:set var="coTheBaoHanh" value="false" />
                              <c:forEach var="item" items="${products}">
                                 <c:set var="giaApDung"
                                    value="${item.giaSauGiam != 0 ? item.giaSauGiam : item.giaTien}" />
                                 <c:set var="tongTien" value="${tongTien + (giaApDung * item.soLuongMua)}" />
                                 <c:if test="${item.conDoiTra && !item.daGuiDoiTra}">
                                    <c:set var="coTheDoiTra" value="true" />
                                 </c:if>
                                 <c:if test="${item.conBaoHanh && !item.daGuiBaoHanh}">
                                    <c:set var="coTheBaoHanh" value="true" />
                                 </c:if>
                              </c:forEach>
                              <div class="YL_VlX">
                                 <div class="J632se">
                                    <div class="kG_yF0">
                                       <div class="ylYzwa" tabindex="0">
                                          <div tabindex="0"
                                             style="display:flex;text-align: center;justify-content: space-between;align-items: center;text-overflow: ellipsis;margin-left: 8px;font-size: 14px;font-weight: 600;overflow: hidden;">
                                             <div>
                                                Thời gian đặt hàng:
                                                <fmt:formatDate value="${products[0].ngayTao}" pattern="yyyy/MM/dd" />
                                             </div>
                                             <c:choose>
                                                <c:when test="${products[0].moTaTrangThaiDoiTra != null}">
                                                   <div>
                                                      <span
                                                         style="color:red;font-size:13px">${products[0].moTaTrangThaiDoiTra}
                                                         Đổi trả</span>
                                                   </div>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                             </c:choose>
                                             <c:choose>
                                                <c:when test="${products[0].moTaTrangThaiBaoHanh != null}">
                                                   <div>
                                                      <span
                                                         style="color:red;font-size:13px">${products[0].moTaTrangThaiBaoHanh}
                                                         bảo hành </span>
                                                   </div>
                                                </c:when>
                                                <c:otherwise>
                                                </c:otherwise>
                                             </c:choose>
                                          </div>
                                       </div>
                                       <div
                                          style="display:flex;text-align: center;justify-content: space-between;align-items: center;">
                                          <a>
                                             <div class="bdAfgU">
                                                <c:forEach var="item" items="${products}">
                                                   <div class="mZ1OWk">
                                                      <div class="dJaa92">
                                                         <div class="divimg">
                                                            <img src="http://localhost:8080/img/${item.hinhAnhURL}"
                                                               class="gQuHsZ" style="object-fit: cover;">
                                                         </div>
                                                         <div class="nmdHRf">
                                                            <div class="zWrp4w">
                                                               ${item.tenSanPham} ${item.tenDungLuong} ${item.tenMauSac}
                                                            </div>
                                                            <div class="rsautk">
                                                               Phân loại: ${item.tenNSX}
                                                            </div>
                                                            <div style="font-size: 13px;color: gray">Số lượng:
                                                               x${item.soLuongMua}</div>
                                                            <div style="font-size: 13px;color: gray">
                                                               Giá bán:
                                                               <bdi>
                                                                  <fmt:formatNumber
                                                                     value="${item.giaSauGiam != 0 ? item.giaSauGiam : item.giaTien}"
                                                                     type="number" />
                                                                  ₫
                                                               </bdi>
                                                            </div>
                                                            <div style="font-size: 13px">
                                                               Ngày mua:
                                                               <fmt:formatDate value="${item.ngayTao}"
                                                                  pattern="dd/MM/yyyy" />
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </c:forEach>
                                             </div>
                                             <div>
                                                <!-- Hiển thị tổng tiền -->
                                                <div class="NWUSQP" style="justify-content: center;">
                                                   <label class="juCcT0">Thành tiền:</label>
                                                   <div class="t7TQaf" tabindex="0"
                                                      aria-label="Thành tiền: 23000000.0000">
                                                      <bdi>
                                                         <fmt:formatNumber value="${tongTien}" type="number" />
                                                         ₫
                                                      </bdi>
                                                   </div>
                                                </div>
                                                <div style="margin-top: 8px">
                                                   <c:if test="${coTheDoiTra}">
                                                      <a class="btnOpenModal" data-ma-hoa-don="${maHD}"
                                                         data-type="return"> <button
                                                            class="stardust-button stardust-button--primary QY7kZh"
                                                            style="background-color: green;" fdprocessedid="u71h1b">Đổi
                                                            trả</button> </a>
                                                   </c:if>
                                                   <c:if test="${coTheBaoHanh}">
                                                      <a class="btnOpenModal" data-ma-hoa-don="${maHD}"
                                                         data-type="warranty"> <button
                                                            class="stardust-button stardust-button--primary QY7kZh"
                                                            style="background-color: blue;" fdprocessedid="u71h1b">Bảo
                                                            Hành</button>
                                                   </c:if>
                                                   <c:if test="${!coTheDoiTra && !coTheBaoHanh}">
                                                      <span style="color:red;font-size:13px">Đã gửi yêu cầu hoặc hết
                                                         thời hạn hỗ trợ</span>
                                                   </c:if>
                                                </div>
                                          </a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                  </div>
                  </c:forEach>
               </div>
               </c:when>
               <c:otherwise>
                  <div
                     class="w-full px-small tablet:px-0 py-small tablet:py-medium flex flex-col gap-1x-small tablet:gap-medium">
                     <div class="w-full">
                        <div class="w-full flex flex-col gap-1x-small tablet:gap-medium">
                           <div
                              class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base">
                              <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async"
                                 data-nimg="1"
                                 class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain"
                                 src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/orderlist/4751043c866ed52f9661.png"
                                 style="color: transparent;">
                              <div
                                 class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400">
                                 <span class="mr-1x-small">Bạn chưa có đơn hàng nào</span><a
                                    class="text-primary-500 hover:underline shrink-0 " href="/">Trang chủ</a></div>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:otherwise>
               </c:choose>
               <div class="pagination"
                  style="margin-top: 20px; text-align:center; display: flex; justify-content: center; align-items: center; gap: 10px;">
                  <c:if test="${currentPage > 0}">
                     <a href="?page=${currentPage - 1}&size=4"
                        style="padding: 5px 10px; border: 1px solid #ddd; border-radius: 4px; text-decoration: none; color: #333;">«
                        Trang trước</a>
                  </c:if>
                  <c:if test="${totalPages > 0}">
                     <span style="font-weight: bold;"> Trang ${currentPage + 1} / ${totalPages} </span>
                  </c:if>
                  <c:if test="${currentPage < totalPages - 1}">
                     <a href="?page=${currentPage + 1}&size=4"
                        style="padding: 5px 10px; border: 1px solid #ddd; border-radius: 4px; text-decoration: none; color: #333;">Trang
                        sau »</a>
                  </c:if>
               </div>
            </div>
         </div>
         </div>
         </div>
         <div role="dialog" id="radix-«rk»" style="display:none;" aria-describedby="radix-«rm»"
            aria-labelledby="radix-«rl»" data-state="open"
            class="cpsui:fixed cpsui:z-10000 cpsui:inset-y-0 cpsui:right-0 cpsui:h-full cpsui:max-w-[calc(100%-20px)] cpsui:transition cpsui:ease-in-out cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out"
            tabindex="-1">
            <div
               class="cpsui:bg-pure-white cpsui:tablet:rounded-medium cpsui:flex cpsui:flex-col cpsui:w-full cpsui:h-full cpsui:rounded-l-medium">
               <div data-slot="sheet-header"
                  class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:tablet:gap-1x-small cpsui:p-small cpsui:tablet:p-medium cpsui:border-b-[1px] cpsui:border-neutral-200">
                  <h2 id="radix-«rl»" class="cpsui:font-bold cpsui:text-medium">Yêu cầu đổi trả sản phẩm</h2>
                  <button type="button" id="btnClose"
                     class="btnClose cpsui:cursor-pointer cpsui:data-[state=open]:bg-secondary cpsui:absolute cpsui:top-3 cpsui:tablet:top-6 cpsui:right-3 cpsui:tablet:right-6 cpsui:rounded-xs cpsui:opacity-70 cpsui:transition-opacity cpsui:hover:opacity-100 cpsui:focus:outline-hidden cpsui:disabled:pointer-events-none">
                     <div
                        class="cpsui:h-[24px] cpsui:w-[24px] cpsui:flex cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-100 cpsui:cursor-pointer">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="16"
                           width="16" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" d="M0 0h24v24H0z"></path>
                           <path
                              d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z">
                           </path>
                        </svg>
                     </div>
                  </button>
               </div>
               <div
                  class="w-full tablet:w-[568px] h-full p-small tablet:px-1x-large tablet:py-medium overflow-hidden pb-[92px] tablet:pb-0">
                  <form class="w-full h-full flex flex-col gap-medium overflow-auto hidden-scroll relative"
                     action="/detailKh/warranty/return" method="post" enctype="multipart/form-data">
                     <input type="hidden" value="" id="maHoaDonChiTiet" name="maHoaDonChiTiet">
                     <input type="hidden" value="" id="type" name="type">
                     <div class="w-full flex flex-1 flex-col gap-medium">
                        <!-- Sản phẩm đổi trả -->
                        <div>
                           <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                              <label data-slot="label"
                                 class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Chọn
                                 sản phẩm </label>
                              <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                 <input type="hidden" value="" name="maChiTietSanPham" id="maChiTietSanPham">
                                 <div id="productLabel" aria-controls="radix-«r16»" aria-expanded="false"
                                    aria-haspopup="dialog" data-slot="popover-trigger" data-state="closed"
                                    class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                    <div
                                       class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                       <input data-slot="input"
                                          class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                          id="productInput" readonly="" placeholder="Chọn sản phẩm" type="text" value=""
                                          name="" fdprocessedid="jhuto">
                                       <div
                                          class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                          <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                             viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                             xmlns="http://www.w3.org/2000/svg">
                                             <path
                                                d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                             </path>
                                          </svg>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div id="productListContainer" style=" display:none;max-height: 240px;"
                                 class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                              </div>
                           </div>
                        </div>
                        <!-- Lý do đổi trả -->
                        <div>
                           <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                              <label data-slot="label"
                                 class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Chọn
                                 lý do </label>
                              <div id="reasonLabel" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                 <input type="hidden" value="">
                                 <div id="reasonLabel" aria-controls="radix-«r16»" aria-expanded="false"
                                    aria-haspopup="dialog" data-slot="popover-trigger" data-state="closed"
                                    class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                    <div
                                       class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                       <input data-slot="input"
                                          class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                          id="reasonInput" readonly="" placeholder="Chọn lý do" type="text" value=""
                                          name="reason" fdprocessedid="jhuto">
                                       <div
                                          class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                          <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                             viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                             xmlns="http://www.w3.org/2000/svg">
                                             <path
                                                d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                             </path>
                                          </svg>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div id="reasonWrapper" style=" display:none;max-height: 240px;"
                                 class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                                 <div class="dropdown" id="reasonList">
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Anh san pham loi -->
                        <div>
                           <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                              <label data-slot="label"
                                 class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Hình
                                 ảnh sản phẩm lỗi</label>
                              <div id="imglabelError" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                 <input type="hidden" value="">
                                 <div aria-controls="radix-«r16»" aria-expanded="false" aria-haspopup="dialog"
                                    data-slot="popover-trigger" data-state="closed"
                                    class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                    <div
                                       class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                       <input data-slot="input"
                                          class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                          id="imgErrorInput" placeholder="Hinh anh san pham loi" type="file"
                                          accept="image/*" name="images" fdprocessedid="jhuto" multiple>
                                       <div
                                          class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                          <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                             viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                             xmlns="http://www.w3.org/2000/svg">
                                             <path
                                                d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                             </path>
                                          </svg>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div id="imgErrorWrapper" style=" display:none;max-height: 240px;justify-content: center;"
                                 class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                                 <div class="dropdown" id="imgErrorList">
                                    <div
                                       class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small"
                                       data-code="91">Đổi tại cửa hàng</div>
                                    <div
                                       class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small"
                                       data-code="91">Gửi về kho</div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Phương thức đổi trả -->
                        <div>
                           <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                              <label data-slot="label"
                                 class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Chọn
                                 phương thức</label>
                              <div id="phuongThuclabel" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                 <input type="hidden" value="">
                                 <div aria-controls="radix-«r16»" aria-expanded="false" aria-haspopup="dialog"
                                    data-slot="popover-trigger" data-state="closed"
                                    class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                    <div
                                       class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                       <input data-slot="input"
                                          class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                          id="phuongThucInput" readonly="" placeholder="Chọn phương thức" type="text"
                                          value="" name="phuongThuc" fdprocessedid="jhuto">
                                       <div
                                          class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                          <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                             viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                             xmlns="http://www.w3.org/2000/svg">
                                             <path
                                                d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                             </path>
                                          </svg>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div id="phuongThucWrapper" style=" display:none;max-height: 240px;"
                                 class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                                 <div class="dropdown" id="phuongThucList">
                                    <div
                                       class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small"
                                       data-code="91">Đổi tại cửa hàng</div>
                                    <div
                                       class="dropdown__item cpsui:p-1x-small cpsui:hover:bg-neutral-100 cpsui:cursor-pointer cpsui:rounded-base cpsui:flex cpsui:items-center cpsui:gap-2x-small"
                                       data-code="91">Gửi về kho</div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <!-- Thông tin bổ sung -->
                        <div>
                           <div style="margin-bottom: 6px;"
                              class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">
                              Thông tin liên hệ:</div>
                           <div class="field-group" style="display:flex;margin: 13px 0;">
                              <div class="box-input">
                                 <input type="text" placeholder="Họ tên người nhận" maxlength="1000" autocomplete="off"
                                    class="box-input__main" fdprocessedid="ylt7jb" id="tenKhachHang"
                                    name="tenKhachHang"> <label>TÊN NGƯỜI NHẬN</label>
                                 <div class="box-input__line"></div>
                              </div>
                              <div class="box-input">
                                 <input type="text" placeholder="Số điện thoại người nhận" maxlength="10"
                                    autocomplete="off" class="box-input__main" fdprocessedid="rv67n" id="sdtKhachHang"
                                    name="sdtKhachHang"> <label>SĐT NGƯỜI NHẬN</label>
                                 <div class="box-input__line"></div>
                              </div>
                           </div>
                        </div>
                        <%-- <!-- Địa chỉ cửa hàng -->
                           <div>
                              <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                                 <label data-slot="label"
                                    class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Địa
                                    chỉ cửa hàng</label>
                                 <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                    <input type="hidden" value="">
                                    <div aria-controls="radix-«r16»" aria-expanded="false" aria-haspopup="dialog"
                                       data-slot="popover-trigger" data-state="closed"
                                       class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                       <div
                                          class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                          <p data-slot="input"
                                             class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                             id="provinceInput" readonly="" placeholder="Địa chỉ cửa hàng" type="text"
                                             value="" name="tinh" fdprocessedid="jhuto">
                                          <div
                                             class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                             aaa</p>
                                             <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                                viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                   d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                                </path>
                                             </svg>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div> --%>
                           <!-- Địa chỉ nhận hàng -->
                           <div>
                              <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                                 <label data-slot="label"
                                    class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Chọn
                                    địa chỉ</label>
                                 <div id="addresslabel" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                                    <input type="hidden" value="" id="maDiaChi" name="maDiaChi">
                                    <div aria-controls="radix-«r16»" aria-expanded="false" aria-haspopup="dialog"
                                       data-slot="popover-trigger" data-state="closed"
                                       class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                                       <div
                                          class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                                          <input data-slot="input"
                                             class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                                             id="addressInput" readonly="" placeholder="Chọn địa chỉ" type="text"
                                             value="" fdprocessedid="jhuto">
                                          <div
                                             class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square">
                                             <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                                                viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                   d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z">
                                                </path>
                                             </svg>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div id="addressWrapper" style=" display:none;max-height: 240px;"
                                    class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                                    <div class="dropdown" id="addressList">
                                    </div>
                                 </div>
                              </div>
                           </div>
                     </div>
                     <div
                        class="shadow-group-button w-full flex items-center gap-1x-small tablet:gap-medium tablet:box-content px-1x-small tablet:px-0 py-medium fixed tablet:sticky z-[9999] bottom-0 left-0 right-0 bg-pure-white">
                        <button type="submit"
                           class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:border cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:rounded-base cpsui:px-medium cpsui:py-1x-small w-full font-medium">Gửi
                           yêu cầu</button>
                     </div>
               </div>
            </div>
            <!-- Button submit -->
            </form>
         </div>
         </div>
         </div>
         <script src="/assets/js/Warranty.js"></script>
         <script src="/assets/js/toast.js"></script>
         <% if (request.getAttribute("successMessage") !=null) { %>
            <script>
               showSuccessToast('<%= request.getAttribute("successMessage") %>');
            </script>
            <% } %>
               <% if (request.getAttribute("errorMessage") !=null) { %>
                  <script>
                     showErrorToast('<%= request.getAttribute("errorMessage") %>');
                  </script>
                  <% } %>