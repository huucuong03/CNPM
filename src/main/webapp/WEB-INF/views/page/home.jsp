 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class=" pos_home_section">
                <div class="row pos_home">
                    <div class="col-lg-3 col-md-8 col-12">
                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/banner5.jpg"
                                                 alt=""></a>
                            </div>
                            <div class="banner_img">
                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>
                            </div>
                        </div>
                        <!--sidebar banner end-->

                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/sildebar1.jpg"
                                                 alt=""></a>
                            </div>
                            <%--                            <div class="banner_img">--%>
                            <%--                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>--%>
                            <%--                            </div>--%>
                        </div>
                        <!--sidebar banner end-->


                        <!--sidebar banner-->
                        <div class="sidebar_widget banner mb-35">
                            <div class="banner_img mb-35">
                                <a href="#"><img style="width: 271px;height: 160px;"
                                                 src="../../../assets/img/banner/dien-thoai-samsung-galaxy-s.jpg"
                                                 alt=""></a>
                            </div>
                            <%--                            <div class="banner_img">--%>
                            <%--                                <a href="#"><img src="../../../assets/img/banner/banner6.jpg" alt=""></a>--%>
                            <%--                            </div>--%>
                        </div>
                        <!--sidebar banner end-->

                        <!--sidebar banner-->
                        <div class="sidebar_widget bottom ">
                            <div class="banner_img">
                                <a href="#"><img style="width: 300px;height: 280px;"
                                                 src="../../../assets/img/banner/banner9.jpg"
                                                 alt=""></a>
                            </div>
                        </div>
                        <!--sidebar banner end-->


                    </div>
                    <div class="col-lg-9 col-md-12">
                        <!--banner slider start-->
                        <div class="banner_slider slider_1">
                            <div class="slider_active owl-carousel">
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_1.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1></h1>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_2.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1>New Collection</h1>
                                            <p>Iphone 15</p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="single_slider"
                                     style="background-image: url(../../../assets/img/slider/slider_3.png)">
                                    <div class="slider_content">
                                        <div class="slider_content_inner">
                                            <h1>Best Collection</h1>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--banner slider start-->

                        <!--new product area start-->
                        <div class="new_product_area">
                            <div class="block_title">
                                <h3>Sản phẩm mới</h3>
                            </div>
                            <div class="row">
                                <div class="product_active owl-carousel">
                                    <c:forEach var="ctsp" items="${ctsp}">
                                        <div class="col-lg-3">
                                            <div class="single_product" style="height: 450.9px;width: 300.5px">
                                                <div class="product_thumb">
                                                    <a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}"><img
                                                            src="/img/${ctsp.hinhAnhURL}"
                                                            style="height: 308.9px;width: 308.9px"></a>
                                                    <div class="img_icone">
                                                        <img src="assets\img\cart\span-new.png" alt="">
                                                    </div>
<%--                                                    <div class="product_action">--%>
<%--                                                        <a onclick="dangnhap1()">--%>
<%--                                                            <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a>--%>
<%--                                                    </div>--%>
                                                </div>
                                                <div class="product_content">
                                                        <%--                                                    <span class="product_price" >--%>
                                                        <%--                                                        <script>document.write(formatCurrencyVND(${ctsp.giaBan}))</script>--%>
                                                        <%--                                                    </span>--%>
                                                    <span class="product_price"
                                                          id="productPrice${ctsp.giaBan}">${ctsp.giaBan}</span>
<%--                                                    <script>--%>
<%--                                                        // Đoạn mã JavaScript để cập nhật giá sản phẩm--%>
<%--                                                        var productPriceElement = document.getElementById("productPrice${ctsp.giaBan}");--%>
<%--                                                        var formattedPrice = formatCurrencyVND(${ctsp.giaBan});--%>
<%--                                                        productPriceElement.textContent = formattedPrice;--%>
<%--                                                    </script>--%>
                                                    <h3 class="product_title"><a
                                                            href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}">${ctsp.tenSanPham}</a>
                                                    </h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}" title="Quick view">Chi
                                                            tiết sản phẩm</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--new product area start-->

                        <div class="new_product_area">
                            <div class="block_title">
                                <h3>Sản phẩm đang giảm giá</h3>
                            </div>
                            <div class="row">
                                <div class="product_active owl-carousel">
                                    <c:forEach var="ctsp" items="${ctsps}">
                                        <div class="col-lg-3">
                                            <div class="single_product" style="height: 500px;width: 300.5px">
                                                <div class="product_thumb">
                                                    <a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}"><img
                                                            src="/img/${ctsp.hinhAnhURL}"
                                                            style="height: 308.9px;width: 308.9px"></a>
                                                    <div class="img_icone">
                                                        <img src="../../../assets/img/cart/sale2.png" alt=""
                                                             style="max-width: 70px;max-height: 70px">
                                                    </div>
