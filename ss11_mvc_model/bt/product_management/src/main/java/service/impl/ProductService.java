package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    List<Product> productList=new ArrayList<>();

    @Override
    public void display() {

    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(Product product) {

    }

    @Override
    public void delete(Product product) {
        productList.remove(product);
    }

    @Override
    public void check(Product product) {

    }

    @Override
    public void searchByName(Product product) {

    }

    @Override
    public List<Product> findAll() {
        return productList;
    }
}
