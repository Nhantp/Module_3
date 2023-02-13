package controller;

import model.User;
import service.IUserService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    IUserService userService=new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null) {
            action = "";
        }
        switch (action){
            case "create":{
                showCreate(request,response);
                break;
            }
            case "list":{
                try {
                    showList(request,response);
                    break;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "delete":{
                try {
                    showDelete(request,response);
                    break;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "update":{
                showUpdate(request,response);
                break;
            }
            case "sort":{
                showSort(request,response);
                break;
            }
            case "check":{
                showCheck(request,response);
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":{
                doCreate(request,response);
                break;
            }
            case "update":{
                try {
                    doUpdate(request,response);
                    break;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            case "search":{
                doSearch(request,response);
                break;
            }
        }
    }


    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(name,email,country);
        userService.addUser(user);
        response.sendRedirect("user?action=list");
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("user/create.jsp");
    }
    private void showList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<User>userList=userService.findAll();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }
    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        response.sendRedirect("user?action=list");

    }
    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        User user=userService.findById(id);
        request.setAttribute("userList",user);
        request.getRequestDispatcher("user/update.jsp").forward(request,response);
    }
    private void doUpdate(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String country=request.getParameter("country");
        User user=new User(id,name,email,country);
        userService.updateUser(user);
        response.sendRedirect("user?action=list");
    }
    private void doSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country=request.getParameter("country");
        List<User>userList=userService.searchByCountry(country);
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }
    private void showSort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User>userList=userService.sortByName();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);
    }
    private void showCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id=Integer.parseInt(request.getParameter("id"));
        User user=userService.findById(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("user/list.jsp").forward(request,response);

    }
}
