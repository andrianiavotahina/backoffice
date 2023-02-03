package Controlleur;

import Model.Enchere;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

@WebServlet(name = "EnchereServelet", value = "/EnchereServelet")
public class EnchereServelet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        int etat=Integer.parseInt(id);
        PrintWriter out= response.getWriter();
        try {
            Vector<Enchere> encheres=Enchere.liste(etat);
            for (Enchere enchere : encheres){
                out.print("<tr>");
                out.print("<td>"+enchere.getNomUtilisateur()+"</td>");
                out.print("<td>"+enchere.getNomCategorie()+"</td>");
                out.print("<td>"+enchere.getNomProduit()+"</td>");
                out.print("<td>"+enchere.getDateFin()+"</td>");
                out.print("<td>"+enchere.getPrixMin()+"</td>");
                out.print("</tr>");
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String durre=request.getParameter("durre");
        int d=Integer.parseInt(durre);
        try {
            Enchere.update(d);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
