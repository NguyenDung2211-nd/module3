package controller;

import entity.User;
import exception.EntityNotFoundException;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private static UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        String countrySearch = req.getParameter("country");

        if (action == null) {
            action = "";
        }
        List<User> users = new LinkedList<>();
        String message = null;
        try {
            switch (action) {
                case "sort":
                    users = userService.sortByName();
                    break;
                default:
                    users = userService.searchByCountry(countrySearch);
                    break;
            }
        } catch (EntityNotFoundException e){
            message = e.getMessage();
        }
        req.setAttribute("users", users);
        req.setAttribute("countrySearch", countrySearch);
        req.setAttribute("message", message);
        req.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(req, resp);
    }
}
