package repository;

import entity.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    private static List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer("Dung", "22-11-2003", "QN",  "https://th.bing.com/th/id/OIP.Sc-ECws6slypw2oYyhNo_gHaNK?rs=1&pid=ImgDetMain"));
        customers.add(new Customer("Dung", "22-11-2003", "QN",  "https://thuvienanime.com/wp-content/uploads/2023/06/tieu-viem-thuvienanime-wallpaper-13-780x1190.jpg"));
        customers.add(new Customer("Dung", "22-11-2003", "QN",  "https://th.bing.com/th/id/OIP.xSydPdzMHjLoFULOtypelQHaNM?pid=ImgDet&w=474&h=844&rs=1"));


    }

    public static List<Customer> getAll() {
        return customers;
    }
}
