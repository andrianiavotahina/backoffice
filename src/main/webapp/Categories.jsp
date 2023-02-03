<%@ page import="java.util.Vector" %>
<%@ page import="Model.Categorie" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-7" style="margin-top: 4%;">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">nom de categorie</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <%
                Vector<Categorie>list=new Vector<>();
                try {
                    list=Categorie.getAll();
                } catch (Exception e) {
                  out.println(e.getMessage());
                }
                int i=0;
                for (Categorie categorie : list){  i++; %>
                    <tr>
                        <th scope="row"><%=i%></th>
                        <td><%=categorie.getNomCategorie()%></td>
                        <td><i class="fa fa-edit hoverable" aria-hidden="true" onclick="edit('<%=categorie.getNomCategorie()%>','<%=categorie.getIdCategories()%>')"></i></td>
                        <td><i class="fa fa-remove view overlay zoom" aria-hidden="true" onclick="deleteH('${pageContext.request.contextPath}','<%=categorie.getIdCategories()%>')" ></i></td>
                    </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <div class="col-4">
        <div class="container card"  style="margin-top: 10%;">
            <form id="n-c4"  autocomplete="off"  method="post" style="font-family: 'Segoe Print',cursive; font-size: 16px">
                <input type="hidden" name="isinsert" id="n-c3" value="0">
                <div class="row">
                    <div class="row g-3 align-items-center">
                        <div class="col-4">
                            <label for="n-c1" class="col-form-label">Catergorie</label>
                        </div>
                        <div class="col-8">
                            <input type="text" id="n-c1" name="categorie" class="form-control" value="">
                        </div>
                    </div>
                </div>
                <div class="row my-4">
                    <div class="col-6 container" style="">
                        <div class="row">
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-8">
                                    <button type="button" onclick="send('${pageContext.request.contextPath}')" class="btn btn-primary text-center" id="n-c2" style="width: 120px">AJOUTER</button>
                                </div>
                                <div class="col-2"></div>
                            </div>
                            <div class="row">
                                <h5 class="text-danger" id="n-c5"></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
