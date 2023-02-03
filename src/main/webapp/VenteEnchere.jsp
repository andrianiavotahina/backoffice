<%@ page import="Model.Categorie" %>
<%
    int dure=0;
    try {
        dure=Categorie.getDure();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
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
        <div class="card text-center my-2" style="">
            <div class="card-body">
                <div class="row">
                    <div class="text-center">
                        <h5 class="text-body" style="font-family: poppins,sans-serif ">Durée de chaque enchere :
                            <span class="text-info" style="font-size: 16px">
                                <%out.print(dure);%>&nbsp;sec
                            </span>
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
                        <button type="button" class="btn btn-primary" onclick="showTable('${pageContext.request.contextPath}',1)">non terminer</button>
                    </div>
                    <div class="col-4 text-center">
                        <button type="button" class="btn btn-success" onclick="showTable('${pageContext.request.contextPath}',2)">terminer</button>
                    </div>
                    <div class="col-2"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Utilisateur</th>
                <th scope="col">categorie</th>
                <th scope="col">produit</th>
                <th scope="col">date fin</th>
                <th scope="col">prix min</th>
            </tr>
            </thead>
            <tbody id="n-e1">

            </tbody>
        </table>
    </div>
</div>


<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modifier durée</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-3">
                        <label for="n-e2" class="col-form-label">durée</label>
                    </div>
                    <div class="col-8">
                        <input type="number" id="n-e2" name="categorie" class="form-control" value="">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">annuller</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="update('${pageContext.request.contextPath}')">modifier</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/Asset/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/Asset/js/Function.js"></script>
<script !src="">
    showTable('${pageContext.request.contextPath}',1)
</script>
</body>
</html>
