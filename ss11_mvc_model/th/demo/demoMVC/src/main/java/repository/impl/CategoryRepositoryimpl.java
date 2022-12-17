package repository.impl;

import bean.Category;
import repository.CategoryRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CategoryRepositoryimpl implements CategoryRepository {
    private static Map<String,Category> categoryMap;
    static {
        categoryMap.put("CT001",new Category("CT001","Sach giao khoa"));
        categoryMap.put("CT002",new Category("CT002","Sach tham khao"));
        categoryMap.put("CT003",new Category("CT003","Sach khoa hoc"));
        categoryMap.put("CT004",new Category("CT004","Sach tieng anh"));
        categoryMap.put("CT005",new Category("CT005","Sach toan"));
    }

    @Override
    public List<Category> findAll() {
        return new ArrayList<>(categoryMap.values());
    }

    @Override
    public Category findById(String id) {
        return categoryMap.get(id);
    }
}
