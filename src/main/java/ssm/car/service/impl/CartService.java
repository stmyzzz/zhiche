package ssm.car.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Service;

import ssm.car.bean.Car;
import ssm.car.bean.Cart;
import ssm.car.service.ICartService;

@Service
public class CartService implements ICartService{	
		
	@Override
	public Cart addGoodsInCart(Car Car, int number,Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Car,Integer> goods=cart.getGoods();
		if(goods.containsKey(Car))
		{
			goods.put(Car, goods.get(Car)+number);
		}
		else
		{
			goods.put(Car, number);	
		}
		 //重新计算购物车的总金�?
		return calTotalPrice(cart);
	}

	@Override
	public Cart removeGoodsFromCart(Car Car,Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Car,Integer> goods=cart.getGoods();
		goods.remove(Car);
		cart.setGoods(goods);
		//重新计算购物车的总金�?
		return calTotalPrice(cart);
	}

	@Override
	public Cart calTotalPrice(Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Car,Integer> goods=cart.getGoods();
		double sum = 0.0;
		Set<Car> keys = goods.keySet(); //获得键的集合
		Iterator<Car> it = keys.iterator(); //获得迭代器对�?
	    while(it.hasNext())
	    {
	    	Car i = it.next();
	    	sum += Double.parseDouble(i.getPirce())* goods.get(i);
	    }
	    cart.setTotalPrice(sum);
	    return cart;
	}

}
