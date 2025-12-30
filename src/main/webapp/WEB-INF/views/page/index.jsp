<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% 
   com.example.demo.Entity.KhachHang kh = (com.example.demo.Entity.KhachHang) session.getAttribute("khachHang"); 
   %>
<%@ include file="/WEB-INF/views/toast.jsp" %>
<div id="toast"></div>
<div class="container" style="margin-top: 15px;">
   <div class="row">
      <div class="col large-3 hide-for-medium box_left">
         <div class="menu-top">
            <div id="nav_menu-2" class="widget_nav_menu">
               <div class="menu-main-menu-container">
                  <ul id="menu-main-menu-1" class="menu">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-1289 nav-dropdown-col has-child" aria-expanded="false">
                        <a href="/apple">Apple</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                        <ul class="sub-menu nav-column">
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1290">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-X">iPhone X </a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-X">iPhone X</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-XS">iPhone XS</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-XR">iPhone XR</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-X-Pro">iPhone X pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iPhone-X-Pro-Max">iPhone X pro max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-se/">iPhone SE</a>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1291">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-11">iPhone 11 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-11">iPhone 11</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-11-Mini">iPhone 11 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-11-Pro">iPhone 11 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-11-Pro-Max">iPhone 11 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1291">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-12">iPhone 12 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-12">iPhone 12</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-12-Mini">iPhone 12 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-12-Pro">iPhone 12 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-12-Pro-Max">iPhone 12 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1293">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-13">iPhone 13 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/iphone-13">iPhone 13</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-13-Mini">iPhone 13 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-13-Pro">iPhone 13 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-13-Pro-Max">iPhone 13 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-14">iPhone 14 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-14">iPhone 14</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-14-Mini">iPhone 14 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-14-Pro">iPhone 14 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-14-Pro-Max">iPhone 14 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-15">iPhone 15 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-15">iPhone 15</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-15-Mini">iPhone 15 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-15-Pro">iPhone 15 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-15-Pro-Max">iPhone 15 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-16">iPhone 16 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-16">iPhone 16</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-16-Mini">iPhone 16 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-16-Pro">iPhone 16 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-16-Pro-Max">iPhone 16 Pro Max</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-17">iPhone 17 Series</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-17">iPhone 17</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-17-Mini">iPhone 17 Mini</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-17-Pro">iPhone 17 pro</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/apple/danh-muc/san-pham/iphone-17-Pro-Max">iPhone 17 Pro Max</a></li>
                              </ul>
                           </li>
                        </ul>
                     </li>
                     </li>
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-36">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/samsung">Samsung</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                        <ul class="sub-menu nav-column">
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1290">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy">Galaxy S</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-S20">Galaxy S20</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-S21">Galaxy S21</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-S21">Galaxy S22</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-S23">Galaxy S23</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-S24">Galaxy S24</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1291">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/Galaxy Note">Galaxy Note</a>
                              <ul class="sub-menu nav-column">
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1274"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-15">Galaxy Note 15</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1275"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-16">Galaxy Note 16</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1276"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-17">Galaxy Note 17</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-18">Galaxy Note 18</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-19">Galaxy Note 19</a></li>
                                 <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1277"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Note-20">Galaxy Note 20</a></li>
                              </ul>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1292"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-A">Galaxy A</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1293"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-M">Galaxy M</a></li>
                           <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1293"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/Samsung/danh-muc/san-pham/Galaxy-Z-Fold">Galaxy Z Fold</a></li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi">Xiaomi</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                        <ul class="sub-menu nav-column">
                           <li class="menu-item menu-item-has-children">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/xiaomi">Xiaomi Series (Flagship)</a>
                              <ul class="sub-menu">
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/xiaomi-14-ultra">Xiaomi 14 Ultra</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/xiaomi-14">Xiaomi 14</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/xiaomi-13">Xiaomi 13 Series</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-has-children">
                              <a  href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/redmi-note">Redmi Note Series</a>
                              <ul class="sub-menu">
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/redmi-note-13-pro">Redmi Note 13 Pro+</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/redmi-note-13">Redmi Note 13</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/redmi-note-12">Redmi Note 12 Series</a></li>
                              </ul>
                           </li>
                           <li class="menu-item">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/redmi/">Redmi (Dòng phổ thông)</a>
                           </li>
                           <li class="menu-item">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/xiaomi/danh-muc/san-pham/poco/">POCO Series</a>
                           </li>
                        </ul>
                     </li>
                     </li>
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo">OPPO</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <button class="toggle" aria-label="Chuyển đổi"><i class="icon-angle-down" aria-hidden="true"></i></button>
                        <ul class="sub-menu nav-column">
                           <li class="menu-item menu-item-has-children">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/find">Find Series (Cao cấp)</a>
                              <ul class="sub-menu">
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/find-n3">Find N3 | N3 Flip</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/find-x7">Find X7 Series</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-has-children">
                              <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/reno">Reno Series</a>
                              <ul class="sub-menu">
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/reno12">OPPO Reno12 Series</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/reno11">OPPO Reno11 Series</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/reno10">OPPO Reno10 Series</a></li>
                              </ul>
                           </li>
                           <li class="menu-item menu-item-has-children">
                              <a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/a">A Series (Giá rẻ)</a>
                              <ul class="sub-menu">
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/oppo-a98">OPPO A98</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/oppo-a78">OPPO A78</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/oppo-a58">OPPO A58</a></li>
                                 <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oppo/danh-muc/san-pham/oppo-a18">OPPO A18</a></li>
                              </ul>
                           </li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-has-children has-dropdown">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/realme">Realme</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <ul class="sub-menu">
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/realme/danh-muc/san-pham/gt">Realme GT Series</a></li>
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/realme/danh-muc/san-pham/number">Realme Number Series</a></li>
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/realme/danh-muc/san-pham/c">Realme C Series</a></li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-has-children has-dropdown">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/vivo">Vivo</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <ul class="sub-menu">
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/vivo/danh-muc/san-pham/x">Vivo X Series</a></li>
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/vivo/danh-muc/san-pham/v">Vivo V Series</a></li>
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/vivo/danh-muc/san-pham/y">Vivo Y Series</a></li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-has-children has-dropdown">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/asus">ASUS</a>
                        <svg stroke="currentColor" style="margin-right: 9px;" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" class="ml-auto size-5 text-neutral-400" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                           <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="m184 112 144 144-144 144"></path>
                        </svg>
                        <ul class="sub-menu">
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/asus/rog-phone">ROG Phone</a></li>
                           <li><a href="https://clause-headline-mild-bizrate.trycloudflare.com/asus/zenfone">Zenfone</a></li>
                        </ul>
                     </li>
                     <li class="menu-item">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/nokia">Nokia</a>
                     </li>
                     <li class="menu-item">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/oneplus">OnePlus</a>
                     </li>
                     <li class="menu-item">
                        <a style="width:88%" href="https://clause-headline-mild-bizrate.trycloudflare.com/vsmart">Vsmart</a>
                     </li>
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children menu-item-27 menu-item-design-default has-dropdown has-icon-left has-child" aria-expanded="false">
                     <li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-1284"><a href="https://clause-headline-mild-bizrate.trycloudflare.com/oneplus/">Điện thoại phổ thông</a></li>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="col slider-top large-7 medium-12 box_center">
         <div class="swiper-container">
            <div class="mySwiper2 swiper-initialized swiper-horizontal swiper-backface-hidden">
               <div class="swiper-wrapper" id="swiper-wrapper-b8945dddd39e32a4" aria-live="off" style="transition-duration: 0ms; transform: translate3d(-3700px, 0px, 0px); transition-delay: 0ms;">
                  <div class="swiper-slide swiper-slide-next" style="width: 740px;" role="group" aria-label="3 / 6" data-swiper-slide-index="2"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/samsung_mua_nhi_u.png"></a></div>
                  <div class="swiper-slide" style="width: 740px;" role="group" aria-label="4 / 6" data-swiper-slide-index="3"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/T3300-new.png"></a></div>
                  <div class="swiper-slide" style="width: 740px;" role="group" aria-label="5 / 6" data-swiper-slide-index="4"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/TV.png"></a></div>
                  <div class="swiper-slide" role="group" aria-label="6 / 6" data-swiper-slide-index="5" style="width: 740px;"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/13ACL6.png"></a></div>
                  <div class="swiper-slide swiper-slide-prev" style="width: 740px;" role="group" aria-label="1 / 6" data-swiper-slide-index="0"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/A73.png"></a></div>
                  <div class="swiper-slide swiper-slide-active" style="width: 740px;" role="group" aria-label="2 / 6" data-swiper-slide-index="1"><a href=""><img src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/iPhone_11-new.png"></a></div>
               </div>
               <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-b8945dddd39e32a4">
                  <svg class="swiper-navigation-icon" width="11" height="20" viewBox="0 0 11 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path d="M0.38296 20.0762C0.111788 19.805 0.111788 19.3654 0.38296 19.0942L9.19758 10.2796L0.38296 1.46497C0.111788 1.19379 0.111788 0.754138 0.38296 0.482966C0.654131 0.211794 1.09379 0.211794 1.36496 0.482966L10.4341 9.55214C10.8359 9.9539 10.8359 10.6053 10.4341 11.007L1.36496 20.0762C1.09379 20.3474 0.654131 20.3474 0.38296 20.0762Z" fill="currentColor"></path>
                  </svg>
               </div>
               <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-b8945dddd39e32a4">
                  <svg class="swiper-navigation-icon" width="11" height="20" viewBox="0 0 11 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <path d="M0.38296 20.0762C0.111788 19.805 0.111788 19.3654 0.38296 19.0942L9.19758 10.2796L0.38296 1.46497C0.111788 1.19379 0.111788 0.754138 0.38296 0.482966C0.654131 0.211794 1.09379 0.211794 1.36496 0.482966L10.4341 9.55214C10.8359 9.9539 10.8359 10.6053 10.4341 11.007L1.36496 20.0762C1.09379 20.3474 0.654131 20.3474 0.38296 20.0762Z" fill="currentColor"></path>
                  </svg>
               </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <div class="mySwiper swiper-initialized swiper-horizontal swiper-watch-progress swiper-backface-hidden swiper-thumbs">
               <div class="swiper-wrapper" id="swiper-wrapper-c6779127d1776670" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms; transition-delay: 0ms;">
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible swiper-slide-active" style="width: 148px;" role="group" aria-label="1 / 6">GALAXY A73<br>Ưu đãi cực lớn</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible swiper-slide-next swiper-slide-thumb-active" style="width: 148px;" role="group" aria-label="2 / 6">IPHONE 11<br>Giảm sâu giá sốc</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="3 / 6">PHỤ KIỆN SAMSUNG<br>Mua nhiều giảm sốc</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="4 / 6">ASUS T3300<br>Nhận ngay quà chất</div>
                  <div class="swiper-slide swiper-slide-visible swiper-slide-fully-visible" style="width: 148px;" role="group" aria-label="5 / 6">TV SAMSUNG<br>Giảm giá đến 40%</div>
                  <div class="swiper-slide" role="group" aria-label="6 / 6" style="width: 148px;">LENOVO YOGA 6<br>Hiệu năng mạnh mẽ</div>
               </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
            <script>
               var swiper = new Swiper(".mySwiper", {
               spaceBetween: 0,
               slidesPerView: 5,
               freeMode: false,
               allowTouchMove: false,
               watchSlidesVisibility: true,
               watchSlidesProgress: true,
               });
               var swiper2 = new Swiper(".mySwiper2", {
               spaceBetween: 0,
               loop: true,
               autoplay: {
                delay: 2500,
                disableOnInteraction: false,
               },
               navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
               },
               thumbs: {
                swiper: swiper,
               },
               });
            </script>
         </div>
      </div>
      <%
         if (kh == null) { 
         %>
      <div class="col large-3 hide-for-medium box_right">
         <div class="image-ads">
            <div class="item-image-ads">
               <div class="d-none d-md-block shadow rounded-3 bg-white p-3 text-dark">
                  <div class="fw-bold d-flex">
                     Nguyễn Văn A
                     <div class="mt-1 d-flex gap-1" style="margin-left:10px">
                        <div class="badge bg-dark text-uppercase p-1" style="color:#fff;height:1rem">S-Null</div>
                     </div>
                  </div>
                  <div class="mb-2 d-flex align-items-center gap-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                        </svg>
                     </div>
                     <a href="" class="d-flex flex-column text-decoration-none ">
                     <span class="fw-bold" style="font-size:16px;">0đ</span>
                     <span class="text-muted" style="font-size: 10px;">Tổng tiền tích lũy</span>
                     </a>
                  </div>
                  <a href="" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>
                     </div>
                     <span>Tài khoản</span>
                     <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6" style="color: #a1a1aa;width: calc(.25rem * 5);height: calc(.25rem * 5);position: absolute;z-index: 1;right: 12px;">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                     </svg>
                  </a>
                  <a href="" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M21 11.25v8.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5v-8.25M12 4.875A2.625 2.625 0 1 0 9.375 7.5H12m0-2.625V7.5m0-2.625A2.625 2.625 0 1 1 14.625 7.5H12m0 0V21m-8.625-9.75h18c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125h-18c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
                        </svg>
                     </div>
                     <span>Xem Đơn hàng</span>
                     <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6" style="color: #a1a1aa;width: calc(.25rem * 5);height: calc(.25rem * 5);position: absolute;z-index: 1;right: 12px;">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                     </svg>
                  </a>
                  <a href="" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg"  style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                        </svg>
                     </div>
                     <span>Đăng xuất</span>
                  </a>
               </div>
            </div>
            <div class="item-image-ads">
               <div>
                  <a class="bg-overlay-black-200 hover:bg-overlay-black-300 mb-1.5 block w-full rounded-md py-1.5 text-center font-medium thucu" href="/thu-cu-doi-moi">Thu cũ lên đời giá hời</a>
                  <a class="line-clamp-2 flex h-9 items-center gap-2 hover:underline" href=""  style="display: flex; padding: 9px 0; margin-left: 16px;">
                     <span class="cps-image-cdn relative inline-block size-4.5"><img alt="iPhone trợ giá &lt;b&gt;đến 5 triệu&lt;/b&gt;" loading="lazy" width="18" height="18" decoding="async" data-nimg="1" class="transition-opacity duration-500 opacity-100 object-contain size-4.5" style="color: transparent;" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:18:18/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_repeat_home_190825.png"></span>
                     <div class="flex-1">iPhone trợ giá <b>đến 5 triệu</b></div>
                  </a>
                  <a class="line-clamp-2 flex h-9 items-center gap-2 hover:underline" href="" style="display: flex; padding: 9px 0; margin-left: 16px;">
                     <span class="cps-image-cdn relative inline-block size-4.5"><img alt="Samsung trợ giá &lt;b&gt;đến 4 triệu&lt;/b&gt;" loading="lazy" width="18" height="18" decoding="async" data-nimg="1" class="transition-opacity duration-500 opacity-100 object-contain size-4.5" style="color: transparent;" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:18:18/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_repeat_home_190825.png"></span>
                     <div class="flex-1">Samsung trợ giá <b>đến 4 triệu</b></div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <% }else { %>
      <div class="col large-3 hide-for-medium box_right">
         <div class="image-ads">
            <div class="item-image-ads">
               <div class="d-none d-md-block shadow rounded-3 bg-white p-3 text-dark">
                  <div class="fw-bold d-flex">
                     <%= kh.getTen() %>
                     <div class="mt-1 d-flex gap-1" style="margin-left:10px">
                        <div class="badge bg-dark text-uppercase p-1" style="color:#fff;height:1rem">S-Null</div>
                     </div>
                  </div>
                  <div class="mb-2 d-flex align-items-center gap-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                        </svg>
                     </div>
                     <a href="" class="d-flex flex-column text-decoration-none ">
                     <span class="fw-bold" style="font-size:16px;">0đ</span>
                     <span class="text-muted" style="font-size: 10px;">Tổng tiền tích lũy</span>
                     </a>
                  </div>
                  <a href="/detailKh/userinfo" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        </svg>
                     </div>
                     <span>Tài khoản</span>
                     <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6" style="color: #a1a1aa;width: calc(.25rem * 5);height: calc(.25rem * 5);position: absolute;z-index: 1;right: 12px;">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                     </svg>
                  </a>
                  <a href="/detailKh/order" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg" style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M21 11.25v8.25a1.5 1.5 0 0 1-1.5 1.5H5.25a1.5 1.5 0 0 1-1.5-1.5v-8.25M12 4.875A2.625 2.625 0 1 0 9.375 7.5H12m0-2.625V7.5m0-2.625A2.625 2.625 0 1 1 14.625 7.5H12m0 0V21m-8.625-9.75h18c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125h-18c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125Z" />
                        </svg>
                     <span>Xem Đơn hàng</span>
                     </div>
                     <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6" style="color: #a1a1aa;width: calc(.25rem * 5);height: calc(.25rem * 5);position: absolute;z-index: 1;right: 12px;">
                        <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                     </svg>
                  </a>
                  <a href="/logout" class="d-flex align-items-center gap-2 text-decoration-none mb-2" style="font-size: 12px;">
                     <div class="d-flex align-items-center justify-content-center rounded-circle p-1" style="background: linear-gradient(to bottom, #DC3545, #FF5733); width: 30px; height: 30px;">
                        <svg xmlns="http://www.w3.org/2000/svg"  style="color:white" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                           <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                        </svg>
                     </div>
                     <span>Đăng xuất</span>
                  </a>
               </div>
            </div>
            <div class="item-image-ads">
               <div>
                  <a class="bg-overlay-black-200 hover:bg-overlay-black-300 mb-1.5 block w-full rounded-md py-1.5 text-center font-medium thucu" href="/thu-cu-doi-moi">Thu cũ lên đời giá hời</a>
                  <a class="line-clamp-2 flex h-9 items-center gap-2 hover:underline" href=""  style="display: flex; padding: 9px 0; margin-left: 16px;">
                     <span class="cps-image-cdn relative inline-block size-4.5"><img alt="iPhone trợ giá &lt;b&gt;đến 5 triệu&lt;/b&gt;" loading="lazy" width="18" height="18" decoding="async" data-nimg="1" class="transition-opacity duration-500 opacity-100 object-contain size-4.5" style="color: transparent;" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:18:18/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_repeat_home_190825.png"></span>
                     <div class="flex-1">iPhone trợ giá <b>đến 5 triệu</b></div>
                  </a>
                  <a class="line-clamp-2 flex h-9 items-center gap-2 hover:underline" href="" style="display: flex; padding: 9px 0; margin-left: 16px;">
                     <span class="cps-image-cdn relative inline-block size-4.5"><img alt="Samsung trợ giá &lt;b&gt;đến 4 triệu&lt;/b&gt;" loading="lazy" width="18" height="18" decoding="async" data-nimg="1" class="transition-opacity duration-500 opacity-100 object-contain size-4.5" style="color: transparent;" src="https://cdn2.cellphones.com.vn/insecure/rs:fill:18:18/q:90/plain/https://cellphones.com.vn/media/wysiwyg/icon_repeat_home_190825.png"></span>
                     <div class="flex-1">Samsung trợ giá <b>đến 4 triệu</b></div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <% } %>
   </div>
   <section class="section" id="section_804548742">
      <div class="section-bg fill">
      </div>
      <div class="section-content relative">
         <div class="row pdb-0" id="row-1814045731">
            <div id="col-852212811" class="col small-12 large-12">
               <div class="col-inner">
                  <div class="img has-hover hide-for-medium x md-x lg-x y md-y lg-y" id="image_938452842">
                     <a class="" href="#">
                        <div class="img-inner dark">
                           <img fetchpriority="high" decoding="async" width="1200" height="75" src="https://clause-headline-mild-bizrate.trycloudflare.com/assets/img/banner/km-o-Special_Banner_1200x75_6.jpg" class="attachment-original size-original" alt="">						
                        </div>
                     </a>
                     <style>
                        #image_938452842 {
                        width: 100%;
                        }
                     </style>
                  </div>
                  <div class="img has-hover show-for-medium x md-x lg-x y md-y lg-y" id="image_975644744">
                     <div class="img-inner dark" style="margin:0px 0px 10px 0px;">
                        <img decoding="async" width="800" height="150" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2021/08/banner-ads-mobile.png" class="attachment-original size-original" alt="">						
                     </div>
                     <style>
                        #image_975644744 {
                        width: 100%;
                        }
                     </style>
                  </div>
               </div>
            </div>
            <style>
               #row-1814045731 > .col > .col-inner {
               background-color: rgb(255, 255, 255);
               }
            </style>
         </div>
      </div>
      <style>
         #section_804548742 {
         padding-top: 0px;
         padding-bottom: 0px;
         }
      </style>
   </section>
   <section class="section" id="section_629166640">
      <div class="section-bg fill">
      </div>
      <div class="section-content relative">
         <div class="row align-middle pdb-0" id="row-1339189191">
            <div id="col-703424715" class="col medium-12 small-12 large-3">
               <div class="col-inner" style="width: 102%;">
                  <h3>ĐIỆN THOẠI NỔI BẬT NHẤT</h3>
                  <a href="/" class="button primary is-link btn-read-more show-for-medium" style="border-radius:99px;">
                  <span>Xem tất cả</span>
                  </a>
               </div>
            </div>
            <div id="col-68942984" class="col brand-items medium-12 small-12 large-9">
               <div class="col-inner text-left">
                  <div class="list-brand-items2">
                     <c:forEach items="${nsx}" var="item">
                        <a title="${item.tenNSX}" style=" text-transform: capitalize;" href="/${item.tenNSX.toLowerCase()}">
                        ${item.tenNSX}
                        </a>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
         <div class="row list-product-home" id="row-1861442257">
            <div id="col-621881846" class="col small-12 large-12">
               <div class="col-inner">
                  <div class="row large-columns-5 medium-columns-3 small-columns-2 row-small">
                     <c:forEach var="sp" items="${products}">
                        <div class="product-small col has-hover product type-product post-1693 status-publish first instock product_cat-apple product_cat-hot-sale product_cat-ipad-pro has-post-thumbnail shipping-taxable purchasable product-type-variable has-default-attributes">
                           <div class="col-inner">
                              <div class="badge-container absolute left top z-1">
                              </div>
                              <div class="product-small box ">
                                 <div class="box-image">
                                    <div class="image-none">
                                       <a href="/san-pham/${sp.tenSanPham}" aria-label="${sp.tenSanPham}">
                                       <img loading="lazy" decoding="async" width="470" height="488" src="../../../img/${sp.anh}" class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail" alt="">				</a>
                                       <div class="item-hotsale"></div>
                                    </div>
                                    <div class="image-tools is-small top right show-on-hover">
                                    </div>
                                    <div class="image-tools is-small hide-for-small bottom left show-on-hover">
                                    </div>
                                    <div class="image-tools grid-tools text-center hide-for-small bottom hover-slide-in show-on-hover">
                                    </div>
                                 </div>
                                 <div class="box-text box-text-products">
                                    <div class="title-wrapper">
                                       <p class="name product-title woocommerce-loop-product__title">
                                          <a href="/san-pham/${sp.tenSanPham}" class="woocommerce-LoopProduct-link woocommerce-loop-product__link">${sp.tenSanPham}</a>
                                       </p>
                                    </div>
                                    <div class="price-wrapper">
                                       <c:choose>
                                          <c:when test="${sp.tongBinhLuan > 0}">
                                             <div class="star-rating" title="Rated 5 out of 5">
                                                <span style="width:${sp.diemTrungBinh * 20}%">
                                                <strong class="rating">5</strong> out of 5</span>
                                             </div>
                                          </c:when>
                                          <c:otherwise>
                                             <div class="star-rating" style="opacity: 0;" title="Rated 5 out of 5">
                                                <span style="display:none">
                                                <strong class="rating">5</strong> out of 5</span>
                                             </div>
                                          </c:otherwise>
                                       </c:choose>
                                       <span class="price">
                                          <%-- Nếu có giá khuyến mãi và nhỏ hơn giá gốc --%>
                                          <c:choose>
                                             <c:when test="${sp.giaBanGG != null && sp.giaBanGG < sp.giaBan}">
                                                <ins>
                                                   <span class="woocommerce-Price-amount amount">
                                                      <bdi>
                                                         <fmt:formatNumber value="${sp.giaBanGG}" type="number" minFractionDigits="0"/>
                                                         <span class="woocommerce-Price-currencySymbol">₫</span>
                                                      </bdi>
                                                   </span>
                                                </ins>
                                                <del>
                                                   <span style="display:none;">Giá niêm yết: </span>
                                                   <span class="woocommerce-Price-amount amount">
                                                      <bdi>
                                                         <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                                         <span class="woocommerce-Price-currencySymbol">₫</span>
                                                      </bdi>
                                                   </span>
                                                </del>
                                             </c:when>
                                             <c:otherwise>
                                                <span class="woocommerce-Price-amount amount">
                                                   <bdi>
                                                      <fmt:formatNumber value="${sp.giaBan}" type="number"/>
                                                      <span class="woocommerce-Price-currencySymbol">₫</span>
                                                   </bdi>
                                                </span>
                                             </c:otherwise>
                                          </c:choose>
                                       </span>
                                       <div class="promotion">Thu cũ lên đời - Trợ giá 1 triệu</div>
                                       <c:choose>
                                          <c:when test="${sp.tongBinhLuan > 0}">
                                             <span class="text-count-review">  ${sp.tongBinhLuan} đánh giá</span>
                                          </c:when>
                                          <c:otherwise>
                                             <span class="text-count-review">Chưa có đánh giá</span>
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <style>
         #section_629166640 {
         padding-top: 0px;
         padding-bottom: 0px;
         }
      </style>
   </section>
   <section class="section pk-home" id="section_512847781">
      <%-- <div class="section-bg fill">
         </div>
         <div class="section-content relative">
            <div class="row align-middle pdb-0" id="row-94458386">
               <div id="col-1368762419" class="col medium-12 small-12 large-3">
                  <div class="col-inner">
                     <h3>DANH MỤC PHỤ KIỆN</h3>
                     <a href="/phu-kien/" class="button primary is-link btn-read-more show-for-medium">
                     <span>Xem tất cả</span>
                     </a>
                  </div>
               </div>
            </div>
            <div class="row" id="row-2134507371">
               <div id="col-139258056" class="col phu-kien small-12 large-12">
                  <div class="col-inner">
                     <a class="plain" href="http://phu-kien/phu-kien-apple/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/phu-kien-apple.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Phụ kiện Apple</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/pin-du-phong/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/pin-du-phong.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Pin dự phòng</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/dan-dien-thoai-laptop/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/dan-man-hinh.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Dán màn hình</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/day-deo-dong-ho/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/day-deo-dong-ho.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Dây đồng hồ</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/the-nho-usb/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/the-nho-usb.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Thẻ nhớ</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/camera/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/camera.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Camera</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/thiet-bi-mang/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/thiet-bi-mang.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Thiết bị mạng</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/balo.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Balo, Túi xách</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/cap-sac/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/cap-sac.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Cáp sạc</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/op-lung-bao-da-op-airpods/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/bao-da-op-lung.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Ốp bao da</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/o-cung.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Ổ cứng</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/chuot-ban-phim.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Chuột, bàn phím</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/gaming-gear.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Gaming Gear</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/quat-mini.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Quạt</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/phu-kien-chup-anh.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Phụ kiện chụp ảnh</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="/phu-kien/phu-kien-may-tinh-laptop/">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/phu-kien-laptop.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Phụ kiện laptop</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/ram.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>RAM</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/cpu.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>CPU</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/card-man-hinh.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Card màn hình</p>
                           </div>
                        </div>
                     </a>
                     <a class="plain" href="#">
                        <div class="icon-box featured-box icon-box-center text-center">
                           <div class="icon-box-img" style="width: 110px">
                              <div class="icon">
                                 <div class="icon-inner">
                                    <img loading="lazy" decoding="async" width="262" height="300" src="https://clause-headline-mild-bizrate.trycloudflare.com/wp-content/uploads/2022/04/mainbroad.png" class="attachment-medium size-medium" alt="">					
                                 </div>
                              </div>
                           </div>
                           <div class="icon-box-text last-reset">
                              <p>Mainbroad</p>
                           </div>
                        </div>
                     </a>
                  </div>
               </div>
            </div>
         </div> --%>
</div>
<style>
#section_512847781 {
padding-top: 0px;
padding-bottom: 0px;
}
</style>
</section>
<c:if test="${not empty message}">
   <script>
      showSuccessToast("${message}");
   </script>
</c:if>