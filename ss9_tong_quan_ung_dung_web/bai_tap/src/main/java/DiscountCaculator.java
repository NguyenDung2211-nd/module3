import service.DiscountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountCaculator", value = "/caculator")
public class DiscountCaculator extends HttpServlet {
    private final DiscountService discountService = new DiscountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/product_discount_caculator.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String description = req.getParameter("description");
            String priceStr = req.getParameter("price");
            String discountStr = req.getParameter("discount");

            if (description == null || priceStr == null || discountStr == null ||
                    description.replace(" ", "").isEmpty() || priceStr.replace(" ", "").isEmpty() || discountStr.replace(" ", "").isEmpty()) {
                req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            } else {
                double price = Double.parseDouble(priceStr);
                double discountPercent = Double.parseDouble(discountStr);

                double discountAmount = discountService.calculateDiscountAmount(price, discountPercent);
                double discountPrice = discountService.calculateDiscountPrice(price, discountAmount);

                req.setAttribute("description", description);
                req.setAttribute("price", price);
                req.setAttribute("discountPercent", discountPercent);
                req.setAttribute("discountAmount", discountAmount);
                req.setAttribute("discountPrice", discountPrice);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Giá và phần trăm giảm giá phải là số hợp lệ!");
        } catch (Exception e) {
            req.setAttribute("error", "Đã xảy ra lỗi, vui lòng thử lại.");
        }

        req.getRequestDispatcher("WEB-INF/view/product_discount_caculator.jsp").forward(req, resp);
    }
}
