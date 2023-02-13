package service;

import model.Product;

import java.util.List;

public interface IProductService {
    void add(Product product);

    Product update(Product product);

    void delete(String id);

    void check(String id);

    List<Product> searchByName(String name);

    List<Product> findAll();

    Product findById(String id);
}
