package repository;

import com.mysql.cj.jdbc.JdbcConnection;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    protected String URL = "jdbc:mysql://localhost:3306/user?user=root";
    protected String USER = "root";
    protected String PASS = "12345";
    protected String INSERT_USER = "insert into users(name, email, country) values (?,?,?)";
    protected String SELECT_ALL_USER = "select *from users";
    protected String SELECT_USER = "select id,name,email,country from users where id=?";
    protected String DELETE_USER = "delete from users where id=?";
    protected String UPDATE_USER = "update users set name = ?,email= ?, country =? where id = ?";
    protected String SEARCH_BY_COUNTRY = "select * from users where country like ?";
    protected String SORT_BY_COUNTRY = "select *from users order by name";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    @Override
    public void addUser(User user) {
        Connection connection = getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_USER);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean delete;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(DELETE_USER);
            statement.setInt(1, id);
            delete = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            statement.close();
            closeConnection(connection);
        }
        return delete;
    }


    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean update;
        Connection connection = getConnection();
        try (PreparedStatement statement = connection.prepareStatement(UPDATE_USER)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            update = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeConnection(connection);
        }
        return update;

    }

    @Override
    public List<User> findAll() throws SQLException {
        Connection connection = getConnection();
        List<User> userList = new ArrayList<>();
        ResultSet resultSet = null;
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_USER);
                resultSet = statement.executeQuery();
                User user = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id, name, email, country);
                    userList.add(user);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                statement.close();
                resultSet.close();
                closeConnection(connection);
            }

        }
        return userList;
    }

    @Override
    public User findById(int id) {
        User user=null;
        Connection connection = getConnection();
        PreparedStatement statement=null;
        ResultSet resultSet=null;
        try {
            statement = connection.prepareStatement(SELECT_USER);
            statement.setInt(1,id);
            resultSet=statement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            closeConnection(connection);
        }
        return user;
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> result=new ArrayList<>();
        Connection connection=getConnection();
        PreparedStatement statement=null;
        ResultSet resultSet=null;
        try {
            statement=connection.prepareStatement(SEARCH_BY_COUNTRY);
            statement.setString(1,"%"+country+"%");
            resultSet=statement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country1=resultSet.getString("country");
                User user=new User(id,name,email,country1);
                result.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            closeConnection(connection);
        }
        return result;
    }

    @Override
    public List<User> sortByName() {
        Connection connection=getConnection();
        List<User>userList=new ArrayList<>();
        PreparedStatement statement=null;
        ResultSet resultSet=null;
        try {
            statement=connection.prepareStatement(SORT_BY_COUNTRY);
            resultSet=statement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    protected void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    protected void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
