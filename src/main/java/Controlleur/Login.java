package Controlleur;

import Model.Admin;
import Model.Rechargement;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        HttpSession session= request.getSession();
        if (session.getAttribute("id")!=null){
            try {
                Rechargement.update(Integer.parseInt(id));
            } catch (Exception ignored) {
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login=request.getParameter("login");
        String pwd=request.getParameter("pwd");
        Admin admin=new Admin();
        HttpSession session=request.getSession();
        PrintWriter out= response.getWriter();
        int id=0;
        try {
            id=admin.login(login,pwd);
        }catch (Exception e){
            System.out.println(e.getMessage());
            id=-200;
        }
        out.print(id);
        if (id<=0){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else {
            session.setAttribute("id",id);
            request.getRequestDispatcher("Acceil.jsp").forward(request,response);
        }
    }
}
