<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="../../../assets/css/bodyHoaDonChiTiet.css">
<div class="fkIi86">
   <div style="display: contents;">
      <div class="aC3v6v">
         <div style="position: fixed; top: 0px; left: 0px;"></div>
         <div class="ZzuSNS">
            <a class="JDwDHl" id="back"  href="javascript:void(0);">
               <svg viewBox="0 0 24 24" fill="none" width="24" height="24" color="rgba(0, 0, 0, 0.54)">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M7.323 11.116L15.47 2.97l1.06 1.06L8.56 12l7.97 7.97-1.06 1.06-8.147-8.146a1.25 1.25 0 010-1.768z" fill="currentColor"></path>
               </svg>
               <span>TRỞ LẠI</span>
            </a>
            <div class="OjjM_R"><span class="gNhiKt">Yêu cầu vào: <fmt:formatDate value="${hoaDonChiTiet.ngayTao}" pattern="yyyy-MM-dd"/></span></div>
         </div>
         <div class="vOQBhV">
            <div class="SEVp9k ngSTcE"> </div>
            <div class="SEVp9k tJeibe"> </div>
         </div>
         <div class="MwCO3u">
            <div class="EQyuwJ">
               <div class="jXhS5s">
                  <div class="BWtzco" tabindex="0">${hoaDonChiTiet.nguoiNhan}</div>
                  <div class="rRE7pF"><span tabindex="0">${hoaDonChiTiet.sdt}</span><br><span tabindex="0">${hoaDonChiTiet.diaChi}, ${hoaDonChiTiet.xa}, ${hoaDonChiTiet.tinh}</span></div>
               </div>
               <div class="PZgRLC">
                  <c:choose>
                     <c:when test="${hoaDonChiTiet.trangThai == 0}">
                        <div class="ck0Uw9" style="color:#de9816">Chờ xử lý đơn hàng</div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 1}">
                        <div class="ck0Uw9" style="color:blue">Đã xử lý thanh toán</div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 2}">
                        <div class="ck0Uw9"style="color:green">Đã giao đơn hàng</div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 3}">
                        <div class="ck0Uw9">Đã hủy đơn hàng</div>
                     </c:when>
                  </c:choose>
                  <div class="W8cHm8">vào <fmt:formatDate value="${hoaDonChiTiet.ngayTao}" pattern="yyyy-MM-dd"/>.</div>
                  <div class="nAeyvB"></div>
               </div>
            </div>
         </div>
         <div class="tKx41q">
            <div class="x9HmZJ">
               <div>
                  <div style="display: contents;">
                     <c:forEach var="sp" items="${hoaDonChiTiet.danhSachSanPhamHoaDonDTOS}">
                        <div class="aNNsGB">
                           <div class="vAQAmD">
                              <a href="/san-pham/${sp.tenSanpham}">
                                 <div class="x5vMbk"><img src="http://localhost:8080/img/${sp.hinhAnh}" alt="${sp.tenSanpham}"></div>
                                 <div class="iX_ZXQ">
                                    <div class="OvglF_"><span>${sp.tenSanpham}</span></div>
                                    <div class="HszWOL">${sp.tenDungLuong} - ${sp.tenMauSac}</div>
                                    <div class="UOsRMz">x${sp.soLuong}</div>
                                 </div>
                                 <div class="pIi9iW">
                                    <div>
                                       <div>
                                          <c:choose>
                                             <c:when test="${sp.giaTienGGCT != null || sp.giaTienGGSP != null}">
                                                <span class="sLVfna" style="text-decoration: line-through; color: #888;">
                                                   <fmt:formatNumber value="${sp.giaTien}" type="currency" currencySymbol="₫"/>
                                                </span>
                                                <span style="color: #EE4D2D; font-weight: bold; margin-left: 5px;">
                                                   <fmt:formatNumber value="${sp.giaTien - (sp.giaTienGGCT != null ? sp.giaTienGGCT : 0) - (sp.giaTienGGSP != null ? sp.giaTienGGSP : 0)}" 
                                                      type="currency" currencySymbol="₫"/>
                                                </span>
                                             </c:when>
                                             <c:otherwise>
                                                <span>
                                                   <fmt:formatNumber value="${sp.giaTien}" type="currency" currencySymbol="₫"/>
                                                </span>
                                             </c:otherwise>
                                          </c:choose>
                                       </div>
                                    </div>
                                 </div>
                              </a>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
                  <div style="display: none;">
                     <div class="vAQAmD cCj_Ps">
                        <div class="x5vMbk"><img src="http://localhost:8080/img/${sp.hinhAnh}" alt="${sp.tenSanpham}"></div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="nJ4hHl">
               <div class="FZn8xK">
                  <c:choose>
                     <c:when test="${hoaDonChiTiet.trangThai == 0}">
                        <div class="dSdz57"><span>Thực hiện bởi</span></div>
                        <div class="mDgIcz">
                           <div>${hoaDonChiTiet.tenKhachHang}</div>
                        </div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 1}">
                        <div class="dSdz57"><span>Thực hiện bởi</span></div>
                        <div class="mDgIcz">
                           <div>${hoaDonChiTiet.tenKhachHang}</div>
                        </div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 2}">
                        <div class="dSdz57"><span>Thực hiện bởi</span></div>
                        <div class="mDgIcz">
                           <div>${hoaDonChiTiet.tenKhachHang}</div>
                        </div>
                     </c:when>
                     <c:when test="${hoaDonChiTiet.trangThai == 3}">
                        <div class="dSdz57"><span>Yêu cầu bởi</span></div>
                        <div class="mDgIcz">
                           <div>Người mua</div>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <div class="dSdz57"><span>Thực hiện bởi</span></div>
                        <div class="mDgIcz">
                           <div>${hoaDonChiTiet.tenKhachHang}</div>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
               <c:set var="tongTienHang" value="0"/>
               <c:set var="tongGiamGiaCT" value="0"/>
               <c:set var="tongGiamGiaSP" value="0"/>
               <c:forEach var="sp" items="${hoaDonChiTiet.danhSachSanPhamHoaDonDTOS}">
                  <c:set var="giaSP" value="${sp.giaTien}"/>
                  <c:set var="giamGiaCT" value="${sp.giaTienGGCT != null ? sp.giaTienGGCT : 0}"/>
                  <c:set var="giamGiaSP" value="${sp.giaTienGGSP != null ? sp.giaTienGGSP : 0}"/>
                  <c:set var="tongTienHang" value="${tongTienHang + giaSP}"/>
                  <c:set var="tongGiamGiaCT" value="${tongGiamGiaCT + giamGiaCT}"/>
                  <c:set var="tongGiamGiaSP" value="${tongGiamGiaSP + giamGiaSP}"/>
               </c:forEach>
               <!-- Giảm giá chi tiết -->
               <div class="FZn8xK">
                  <div class="dSdz57"><span>Giảm giá chi tiết</span></div>
                  <div class="mDgIcz">
                     <div>
                        <fmt:formatNumber value="${tongGiamGiaCT}" type="currency" currencySymbol="₫"/>
                     </div>
                  </div>
               </div>
               <!-- Giảm giá sản phẩm -->
               <div class="FZn8xK">
                  <div class="dSdz57"><span>Giảm giá sản phẩm</span></div>
                  <div class="mDgIcz">
                     <div>
                        <fmt:formatNumber value="${tongGiamGiaSP}" type="currency" currencySymbol="₫"/>
                     </div>
                  </div>
               </div>
               <!-- Thành tiền -->
               <div class="FZn8xK">
                  <div class="dSdz57"><span>Thành tiền</span></div>
                  <div class="mDgIcz">
                     <div>
                        <fmt:formatNumber value="${tongTienHang - tongGiamGiaCT - tongGiamGiaSP}" type="currency" currencySymbol="₫"/>
                     </div>
                  </div>
               </div>
               <div class="FZn8xK">
                  <div class="dSdz57"><span>Phương thức thanh toán</span></div>
                  <div class="mDgIcz">
                     <c:choose>
                        <c:when test="${hoaDonChiTiet.loaiThanhToan == 0}">Chưa thanh toán</c:when>
                        <c:when test="${hoaDonChiTiet.loaiThanhToan == 1}">Thanh toán Online</c:when>
                        <c:otherwise>Thanh toán khi nhận hàng</c:otherwise>
                     </c:choose>
                  </div>
               </div>
               <div class="FZn8xK">
                  <div class="dSdz57"><span>Mã đơn hàng</span></div>
                  <div class="mDgIcz">
                     <div>
                        <a class="S2ZN0Z" style="display:flex;margin: 0 30px 0 55px;" href="/user/purchase/order/205595020267718">
                           <span style="margin: auto;">${hoaDonChiTiet.maHoaDon}</span>
                           <svg width="12" height="13" viewBox="0 0 12 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path d="M7.67983 2.66743C7.92391 2.42336 8.31963 2.42336 8.56371 2.66743L10.3315 4.4352C10.5756 4.67928 10.5756 5.07501 10.3315 5.31908L7.32628 8.32429C7.0822 8.56837 6.68647 8.56837 6.44239 8.32429L4.8514 6.7333L4.32107 7.26363L5.91206 8.85462C6.44903 9.39159 7.31963 9.39159 7.85661 8.85462L10.8618 5.84941C11.3988 5.31244 11.3988 4.44184 10.8618 3.90487L9.09404 2.1371C8.55707 1.60013 7.68647 1.60013 7.1495 2.1371L5.91206 3.37454L6.44239 3.90487L7.67983 2.66743Z" fill="#EE4D2D"></path>
                              <path d="M4.32104 11.3295C4.07696 11.5736 3.68123 11.5736 3.43715 11.3295L1.66939 9.56172C1.42531 9.31764 1.42531 8.92192 1.66939 8.67784L4.67459 5.67263C4.91867 5.42856 5.3144 5.42856 5.55847 5.67263L7.14946 7.26362L7.67979 6.73329L6.0888 5.1423C5.55183 4.60533 4.68123 4.60533 4.14426 5.1423L1.13906 8.14751C0.602086 8.68448 0.602085 9.55508 1.13906 10.0921L2.90682 11.8598C3.44379 12.3968 4.3144 12.3968 4.85137 11.8598L6.0888 10.6224L5.55847 10.0921L4.32104 11.3295Z" fill="#EE4D2D"></path>
                           </svg>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
document.getElementById("back").addEventListener("click", function() {
        window.history.back();
    });
</script>