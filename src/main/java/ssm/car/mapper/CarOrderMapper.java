package ssm.car.mapper;

import org.apache.ibatis.annotations.Param;

import ssm.car.bean.CarOrder;
import ssm.car.bean.CarOrderExample;

import java.util.List;

public interface CarOrderMapper {
    int countByExample(CarOrderExample example);

    int deleteByExample(CarOrderExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(CarOrder record);

    int insertSelective(CarOrder record);

    List<CarOrder> selectByExample(CarOrderExample example);

    CarOrder selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") CarOrder record, @Param("example") CarOrderExample example);

    int updateByExample(@Param("record") CarOrder record, @Param("example") CarOrderExample example);

    int updateByPrimaryKeySelective(CarOrder record);

    int updateByPrimaryKey(CarOrder record);

    // --- TODO: djzhao --- //
    int getOrderNumberByBid(Integer bid);
}