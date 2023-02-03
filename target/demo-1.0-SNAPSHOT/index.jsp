<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sing in page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/bootstrap.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="card shadow p-3  rounded" style="height: 50%;width: 30%;position: absolute;top: 0; left: 0; right: 0;bottom: 0;  margin: auto; ">
            <div class="card-body">
                <div class="row text-center">
                    <h2 style="font-family: 'Segoe Print',cursive"> Entrer votre login</h2>
                    <br>
                </div>
                <form action="${pageContext.request.contextPath}/Login" autocomplete="off" method="post" style="font-family: 'Segoe Print',cursive; font-size: 16px">
                    <div class="row">
                        <div class="row g-3 align-items-center">
                            <div class="col-4">
                                <label for="n-1" class="col-form-label">login</label>
                            </div>
                            <div class="col-8">
                                <input type="text" id="n-1" name="login" class="form-control" value="andrianiavo">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row g-3 align-items-center">
                            <div class="col-4">
                                <label for="inputPassword6" class="col-form-label">Password</label>
                            </div>
                            <div class="col-8">
                                <input type="password" id="inputPassword6" name="pwd" class="form-control" aria-describedby="passwordHelpInline" value="niavo jr">
                            </div>
                        </div>
                    </div>
                    <div class="row my-4">
                        <div class="col-6 container" style="">
                            <div class="row">
                                <div class="row">
                                    <div class="col-2"></div>
                                    <div class="col-8">
                                        <button type="submit" class="btn btn-primary text-center" style="width: 120px">login</button>
                                    </div>
                                    <div class="col-2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 container">
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-8">
                                    <a href="Insert.jsp" type="button" class="btn btn-secondary text-center" style="width: 120px">sing up</a>
                                </div>
                                <div class="col-2"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/Asset/js/bootstrap.js"></script>
</body>
</html>