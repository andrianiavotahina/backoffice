<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Acceil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/font/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/font/css/all.css">
</head>
<body>
<div class="row" style="max-width: 100%; overflow-x: hidden; margin-top: 0.2%;">
    <div class="col-3 container" style="background: #1e357a; border-left: 2px solid black">
        <div class="row container" style="margin-top: 30%;">
            <div class="col-2">
                <br>
            </div>
                <button type="button" class="btn btn-primary" onclick="showPage('${pageContext.request.contextPath}/VenteEnchere.jsp','get')">Liste enchere</button>
            <div class="col-2">
                <br>
            </div>
        </div>
        <div class="row container" style="margin-top: 2%;">
            <div class="col-2">
                <br>
            </div>
            <button type="button" class="btn btn-primary" onclick="showPage('${pageContext.request.contextPath}/Categories.jsp','get')">Categorie</button>
            <div class="col-2">
                <br>
            </div>
        </div>
        <div class="row container" style="margin-top: 2%;">
            <div class="col-2">
                <br>
            </div>
            <button type="button" class="btn btn-primary" onclick="showPage('${pageContext.request.contextPath}/Rechargement.jsp','get')">Rechargement</button>
            <div class="col-2">
                <br>
            </div>
        </div>
        <div class="row container" style="margin-top: 2%;">
            <div class="col-2">
                <br>
            </div>
            <button type="button" class="btn btn-primary" onclick="showPage('${pageContext.request.contextPath}/Statistique.jsp','get')">Statistique</button>
            <div class="col-2">
                <br>
            </div>
        </div>
        <div class="row container" style="margin-top: 40%;">
            <div class="col-2">
                <br>
            </div>
            <div class="col-2">
                <br>
            </div>
        </div>
    </div>
    <div class="col-9" style="height: 100%;">
        <div class="row m-2" id="response">

        </div>
    </div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="${pageContext.request.contextPath}/Asset/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/Asset/js/Function.js"></script>
<script !src="">
    showPage('${pageContext.request.contextPath}/VenteEnchere.jsp','get')
</script>
</body>
</html>
