                       
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
         <header id="header" class="from-primary-300 to-primary-500 fixed top-0 right-0 left-0 z-1000  max-w-screen flex-col items-center justify-center bg-linear-to-b text-white tablet:flex hidden">
            <div class="mx-auto max-w-[1440px] flex w-full px-3x-large py-[16px] h-[72px] items-center">
               <a title="" class="flex mr-[28px] h-10 items-center transition-all duration-300 md:hover:scale-95" href="/index">
                  <div class="logo">
                  <img src="../../../assets/img/logo/logo.png" alt="" style="height: 80px;width: 170px">
               </div>
               </a>
               <div class="overlay fixed top-[72px] inset-0 bg-black/55 backdrop-blur-[3px] transition-opacity duration-200 z-[1000] opacity-0 pointer-events-none"></div>
               <div class="relative h-fit flex-1 mr-[21px] max-w-[779px]">
                  <form>
                     <div class="cpsui:flex cpsui:flex-col cpsui:gap-2x-small cpsui:peer z-10 w-full overflow-hidden rounded-[10px] text-neutral-600 border-0 border-transparent">
                        <div class="cpsui:p-1x-small cpsui:flex cpsui:items-center cpsui:gap-1x-small cpsui:min-w-0 cpsui:border cpsui:transition-colors cpsui:data-[disabled=true]:bg-neutral-100 cpsui:data-[disabled=true]:cursor-not-allowed cpsui:border-neutral-300 cpsui:focus-within:border-neutral-600 cpsui:data-[disabled=true]:border-neutral-200 cpsui:text-small cpsui:min-h-[40px] cpsui:rounded-small bg-pure-white h-[40px] text-medium focus-within:border-none focus-within:ring-0 focus-within:shadow-none border-0">
                           <div class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:aspect-square ">
                              <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="text-pure-black ml-[9px] mr-[5px]" height="24" width="24" xmlns="http://www.w3.org/2000/svg">
                                 <path fill="none" stroke-miterlimit="10" stroke-width="32" d="M221.09 64a157.09 157.09 0 1 0 157.09 157.09A157.1 157.1 0 0 0 221.09 64z"></path>
                                 <path fill="none" stroke-linecap="round" stroke-miterlimit="10" stroke-width="32" d="M338.29 338.29 448 448"></path>
                              </svg>
                           </div>
                           <input data-slot="input" class="cpsui:w-full cpsui:h-full cpsui:bg-transparent cpsui:border-none cpsui:outline-none cpsui:shadow-none cpsui:ring-0 cpsui:focus:outline-none cpsui:focus:border-none cpsui:focus:ring-0 cpsui:focus-visible:outline-none cpsui:focus-visible:border-none cpsui:focus-visible:ring-0 cpsui:placeholder:text-neutral-300 cpsui:placeholder:select-none cpsui:disabled:opacity-80 cpsui:disabled:cursor-not-allowed cpsui:disabled:text-neutral-500 cpsui:disabled:placeholder:text-neutral-400 cpsui:overflow-hidden cpsui:text-ellipsis cpsui:whitespace-nowrap" placeholder="Bạn muốn mua gì hôm nay?" value="" fdprocessedid="38nfas">
                        </div>
                     </div>
                  </form>
               </div>
               <div class="mx-auto flex max-w-screen-xl gap-6 overflow-hidden px-2 text-xs transition-all duration-200 ease-in-out xl:px-1 mr-[20px] ml-[1px]">
                  <div class="hidden items-center gap-7.5 md:flex">
                     <a class="flex items-center text-[12px] gap-1 whitespace-nowrap relative before:absolute before:top-1/2 before:-translate-y-1/2 before:-left-[15px] before:w-0.5 before:h-3 before:bg-primary-200" target="blank" href="">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="none" viewBox="0 0 25 25" class="size-[17px]">
                           <path stroke="white" stroke-linecap="round" stroke-width="1.5" d="M8.32 22.66h8.36c2.31 0 4.18-1.786 4.18-3.99v-4.877c0-.708.296-1.387.82-1.888 1.216-1.16 1.058-3.083-.332-4.048l-6.39-4.434a4.343 4.343 0 0 0-4.917 0L3.653 7.857c-1.391.965-1.55 2.888-.333 4.048.524.5.82 1.18.82 1.888v4.878c0 2.203 1.87 3.989 4.18 3.989Z"></path>
                           <path fill="white" d="M8.9 12.916V9.66h7v2.816l-.987-1.222h-4.419V12l2.004 2.175-.128.183-3.47-1.441Z"></path>
                           <path fill="white" d="M8.9 18.778v-2.922l1.097 1.327h4.309V15.83l-1.95-2.236.135-.179 3.409 1.61v3.754h-7Z"></path>
                        </svg>
                        <span class="cursor-pointer hover:scale-95 transition-all duration-300">Cửa hàng gần bạn</span>
                     </a>
                     <a class="flex items-center text-[12px] gap-1 whitespace-nowrap relative before:absolute before:top-1/2 before:-translate-y-1/2 before:-left-[15px] before:w-0.5 before:h-3 before:bg-primary-200" href="tel:18002097">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 256 256" class="size-[17px]" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path d="M144.27,45.93a8,8,0,0,1,9.8-5.66,86.22,86.22,0,0,1,61.66,61.66,8,8,0,0,1-5.66,9.8A8.23,8.23,0,0,1,208,112a8,8,0,0,1-7.73-5.94,70.35,70.35,0,0,0-50.33-50.33A8,8,0,0,1,144.27,45.93Zm-2.33,41.8c13.79,3.68,22.65,12.54,26.33,26.33A8,8,0,0,0,176,120a8.23,8.23,0,0,0,2.07-.27,8,8,0,0,0,5.66-9.8c-5.12-19.16-18.5-32.54-37.66-37.66a8,8,0,1,0-4.13,15.46Zm81.94,95.35A56.26,56.26,0,0,1,168,232C88.6,232,24,167.4,24,88A56.26,56.26,0,0,1,72.92,32.12a16,16,0,0,1,16.62,9.52l21.12,47.15,0,.12A16,16,0,0,1,109.39,104c-.18.27-.37.52-.57.77L88,129.45c7.49,15.22,23.41,31,38.83,38.51l24.34-20.71a8.12,8.12,0,0,1,.75-.56,16,16,0,0,1,15.17-1.4l.13.06,47.11,21.11A16,16,0,0,1,223.88,183.08Zm-15.88-2s-.07,0-.11,0h0l-47-21.05-24.35,20.71a8.44,8.44,0,0,1-.74.56,16,16,0,0,1-15.75,1.14c-18.73-9.05-37.4-27.58-46.46-46.11a16,16,0,0,1,1-15.7,6.13,6.13,0,0,1,.57-.77L96,95.15l-21-47a.61.61,0,0,1,0-.12A40.2,40.2,0,0,0,40,88,128.14,128.14,0,0,0,168,216,40.21,40.21,0,0,0,208,181.07Z"></path>
                        </svg>
                        <span class="cursor-pointer hover:scale-95 transition-all duration-300">1800 2097</span>
                     </a>
                  </div>
               </div>
               <span data-slot="button" id="btn-cart" class="cpsui:flex cpsui:items-center cpsui:justify-center cpsui:gap-2x-small cpsui:cursor-pointer cpsui:disabled:cursor-not-allowed cpsui:border cpsui:border-[1px] cpsui:text-base cpsui:px-medium cpsui:py-1x-small cpsui:min-h-[40px] cpsui:rounded-base cpsui:border-primary-500 cpsui:bg-primary-500 cpsui:text-pure-white cpsui:hover:border-primary-700 cpsui:hover:bg-primary-700 cpsui:disabled:text-black-300 cpsui:disabled:bg-neutral-200 cpsui:disabled:border-neutral-200 button__cart hover:bg-primary-500 hidden border-none bg-transparent md:flex">
                  <span class="hidden lg:inline-block">Giỏ hàng</span>
                  <span class="relative">
                     <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="size-6" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="176" cy="416" r="16" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></circle>
                        <circle cx="400" cy="416" r="16" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"></circle>
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M48 80h64l48 272h256"></path>
                        <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M160 288h249.44a8 8 0 0 0 7.85-6.43l28.8-144a8 8 0 0 0-7.85-9.57H128"></path>
                     </svg>
                     <span id="countGH" class="absolute -top-1.5 -right-1.5 flex items-center justify-center rounded-full border border-white bg-orange-500 px-1 py-0.25 text-[10px] leading-none text-white">0</span>
                  </span>
               </span>
            </div>
         </header>