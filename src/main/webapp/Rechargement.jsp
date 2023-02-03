<%@ page import="java.util.Vector" %>
<%@ page import="Model.Rechargement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/font/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/font/css/all.css">
</head>
<body>
<div class="container">
    <div class="row">
        <%
            Vector<Rechargement> rechargements=new Vector<>();
            try {
                rechargements=Rechargement.nonvalider();
            } catch (Exception e) {
                out.println("des erreurs sont survenus!!");
            }
            for (Rechargement r : rechargements){ %>
                <div class="card rounded col-3 m-2">
                    <div class="card-body">
                        <h6 class="card-title">Utilisateur: <span style="font-size: 16px;font-family: poppins,sans-serif"><%=r.getIdUtilisateur()%></span></h6>
                        <h6 class="card-title">Date :<span style="font-size: 16px;font-family: poppins,sans-serif"><%=r.getDateRechargement()%></span> </h6>
                        <h6 class="card-title">Montant : <span style="font-size: 16px;font-family: poppins,sans-serif"><%=r.getMontant()%></span></h6>
                    </div>
                    <div class="card-footer text-center">
                        <button type="button" class="btn btn-primary" onclick="validerRechargement('${pageContext.request.contextPath}','<%=r.getIdRechargement()%>')">Valider</button>
                    </div>
                </div>
         <%}%>
    </div>
</div>
<script src="${pageContext.request.contextPath}/Asset/js/bootstrap.js"></script>
</body>
</html>
