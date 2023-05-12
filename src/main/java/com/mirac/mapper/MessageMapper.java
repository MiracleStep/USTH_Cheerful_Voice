package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Message;
import com.mirac.entity.MessageCriteria;
import com.mirac.entity.MessageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
* 帖子信息数据访问接口
* @author Mirac
*
*/
@Mapper
public interface MessageMapper extends BaseMapper<MessageInfo> {
	/**
	 * 添加帖子
	 * @param msg 帖子信息
	 * @return
	 */
	int add(Message msg);

	
	/**
	 * 更新状态
	 @param msgid
	 @param state
	 * @return
	 */
	int updateState(@Param("msgid") int msgid,@Param("state") int state);
	
	/**
	 * 查询指定帖子信息
	 * @param msgid 帖子ID
	 * @return
	 */
	MessageInfo get(int msgid);
	
	/**
	 * 多条件查询帖子信息
	 * @param messageCriteria 复合条件
	 * @param  messageCriteria  分页信息
	 * @return 查询结果
	 */
	List<MessageInfo> query(MessageCriteria messageCriteria);
	
	/**
	 * 查询最新的帖子信息
	 * @return
	 */
	List<MessageInfo> queryNew();
	
	/**
	 * 查询最热的帖子信息
	 * @return
	 */
	List<MessageInfo> queryHot();
	
	/**
	 * 查询最热主题信息
	 * @return
	 */
	List<MessageInfo> queryTheme();
	
	/**
	 * 根据时间查询帖子数量
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return
	 */
	long queryCountByDate(@Param("startDate") Date startDate,@Param("endDate") Date endDate);
}
