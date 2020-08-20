package ssm.car.service;

import java.util.List;
import java.util.Set;

import ssm.car.bean.Car;
import ssm.car.bean.CarExample;



public interface ICarService {
	int addCar(Car Car);
	
	List<Car> findAllCar();
	
	int delById(Integer bid);
	
	Car findById(Integer bid);
	
	int modifyCar(Car Car);
	
	Set<String> CarType();
	
	List<Car> selectByExample(CarExample example);

	boolean checkStore(Integer bid, Integer number);
	
	int reduceStore(Integer bid,Integer number);

	// --- TODO: djzhao --- //
	List<Car> getAllCars();

    void addCarType(String typename);
}
