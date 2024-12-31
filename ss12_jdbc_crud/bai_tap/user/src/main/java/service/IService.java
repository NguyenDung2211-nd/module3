package service;

import entity.User;

import java.util.List;

public interface IService {
    List<User> searchByCountry(String country);
    List<User> sortByName();
}
