<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
   #radix-«rq»,#radix-«rn»,#radix-«rk»{
   position: fixed;
   top: 0;
   left: 0;
   width: 100vw;
   height: 100vh;
   background: rgba(0,0,0,0); /* overlay mờ */
   display: none;
   z-index: 1000;
   }
   #radix-«rq» > div:first-child ,#radix-«rn» > div:first-child,#radix-«rk» > div:first-child{
   position: absolute;
   right: 0;
   top: 0;
   height: 100%;
   max-width: 568px; /* hoặc tùy ý */
   background: #fff;
   }
   .input-error {
   border: 1px solid red !important;
   }
   #provinceList {
   max-height: 230px !important;
   overflow-y: auto !important;
   }
   #wardWrapper {
   max-height: 230px !important;
   overflow-y: auto !important;
   }
   :root {
   --tw-outline-style: solid;
   }
   .address-type-option.active{
   outline-style: var(--tw-outline-style);
   outline-width: 2px;
   outline-color: #d70018;
   outline-offset: -1px;
   }
</style>
<link rel="stylesheet" href="../../../assets/css/toast.css">
<jsp:include page="/WEB-INF/views/toast.jsp" />
<div id="toast"></div>
<div class="flex-auto min-w-0">
   <div class="w-full">
      <div class="relative flex justify-center items-center w-full h-[50px] tablet:hidden bg-pure-white">
         <a class="absolute left-0 top-1/2 -translate-y-1/2 p-1x-small" href="/account">
            <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
               <path d="M15 6l-6 6l6 6"></path>
            </svg>
         </a>
         <div class="flex items-center gap-2x-small"><span class="text-medium font-bold">Tài khoản</span></div>
      </div>
      <div class="w-full p-1x-small tablet:p-0 flex flex-col">
         <div class="w-full">
            <div class="flex items-center gap-1x-small p-1x-small rounded-base border-[1px] border-info-400 bg-info-50 text-info-500 mb-1x-small tablet:mb-small min-h-[56px]">
               <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                  <path d="M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0"></path>
                  <path d="M12 9h.01"></path>
                  <path d="M11 12h1v4h1"></path>
               </svg>
               <span class="text-base font-medium text-neutral-800 flex-1">Vui lòng cập nhật giới tính để có trải nghiệm tốt hơn.</span>
               <div class="shrink-0">
                  <button data-slot="button" id="btnCapNhat1" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-pure-white cpsui:text-info-500 cpsui:bg-pure-white cpsui:hover:border-neutral-50 cpsui:hover:bg-neutral-50 cpsui:disabled:border-pure-white cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white font-medium bg-transparent border-none hover:bg-transparent" fdprocessedid="dl7mp">
                  Cập nhật</button>
               </div>
            </div>
         </div>
         <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large mb-1x-small tablet:mb-small">
            <div class="w-full flex justify-between items-center">
               <div class="text-medium font-bold">Thông tin cá nhân</div>
               <div id="btnCapNhat" class="flex items-center justify-center gap-2x-small shrink-0 cursor-pointer select-none text-primary-500">
                  <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                     <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1"></path>
                     <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z"></path>
                     <path d="M16 5l3 3"></path>
                  </svg>
                  <span>Cập nhật</span>
               </div>
            </div>
            <div class="w-full mt-1x-small tablet:mt-small">
               <div class="w-full grid grid-cols-1 laptop:grid-cols-2 laptop:gap-4x-large">
                  <div class="w-full">
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between border-b border-b-neutral-200">
                        <div class="text-base text-neutral-500 font-regular">Họ và tên:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">${khanhHang.ten}</div>
                     </div>
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between border-b border-b-neutral-200">
                        <div class="text-base text-neutral-500 font-regular">Giới tính:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">
                           <c:choose>
                              <c:when test="${khanhHang.gioiTinh == true}">Nam</c:when>
                              <c:when test="${khanhHang.gioiTinh == false}">Nữ</c:when>
                              <c:otherwise>-</c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between border-b border-b-neutral-200 laptop:border-b-0">
                        <div class="text-base text-neutral-500 font-regular">Ngày sinh:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">${khanhHang.ngaySinh}</div>
                     </div>
                  </div>
                  <div class="w-full">
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between border-b border-b-neutral-200">
                        <div class="text-base text-neutral-500 font-regular">Số điện thoại:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">${khanhHang.sdt}</div>
                     </div>
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between border-b border-b-neutral-200">
                        <div class="text-base text-neutral-500 font-regular">Email:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">${khanhHang.email}</div>
                     </div>
                     <div class="w-full py-medium flex items-center gap-1x-large justify-between">
                        <div class="text-base text-neutral-500 font-regular">Địa chỉ mặc định:</div>
                        <div class="text-base text-neutral-800 text-right font-medium">${khanhHang.diaChi}</div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large">
            <div class="w-full flex justify-between items-center">
               <div class="text-medium font-bold">Sổ địa chỉ</div>
               <div id="btnopenModalAddDC" class="flex items-center justify-center gap-2x-small shrink-0 cursor-pointer select-none text-primary-500">
                  <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                     <path d="M12 5l0 14"></path>
                     <path d="M5 12l14 0"></path>
                  </svg>
                  <span>Thêm địa chỉ</span>
               </div>
            </div>
            <div class="w-full mt-1x-small tablet:mt-small">
               <div class="w-full">
                  <c:choose>
                     <c:when test="${not empty listDiaChi}">
                        <div class="w-full grid grid-cols-1 laptop:grid-cols-2 gap-small">
                           <c:forEach var="dc" items="${listDiaChi}">
                              <div class="address-container w-full p-medium flex flex-col gap-2x-small rounded-medium bg-pure-white tablet:bg-neutral-50 w-full" data-id="${dc.maDiaChi}">
                                 <div class="flex flex-1 flex-col gap-2x-small">
                                    <div class="w-full flex items-center justify-between">
                                       <div class="text-base text-neutral-800 font-bold"id="tenDiaChi" data-ten="${dc.tenDiaChi}">${dc.tenDiaChi}</div>
                                       <div class="flex items-center gap-1x-small">
                                          <div class="flex items-center gap-1x-small">
                                             <div class="px-2x-small py-3x-small flex items-center justify-center gap-2x-small rounded-1x-small bg-neutral-200">
                                                <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0 text-neutral-500" height="12" width="12" xmlns="http://www.w3.org/2000/svg">
                                                   <path d="M5 12l-2 0l9 -9l9 9l-2 0"></path>
                                                   <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path>
                                                   <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path>
                                                </svg>
                                                <span class="text-small font-medium">
                                                   <c:choose>
                                                      <c:when test="${dc.loaiDiaChi == false}">Nhà</c:when>
                                                      <c:otherwise>Văn phòng</c:otherwise>
                                                   </c:choose>
                                                </span>
                                             </div>
                                          </div>
                                          <c:if test="${dc.macDinh == true}">
                                             <div class="px-2x-small py-3x-small flex items-center justify-center gap-2x-small rounded-1x-small bg-info-100">
                                                <span class="text-small text-info-900 font-medium" id="macDinh" data-macding="${dc.macDinh == true}">Mặc định</span>
                                             </div>
                                          </c:if>
                                       </div>
                                    </div>
                                    <div class="flex items-center justify-start gap-1x-small">
                                       <div class="text-base text-pure-black font-regular">${dc.khachHang.ten}</div>
                                       <div class="w-[1px] h-[60%] my-2x-small bg-neutral-200"></div>
                                       <div class="text-base text-pure-black font-regular">${dc.khachHang.sdt}</div>
                                    </div>
                                    <div class="w-full text-base text-neutral-500 font-regular" id="diaChi" data-diaChiNha="${dc.diaChiNha}" data-xa="${dc.xa}" data-tinh="${dc.tinh}">${dc.diaChiNha}, ${dc.xa}, ${dc.tinh}</div>
                                 </div>
                                 <div class="flex items-center justify-end gap-3x-small">
                                    <button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-neutral-300 cpsui:text-neutral-800 cpsui:bg-pure-white cpsui:hover:border-neutral-400 cpsui:hover:bg-neutral-50 cpsui:disabled:border-black-300 cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white tablet:bg-neutral-50 outline-0 border-0 px-1x-small py-2x-small"
                                     fdprocessedid="x0xzwg" data-id="${dc.maDiaChi}" id="btnXoa">Xóa</button>
                                    <div class="w-[1px] h-[60%] my-2x-small bg-neutral-200"></div>
                                    <button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-pure-white cpsui:bg-pure-white cpsui:text-info-500 cpsui:hover:border-info-50 cpsui:hover:bg-info-50 cpsui:disabled:bg-neutral-200 cpsui:disabled:text-black-400 cpsui:disabled:border-neutral-200 tablet:bg-neutral-50 outline-0 border-0 px-1x-small py-2x-small" 
                                    fdprocessedid="yft6g8" data-id="${dc.maDiaChi}" id="btnEdit">Cập nhật</button>
                                 </div>
                              </div>
                           </c:forEach>
                     </c:when>
                     <c:otherwise>
                     <div class="w-full p-medium flex flex-col items-center tablet:justify-center gap-medium tablet:gap-small bg-pure-white rounded-base">
                     <img alt="empty" title="empty" loading="lazy" width="420" height="312" decoding="async" data-nimg="1" class="w-[88px] h-[65px] tablet:w-[140px] tablet:h-[104px] object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/empty.f8088c4d.png" style="color: transparent;">
                     <div class="flex flex-wrap flex-col tablet:flex-row justify-center tablet:items-center text-small text-center font-regular tablet:text-center text-neutral-400"><span class="mr-1x-small">Bạn chưa có địa chỉ nào được tạo</span></div>
                     </div>
                     </c:otherwise>
                  </c:choose>
                  </div>
               </div>
            </div>
         </div>
         <div class="mt-small w-full grid grid-cols-1 laptop:grid-cols-2 gap-small">
            <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large">
               <div class="w-full flex justify-between items-center">
                  <div class="text-medium font-bold">Mật khẩu</div>
                  <button id="btnChangePW" class="flex items-center justify-center gap-2x-small shrink-0 cursor-pointer select-none text-primary-500" fdprocessedid="nuvdmr">
                     <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1"></path>
                        <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z"></path>
                        <path d="M16 5l3 3"></path>
                     </svg>
                     <span>Thay đổi mật khẩu</span>
                  </button>
               </div>
               <div class="w-full mt-1x-small tablet:mt-small">
                  <div class="w-full py-medium flex items-center gap-1x-large justify-between">
                     <div class="text-base text-neutral-500 font-regular">Cập nhật lần cuối lúc:</div>
                     <div class="text-base text-neutral-800 text-right font-medium">
                        <fmt:formatDate value="${khanhHang.lastUpdate}" pattern="dd/MM/yyyy" />
                     </div>
                  </div>
               </div>
            </div>
            <div class="p-small tablet:p-medium bg-pure-white rounded-1x-large w-full">
               <div class="w-full flex justify-between items-center">
                  <div class="text-medium font-bold">Tài khoản liên kết</div>
               </div>
               <div class="w-full mt-1x-small tablet:mt-small">
                  <div class="w-full flex items-center justify-between py-1x-small border-b border-b-neutral-200">
                     <div class="flex items-center gap-2x-small font-medium text-neutral-900 py-1x-small">
                        <img alt="Google" title="Google" loading="lazy" width="25" height="24" decoding="async" data-nimg="1" class="object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/logo-google.b6f9570f.svg" style="color: transparent;"><span>Google</span>
                     </div>
                     <div class="flex items-center justify-end gap-2x-small text-small font-medium cursor-pointer select-none hover:text-primary-500 text-neutral-900 text-primary-500">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                           <path d="M9 15l6 -6"></path>
                           <path d="M11 6l.463 -.536a5 5 0 0 1 7.071 7.072l-.534 .464"></path>
                           <path d="M13 18l-.397 .534a5.068 5.068 0 0 1 -7.127 0a4.972 4.972 0 0 1 0 -7.071l.524 -.463"></path>
                        </svg>
                        <span>Liên kết</span>
                     </div>
                  </div>
                  <div class="w-full flex items-center justify-between py-1x-small">
                     <div class="flex items-center gap-2x-small font-medium text-neutral-900 py-1x-small">
                        <img alt="Zalo" title="Zalo" loading="lazy" width="21" height="20" decoding="async" data-nimg="1" class="object-contain" src="https://cdn-static.smember.com.vn/_next/static/media/logo-zalo.120d889f.svg" style="color: transparent;"><span>Zalo</span>
                     </div>
                     <div class="flex items-center justify-end gap-2x-small text-small font-medium cursor-pointer select-none hover:text-primary-500 text-primary-500">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                           <path d="M9 15l6 -6"></path>
                           <path d="M11 6l.463 -.536a5 5 0 0 1 7.071 7.072l-.534 .464"></path>
                           <path d="M13 18l-.397 .534a5.068 5.068 0 0 1 -7.127 0a4.972 4.972 0 0 1 0 -7.071l.524 -.463"></path>
                        </svg>
                        <span>Liên kết</span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<div role="dialog" id="radix-«rq»" style="display:none"  aria-describedby="radix-«rs»" aria-labelledby="radix-«rr»" data-state="open" data-slot="sheet-content" class="cpsui:tablet:p-medium cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:fixed cpsui:z-10000 cpsui:transition cpsui:ease-in-out cpsui:data-[state=closed]:duration-300 cpsui:data-[state=open]:duration-500 cpsui:data-[state=closed]:slide-out-to-right cpsui:data-[state=open]:slide-in-from-right cpsui:inset-y-0 cpsui:right-0 cpsui:h-full cpsui:max-w-[calc(100%-20px)]" tabindex="-1" style="pointer-events: auto;">
   <div class="cpsui:bg-pure-white cpsui:tablet:rounded-medium cpsui:flex cpsui:flex-col cpsui:w-full cpsui:h-full cpsui:rounded-l-medium" >
      <div data-slot="sheet-header" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:tablet:gap-1x-small cpsui:p-small cpsui:tablet:p-medium cpsui:border-b-[1px] cpsui:border-neutral-200 ">
         <h2 id="radix-«rr»" data-slot="sheet-title" class="cpsui:font-bold cpsui:text-medium">Cập nhật thông tin cá nhân</h2>
      </div>
      <div class="w-full tablet:w-[568px] h-full p-small tablet:px-1x-large tablet:py-medium overflow-y-auto pb-0">
         <form class="w-full h-full flex flex-col gap-medium overflow-auto hidden-scroll relative" action="/detailKh/userinfo" method="post">
            <div class="w-full flex flex-1 flex-col gap-medium">
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Họ và tên </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" 
                           id="fullName" placeholder="Nhập họ và tên" maxlength="255" value="${khanhHang.ten}" name="name">
                        <button type="button" id="clearName" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Clear input">
                           <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                              <path fill="none" d="M0 0h24v24H0z"></path>
                              <path d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
                           </svg>
                        </button>
                     </div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:text-base">
                  Giới tính
                  </label>
                  <input type="hidden" id="genderOriginal" value="${khanhHang.gioiTinh}" name="gender">
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:w-full">
                     <select id="genderInput" name="gender" class="cpsui:p-1x-small cpsui:border cpsui:min-h-[48px] cpsui:rounded-base cpsui:text-base cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600">
                        <option value="">Chọn giới tính</option>
                        <option value="1" ${khanhHang.gioiTinh == true ? 'selected' : ''}>Nam</option>
                        <option value="0" ${khanhHang.gioiTinh == false ? 'selected' : ''}>Nữ</option>
                     </select>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col" data-disabled="true">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Ngày sinh </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium" data-disabled="true">
                        <input data-slot="input" disabled="" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" placeholder="Ngày sinh" min="1900-01-01" max="2999-12-31" lang="vi-VN" type="text" value="${khanhHang.ngaySinh}" name="birthday">
                        <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square ">
                           <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:select-none cpsui:cursor-pointer cpsui:rounded-base cpsui:hover:bg-neutral-100 cpsui:h-[30px] cpsui:w-[30px]" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«r16»" data-state="closed" data-slot="popover-trigger">
                              <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="cpsui:text-neutral-600" height="20" width="20" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M8 2v4"></path>
                                 <path d="M16 2v4"></path>
                                 <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                                 <path d="M3 10h18"></path>
                              </svg>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col" data-disabled="true">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Số điện thoại </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium" data-disabled="true"><input data-slot="input" disabled="" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" placeholder="Số điện thoại" maxlength="255" value="${khanhHang.sdt}" name="phone"></div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col" data-disabled="true">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Email </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium" data-disabled="true"><input data-slot="input" disabled="" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" placeholder="Nhập email" maxlength="255" value="${khanhHang.email}" name="email"></div>
                  </div>
               </div>
            </div>
            <div class="shadow-group-button w-full tablet:box-content grid px-0 py-medium grid-cols-2 gap-medium bg-pure-white">
               <button data-slot="button"id="resetName" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-neutral-300 cpsui:text-neutral-800 cpsui:bg-pure-white cpsui:hover:border-neutral-400 cpsui:hover:bg-neutral-50 cpsui:disabled:border-black-300 cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white w-full px-0 tablet:px-medium" type="button">Thiết lập lại</button>
               <button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" type="submit">Cập nhật thông tin</button>
            </div>
         </form>
      </div>
      <button type="button" id="btnClose" class="cpsui:cursor-pointer cpsui:data-[state=open]:bg-secondary cpsui:absolute cpsui:top-3 cpsui:tablet:top-6 cpsui:right-3 cpsui:tablet:right-6 cpsui:rounded-xs cpsui:opacity-70 cpsui:transition-opacity cpsui:hover:opacity-100 cpsui:focus:outline-hidden cpsui:disabled:pointer-events-none">
         <div class="cpsui:h-[24px] cpsui:w-[24px] cpsui:flex cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-100 cpsui:cursor-pointer">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
               <path fill="none" d="M0 0h24v24H0z"></path>
               <path d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
            </svg>
         </div>
      </button>
   </div>
