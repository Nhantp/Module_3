package service.impl;

import bean.Category;
import repository.CategoryRepository;
import repository.impl.CategoryRepositoryimpl;
import service.CategoryService;

import java.util.List;

public class CategoryServiceimpl implements CategoryService {
    private CategoryRepository categoryRepository = new CategoryRepositoryimpl();
    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category findById(String id) {
        return categoryRepository.findById(id);
    }
}
