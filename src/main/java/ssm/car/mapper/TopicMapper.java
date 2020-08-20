package ssm.car.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ssm.car.bean.Topic;
import ssm.car.bean.TopicExample;

public interface TopicMapper {
    long countByExample(TopicExample example);

    int deleteByExample(TopicExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Topic record);

    int insertSelective(Topic record);

    List<Topic> selectByExample(TopicExample example);

    Topic selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByExample(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);
}