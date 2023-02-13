package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void addUser(User user);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> findAll() throws SQLException;
    User findById(int id);
    List<User>searchByCountry(String country);
    List<User>sortByName();

}
