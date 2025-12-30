<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
            <%@ page isELIgnored="false" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <title>Bảo hành sản phẩm | Quản trị Admin</title>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <!-- Main CSS-->
                    <link rel="stylesheet" type="text/css" href="../../../../assetsAdmin/css/main.css">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
                    <!-- or -->
                    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
                    <!-- Font-icon css-->
                    <link rel="stylesheet" type="text/css"
                        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.1/dist/sweetalert2.all.min.js"></script>
                    <link rel="icon" type="image/png" href="../../../../../assets/img/logo/AZURA.png">

                </head>

                <body class="app sidebar-mini rtl">
                    <style>
                        .Choicefile {
                            display: block;
                            background: #14142B;
                            border: 1px solid #fff;
                            color: #fff;
                            width: 150px;
                            text-align: center;
                            text-decoration: none;
                            cursor: pointer;
                            padding: 5px 0px;
                            border-radius: 5px;
                            font-weight: 500;
                            align-items: center;
                            justify-content: center;
                        }

                        .Choicefile:hover {
                            text-decoration: none;
                            color: white;
                        }

                        #uploadfile,
                        .removeimg {
                            display: none;
                        }

                        #thumbbox {
                            position: relative;
                            width: 100%;
                            margin-bottom: 20px;
                        }

                        .removeimg {
                            height: 25px;
                            position: absolute;
                            background-repeat: no-repeat;
                            top: 5px;
                            left: 5px;
                            background-size: 25px;
                            width: 25px;
                            /* border: 3px solid red; */
                            border-radius: 50%;

                        }

                        .removeimg::before {
                            -webkit-box-sizing: border-box;
                            box-sizing: border-box;
                            content: '';
                            border: 1px solid red;
                            background: red;
                            text-align: center;
                            display: block;
                            margin-top: 11px;
                            transform: rotate(45deg);
                        }

                        .removeimg::after {
                            /* color: #FFF; */
                            /* background-color: #DC403B; */
                            content: '';
                            background: red;
                            border: 1px solid red;
                            text-align: center;
                            display: block;
                            transform: rotate(-45deg);
                            margin-top: -2px;
                        }
                    </style>
                    <!-- Navbar-->
                    <header class="app-header">
                        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                            aria-label="Hide Sidebar"></a>
                        <!-- Navbar Right Menu-->
                        <ul class="app-nav">


                            <!-- User Menu-->
                            <li><a class="app-nav__item" href="/admin/admin-login"><i class='bx bx-log-out bx-rotate-180'></i>
                                </a>

                            </li>
                        </ul>
                    </header>
                    <!-- Sidebar menu-->
                    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
                    <aside class="app-sidebar">
                        <jsp:include page="template/header.jsp"></jsp:include>

                        <jsp:include page="template/slidebar.jsp"></jsp:include>
                    </aside>
                    <main class="app-content">
                        <div class="app-title">
                            <ul class="app-breadcrumb breadcrumb">
                                <li class="breadcrumb-item">Danh sách sản phẩm bảo hành</li>
                                <li class="breadcrumb-item"><a href="#"></a></li>
                            </ul>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="tile">
                                    <h3 class="tile-title">Bảo hành sản phẩm</h3>
                                    <div class="tile-body">
                                        <form class="row" id="form-add">
                                            <div class="form-group col-md-3">
                                                <label class="control-label">Tên sản phẩm</label>
                                                <input class="form-control" type="text" id="tenSanPhamSearch">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label class="control-label">Imei</label>
                                                <input class="form-control" type="text" id="imei">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="ngayBatDau" class="control-label">Ngày bắt đầu</label>
                                                <input id="ngayBatDau" class="form-control" type="date"
                                                    name="ngayBatDau">
                                            </div>
                                            <div class="form-group col-md-3 ">
                                                <label for="ngayKetThuc" class="control-label">Ngày kết thúc</label>
                                                <input id="ngayKetThuc" class="form-control" type="date"
                                                    name="ngayKetThuc">
                                            </div>
                                        </form>
                                        <div class="row element-button">
                                            <div class="col-sm-2">
                                                <button class="btn btn-excel btn-sm" id="search" title="In"
                                                    form="form-add"><i class="fas fa-search-plus"></i>Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                        <div id="divPrint">
                                            <table class="table table-hover table-bordered" id="sampleTable">
                                                <thead>
                                                    <tr>
                                                        <th>Mã yêu cầu</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Màu sắc</th>
                                                        <th>Dung lượng</th>
                                                        <th>Imei</th>
                                                        <th>Khách hàng</th>
                                                        <th>SĐT</th>
                                                        <th>Loại</th>
                                                        <th>Ngày gửi</th>
                                                        <th>Trạng thái</th>
                                                        <th>Thao tác</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="data-body">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>

                        <!-- Modal hiển thị chi tiết bảo hành -->
                        <div class="modal fade" id="warrantyDetailModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-xl" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary text-white">
                                        <h5 class="modal-title"><i class="fa fa-info-circle"></i> Thông tin chi tiết yêu
                                            cầu bảo hành</h5>
                                        <button type="button" class="close text-white" data-dismiss="modal"
                                            aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Thông tin tóm tắt -->
                                        <div class="card mb-4">
                                            <div class="card-header bg-light">
                                                <h6 class="mb-0"><i class="fa fa-file-text"></i> Thông tin yêu cầu</h6>
                                            </div>
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <p class="mb-2"><strong>Mã yêu cầu:</strong></p>
                                                        <p class="text-primary fs-5" id="warrantyId"></p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <p class="mb-2"><strong>Loại:</strong></p>
                                                        <p class="fs-5" id="warrantyType"></p>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <p class="mb-2"><strong>Trạng thái:</strong></p>
                                                        <p><span id="warrantyStatus"
                                                                class="badge bg-warning fs-6"></span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Lý do -->
                                        <div class="card mb-4">
                                            <div class="card-header bg-light">
                                                <h6 class="mb-0"><i class="fa fa-exclamation-triangle"></i> Lý do yêu
                                                    cầu bảo hành</h6>
                                            </div>
                                            <div class="card-body">
                                                <p id="warrantyReason" class="mb-0" style="font-size: 1.05rem;"></p>
                                            </div>
                                        </div>

                                        <!-- Hình ảnh -->
                                        <div class="card">
                                            <div class="card-header bg-light">
                                                <h6 class="mb-0"><i class="fa fa-image"></i> Hình ảnh đính kèm</h6>
                                            </div>
                                            <div class="card-body">
                                                <div id="warrantyImages" class="row g-3"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                            onclick="closeWarrantyModal()">
                                            <i class="fa fa-times"></i> Đóng
                                        </button>
                                        <button type="button" id="btnCheckWarranty" class="btn btn-primary"
                                            onclick="updateStatusToChecking()">
                                            <i class="fa fa-check"></i> Kiểm tra
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>

                    <script src="../../../../assetsAdmin/js/jquery-3.2.1.min.js"></script>
                    <script src="../../../../assetsAdmin/js/popper.min.js"></script>
                    <script src="../../../../assetsAdmin/js/bootstrap.min.js"></script>
                    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                    <script src="../../../../assetsAdmin/js/main.js"></script>
                    <!-- The javascript plugin to display page loading on top-->
                    <script src="../../../../assetsAdmin/js/plugins/pace.min.js"></script>
                    <!-- Page specific javascripts-->
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
                    <!-- Data table plugin-->
                    <script type="text/javascript"
                        src="../../../../assetsAdmin/js/plugins/jquery.dataTables.min.js"></script>
                    <script type="text/javascript"
                        src="../../../../assetsAdmin/js/plugins/dataTables.bootstrap.min.js"></script>
                    <script>
                        var dataTableInstance;

                        var request = {};
                        $(document).ready(function () {

                            if ($.fn.DataTable.isDataTable('#sampleTable')) {
                                $('#sampleTable').DataTable().destroy();
                            }
                            $("#search").click(function () {
                                event.preventDefault();
                                request.tenSanPhamSearch = $("#tenSanPhamSearch").val();
                                request.imei = $("#imei").val();
                                request.ngayBatDau = $("#ngayBatDau").val();
                                request.ngayKetThuc = $("#ngayKetThuc").val();
                                console.log(request)
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json",
                                    url: "/admin/warranty/search",
                                    data: JSON.stringify(request),
                                    dataType: 'json',
                                    success: function (response) {
                                        console.log(response);

                                        displayResults(response);

                                    },
                                    error: function (xhr, status, error) {
                                        console.error(error);
                                    }
                                });

                            });


                            //view Table warranty requests
                            function displayResults(results) {
                                // Get the table body element
                                var tableBody = $("#sampleTable tbody");
                                // Clear existing table rows
                                tableBody.empty();

                                if (results.length === 0) {
                                    var noResultsRow = "<tr><td colspan='11' class='text-center'>Không có kết quả</td></tr>";
                                    tableBody.append(noResultsRow);
                                    return;
                                }
                                if (dataTableInstance) {
                                    dataTableInstance.destroy();
                                }
                                // Iterate over the results and populate the table rows
                                for (var i = 0; i < results.length; i++) {
                                    var wr = results[i];
                                    console.log('Warranty request #' + i + ':', wr);
                                    console.log('maBaoHanh:', wr.maBaoHanh, 'Type:', typeof wr.maBaoHanh);

                                    var spanClass = '';
                                    var spanText = wr.tenTrangThai || 'Chưa xác định';

                                    // Màu sắc theo trạng thái
                                    switch (wr.maTrangThai) {
                                        case 1: // Chờ xử lý
                                            spanClass = 'bg-warning';
                                            break;
                                        case 2: // Đang kiểm tra
                                            spanClass = 'bg-info';
                                            break;
                                        case 3: // Hoàn thành
                                            spanClass = 'bg-success';
                                            break;
                                        case 4: // Từ chối
                                            spanClass = 'bg-danger';
                                            break;
                                        default:
                                            spanClass = 'bg-secondary';
                                    }

                                    // Tạo nút thao tác dựa trên trạng thái
                                    var actionButtons = '';

                                    if (wr.maTrangThai === 1) { // Chờ xử lý
                                        actionButtons = '<button class="btn btn-info btn-sm" onclick="showWarrantyDetail(' + wr.maBaoHanh + ')" title="Hiển thị thông tin lỗi">' +
                                            '<i class="fa fa-info-circle"></i> Thông tin lỗi' +
                                            '</button>';
                                    } else if (wr.maTrangThai === 2) { // Đang kiểm tra
                                        var completeBtnText = wr.tenType === 'Đổi trả' ? 'Hoàn thành đổi trả' : 'Hoàn thành bảo hành';
                                        actionButtons = '<button class="btn btn-success btn-sm" onclick="completeWarranty(' + wr.maBaoHanh + ')" title="' + completeBtnText + '">' +
                                            '<i class="fa fa-check-circle"></i> ' + completeBtnText +
                                            '</button>';
                                    } else if (wr.maTrangThai === 3) { // Hoàn thành
                                        actionButtons = '<button class="btn btn-success btn-sm" onclick="showWarrantyDetail(' + wr.maBaoHanh + ')" title="Xem chi tiết">' +
                                            '<i class="fa fa-eye"></i> Xem chi tiết' +
                                            '</button>';
                                    } else if (wr.maTrangThai === 4) { // Từ chối
                                        actionButtons = '<button class="btn btn-secondary btn-sm" onclick="showWarrantyDetail(' + wr.maBaoHanh + ')" title="Xem chi tiết">' +
                                            '<i class="fa fa-eye"></i> Xem chi tiết' +
                                            '</button>';
                                    }

                                    var row = "<tr>" +
                                        "<td>" + wr.maBaoHanh + "</td>" +
                                        "<td>" + wr.tenSanPham + "</td>" +
                                        "<td>" + wr.mauSac + "</td>" +
                                        "<td>" + wr.dungLuong + "</td>" +
                                        "<td>" + wr.imei + "</td>" +
                                        "<td>" + wr.tenKhachHang + "</td>" +
                                        "<td>" + wr.sdtKhachHang + "</td>" +
                                        "<td>" + (wr.tenType || 'N/A') + "</td>" +
                                        "<td>" + wr.createdAtString + "</td>" +
                                        "<td><span class='badge " + spanClass + "'>" + spanText + "</span></td>" +
                                        "<td>" + actionButtons + "</td>" +
                                        "</tr>";
                                    tableBody.append(row);
                                }
                                if (!$.fn.DataTable.isDataTable('#sampleTable')) {
                                    $('#sampleTable').DataTable({
                                        paging: true,
                                        lengthChange: true,
                                        searching: false,
                                        order: [[0, 'desc']]
                                    });
                                }
                            }


                        });

                    </script>

                    <script>
                        // Biến global để lưu thông tin warranty hiện tại
                        var currentWarranty = null;

                        // Function đóng modal (vanilla JS)
                        function closeWarrantyModal() {
                            var modal = document.getElementById('warrantyDetailModal');
                            modal.style.display = 'none';
                            modal.classList.remove('show');
                            document.body.classList.remove('modal-open');
                            var backdrop = document.querySelector('.modal-backdrop');
                            if (backdrop) {
                                backdrop.remove();
                            }
                        }

                        // Function mở modal (vanilla JS)
                        function openWarrantyModal() {
                            var modal = document.getElementById('warrantyDetailModal');
                            modal.style.display = 'block';
                            modal.classList.add('show');
                            document.body.classList.add('modal-open');

                            // Tạo backdrop
                            var backdrop = document.createElement('div');
                            backdrop.className = 'modal-backdrop fade show';
                            document.body.appendChild(backdrop);
                        }

                        // Hiển thị modal chi tiết
                        function showWarrantyDetail(maBaoHanh) {
                            console.log('Calling showWarrantyDetail with maBaoHanh:', maBaoHanh);
                            $.ajax({
                                type: "GET",
                                url: "/admin/warranty/detail/" + maBaoHanh,
                                success: function (data) {
                                    console.log('Received warranty detail data:', data);
                                    currentWarranty = data;

                                    // Điền thông tin vào modal
                                    $('#warrantyId').text(data.maBaoHanh);
                                    $('#warrantyReason').text(data.reason || 'Không có mô tả');
                                    $('#warrantyType').text(data.tenType);

                                    // Hiển thị trạng thái đúng màu
                                    var statusLabel = data.tenTrangThai || 'PENDING';
                                    var statusClass = 'bg-warning';

                                    if (data.maTrangThai === 2) statusClass = 'bg-info';
                                    else if (data.maTrangThai === 3) statusClass = 'bg-success';
                                    else if (data.maTrangThai === 4) statusClass = 'bg-danger';

                                    $('#warrantyStatus').text(statusLabel).removeClass().addClass('badge ' + statusClass + ' fs-6');

                                    // Ẩn nút "Kiểm tra" nếu không phải trạng thái PENDING (1)
                                    if (data.maTrangThai === 1) {
                                        $('#btnCheckWarranty').show();
                                    } else {
                                        $('#btnCheckWarranty').hide();
                                    }

                                    // Hiển thị hình ảnh
                                    var imagesHtml = '';
                                    console.log('Processing images:', data.images);

                                    if (data.images && data.images.length > 0) {
                                        data.images.forEach(function (img, index) {
                                            console.log('=== Image #' + (index + 1) + ' ===');
                                            console.log('Image URL from backend:', img.imageUrl);

                                            imagesHtml += `
                                                <div class="col-md-4 col-sm-6 mb-3">
                                                    <div class="card shadow-sm h-100" 
                                                         style="border-radius: 10px; overflow: hidden; cursor: pointer;"
                                                         onclick="window.open('\${img.imageUrl}', '_blank')">
                                                        <img src="\${img.imageUrl}" 
                                                             class="card-img-top" 
                                                             alt="Hình ảnh bảo hành" 
                                                             style="height: 250px; object-fit: cover;">
                                                        <div class="card-body p-2 text-center bg-light">
                                                            <small class="text-primary fw-bold"><i class="fa fa-search-plus"></i> Click để xem lớn</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            `;
                                        });
                                    } else {
                                        imagesHtml = '<div class="col-12"><div class="alert alert-info mb-0"><i class="fa fa-info-circle"></i> Không có hình ảnh đính kèm</div></div>';
                                    }
                                    $('#warrantyImages').html(imagesHtml);

                                    // Hiển thị modal
                                    openWarrantyModal();
                                },
                                error: function (xhr, status, error) {
                                    console.error('Error loading warranty detail:', xhr.responseText);
                                    Swal.fire('Lỗi', 'Không thể tải thông tin bảo hành', 'error');
                                }
                            });
                        }

                        // Cập nhật trạng thái sang "Đang kiểm tra"
                        function updateStatusToChecking() {
                            if (!currentWarranty) {
                                console.error('currentWarranty is null or undefined');
                                return;
                            }

                            console.log('Current warranty data:', currentWarranty);

                            Swal.fire({
                                title: 'Xác nhận',
                                text: 'Bạn có chắc muốn chuyển sang trạng thái "Đang kiểm tra"?',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonText: 'Xác nhận',
                                cancelButtonText: 'Hủy'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    var requestData = {
                                        maBaoHanh: currentWarranty.maBaoHanh,
                                        maTrangThai: 2
                                    };
                                    console.log('Sending update status request:', requestData);

                                    $.ajax({
                                        type: "POST",
                                        url: "/admin/warranty/update-status",
                                        contentType: "application/json",
                                        data: JSON.stringify(requestData),
                                        success: function (response) {
                                            console.log('Update status response:', response);
                                            Swal.fire({
                                                title: 'Thành công',
                                                text: 'Đã cập nhật trạng thái',
                                                icon: 'success',
                                                confirmButtonText: 'OK'
                                            }).then(() => {
                                                // Đóng modal
                                                closeWarrantyModal();
                                                // Reload lại danh sách
                                                $('#search').click();
                                            });
                                        },
                                        error: function (xhr, status, error) {
                                            console.error('Update status error:', xhr.responseText);
                                            Swal.fire('Lỗi', 'Không thể cập nhật trạng thái', 'error');
                                        }
                                    });
                                }
                            });
                        }

                        // Hoàn thành bảo hành/đổi trả
                        function completeWarranty(maBaoHanh) {
                            Swal.fire({
                                title: 'Xác nhận',
                                text: 'Bạn có chắc muốn hoàn thành yêu cầu này?',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonText: 'Xác nhận',
                                cancelButtonText: 'Hủy'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.ajax({
                                        type: "POST",
                                        url: "/admin/warranty/update-status",
                                        contentType: "application/json",
                                        data: JSON.stringify({
                                            maBaoHanh: maBaoHanh,
                                            maTrangThai: 3 // Hoàn thành
                                        }),
                                        success: function (response) {
                                            Swal.fire('Thành công', 'Đã hoàn thành yêu cầu', 'success');
                                            // Reload lại danh sách
                                            $('#search').click();
                                        },
                                        error: function (xhr, status, error) {
                                            Swal.fire('Lỗi', 'Không thể cập nhật trạng thái', 'error');
                                        }
                                    });
                                }
                            });
                        }
                    </script>
                    <jsp:include page="template/footer.jsp"></jsp:include>
                </body>

                </html>