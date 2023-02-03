package Controlleur;

import Model.Enchere;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Statistique", value = "/Statistique")
public class Statistique extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String v=request.getParameter("value");
        PrintWriter out= response.getWriter();
        try {
            out.print(Model.Statistique.statCategorie());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String durre=request.getParameter("value");
        double d=Double.parseDouble(durre);
        try {
            Enchere.updateCommission(d);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
