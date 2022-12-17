package service.impl;

import bean.Book;
import repository.BookRepository;
import repository.impl.BookRepositoryimpl;
import service.BookService;

import java.util.List;

public class BookServiceimpl implements BookService {
    private BookRepository bookRepository=new BookRepositoryimpl();
    @Override
    public void saveOrUpdate(Book book) {
        bookRepository.saveOrUpdate(book);
    }

    @Override
    public void deleteById(String id) {
        bookRepository.deleteById(id);
    }

    @Override
    public Book findById(String id) {
        return bookRepository.findById(id);
    }

    @Override
    public List<Book> findAll() {
        return bookRepository.findAll();
    }
}
