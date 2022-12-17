package service;

import model.Product;

import java.util.List;

public interface IProductService {
    void display();
    void add(Product product);
    void update(Product product);
    void delete(Product product);
    void check(Product product);
    void searchByName(Product product);
    List<Product>findAll();
}
