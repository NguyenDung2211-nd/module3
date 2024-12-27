package controller;

import entity.Product;
import service.IService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController" , value = "/product")
public class ProductController extends HttpServlet {
    private static final IService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        String message = req.getParameter("message");

        if (message != null) {
            switch (message) {
                case "create":
                    req.setAttribute("message", "Thêm mới thành công");
                    break;
                case "update":
                    req.setAttribute("message", "Cập nhật thành công");
                    break;
                case "delete":
                    req.setAttribute("message", "xóa thành công");
            }
        }

        if (action == null) {
            action = "";
        }
        switch(action){
            case "create":
                req.getRequestDispatcher("WEB-INF/view/product/create.jsp").forward(req, resp);
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                Product product = productService.getById(id);
                req.setAttribute("product", product);
                req.getRequestDispatcher("WEB-INF/view/product/update.jsp").forward(req, resp);
                break;
            case "delete":
                    int idProduct = Integer.parseInt(req.getParameter("id"));
                    productService.delete(idProduct);
                    resp.sendRedirect("/product?message=delete");
                break;
            case "search":
                String name = req.getParameter("name");
                List<Product> searchResult = productService.search(name);
                if(searchResult.isEmpty()){
                    req.setAttribute("message","Không tìm thấy sản phẩm nào phù hợp.");
                }else {
                    req.setAttribute("products", searchResult);
                }
                req.getRequestDispatcher("WEB-INF/view/product/list.jsp").forward(req, resp);
                break;
            case "detail":
                int idProductDetail = Integer.parseInt(req.getParameter("id"));
                Product productDetail = productService.getById(idProductDetail);
                if (productDetail != null) {
                    req.setAttribute("product", productDetail);
                    req.getRequestDispatcher("WEB-INF/view/product/detail.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("/product?message=not_found");
                }
                break;
            default:
                List<Product> products = productService.getAll();
                req.setAttribute("products", products);
                req.getRequestDispatcher("WEB-INF/view/product/list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch(action){
            case "create":
                try {
                    String name = req.getParameter("name");
                    String price = req.getParameter("price");
                    String description = req.getParameter("description");
                    Product product = new Product(name, Double.parseDouble(price), description);
                    productService.save(product);
                    resp.sendRedirect("/product?message=create");
                }catch(NumberFormatException e){
                    req.setAttribute("message", "Giá sản phẩm phải là một số.");
                    req.getRequestDispatcher("WEB-INF/view/product/create.jsp").forward(req, resp);
                }catch(Exception e){
                    req.setAttribute("message", "Lỗi không xác định.");
                    req.getRequestDispatcher("WEB-INF/view/product/create.jsp").forward(req, resp);
                }
                break;
            case "update":
                int id = Integer.parseInt(req.getParameter("id"));
                String updatedName = req.getParameter("name");
                String updatedPrice = req.getParameter("price");
                String updatedDescription = req.getParameter("description");

                Product updatedProduct = new Product(id, updatedName, Double.parseDouble(updatedPrice), updatedDescription);

                productService.update(id, updatedProduct);

                resp.sendRedirect("/product?message=update");
                break;
        }
    }
}
