package service.impl;

import entity.Customer;
import repository.CustomerRepository;
import service.IService;

import java.util.List;

public class CustomerService implements IService {

    @Override
    public List<Customer> getAll() {
        List<Customer> customer = CustomerRepository.getAll();

        return customer;
    }
}
