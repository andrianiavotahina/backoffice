<%@ page import="Model.Rechargement" %>
<%@ page import="Model.Enchere" %>
<%@ page import="Model.Statistique" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    double dure= 0;
    try {
        dure = Enchere.getCommission();
    } catch (Exception e) {
        e.printStackTrace();
    }
    double m=0;
    try {
        m=Statistique.getM();
    } catch (Exception e) {
        e.printStackTrace();
    }
    double n= 0;
    try {
        n = Statistique.getC();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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
        <div class="card text-center my-2" style="">
            <div class="card-body">
                <div class="row">
                    <div class="text-center">
                        <h5 class="text-body" style="font-family: poppins,sans-serif ">Vous avez &nbsp;:
                            <span class="text-info" style="font-size: 16px">
                                <%out.print(dure);%>&nbsp;
                            </span>&nbsp;% pour chaque enchere
                        </h5>
                    </div>
                    <div class="">
                        <button type="button" onclick="display('<%=dure%>')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                            Modifier
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-4 text-center">
                        <button type="button" class="btn btn-primary" onclick="statCategorie('${pageContext.request.contextPath}',1)">Statistique par categorie</button>
                    </div>
                    <div class="col-4 text-center">
                        <button type="button" class="btn btn-success">Statistique par personne</button>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div id="chartContainer" style="height: 300px; width: 100%;"></div>
    </div>
    <div class="row my-2">
        <div class="col-4">
            <div class="card shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <h5 class="card-title">Total :
                        <span class="text-info" style="font-size: 16px; font-family: poppins,sans-serif ">
                            <%=m%>
                        </span>
                    </h5>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <h5 class="card-title">Total par categorie:
                        <span class="text-info" style="font-size: 16px; font-family: poppins,sans-serif ">
                            <%=n%>
                        </span>
                    </h5>
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="card shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <h5 class="card-title">Total :
                        <span class="text-info" style="font-size: 16px; font-family: poppins,sans-serif ">

                        </span>
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modifier commission</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-3">
                        <label for="n-s2" class="col-form-label">Valeur</label>
                    </div>
                    <div class="col-8">
                        <input type="number" step="0.001" id="n-s2" name="categorie" class="form-control" value="">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">annuller</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="updateCommission('${pageContext.request.contextPath}')">modifier</button>
            </div>
        </div>
    </div>
</div>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="${pageContext.request.contextPath}/Asset/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/Asset/js/Function.js"></script>
</body>
</html>
