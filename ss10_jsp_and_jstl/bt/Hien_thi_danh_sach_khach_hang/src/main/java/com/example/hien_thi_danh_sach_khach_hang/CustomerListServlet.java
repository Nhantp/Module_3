package com.example.hien_thi_danh_sach_khach_hang;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/customer")
public class CustomerListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("listCustomer",CustomerService.customerList);
//   List<Customer> tmp = new ArrayList<>();
//   tmp.add(new Customer("a", "b", "c"));
        request.setAttribute("listCustomer", CustomerService.customerList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
