<%@ page import="java.util.Set, java.util.HashSet, java.util.List, java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.demo.dto.ListMauSacOfSanPhamDTO" %>
 <%@ include file="toast.jsp" %>
<div id="toast"></div>
 <jsp:include page="/WEB-INF/views/layout/breadcrumbs.jsp" />
<div id="product-1693" class="product type-product post-1693 status-publish first instock product_cat-apple product_cat-hot-sale product_cat-ipad-pro has-post-thumbnail shipping-taxable purchasable product-type-variable has-default-attributes">
   <div class="product-container">
      <div class="product-main"style="padding-top:15px;">
         <div class="row pdb-0">
            <div class="col medium-12 header-title" style="padding: 0;">
               <h1 class="ma-san-pham"  id="${sanPham.maSanPham}">${sanPham.tenSanPham}</h1>
               <div class="meta-title">
                  <div class="" title="Rated 5 out of 5">
                     <span style="border-right: 1px solid;display: block;font-family: fl-icons !important;font-size: 16px;font-weight: 400 !important;height: 1em;letter-spacing: 0;line-height: 1em;margin: .5em 0;overflow: hidden;position: relative;text-align: left;width: 6em;">
                     <i class="bi bi-star-fill" style="font-size: 13px;color: #ffa500 !important;"></i>
                     <i class="bi bi-star-fill" style="font-size: 13px;color: #ffa500 !important;"></i>
                     <i class="bi bi-star-fill" style="font-size: 13px;color: #ffa500 !important;"></i>
                     <i class="bi bi-star-fill" style="font-size: 13px;color: #ffa500 !important;"></i>
                     <i class="bi bi-star-fill" style="font-size: 13px;color: #ffa500 !important;"></i>
                  </div>
                  <a href="#reviews_summary" class="woocommerce-review-link" rel="nofollow" style="font-size: 90%;margin-left: 10px;color:#e0052b"><span class="count">2</span> Đánh Giá</a>
               </div>
            </div>
         </div>
         <div class="row content-row mb-0">
            <div class="product-gallery large-4 col">
               <div class="product-images relative mb-half has-hover woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images" data-columns="4" style="opacity: 1;">
                  <div class="badge-container is-larger absolute left top z-1">
                  </div>
                  <div class="image-tools absolute top show-on-hover right z-3">
                  </div>
                  <div class="woocommerce-product-gallery__wrapper product-gallery-slider slider slider-nav-small mb-half is-draggable flickity-enabled" data-flickity-options="{
                     &quot;cellAlign&quot;: &quot;center&quot;,
                     &quot;wrapAround&quot;: true,
                     &quot;autoPlay&quot;: false,
                     &quot;prevNextButtons&quot;:true,
                     &quot;adaptiveHeight&quot;: true,
                     &quot;imagesLoaded&quot;: true,
                     &quot;lazyLoad&quot;: 1,
                     &quot;dragThreshold&quot; : 15,
                     &quot;pageDots&quot;: false,
                     &quot;rightToLeft&quot;: false       }" tabindex="0">
                     <div class="flickity-viewport" style="height: 384.156px; touch-action: pan-y;">
                        <div class="flickity-slider" style="left: 0px; transform: translateX(0%);">
                           <div class="main-product-image">
                              <img src="http://localhost:8080/img/${mauSacDefault.hinhAnhURL}" alt="${sanPham.tenSanPham}"  width="470" height="488" style="width:370px;height:384px;"/>
                           </div>
                           <div class="color-thumbnails">
                              <c:forEach var="mauSac" items="${listMauSac}">
                                 <c:if test="${mauSac.maMauSac != mauSacDefault.maMauSac}">
                                    <div class="thumbnail">
                                       <img src="http://localhost:8080/img/${mauSac.hinhAnhURL}" 
                                          alt="${sanPham.tenSanPham}" 
                                          width="100" height="100"/>
                                    </div>
                                 </c:if>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                     <button class="flickity-button flickity-prev-next-button previous" type="button" aria-label="Previous">
                        <svg class="flickity-button-icon" viewBox="0 0 100 100">
                           <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow"></path>
                        </svg>
                     </button>
                     <button class="flickity-button flickity-prev-next-button next" type="button" aria-label="Next">
                        <svg class="flickity-button-icon" viewBox="0 0 100 100">
                           <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow" transform="translate(100, 100) rotate(180) "></path>
                        </svg>
                     </button>
                  </div>
                  <div class="image-tools absolute bottom left z-3">
                     <a role="button" href="#product-zoom" class="zoom-button button is-outline circle icon tooltip hide-for-small" title="Phóng to" aria-label="Phóng to" data-flatsome-role-button="attached"><i class="icon-expand" aria-hidden="true"></i></a>  
                  </div>
               </div>
               <div class="product-thumbnails thumbnails slider-no-arrows slider row row-small row-slider slider-nav-small small-columns-4 is-draggable flickity-enabled" data-flickity-options="{
                  &quot;cellAlign&quot;: &quot;left&quot;,
                  &quot;wrapAround&quot;: false,
                  &quot;autoPlay&quot;: false,
                  &quot;prevNextButtons&quot;: true,
                  &quot;asNavFor&quot;: &quot;.product-gallery-slider&quot;,
                  &quot;percentPosition&quot;: true,
                  &quot;imagesLoaded&quot;: true,
                  &quot;pageDots&quot;: false,
                  &quot;rightToLeft&quot;: false,
                  &quot;contain&quot;: true
                  }" tabindex="0">
                  <div class="flickity-viewport" style="height: 90.8125px; touch-action: pan-y;">
                     <div class="flickity-slider Imagephu" id="main-image">
                        <c:forEach var="mauSac" items="${listMauSac}" varStatus="status">
                           <c:if test="${mauSac.maMauSac != mauSacDefault.maMauSac}">
                              <div class="col ${status.first ? 'first' : ''}" 
                                 style="position: absolute; left: ${status.index * 25}%;">
                                 <a>
                                 <img src="http://localhost:8080/img/${mauSac.hinhAnhURL}" 
                                    alt="${sanPham.tenSanPham}" 
                                    width="1024" height="815" 
                                    class="attachment-woocommerce_thumbnail"/>
                                 </a>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
                  <button class="flickity-button flickity-prev-next-button previous" type="button" disabled="" aria-label="Previous">
                     <svg class="flickity-button-icon" viewBox="0 0 100 100">
                        <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow"></path>
                     </svg>
                  </button>
                  <button class="flickity-button flickity-prev-next-button next" type="button" aria-label="Next">
                     <svg class="flickity-button-icon" viewBox="0 0 100 100">
                        <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class="arrow" transform="translate(100, 100) rotate(180) "></path>
                     </svg>
                  </button>
               </div>
            </div>
            <div class="product-info summary col-fit col entry-summary large-5">
               <div class="price-wrapper">
                  <p class="price product-page-price price-on-sale">
                     <%
                        Object giaBan = request.getAttribute("giaBan");
                        Object giaBanGG = request.getAttribute("giaBanGG");
                        
                        Long giaBanLong = Math.round(Double.parseDouble(giaBan.toString()));
                        Long giaBanGGLong = null;
                        
                        if (giaBanGG != null && !giaBanGG.toString().isEmpty()) {
                            giaBanGGLong = Math.round(Double.parseDouble(giaBanGG.toString()));
                        %>
                     <ins>
                     <span class="woocommerce-Price-amount amount">
                     <bdi><%= String.format("%,d", giaBanGGLong) %><span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                     </span>
                     </ins>
                     <del>
                     <span>Giá niêm yết: </span>
                     <span class="woocommerce-Price-amount amount">
                     <bdi><%= String.format("%,d", giaBanLong) %><span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                     </span>
                     </del>
                     <%
                        } else {
                        %>
                     <span class="woocommerce-Price-amount amount">
                     <bdi><%= String.format("%,d", giaBanLong) %><span class="woocommerce-Price-currencySymbol">₫</span></bdi>
                     </span>
                     <%
                        }
                        %>
                  </p>
               </div>
               <form id="checkoutForm" action="/cart/check-out" method="post" class="variations_form cart ux-swatches-js-attached" enctype="multipart/form-data" data-product_id="1693" >
                  <div class="single_variation_wrap">
                     <table class="variations" cellspacing="0">
                        <tbody>
                           <tr>
                              <td class="label" style="font-weight: bold; padding-right: 20px; font-size:1.3em">
                                 <label for="pa_mau-sac" style="margin: .5em 0;">Màu sắc</label>
                              </td>
                              <%
                                 List<ListMauSacOfSanPhamDTO> listMauSac =
                                     (List<ListMauSacOfSanPhamDTO>) request.getAttribute("listMauSac");
                                 %>
                              <td class="value">
                                 <!-- Dropdown select (ẩn theo UX) -->
                                 <div class="variation-selector variation-select-ux_label hidden">
                                    <select id="list-mau-sac" name="attribute_pa_mau-sac" data-attribute_name="attribute_pa_mau-sac" data-show_option_none="yes">
                                       <option value="">Chọn một tùy chọn</option>
                                       <%
                                          if (listMauSac != null && !listMauSac.isEmpty()) {
                                              boolean first = true;
                                              for (ListMauSacOfSanPhamDTO mauSac : listMauSac) {
                                                  String value = mauSac.getMaMauSac().toString();
                                                  String label = mauSac.getTenMauSac();
                                          %>
                                       <option value="<%= value %>" <%= first ? "selected" : "" %>><%= label %></option>
                                       <%
                                          first = false;
                                          }
                                          }
                                          %>
                                    </select>
                                 </div>
                                 <!-- Swatches hiển thị màu -->
                                 <div class="ux-swatches ux-swatches-attribute-ux_label" data-attribute_name="attribute_pa_mau-sac" role="radiogroup" aria-labelledby="pa_mau-sac">
                                    <%
                                       if (listMauSac != null && !listMauSac.isEmpty()) {
                                           boolean first = true;
                                           for (ListMauSacOfSanPhamDTO mauSac : listMauSac) {
                                               String value = mauSac.getMaMauSac().toString();
                                               String label = mauSac.getTenMauSac();
                                       %>
                                    <div class="ux-swatch ux-swatch--label <%= first ? "selected" : "" %>" 
                                       aria-checked="<%= first ? "true" : "false" %>" 
                                       data-value="<%= value %>" 
                                       data-name="<%= label %>" 
                                       role="radio" tabindex="0">
                                       <span class="ux-swatch__text"><%= label %></span>
                                    </div>
                                    <%
                                       first = false;
                                       }
                                       }
                                       %>
                                 </div>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                     <div class="linked-product" id="list-dung-luong">
                        <%
                           List<Map<String, Object>> variants = 
                               (List<Map<String, Object>>) request.getAttribute("variantsDungLuong");
                           
                           String tenDungLuongCheck = (String) request.getAttribute("tenDungLuongCheck"); // Dung lượng mặc định
                           
                           Set<String> displayedIds = new HashSet<>(); // Set để lưu id đã hiển thị
                           
                           if (variants != null) {
                               for (Map<String, Object> item : variants) {
                                   String maDL = String.valueOf(item.get("maDungLuong"));
                                   
                                   // Nếu id đã hiển thị thì bỏ qua
                                   if (displayedIds.contains(maDL)) {
                                       continue;
                                   }
                                   
                                   displayedIds.add(maDL); // Đánh dấu đã hiển thị
                                   
                                   String tenDL = (String) item.get("tenDungLuong");
                                   boolean isActive = tenDL.equals(tenDungLuongCheck);
                           %>
                        <a class="item-linked-product<%= isActive ? " active" : "" %>" href="#"  id="<%= maDL %>">
                        <span><%= tenDL %></span>
                        <strong>
                        <%
                           Object ggg = item.get("giaBanGG");
                           if (ggg != null) {
                               out.print(String.format("%,d", (long) Double.parseDouble(ggg.toString())) + " ₫");
                           } else {
                               out.print(String.format("%,d", (long) Double.parseDouble(item.get("giaBan").toString())) + " ₫");
                           }
                           %>
                        </strong>
                        </a>
                        <%
                           }
                           }
                           %>
                     </div>
                     <div class="promotion-info">
                        <div class="promotion-product">
                           <div class="promotion-icon"><i class="bi bi-gift"></i> Khuyến mãi</div>
                           <div>
                              <h4>Khuyến mãi hãng:</h4>
                              <div class="pack-detail">
                                 <ul class="el-promotion-pack">
                                    <li>Ưu đãi thanh toán/ trả góp qua thẻ ngân hàng lên đến 1 triệu</li>
                                    <li>Thu cũ lên đời – Trợ giá 1 triệu</li>
                                 </ul>
                              </div>
                              <h4>Chương trình khuyến mại:</h4>
                              <div class="pack-detail">
                                 <ul class="el-promotion-pack">
                                    <li>Mua kèm dịch vụ bảo hành Apple Care giá tốt</li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="woocommerce-variation single_variation">
                        <div class="woocommerce-variation-description"></div>
                        <div class="woocommerce-variation-price" style="display: none;"></div>
                        <div class="woocommerce-variation-availability"></div>
                     </div>
                     <div class="woocommerce-variation-add-to-cart variations_button woocommerce-variation-add-to-cart-enabled">
                        <div class="quantity buttons_added" style="display: block;">
                           <span>Số lượng</span>
                           <input type="button" value="-" class="minus button is-form">				
                           <label class="screen-reader-text" for="quantity_692c29b254fbc"data-id-san-pham="${sanPham.maSanPham}">${sanPham.tenSanPham}</label>
                           <input type="number" id="quantity_692c29b254fbc" class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Qty" size="4" placeholder="" inputmode="numeric">
                           <input type="button" value="+" class="plus button is-form">	
                        </div>
                        <button type="button" id="single_add_to_cart_button" class="single_add_to_cart_button button alt">
                        <i class="fa-solid fa-basket-shopping"></i> Thêm Vào Giỏ Hàng</button>
                        <button id="btnBuyNow" type="button" class="button buy_now_button" fdprocessedid="zqsgr">Mua ngay</button>
                        <input type="hidden" name="is_buy_now" class="is_buy_now" value="0" autocomplete="off">
                        <input type="hidden" name="add-to-cart" value="1693">
                        <input type="hidden" name="product_id" value="1693">
                        <input type="hidden" name="variation_id" class="variation_id" value="1694">
                     </div>
                  </div>
                  <input type="hidden" name="maGHCTs" id="checkoutMaGHCTs">
               </form>
               <script type="text/javascript">
                  jQuery(document).ready(function () {
                  	jQuery(document).ready(function(event) {
                  		var m = jQuery('.price.product-page-price ').html();
                  		jQuery('.single_variation_wrap').change(function(){
                  			jQuery('.woocommerce-variation-price').hide();
                  			var p = jQuery('.single_variation_wrap').find('.price').html();
                  			jQuery('.price.product-page-price').html(p);
                  		});
                  		jQuery('body').on('click','.reset_variations',function(event) {
                  			jQuery('.price.product-page-price').html(m);
                  		});
                  	});
                  });
               </script>
            </div>
            <div class="col large-3" style="max-width: 25%;">
               <div class="description-product">
                  <p><b>Mô tả</b><br>
                     ${sanPham.moTa}
                  </p>
                  <p><b>Bảo hành</b><br>
                     Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple Việt Nam. 1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Gia hạn bảo hành thời gian giãn cách
                  </p>
               </div>
            </div>
         </div>
      </div>
      <div class="row tab-product-related">
         <div class="col small-12">
            <div class="tabs nav nav-outline">
               <button class="tab active" onclick="opentab(event, 'Related')" fdprocessedid="1fqmvd">Sản phẩm tương tự</button>
            </div>
            <div id="Related" class="tab-content" style="">
               <div class="related related-products-wrapper product-section">
                  <h3 class="product-section-title container-width product-section-title-related">
                     Sản phẩm tương tự			
                  </h3>
                  <div class="row large-columns-4 medium-columns-3 small-columns-2 row-small">
                     <c:forEach var="sp" items="${sanPhamGanNhat}">
                        <div class="product-small col has-hover product">
                           <div class="col-inner">
                              <div class="badge-container absolute left top z-1"></div>
                              <div class="product-small box">
                                 <div class="box-image">
                                    <div class="image-none">
                                       <a href="/san-pham/${sp.tenSanPham}" aria-label="${sp.tenSanPham}">
                                       <img width="600"
                                          height="600"
                                          src="http://localhost:8080/img/${sp.hinhAnh}"
                                          class="attachment-woocommerce_thumbnail size-woocommerce_thumbnail"
                                          alt="${sp.tenSanPham}"
                                          loading="lazy"/>
                                       </a>
                                       <div class="item-hotsale"></div>
                                    </div>
                                 </div>
                                 <div class="box-text box-text-products">
                                    <div class="title-wrapper">
                                       <p class="name product-title woocommerce-loop-product__title">
                                          <a href="/san-pham/${sp.tenSanPham}" 
                                             class="woocommerce-LoopProduct-link woocommerce-loop-product__link">
                                          ${sp.tenSanPham}
                                          </a>
                                       </p>
                                    </div>
                                    <div class="price-wrapper">
                                       <c:choose>
                                          <c:when test="${sp.giaBanGG != null && sp.giaBanGG > 0}">
                                             <span class="price">
                                                <ins>
                                                <span class="woocommerce-Price-amount amount">
                                                <bdi>${sp.giaBanGG}₫</bdi>
                                                </span>
                                                </ins>
                                                <c:if test="${sp.giaBan != null}">
                                                   <del>
                                                   <span class="woocommerce-Price-amount amount">
                                                   <bdi>${sp.giaBan}₫</bdi>
                                                   </span>
                                                   </del>
                                                </c:if>
                                             </span>
                                          </c:when>
                                          <c:otherwise>
                                             <span class="price">
                                                <c:choose>
                                                   <c:when test="${sp.giaBan != null}">
                                                      <span class="woocommerce-Price-amount amount">
                                                      <bdi>${sp.giaBan}₫</bdi>
                                                      </span>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <span class="woocommerce-Price-amount amount">
                                                      Liên hệ
                                                      </span>
                                                   </c:otherwise>
                                                </c:choose>
                                             </span>
                                          </c:otherwise>
                                       </c:choose>
                                       <div class="promotion mo-ta-san-pham">
                                          ${sp.moTa}
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
            <%-- <script>
               function opentab(evt, Name) {
                 var i, tabcontent, tab;
                 tabcontent = document.getElementsByClassName("tab-content");
                 for (i = 0; i < tabcontent.length; i++) {
               	tabcontent[i].style.display = "none";
                 }
                 tab = document.getElementsByClassName("tab");
                 for (i = 0; i < tab.length; i++) {
               	tab[i].className = tab[i].className.replace(" active", "");
                 }
                 document.getElementById(Name).style.display = "block";
                 evt.currentTarget.className += " active";
               }
               document.getElementById("tab-active").click();
               </script> --%>
         </div>
      </div>
      <div class="product-footer">
         <div class="container">
            <div class="row row-small content-product-page" style="display: flex;flex-direction: row;">
               <div class="col medium-9 product-footer-left" style="max-width: 830px;-ms-flex-preferred-size: 830px;flex-basis: 830px;">
                  <div class="product-page-sections">
                     <div class="product-reviews">
                        <div class="row">
                           <div class="large-12 col pb-0 mb-0">
                              <div class="panel entry-content">
                                 <div id="ywar_reviews">
                                    <div id="reviews_summary">
                                       <h3>ĐÁNH GIÁ SẢN PHẨM</h3>
                                       <div id="reviews_header"></div>
                                    </div>
                                    <div id="reviews_dialog"></div>
                                 </div>
                                 <div id="reviews" class="ywar-review-content">
                                    <div id="comments">
                                       <c:choose>
                                          <c:when test="${not empty danhGiaList}">
                                             <ol class="commentlist">
                                                <c:forEach var="dg" items="${danhGiaList}">
                                                   <li id="li-comment-${dg.maDanhGia}" class="clearfix">
                                                      <div id="comment-${dg.maDanhGia}" class="comment_container clearfix">
                                                         <img alt="" 
                                                            src="https://secure.gravatar.com/avatar/${dg.khachHang.ten}?s=60&d=mm&r=g" 
                                                            class="avatar avatar-60 photo" height="60" width="60" loading="lazy" decoding="async">
                                                         <p class="meta">
                                                            <strong>${dg.khachHang.ten}</strong>
                                                            <time datetime="${dg.ngayDanhGia}">${dg.ngayDanhGia}</time>
                                                         </p>
                                                         
                                                         <div class="comment-text clearfix">
                                                            <div class="description ywar-description">
                                                               <p><span class="review_content">${dg.danhGia}</span></p>
                                                               <div class="review_vote">
                                                                  <span class="review_helpful">Nhận xét này có hữu ích cho bạn?</span>
                                                                  <a id="vote_yes_${dg.maDanhGia}" class="ywar_votereview yes" href="#" data-vote_review="1" data-id_review="${dg.maDanhGia}" title="This review is helpful" rel="nofollow"></a>
                                                                  <a id="vote_no_${dg.maDanhGia}" class="ywar_votereview not" href="#" data-vote_review="-1" data-id_review="${dg.maDanhGia}" title="This review is not helpful" rel="nofollow"></a>
                                                                  <span class="ywar_review_helpful">0 of 0 people found this review helpful</span>
                                                               </div>
                                                               <div class="reply review-actions">
                                                                  <div class="reply">
                                                                     <a class="comment-reply-link button" href="#respond" aria-label="Bình luận" rel="nofollow">Bình luận</a>
                                                                  </div>
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </li>
                                                </c:forEach>
                                             </ol>
                                          </c:when>
                                          <c:otherwise>
                                             <p class="woocommerce-noreviews">Sản phẩm chưa có đánh giá nào.</p>
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
                                    <c:choose>
                                       <c:when test="${kh != null}">
                                          <div id="review_form_wrapper" class="open">
                                             <div id="review_form">
                                                <div id="respond" class="comment-respond">
                                                   <h3 id="reply-title" class="comment-reply-title"><span class="review_label">Thêm bình luận</span> <small><a rel="nofollow" id="cancel-comment-reply-link" href="/san-pham/apple-ipad-pro-11-2021-m1-wifi-512gb-i-chinh-hang-apple-viet-nam/#respond" style="display:none;">Hủy</a></small></h3>
                                                   <form action="/binhluan" method="post" id="commentform" class="comment-form" enctype="multipart/form-data">
                                                      <div id="comments">
                                                         <ol class="commentlist">
                                                            <li id="li-comment-2158" class="clearfix ">
                                                               <div id="comment-2158" class="comment_container clearfix ">
                                                                  <img alt="" src="https://secure.gravatar.com/avatar/7527cc194c5a168daa3a26a7543bed2878b7ef42c09cdd0b5741c15f79305f6f?s=60&amp;d=mm&amp;r=g" srcset="https://secure.gravatar.com/avatar/7527cc194c5a168daa3a26a7543bed2878b7ef42c09cdd0b5741c15f79305f6f?s=120&amp;d=mm&amp;r=g 2x" class="avatar avatar-60 photo" height="60" width="60" loading="lazy" decoding="async">			
                                                                  <p class="meta">
                                                                    <strong>${tenKhachHang}</strong>
                                                                     <%-- <time datetime="2024-05-29T11:21:24+07:00">29/05/2024</time> --%>
                                                                  </p>
                                                                  <div class="comment-text clearfix ">
                                                                     <div class="description ywar-description">
                                                                        <span class="review_helpful">Nhận xét của bạn:</span>
                                                                        <textarea id="comment" name="comment" cols="22" rows="4" aria-required="true"></textarea>
                                                                        <div class="reply review-actions">
                                                                           <input type="hidden" name="maSP" value="${sanPham.maSanPham}">
                                                                           <input type="hidden" name="maKH" value="${maKhachHang}">
                                                                           <p class="form-submit" style="width: 30%;margin: auto;">
                                                                              <input name="submit" type="submit" id="submit" class="submit" value="Gửi bình luận" fdprocessedid="yjy4it"> 
                                                                              <input type="hidden" name="comment_post_ID" value="1687" id="comment_post_ID">
                                                                              <input type="hidden" name="comment_parent" id="comment_parent" value="0">
                                                                           </p>
                                                                        </div>
                                                                        <p></p>
                                                                     </div>
                                                                  </div>
                                                               </div>
                                                            </li>
                                                         </ol>
                                                      </div>
                                                   </form>
                                                </div>
                                                <!-- #respond -->
                                             </div>
                                          </div>
                                       </c:when>
                                       <c:otherwise>
                                          <div class="text-center mt-3">
                                             <p>Bạn cần đăng nhập để bình luận sản phẩm.</p>
                                             <a href="/loginView" class="btn btn-danger">Đăng nhập</a>
                                          </div>
                                       </c:otherwise>
                                    </c:choose>
                                    <div class="clear"></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col medium-3 content-product-footer-right" style="max-width: calc(100% - 830px);-ms-flex-preferred-size: calc(100% - 830px);flex-basis: calc(100% - 830px);">
                  <div class="product-footer-right">
                     <h3>Thông số kỹ thuật</h3>
                     <div class="table">
                        <table id="tskt">
                           <tbody>
                              <tr>
                                 <td>Kích thước màn hình</td>
                                 <td>${sanPham.manHinh}</td>
                              </tr>
                              <tr>
                                 <td>Công nghệ màn hình</td>
                                 <td>${sanPham.manHinh}</td>
                              </tr>
                              <tr>
                                 <td>Camera sau</td>
                                 <td>${sanPham.camerasau}
                                 </td>
                              </tr>
                              <tr>
                                 <td>Camera trước</td>
                                 <td>${sanPham.cameratruoc}</td>
                              </tr>
                              <tr>
                                 <td>Chipset</td>
                                 <td>${sanPham.tenChip}</td>
                              </tr>
                              <tr>
                                 <td>Dung lượng RAM</td>
                                 <td>${sanPham.ram}</td>
                              </tr>
                              <tr>
                                 <td>Bộ nhớ trong</td>
                                 <td>512 GB</td>
                              </tr>
                              <tr>
                                 <td>Pin</td>
                                 <td>${sanPham.dungLuongPin}</td>
                              </tr>
                              <tr>
                                 <td>Hệ điều hành</td>
                                 <td>${sanPham.heDieuHanh}</td>
                              </tr>
                              <tr>
                                 <td>Tính năng màn hình</td>
                                 <td>Tần số quét 120Hz<br>
                                    Tỉ lệ tương phản 1000000:1<br>
                                    Độ sáng 600 nit<br>
                                    Dải màu P3<br>
                                    Công nghệ True-Tone
                                 </td>
                              </tr>
                              <tr class="more-info">
                                 <td>Loại CPU</td>
                                 <td>8 nhân CPU</td>
                              </tr>
                              <tr class="more-info">
                                 <td>GPU</td>
                                 <td>8 nhân GPU</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Kích thước</td>
                                 <td>247.6 x 178.5 x 5.9 mm</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Trọng lượng</td>
                                 <td>466 g</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Chất liệu mặt lưng</td>
                                 <td>Kim loại</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Chất liệu khung viền</td>
                                 <td>Kim loại</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Công nghệ sạc</td>
                                 <td>Sạc nhanh 18W</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Cổng sạc</td>
                                 <td>USB Type-C</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Các loại cảm biến</td>
                                 <td>Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển, La bàn</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Khe cắm thẻ nhớ</td>
                                 <td>Không</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Wi-Fi</td>
                                 <td>Wi-Fi 6</td>
                              </tr>
                              <tr class="more-info">
                                 <td>Bluetooth</td>
                                 <td>v5.0</td>
                              </tr>
                           </tbody>
                        </table>
                        <a id="more-specific" class="btn btn-default btn-sm" href="javascript:void(0)">Xem thêm</a>
                        <script>
                           // Chờ DOM load xong
                           document.addEventListener("DOMContentLoaded", function() {
                             // Lấy nút "Xem thêm"
                             const btn = document.getElementById("more-specific");
                           
                             // Lấy tất cả các tr có class "more-info"
                             const moreRows = document.querySelectorAll(".product-footer-right .table tr.more-info");
                           
                             btn.addEventListener("click", function(e) {
                               e.preventDefault();
                               
                               // Hiển thị tất cả các tr bị ẩn
                               moreRows.forEach(tr => {
                                 tr.style.display = "table-row";
                               });
                           
                               // Ẩn nút sau khi click
                               btn.style.display = "none";
                             });
                           });
                        </script>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<script src="/assets/js/singleproduct.js"></script>