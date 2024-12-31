package repository;

import entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UserRepository {
    public List<User> getAll(){
        PreparedStatement statement = null;
        List<User> users = new ArrayList<>();
        try{
            statement = BaseRepository.getConnection().prepareStatement("select * from users");
            ResultSet resultSet = statement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        }catch(Exception e){
            throw new RuntimeException("Error closing statement:" + e);
        }
        return users.isEmpty() ? Collections.emptyList() : users;
    }

    public List<User> searchByCountry(String country) {
        List<User> users = new ArrayList<>();
        String query = "select * from users where country like ?";

        try (PreparedStatement statement = BaseRepository.getConnection().prepareStatement(query)) {
            statement.setString(1, "%" + country + "%");

            ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name_user");
                    String email = resultSet.getString("email");
                    String countryName = resultSet.getString("country");
                    users.add(new User(id, name, email, countryName));
                }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm kiếm người dùng theo quốc gia: " + e.getMessage(), e);
        }

        return users;
    }

    public List<User> sortByName() {
        List<User> users = new ArrayList<>();
        String query = "select * from users order by name_user asc";

        try (PreparedStatement statement = BaseRepository.getConnection().prepareStatement(query)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi sắp xếp người dùng theo tên: " + e.getMessage(), e);
        }

        return users;
    }






}
