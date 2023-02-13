package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();
    List<Product> productList = productService.findAll();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list": {
                showList(request, response);
                break;
            }
            case "create": {
                showCreate(request, response);
                break;
            }
            case "delete": {
                showDelete(request, response);
                break;
            }
            case "check": {
                showCheck(request, response);
                break;
            }
            case "searchByName": {
                showSearchByName(request, response);
                break;
            }
            case "update": {
                showUpdate(request, response);
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("product?action=list");
            return;
        }
        switch (action) {
            case "create": {
                doCreate(request, response);
                break;
            }
            case "update":   {
                doUpdate(request, response);
                break;
            }
            case "searchByName": {
                doSearch(request, response);
            }
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productService.add(product);
        response.sendRedirect("product?action=list");
    }

    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productService.update(product);

        response.sendRedirect("product?action=list");
    }

    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameTxt = request.getParameter("name");
        List<Product> products = productService.searchByName(nameTxt);
        request.setAttribute("products", products);
        request.getRequestDispatcher("product/search.jsp").forward(request, response);
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Product productUpdate = productService.findById(id);
        request.setAttribute("products", productUpdate);
        request.getRequestDispatcher("product/update.jsp").forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        productService.delete(id);
        response.sendRedirect("product?action=list");
    }

    private void showCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", productService.findAll());
        request.getRequestDispatcher("product/list.jsp").forward(request, response);
    }

    private void showSearchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("product/search.jsp");
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("product/create.jsp");
    }
}
