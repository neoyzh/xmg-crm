package com._520it.crm.service;

import com._520it.crm.domain.Task;
import com._520it.crm.req.TaskQueryObject;
import com._520it.crm.resp.PageResult;

import java.util.List;


public interface ITaskService {
	int save(Task task);
	int update(Task task);
	int delete(Long id);
	Task get(Long id);
	List<Task> selectAll();
	PageResult selectByCondition(TaskQueryObject qo);

    int change(Task todayTask);

    /**
     * 完成任务：7天内 + status=0 才能标记完成
     * @return null=成功，非null=错误消息
     */
    String completeTask(Long id);

    /**
     * 标记失败：7天内 + status=0 才能标记失败
     * @return null=成功，非null=错误消息
     */
    String loseTask(Long id);
}