<%--                                                    <div class="product_action">--%>
<%--                                                        <a onclick="dangnhap1()">--%>
<%--                                                            <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</a>--%>
<%--                                                    </div>--%>
                                                </div>
                                                <div class="product_content">
                                                        <%--                                                    <span class="product_price"--%>
                                                        <%--                                                          style="font-size: 15px; text-decoration: line-through;">${ctsp.giaBan}</span>--%>
                                                        <%--                                                    <span class="product_price" style="color: red"--%>
                                                        <%--                                                          id="giaSauKhiGiam">${ctsp.giaSauKhiGiam}</span>--%>
<%--                                                    <span class="product_price"--%>
<%--                                                          style="font-size: 15px; text-decoration: line-through;">--%>
<%--                                                        <script>document.write(formatCurrencyVND(${ctsp.giaBan}))</script>--%>
<%--                                                    </span>--%>
                                                            <span class="product_price"
                                                                  id="productPrice${ctsp.maChiTietSanPham}" style="font-size: 15px; text-decoration: line-through;">${ctsp.giaBan}</span>
<%--                                                            <script>--%>
<%--                                                                // Đoạn mã JavaScript để cập nhật giá sản phẩm--%>
<%--                                                                var productPriceElement = document.getElementById("productPrice${ctsp.maChiTietSanPham}");--%>
<%--                                                                var formattedPrice = formatCurrencyVND(${ctsp.giaBan});--%>
<%--                                                                productPriceElement.textContent = formattedPrice;--%>
<%--                                                            </script>--%>

                                                            <span class="product_price" style="color: red"
                                                                  id="productPrice_${ctsp.maChiTietSanPham}">${ctsp.giaSauKhiGiam}</span>
<%--                                                            <script>--%>
<%--                                                                // Đoạn mã JavaScript để cập nhật giá sản phẩm--%>
<%--                                                                var productPriceElement = document.getElementById("productPrice_${ctsp.maChiTietSanPham}");--%>
<%--                                                                var formattedPrice = formatCurrencyVND(${ctsp.giaSauKhiGiam});--%>
<%--                                                                productPriceElement.textContent = formattedPrice;--%>
<%--                                                            </script>--%>
                                                    <h3 class="product_title"><a
                                                            href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}">${ctsp.tenSanPham}</a>
                                                    </h3>
                                                </div>
                                                <div class="product_info">
                                                    <ul>
                                                        <li><a href="/viewCDN/${ctsp.tenSanPham}/${ctsp.dungLuong}" title="Quick view">Chi
                                                            tiết sản phẩm</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>


                        <!--banner area start-->
                        <div class="banner_area mb-60">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_banner">
                                        <a href="#"><img style="width: 420px;height: 221px;"
                                                         src="../../../assets/img/banner/banner7.jpg" alt=""></a>
                                        <div class="banner_title">
                                            <p>Up to <span> 20%</span> off</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="single_banner">
                                        <a href="#"><img style="width: 420px;height: 221px;"
                                                         src="../../../assets/img/banner/banner8.jpg" alt=""></a>
                                        <div class="banner_title title_2">
                                            <p>Đổi trả trong<span> 7 ngày</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--banner area end-->

                        <!--brand logo strat-->
                        <div class="brand_logo mb-60">
                            <div class="block_title">
                                <h3>Brands</h3>
                            </div>
                            <div class="row">
                                <div class="brand_active owl-carousel">
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand1.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand2.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand4.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand5.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand7.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img style="width: 120px;height: 24.49px;"
                                                             src="../../../assets/img/brand/brand6.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="single_brand">
                                            <a href="#"><img src="../../../assets/img/brand/brand8.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--brand logo end-->
                    </div>
                </div>
            </div>
            <!--pos home section end-->