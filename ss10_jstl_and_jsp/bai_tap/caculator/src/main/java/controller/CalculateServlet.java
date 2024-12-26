package controller;

import sercice.Calculate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateServlet" , value = "/calculator")
public class CalculateServlet extends HttpServlet {
    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        String display;

        try {
            float firstOperand = Integer.parseInt(req.getParameter("first-operand"));
            float secondOperand = Integer.parseInt(req.getParameter("second-operand"));
            char operator = req.getParameter("operator").charAt(0);
            float result = Calculate.calculate(firstOperand, secondOperand, operator);
            display = (firstOperand + " " + operator + " " + secondOperand + " = " + result);
        } catch(NumberFormatException e){
            display = ("Error: The value must be 1 number" );
        } catch (Exception e) {
            display = ("Error: Unknown Errors " );
        }
        req.setAttribute("display", display);
        req.getRequestDispatcher("WEB-INF/view/index.jsp").forward(req, response);
    }
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        }
}
