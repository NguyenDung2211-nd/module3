import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateServlet" , value = "/calculate")
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
        } catch (Exception e) {
            display = ("Error: " );
        }
        req.setAttribute("display", display);
        req.getRequestDispatcher("/index.jsp").forward(req, response);
    }
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        }
}