</div>
<div role="dialog" id="radix-«rn»" style="display:none" aria-describedby="radix-«rp»" aria-labelledby="radix-«ro»" data-state="open" data-slot="sheet-content" class="cpsui:tablet:p-medium cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:fixed cpsui:z-10000 cpsui:transition cpsui:ease-in-out cpsui:data-[state=closed]:duration-300 cpsui:data-[state=open]:duration-500 cpsui:data-[state=closed]:slide-out-to-right cpsui:data-[state=open]:slide-in-from-right cpsui:inset-y-0 cpsui:right-0 cpsui:h-full cpsui:max-w-[calc(100%-20px)]" tabindex="-1" style="pointer-events: auto;">
   <div class="cpsui:bg-pure-white cpsui:tablet:rounded-medium cpsui:flex cpsui:flex-col cpsui:w-full cpsui:h-full cpsui:rounded-l-medium">
      <div data-slot="sheet-header" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:tablet:gap-1x-small cpsui:p-small cpsui:tablet:p-medium cpsui:border-b-[1px] cpsui:border-neutral-200 ">
         <h2 id="radix-«ro»" data-slot="sheet-title" class="cpsui:font-bold cpsui:text-medium">Đổi mật khẩu</h2>
      </div>
      <div class="w-full tablet:w-[568px] h-full p-small tablet:px-1x-large tablet:py-medium overflow-hidden pb-0">
         <form class="w-full h-full flex flex-col gap-medium overflow-auto hidden-scroll relative" action="/detailKh/userinfo/change-password" method="post">
            <div class="w-full flex flex-1 flex-col gap-medium tablet:flex-1">
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Mật khẩu cũ </label>
                  <div  class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div id="borderoldPW" class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input id="oldPW" data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap cpsui:[&amp;::-ms-reveal]:hidden cpsui:[&amp;::-ms-clear]:hidden cpsui:appearance-none cpsui:-webkit-appearance-none"
                           autocomplete="off" autocapitalize="off" spellcheck="false" placeholder="Nhập mật khẩu cũ của bạn" type="password" id="oldPW" value="" name="oldPassword">
                        <button type="button" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Show password">
                           <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="0.8em" width="0.8em" xmlns="http://www.w3.org/2000/svg">
                              <path d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path>
                           </svg>
                        </button>
                     </div>
                     <div id="oldPWError" style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path>
                        </svg>
                        Mật khẩu tối thiểu 6 ký tự, có ít nhất 1 chữ số và 1 số
                     </div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Mật khẩu mới </label>
                  <div data-status="default" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div id="bordernewPW" class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap cpsui:[&amp;::-ms-reveal]:hidden cpsui:[&amp;::-ms-clear]:hidden cpsui:appearance-none cpsui:-webkit-appearance-none" 
                           autocomplete="off" autocapitalize="off" spellcheck="false" placeholder="Nhập mật khẩu mới của bạn" type="password" value="" id="newPW" name="newPassword">
                        <button type="button" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Show password">
                           <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="0.8em" width="0.8em" xmlns="http://www.w3.org/2000/svg">
                              <path d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path>
                           </svg>
                        </button>
                     </div>
                     <div id="newPWError" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-neutral-600 cpsui:text-small">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path>
                        </svg>
                        Mật khẩu tối thiểu 6 ký tự, có ít nhất 1 chữ số và 1 số
                     </div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Nhập lại mật khẩu mới </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div id="borderconfirmPW" class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap cpsui:[&amp;::-ms-reveal]:hidden cpsui:[&amp;::-ms-clear]:hidden cpsui:appearance-none cpsui:-webkit-appearance-none"
                           autocomplete="off" autocapitalize="off" spellcheck="false" placeholder="Nhập lại mật khẩu mới của bạn" type="password" id="confirmPW" value="" name="confirmPassword">
                        <button type="button" tabindex="-1" class="cpsui:flex cpsui:cursor-pointer cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-200 cpsui:text-neutral-600 cpsui:hover:bg-neutral-300 cpsui:focus:outline-none cpsui:transition-colors cpsui:w-[20px] cpsui:h-[20px] cpsui:flex-shrink-0" aria-label="Show password">
                           <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="0.8em" width="0.8em" xmlns="http://www.w3.org/2000/svg">
                              <path d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z"></path>
                           </svg>
                        </button>
                     </div>
                  </div>
                  <div id="conformPWError" style="display:none" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:text-negative-600 cpsui:text-small">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:shrink-0" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                        <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336l24 0 0-64-24 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l48 0c13.3 0 24 10.7 24 24l0 88 8 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-80 0c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"></path>
                     </svg>
                     Mật khẩu không khớp
                  </div>
               </div>
            </div>
            <div class="shadow-group-button tablet:shadow-none w-full tablet:box-content px-0 py-medium bg-pure-white"><button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" type="submit">Đổi mật khẩu</button></div>
         </form>
      </div>
      <button type="button" id="closeModalChangePW" class="cpsui:cursor-pointer cpsui:data-[state=open]:bg-secondary cpsui:absolute cpsui:top-3 cpsui:tablet:top-6 cpsui:right-3 cpsui:tablet:right-6 cpsui:rounded-xs cpsui:opacity-70 cpsui:transition-opacity cpsui:hover:opacity-100 cpsui:focus:outline-hidden cpsui:disabled:pointer-events-none">
         <div class="cpsui:h-[24px] cpsui:w-[24px] cpsui:flex cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-100 cpsui:cursor-pointer">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
               <path fill="none" d="M0 0h24v24H0z"></path>
               <path d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
            </svg>
         </div>
      </button>
   </div>
