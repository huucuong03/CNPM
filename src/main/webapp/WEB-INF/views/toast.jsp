 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />

<div id="toast"></div>
<script>
  function showSuccessToast(message) {
    toast({
      title: "Thành công!",
      message: message,
      type: "success",
      duration: 5000
    });
  }

  function showErrorToast(errmessage) {
    toast({
      title: "Thất bại!",
      message: errmessage,
      type: "error",
      duration: 5000
    });
  }
</script>