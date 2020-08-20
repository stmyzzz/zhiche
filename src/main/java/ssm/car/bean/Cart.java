package ssm.car.bean;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;


//购物车类
public class Cart {

	//购买商品的集�?
	private HashMap<Car,Integer> goods;
	
	//购物车的总金�?
	private double totalPrice;

	//构�?�方�?
	public Cart()
	{
		goods = new HashMap<Car,Integer>();
		totalPrice = 0.0;
	}
	
	public Cart(HashMap<Car, Integer> goods, double totalPrice) {
		super();
		this.goods = goods;
		this.totalPrice = totalPrice;
	}

	public HashMap<Car, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Car, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	//添加商品进购物车的方�?
	public boolean addGoodsInCart(Car item ,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);	
		}
		calTotalPrice(); //重新计算购物车的总金�?
		return true;
	}
	
	//删除商品的方�?
	public boolean removeGoodsFromCart(Car item)
	{
		goods.remove(item);
		calTotalPrice(); //重新计算购物车的总金�?
		return true;
	}
	
	//统计购物车的总金�?
	public double calTotalPrice()
	{
		double sum = 0.0;
		Set<Car> keys = goods.keySet(); //获得键的集合
		Iterator<Car> it = keys.iterator(); //获得迭代器对�?
	    while(it.hasNext())
	    {
	    	Car i = it.next();
	    	sum += Double.parseDouble(i.getPirce())* goods.get(i);
	    }
	    this.setTotalPrice(sum); //设置购物车的总金�?
	    return this.getTotalPrice();
	}
	
//	public static void main(String[] args) {
//		
//		//先创建两个商品对�?
//		Car i1 = new Car(1,"沃特篮球�?","温州",200,500,"001.jpg");
//		Car i2 = new Car(2,"李宁运动�?","广州",300,500,"002.jpg");
//		Car i3 = new Car(1,"沃特篮球�?","温州",200,500,"001.jpg");
//		
//		Cart c = new Cart();
//		c.addGoodsInCart(i1, 1);
//		c.addGoodsInCart(i2, 2);
//		//再次购买沃特篮球鞋，购买3�?
//		c.addGoodsInCart(i3, 3);
//		
//		
//		//变量购物商品的集�?
//		Set<Map.Entry<Car, Integer>> Car= c.getGoods().entrySet();
//		for(Map.Entry<Car, Integer> obj:Car)
//		{
//			System.out.println(obj);
//		}
//		
//		
//		System.out.println("购物车的总金额："+c.getTotalPrice());
//		
//	}
	
}
