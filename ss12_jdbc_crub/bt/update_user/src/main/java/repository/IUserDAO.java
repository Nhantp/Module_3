package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void addUser(User user);
    User selectUser(int id);
    List<User> selectAll();
    boolean delete(int id) throws SQLException;
    boolean update(User user) throws SQLException;
    List<User>SearchByCountry(String country);
    List<User>sortByName() throws SQLException;

}
