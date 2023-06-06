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
<body>
<div class="d-flex justify-content-between">
<h1 class="text-success">Your Gold: <c:out value="${gold}"></c:out></h1>

    <form action="/reset" method="post">
        <button class="btn btn-danger mt-2 me-5" type="submit">Reset</button>
    </form>
</div>
<div class="container d-flex justify-content-around">
    <form action="/game" method="post">
        <div class="card text-center m-3">
            <div class="card-header">
                Farm
            </div>
            <div class="card-body">
                <h5 class="card-title">(earns 10-20 gold)</h5>
                <input type="hidden" name="place" value="farm">
                <button class="btn btn-primary">Find Gold!</button>
            </div>
        </div>
    </form>
    <form action="/game" method="post">
        <div class="card text-center m-3">
            <div class="card-header">
                Cave
            </div>
            <div class="card-body">
                <h5 class="card-title">(earns 5-10 gold)</h5>
                <input type="hidden" name="place" value="cave">
                <button class="btn btn-primary">Find Gold!</button>
            </div>
        </div>
    </form>
    <form action="/game" method="post">
        <div class="card text-center m-3">
            <div class="card-header">
                House
            </div>
            <div class="card-body">
                <h5 class="card-title">(earns 2-5 gold)</h5>
                <input type="hidden" name="place" value="house">
                <button class="btn btn-primary">Find Gold!</button>
            </div>
        </div>
    </form>
    <form action="/game" method="post">
        <div class="card text-center m-3">
            <div class="card-header">
                Quest
            </div>
            <div class="card-body">
                <h5 class="card-title">(earns/takes 0-50 gold)</h5>
                <input type="hidden" name="place" value="quest">
                <button class="btn btn-warning">Find Gold!</button>
            </div>
        </div>
    </form>
    <form action="/game" method="post">
        <div class="card text-center m-3">
            <div class="card-header">
                Spa
            </div>
            <div class="card-body">
                <h5 class="card-title">(takes 5-20 gold)</h5>
                <input type="hidden" name="place" value="spa">
                <button class="btn btn-danger">Spend Gold!</button>
            </div>
        </div>
    </form>
</div>

<h1 class="text-success">Activity: </h1>
<div class="container w-75 h-auto border-2">
    <c:forEach var="activityy" items="${activity}">
        <c:if test="${activityy.contains('earned')}">
            <p class="green"><c:out value="${activityy}" /></p>
        </c:if>
        <c:if test="${!activityy.contains('earned')}">
            <p class="red"><c:out value="${activityy}" /></p>
        </c:if>
    </c:forEach>
</div>
</body>
</html>
