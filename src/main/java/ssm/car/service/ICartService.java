package ssm.car.service;

import ssm.car.bean.Car;
import ssm.car.bean.Cart;

public interface ICartService {
	Cart addGoodsInCart(Car Car ,int number,Cart cart);
	
	Cart removeGoodsFromCart(Car Car,Cart cart);
	
	Cart calTotalPrice(Cart cart);
	
}
