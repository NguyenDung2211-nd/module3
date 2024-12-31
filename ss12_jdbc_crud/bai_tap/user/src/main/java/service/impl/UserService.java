package service.impl;

import entity.User;
import exception.EntityNotFoundException;
import repository.UserRepository;
import service.IService;

import java.util.Collections;
import java.util.List;

public class UserService implements IService {
    private static UserRepository userRepository = new UserRepository();

    private List<User> getAll() {
        List<User> users = userRepository.getAll();
        return users.isEmpty() ? Collections.emptyList() : users;
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> users;
        if (country == null || country.isEmpty()) {
            users = getAll();
        } else {
            users = userRepository.searchByCountry(country);
        }
        if (users.isEmpty()) {
            throw new EntityNotFoundException("Không có dữ liệu.");
        }
        return users;
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

}
