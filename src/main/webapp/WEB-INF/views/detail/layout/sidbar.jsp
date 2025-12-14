                                 
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
                  <div class="hidden tablet:block w-[280px] laptop:w-[340px] min-h-[calc(100vh-280px)] shrink-0 mr-small sticky top-[32px] left-0">
                     <div class="bg-pure-white rounded-1x-large h-full w-full">
                        <div class="w-full h-full flex flex-col justify-between">
                           <div class="w-full flex flex-col py-medium">
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative menu-item ${currentTab == 'default' ? 'active' : ''}" target="_self" href="/detailKh" data-body="/detailKh">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M19 8.71l-5.333 -4.148a2.666 2.666 0 0 0 -3.274 0l-5.334 4.148a2.665 2.665 0 0 0 -1.029 2.105v7.2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-7.2c0 -.823 -.38 -1.6 -1.03 -2.105"></path>
                                       <path d="M16 15c-2.21 1.333 -5.792 1.333 -8 0"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Tổng quan<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative menu-item ${currentTab == 'order' ? 'active' : ''}" target="_self" href="/detailKh/order" data-body="/detailKh/order">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M15 21h-9a3 3 0 0 1 -3 -3v-1h10v2a2 2 0 0 0 4 0v-14a2 2 0 1 1 2 2h-2m2 -4h-11a3 3 0 0 0 -3 3v11"></path>
                                       <path d="M9 7l4 0"></path>
                                       <path d="M9 11l4 0"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Lịch sử mua hàng<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative menu-item" target="_self" href="/detailKh/warranty">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M12 21a12 12 0 0 1 -8.5 -15a12 12 0 0 0 8.5 -3a12 12 0 0 0 8.5 3c.539 1.832 .627 3.747 .283 5.588"></path>
                                       <path d="M18 18m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"></path>
                                       <path d="M20.2 20.2l1.8 1.8"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Tra cứu bảo hành<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <div class="w-full px-medium">
                                 <div class="w-full h-[1px] bg-neutral-200"></div>
                              </div>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative menu-item " target="_self" href="/detailKh/promotion">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M18.316 5h-12.632l-3.418 4.019a1.089 1.089 0 0 0 .019 1.447l9.714 10.534l9.715 -10.49a1.09 1.09 0 0 0 .024 -1.444l-3.422 -4.066z"></path>
                                       <path d="M9 11l3 3l3 -3"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Hạng thành viên và ưu đãi<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <div class="w-full px-medium">
                                 <div class="w-full h-[1px] bg-neutral-200"></div>
                              </div>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative menu-item ${currentTab == 'userinfo' ? 'active' : ''}" target="_self" href="/detailKh/userinfo">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M10.325 4.317c.426 -1.756 2.924 -1.756 3.35 0a1.724 1.724 0 0 0 2.573 1.066c1.543 -.94 3.31 .826 2.37 2.37a1.724 1.724 0 0 0 1.065 2.572c1.756 .426 1.756 2.924 0 3.35a1.724 1.724 0 0 0 -1.066 2.573c.94 1.543 -.826 3.31 -2.37 2.37a1.724 1.724 0 0 0 -2.572 1.065c-.426 1.756 -2.924 1.756 -3.35 0a1.724 1.724 0 0 0 -2.573 -1.066c-1.543 .94 -3.31 -.826 -2.37 -2.37a1.724 1.724 0 0 0 -1.065 -2.572c-1.756 -.426 -1.756 -2.924 0 -3.35a1.724 1.724 0 0 0 1.066 -2.573c-.94 -1.543 .826 -3.31 2.37 -2.37c1 .608 2.296 .07 2.572 -1.065z"></path>
                                       <path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0 -6 0"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Thông tin tài khoản<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative" target="_blank" href="https://cellphones.com.vn/chinh-sach-bao-hanh">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M14 3v4a1 1 0 0 0 1 1h4"></path>
                                       <path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z"></path>
                                       <path d="M9 9l1 0"></path>
                                       <path d="M9 13l6 0"></path>
                                       <path d="M9 17l6 0"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Chính sách bảo hành<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative" target="_self" href="/detailKh/support">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M3 7a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-10z"></path>
                                       <path d="M3 7l9 6l9 -6"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Góp ý - Phản hồi - Hỗ trợ<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <a class="text-base laptop:text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative" target="_blank" href="/detailKh/tos">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-r-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M13 15v-6a1 1 0 0 1 1 -1h6a1 1 0 0 1 1 1v4"></path>
                                       <path d="M18 8v-3a1 1 0 0 0 -1 -1h-13a1 1 0 0 0 -1 1v12a1 1 0 0 0 1 1h9"></path>
                                       <path d="M16 22l5 -5"></path>
                                       <path d="M21 21.5v-4.5h-4.5"></path>
                                       <path d="M16 9h2"></path>
                                    </svg>
                                    <span class="font-medium">
                                       Điều khoản sử dụng<!-- --> 
                                    </span>
                                 </div>
                              </a>
                              <div class="w-full px-medium">
                                 <div class="w-full h-[1px] bg-neutral-200"></div>
                              </div>
                              <button class="text-medium items-center group hover:bg-primary-50 hover:text-primary-500 relative cursor-pointer" fdprocessedid="5963o">
                                 <div class="absolute top-0 left-0 w-[4px] h-full shrink-0 bg-transparent rounded-tr-full rounded-br-full group-hover:bg-primary-500"></div>
                                 <div class="w-full px-1x-large py-medium flex items-center gap-1x-small">
                                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="shrink-0" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                       <path d="M14 8v-2a2 2 0 0 0 -2 -2h-7a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2 -2v-2"></path>
                                       <path d="M9 12h12l-3 -3"></path>
                                       <path d="M18 15l3 -3"></path>
                                    </svg>
                                    <span class="font-medium">Đăng xuất</span>
                                 </div>
                              </button>
                           </div>
                           <div class="w-full flex-1 flex justify-end items-end relative">
                              <div class="w-full px-1x-large py-medium sticky bottom-0 left-0">
                                 <span class="w-full pb-small flex items-center gap-1x-small text-small text-neutral-500 tablet:font-regular tablet:text-medium">Mua sắm dễ dàng - Ưu đãi ngập tràn cùng app CellphoneS</span>
                                 <div class="flex gap-small tablet:gap-medium items-center justify-center">
                                    <div class="max-h-[100px] w-[100px] h-[100px] bg-neutral-50 rounded-base shrink-0 p-2x-small flex items-center justify-center"><img alt="Qr Install App" title="Qr Install App" loading="lazy" width="300" height="300" decoding="async" data-nimg="1" class="w-[100%] h-[100%] object-contain" style="color:transparent" src="https://cdn-static.Smember.com.vn/_next/static/media/qr-install-app.c92a5dbb.webp"></div>
                                    <div class="max-h-[100px] app-downloader__stores flex flex-col gap-2 justify-center"><a href="" rel="nofollow" class="p-0"><img alt="Tải app từ Google Play" title="Tải app từ Google Play" loading="lazy" width="300" height="44" decoding="async" data-nimg="1" class="w-[150px] h-[auto] object-contain" style="color: transparent;" src="https://cdn2.cellphones.com.vn/200x,webp/media/wysiwyg/downloadANDROID.png"></a><a href="" rel="nofollow" class="p-0"><img alt="Tải app từ App Store" title="Tải app từ App Store" loading="lazy" width="300" height="44" decoding="async" data-nimg="1" class="w-[150px] h-[auto] object-contain" style="color: transparent;" src="https://cdn2.cellphones.com.vn/200x,webp/media/wysiwyg/downloadiOS.png"></a></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>