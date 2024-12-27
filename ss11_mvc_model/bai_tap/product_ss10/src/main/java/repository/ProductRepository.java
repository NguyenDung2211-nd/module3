package repository;

import entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    private static List<Product> products = new ArrayList<>();

    static{
        products.add(new Product(1, "Bánh quy", 20000, "Rất ngon luôn" ));
        products.add(new Product(3, "Sữa chua", 8000, "Ngon" ));
        products.add(new Product(6, "Xoài", 15000, "Hơi chua" ));
        products.add(new Product(2, "Bắp nướng", 22000, "Cháy đen" ));
    }
     public List<Product> getAll(){
        return products;
     }

     public void save(Product product){
        product.setId(products.get(products.size()-1).getId()+1);
        products.add(product);
     }

     public void update(int id, Product updateProduct){
        for(Product product : products){
            if(product.getId() == id){
                product.setName(updateProduct.getName());
                product.setPrice(updateProduct.getPrice());
                product.setDescription(updateProduct.getDescription());
                break;
            }
        }
     }

    public Product getById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public void delete(int id) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == id) {
                products.remove(i);
                break;
            }
        }
    }

    public List<Product> search(String name){
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getName().toLowerCase().equals(name.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }
}
