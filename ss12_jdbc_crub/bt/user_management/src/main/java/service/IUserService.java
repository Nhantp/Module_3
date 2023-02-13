package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void addUser(User user);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    User findById(int id);
    List<User> findAll() throws SQLException;
    List<User>searchByCountry(String country);
    List<User>sortByName();
}
