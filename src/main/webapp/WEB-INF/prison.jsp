<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude E7450
  Date: 6/6/2023
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <!-- for Bootstrap CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <!-- For any Bootstrap that uses JS -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="d-flex justify-content-around">
<div class="d-flex justify-content-around">
<h1 class="text-danger">Welcome in prison.</h1>
<h1 class="text-danger">You lost.</h1>
</div>
<div class="d-flex justify-content-around mt-2">
    <form action="/reset" method="post">
        <button class="btn btn-danger" type="submit">Play Again</button>
    </form>
</div>
</body>
</html>
