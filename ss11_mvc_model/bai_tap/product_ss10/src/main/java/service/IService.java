package service;

import entity.Product;

import java.util.List;

public interface IService {
    List<Product> getAll();
    void save (Product product);
    Product getById(int id);
    void update(int id,Product product);
    void delete(int id);
    List<Product> search(String name);
}
