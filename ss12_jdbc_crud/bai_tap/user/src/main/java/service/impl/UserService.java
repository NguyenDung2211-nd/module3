package service.impl;

import entity.User;
import repository.UserRepository;
import service.IService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IService {
    private static UserRepository userRepository = new UserRepository();
    @Override
    public List<User> getAll() {
        List<User> users = userRepository.getAll();
        return users;
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users = userRepository.searchByCountry(country);
        if (users.isEmpty()) {
            return null;
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

}
