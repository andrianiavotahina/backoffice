package Controlleur;

import Model.Categorie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "categorieInsert", value = "/categorieInsert")
public class categorieInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idCategorie=request.getParameter("id");
        HttpSession session= request.getSession();
        int id= 0;
        PrintWriter out= response.getWriter();
        if (session.getAttribute("id")!=null){
            id= (int) session.getAttribute("id");
        }
        if (id!=0 && idCategorie!=null && !idCategorie.equalsIgnoreCase("")) {
            try {
                Categorie.delete(idCategorie);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categorie=request.getParameter("categorie");
        String hidden=request.getParameter("isinsert");
        HttpSession session= request.getSession();
        int id= 0;
        PrintWriter out= response.getWriter();
        if (session.getAttribute("id")!=null){
            id= (int) session.getAttribute("id");
        }
        if (id!=0 && categorie!=null && !categorie.equalsIgnoreCase("")){
            if (hidden.equalsIgnoreCase("0")) {
                try {
                    Categorie.insert(categorie);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else{
                try {
                    Categorie.update(Integer.parseInt(hidden),categorie);
                } catch (Exception e) {
                    out.print("doublant!");
                }
            }
        }
    }
}