</div>
<div style="display:none" role="dialog" id="radix-«rk»" aria-describedby="radix-«rm»" aria-labelledby="radix-«rl»" data-state="open" data-slot="sheet-content" class="cpsui:tablet:p-medium cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:fixed cpsui:z-10000 cpsui:transition cpsui:ease-in-out cpsui:data-[state=closed]:duration-300 cpsui:data-[state=open]:duration-500 cpsui:data-[state=closed]:slide-out-to-right cpsui:data-[state=open]:slide-in-from-right cpsui:inset-y-0 cpsui:right-0 cpsui:h-full cpsui:max-w-[calc(100%-20px)]" tabindex="-1" style="pointer-events: auto;">
   <div class="cpsui:bg-pure-white cpsui:tablet:rounded-medium cpsui:flex cpsui:flex-col cpsui:w-full cpsui:h-full cpsui:rounded-l-medium">
      <div data-slot="sheet-header" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:tablet:gap-1x-small cpsui:p-small cpsui:tablet:p-medium cpsui:border-b-[1px] cpsui:border-neutral-200 ">
         <h2 id="radix-«rl»" data-slot="sheet-title" class="cpsui:font-bold cpsui:text-medium">Thêm địa chỉ</h2>
      </div>
      <div class="w-full tablet:w-[568px] h-full p-small tablet:px-1x-large tablet:py-medium overflow-hidden pb-[92px] tablet:pb-0" >
         <form class="w-full h-full flex flex-col gap-medium overflow-auto hidden-scroll relative" action="/detailKh/userinfo/diachi/add" method="post">
            <div class="w-full flex flex-1 flex-col gap-medium">
               <div class="text-base font-bold text-neutral-900">Địa chỉ nhận hàng</div>
               <input type="hidden" id="maDiaChi" name="maDiaChi" value="">
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Tỉnh/Thành phố </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer" >
                     <input type="hidden" value="">
                     <div aria-controls="radix-«r16»" aria-expanded="false"  aria-haspopup="dialog" data-slot="popover-trigger" data-state="closed" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                        <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                              id="provinceInput" readonly="" placeholder="Chọn Tỉnh/Thành phố" type="text" value="" name="tinh">
                           <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square" >
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z"></path>
                              </svg>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div id="provinceWrapper" style="max-height: 240px; display:none;"
                     class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                     <div class="dropdown" id="provinceList"></div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Phường/Xã </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <input type="hidden" value="">
                     <div aria-controls="radix-«r18»" aria-expanded="false" aria-haspopup="dialog" data-slot="popover-trigger" data-state="closed" class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer cpsui:w-full">
                        <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                              id="wardInput" readonly="" placeholder="Chọn Phường/Xã" type="text" value="" name="xa">
                           <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square ">
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="cpsui:text-large" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                 <path d="M256 294.1L383 167c9.4-9.4 24.6-9.4 33.9 0s9.3 24.6 0 34L273 345c-9.1 9.1-23.7 9.3-33.1.7L95 201.1c-4.7-4.7-7-10.9-7-17s2.3-12.3 7-17c9.4-9.4 24.6-9.4 33.9 0l127.1 127z"></path>
                              </svg>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div id="wardWrapper" style="max-height: 240px; display:none;"class="cpsui:bg-popover cpsui:text-popover-foreground cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:data-[side=bottom]:slide-in-from-top-2 cpsui:data-[side=left]:slide-in-from-right-2 cpsui:data-[side=right]:slide-in-from-left-2 cpsui:data-[side=top]:slide-in-from-bottom-2 cpsui:z-10000 cpsui:origin-(--radix-popover-content-transform-origin) cpsui:outline-hidden cpsui:text-base cpsui:!p-0 cpsui:rounded-base cpsui:border cpsui:border-neutral-300 cpsui:shadow-sm cpsui:box-border cpsui:[width:var(--radix-popover-trigger-width)]">
                     <div class="dropdown" id="wardList"></div>
                  </div>
               </div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Địa chỉ nhà </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                           placeholder="Nhập địa chỉ nhà" maxlength="255" value="" name="diaChiNha">
                     </div>
                  </div>
               </div>
               <div class="w-full h-[1px] border border-dashed border-neutral-200"></div>
               <div class="cpsui:flex cpsui:gap-2x-small cpsui:group cpsui:flex-col">
                  <label data-slot="label" class="cpsui:flex cpsui:items-center cpsui:gap-2x-small cpsui:font-medium cpsui:select-none cpsui:group-data-[disabled=true]:pointer-events-none cpsui:group-data-[disabled=true]:opacity-50 cpsui:peer-data-[disabled=true]:cursor-not-allowed cpsui:peer-data-[disabled=true]:opacity-50 cpsui:text-base">Đặt tên gợi nhớ </label>
                  <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer">
                     <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-base cpsui:min-h-[48px] cpsui:rounded-base cpsui:pl-medium">
                        <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap"
                           placeholder="Đặt tên gợi nhớ" maxlength="255" value="" name="tenDiaChi">
                     </div>
                  </div>
               </div>
               <div class="flex gap-2x-small group flex-col">
                  <label class="flex items-center gap-2x-small font-medium select-none group-data-[disabled=true]:pointer-events-none group-data-[disabled=true]:opacity-50 peer-data-[disabled=true]:cursor-not-allowed peer-data-[disabled=true]:opacity-50 text-base">Loại địa chỉ</label>
                  <div class="flex items-center gap-1x-small px-3x-small">
                     <div class="address-type-option min-w-[60px] w-fit h-4x-large flex items-center justify-center p-small border rounded-base cursor-pointer relative border-neutral-200" data-type="home">
                        Nhà
                        <div class="check-icon absolute top-0 right-0 bg-primary-500 text-white rounded-bl-small rounded-tr-small flex items-center justify-center w-medium h-medium">
                           <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="8" width="8" xmlns="http://www.w3.org/2000/svg">
                              <path d="M5 12l5 5l10 -10"></path>
                           </svg>
                        </div>
                     </div>
                     <div class="address-type-option min-w-[60px] w-fit h-4x-large flex items-center justify-center p-small border rounded-base cursor-pointer relative border-neutral-200" data-type="office">
                        Văn phòng
                        <div class="check-icon absolute top-0 right-0 bg-primary-500 text-white rounded-bl-small rounded-tr-small flex items-center justify-center w-medium h-medium">
                           <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="8" width="8" xmlns="http://www.w3.org/2000/svg">
                              <path d="M5 12l5 5l10 -10"></path>
                           </svg>
                        </div>
                     </div>
                  </div>
                  <input type="hidden" id="addressType" name="loaiDiaChi" value=""> 
               </div>
               <div class="w-full h-[1px] border border-dashed border-neutral-200"></div>
               <div class="flex items-center gap-small">
                  <div class="text-base font-medium text-neutral-900">Đặt làm địa chỉ mặc định</div>
                  <button type="button" role="switch" aria-checked="false" data-state="unchecked" value="on" data-slot="switch" class="cpsui:relative cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:hover:disabled:after:hidden cpsui:hover:after:rounded-full cpsui:hover:after:content-[''] cpsui:hover:after:absolute cpsui:hover:after:inset-0 cpsui:hover:after:bg-overlay-white-400 cpsui:w-[40px] cpsui:h-[24px] cpsui:inline-flex cpsui:shrink-0 cpsui:items-center cpsui:data-[state=checked]:bg-blue-500 cpsui:data-[state=checked]:disabled:bg-blue-200 cpsui:data-[state=unchecked]:bg-neutral-300 cpsui:data-[state=unchecked]:disabled:bg-neutral-100 cpsui:rounded-full cpsui:border-none cpsui:outline-none cpsui:transition-all cpsui:duration-200">
                  <span id="isDefaultState" data-state="unchecked" data-slot="switch-thumb" class="cpsui:block cpsui:pointer-events-none cpsui:bg-pure-white cpsui:rounded-full cpsui:transition-transform cpsui:duration-200 cpsui:data-[state=checked]:translate-x-[calc(100%-5px)] cpsui:data-[state=unchecked]:translate-x-[1px] cpsui:size-[22px] cpsui:z-10 cpsui:data-[disabled=false]:shadow-[0_1px_4px_rgba(0,0,0,0.2)]"></span></button><input aria-hidden="true" tabindex="-1" type="checkbox" value="on" style="transform: translateX(-100%); position: absolute; pointer-events: none; opacity: 0; margin: 0px; width: 40px; height: 24px;">
                  <input type="hidden" name="macDinh" id="isDefault" value="false">
               </div>
            </div>
            <div class="shadow-group-button w-full flex items-center gap-1x-small tablet:gap-medium tablet:box-content px-1x-small tablet:px-0 py-medium fixed tablet:sticky z-[9999] tablet:z-10 bottom-0 left-0 right-0 bg-pure-white">
            <button data-slot="button" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-medium cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[48px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 w-full font-medium px-0 tablet:px-medium" type="submit">Thêm địa chỉ</button></div>
         </form>
      </div>
      <button id="btncloseModalAddDC" type="button" class="cpsui:cursor-pointer cpsui:data-[state=open]:bg-secondary cpsui:absolute cpsui:top-3 cpsui:tablet:top-6 cpsui:right-3 cpsui:tablet:right-6 cpsui:rounded-xs cpsui:opacity-70 cpsui:transition-opacity cpsui:hover:opacity-100 cpsui:focus:outline-hidden cpsui:disabled:pointer-events-none">
         <div class="cpsui:h-[24px] cpsui:w-[24px] cpsui:flex cpsui:items-center cpsui:justify-center cpsui:rounded-full cpsui:bg-neutral-100 cpsui:cursor-pointer">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
               <path fill="none" d="M0 0h24v24H0z"></path>
               <path d="M19 6.41 17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
            </svg>
         </div>
      </button>
   </div>
</div>
<div role="alertdialog" id="radix-«r1l»" style="display:none" aria-describedby="radix-«r1n»" aria-labelledby="radix-«r1m»" data-state="open" data-slot="alert-dialog-content" class="cpsui:bg-background cpsui:data-[state=open]:animate-in cpsui:data-[state=closed]:animate-out cpsui:data-[state=closed]:fade-out-0 cpsui:data-[state=open]:fade-in-0 cpsui:data-[state=closed]:zoom-out-95 cpsui:data-[state=open]:zoom-in-95 cpsui:fixed cpsui:top-[50%] cpsui:left-[50%] cpsui:z-50 cpsui:grid cpsui:w-full cpsui:translate-x-[-50%] cpsui:translate-y-[-50%] cpsui:gap-medium cpsui:rounded-lg cpsui:p-medium cpsui:shadow-lg cpsui:duration-200 max-w-[min(calc(100vw-16px),400px)]" tabindex="-1" style="pointer-events: auto;">
   <div data-slot="alert-dialog-header" class="cpsui:flex cpsui:flex-col cpsui:gap-2 cpsui:text-center cpsui:sm:text-left">
      <h2 id="radix-«r1m»" data-slot="alert-dialog-title" class="cpsui:font-semibold text-1x-large text-center">Xoá địa chỉ</h2>
      <p id="radix-«r1n»" data-slot="alert-dialog-description" class="cpsui:font-regular cpsui:text-neutral-500 text-center">Bạn có chắc chắn muốn xoá địa chỉ</p>
   </div>
   <div data-slot="alert-dialog-footer" class="cpsui:flex cpsui:justify-end cpsui:gap-small flex justify-center flex-row-reverse">
   <button data-slot="button" id="btnSuyNghiLai" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 cpsui:font-medium w-full" type="button" fdprocessedid="1zw97s">Suy nghĩ lại</button>
   <button data-slot="button" id="confirmDeleteBtn"class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-neutral-300 cpsui:text-neutral-800 cpsui:bg-pure-white cpsui:hover:border-neutral-400 cpsui:hover:bg-neutral-50 cpsui:disabled:border-black-300 cpsui:disabled:text-black-300 cpsui:disabled:bg-pure-white cpsui:font-medium w-full" type="button" fdprocessedid="ksejyf">Xóa địa chỉ</button></div>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/assets/js/userInfor.js"></script>
<script src="/assets/js/toast.js"></script>
<% if (request.getAttribute("successMessage") != null) { %>
<script>
   showSuccessToast('<%= request.getAttribute("successMessage") %>');
</script>
<% } %>
<% if (request.getAttribute("errorMessage") != null) { %>
<script>
   showErrorToast('<%= request.getAttribute("errorMessage") %>');
</script>
<% } %>