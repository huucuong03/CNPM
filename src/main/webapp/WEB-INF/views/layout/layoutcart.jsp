<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<body class="home wp-singular page-template page-template-page-blank page-template-page-blank-php page page-id-14 wp-theme-flatsome wp-child-theme-flatsome-child theme-flatsome woocommerce-js lightbox nav-dropdown-has-border mobile-submenu-toggle">

    <a class="skip-link screen-reader-text" href="#main">Bỏ qua nội dung</a>

    <div id="wrapper">

        <div class="header-overlay">
            <jsp:include page="/WEB-INF/views/layout/sidebar.jsp" />
        </div>

        <main id="main" class="mx-auto max-w-screen-xl" style="background-color:#f4f6f8">
            <div class="main_content">
                <jsp:include page="${bodyPage}" />
            </div>
        </main>

        <!-- Footer cố định -->

    </div>
 <jsp:include page="/WEB-INF/views/layout/script.jsp" />
</body>
</html>
