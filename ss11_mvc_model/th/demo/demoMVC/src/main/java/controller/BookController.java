package controller;

import bean.Book;
import bean.Category;
import service.BookService;
import service.CategoryService;
import service.impl.BookServiceimpl;
import service.impl.CategoryServiceimpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookController", value = "/book")
public class BookController extends HttpServlet {
    BookService bookService=new BookServiceimpl();
    CategoryService categoryService=new CategoryServiceimpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="list";
        }
        switch (action){
            case "create":
                showCreate(request,response);
                break;
            case "update":
                break;
            case "list":
                showList(request,response);
                break;
            case "delete":
                showList(request,response);
                break;
            default:

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            response.sendRedirect("book?action=list");
            return;
        }
        switch (action){
            case "create":
                doCreate(request,response);
                break;
            case "update":
                break;
                case "delete":
                showList(request,response);
                break;
            default:
                response.sendRedirect("book?action=list");

        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String author=request.getParameter("author");
        String categoryId=request.getParameter("categoryId");
        Category category = categoryService.findById(categoryId);
        Book book=new Book(id,name,author,category);
        bookService.saveOrUpdate(book);
        response.sendRedirect("book/list?action=list");
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute("category",categoryService.findAll());
        request.getRequestDispatcher("book/create.jsp").forward(request,response);
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setAttribute("books",bookService.findAll());
        request.getRequestDispatcher("book/list.jsp").forward(request,response);
    }
}
