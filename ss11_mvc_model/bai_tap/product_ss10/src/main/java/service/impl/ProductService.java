package service.impl;

import entity.Product;
import repository.ProductRepository;
import service.IService;

import java.util.List;

public class ProductService implements IService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        List<Product> products = productRepository.getAll();
        return products;
    }

    @Override
    public void save(Product product){
        productRepository.save(product);
    }

    @Override
    public Product getById(int id) {
        return productRepository.getById(id);
    }

    @Override
    public void update(int id, Product updateProduct) {
        productRepository.update(id, updateProduct);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public List<Product> search(String name) {
        return productRepository.search(name);
    }
}
