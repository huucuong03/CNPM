 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="cps-container cps-body">
   <div style="display:none;">
      <div id="page_loader">
         <div class="logo"></div>
         <div class="loader"></div>
      </div>
   </div>
   <div id="tos">
      <div id="breadcrumbs" class="bannerTopHead">
         <div class="block-breadcrumbs">
            <div class="cps-container">
               <ul>
                  <li>
                     <div>
                        <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <g clip-path="url(#clip0_2841_7864)">
                              <path d="M3.33333 8H2L8 2L14 8H12.6667" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                              <path d="M3.3335 8V12.6667C3.3335 13.0203 3.47397 13.3594 3.72402 13.6095C3.97407 13.8595 4.31321 14 4.66683 14H11.3335C11.6871 14 12.0263 13.8595 12.2763 13.6095C12.5264 13.3594 12.6668 13.0203 12.6668 12.6667V8" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                              <path d="M6 14V9.99996C6 9.64634 6.14048 9.3072 6.39052 9.05715C6.64057 8.8071 6.97971 8.66663 7.33333 8.66663H8.66667C9.02029 8.66663 9.35943 8.8071 9.60948 9.05715C9.85952 9.3072 10 9.64634 10 9.99996V14" stroke="#18181B" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                           </g>
                           <defs>
                              <clipPath id="clip0_2841_7864">
                                 <rect width="16" height="16" fill="white"></rect>
                              </clipPath>
                           </defs>
                        </svg>
                     </div>
                     <a href="https://clause-headline-mild-bizrate.trycloudflare.com/index" class="button__home">Trang chủ</a>
                  </li>
                  <li>
                     <div class="separator">/</div>
                     <p>
                        QUY CHẾ HOẠT ĐỘNG WEBSITE
                     </p>
                  </li>
               </ul>
            </div>
         </div>
         <div class="clear"></div>
      </div>
      <div data-fetch-key="InfoBoardByBlockId:0" class="warranty-container" ins-init-condition="#LmNwcy1jb250YWluZXIgW2RhdGEtZmV0Y2gta2V5XTpmaXJzdA==">
         <h1 class="title has-text-centered">QUY CHẾ HOẠT ĐỘNG WEBSITE CUNG CẤP DỊCH VỤ TMĐT</h1>
         <div class="warranty-page-content is-flex columns">
            <div class="warranty-options column">
                <a href="?section=1">
               <div class="my-4 warranty-options-item <c:if test='${index == 1}'>selected</c:if>">
                
                  PHẦN I. QUY ĐỊNH CHUNG
                    
               </div>
               </a>
                <a href="?section=2">
               <div class="my-4 warranty-options-item <c:if test='${index == 2}'>selected</c:if>">
                  PHẦN II. QUY TRÌNH GIAO DỊCH
               </div>
               </a>
                <a href="?section=3" >
               <div class="my-4 warranty-options-item <c:if test='${index == 3}'>selected</c:if>">
                  PHẦN III. CHÍNH SÁCH BẢO HÀNH SẢN PHẨM  
               </div>
               </a>
                <a href="?section=4" >
               <div class="my-4 warranty-options-item <c:if test='${index == 4}'>selected</c:if>">
                  PHẦN IV. CHÍNH SÁCH HUỶ GIAO DỊCH, ĐỔI TRẢ HÀNG
                 
               </div>
                 </a>
                  <a href="?section=5">
               <div class="my-4 warranty-options-item <c:if test='${index == 5}'>selected</c:if>">       
                  PHẦN V. CHỨNG NHẬN ĐẠI LÝ ỦY QUYỀN 
               </div>
               </a>
            </div>
              <div class="warranty-content column">
            <jsp:include page="${contentView}" />
                 </div>
         </div>
      </div>
   </div>
   <div data-v-6d614cb8="">
      <!---->
   </div>
   <canvas id="confetti"></canvas>
</div>