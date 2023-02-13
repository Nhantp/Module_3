package service.impl;

import model.Product;
import service.IProductService;

import java.util.*;
import java.util.stream.Collectors;

public class ProductService implements IProductService {
    private static Map<String, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put("PD01", new Product("PD01", "nuoc", 11, "t", "reo"));
        productMap.put("PD02", new Product("PD02", "che", 13, "td", "regg"));
        productMap.put("PD03", new Product("PD03", "oi", 16, "tc", "recc"));
        productMap.put("PD04", new Product("PD04", "xoai", 17, "rt", "reff"));
        productMap.put("PD05", new Product("PD05", "cam", 19, "tu", "reww"));
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public Product update(Product product) {
        productMap.put(product.getId(), product);
        return product;
    }

    @Override
    public void delete(String id) {
        productMap.remove(id);
    }

    @Override
    public void check(String id) {
        productMap.get(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> result = new ArrayList<>();

        for (Map.Entry<String, Product> e : productMap.entrySet()) {
            if (e.getValue().getName().contains(name)) {
                result.add(e.getValue());
            }
        }

        return result;

//       return productMap.values().stream().filter(e -> e.getName().contains(name)).collect(Collectors.toList());
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(String id) {
        return productMap.get(id);
    }

}
