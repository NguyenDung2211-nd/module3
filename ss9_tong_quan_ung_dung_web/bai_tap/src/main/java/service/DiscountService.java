package service;

public class DiscountService {
    public double calculateDiscountAmount(double price, double discountPercent) {
        return price * discountPercent * 0.01;
    }

    public double calculateDiscountPrice(double price, double discountAmount) {
        return price - discountAmount;
    }
}
