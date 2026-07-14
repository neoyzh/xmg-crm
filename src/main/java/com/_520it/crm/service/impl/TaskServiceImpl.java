package com._520it.crm.service.impl;

import com._520it.crm.domain.*;
import com._520it.crm.mapper.TaskMapper;
import com._520it.crm.req.TaskQueryObject;
import com._520it.crm.resp.PageResult;
import com._520it.crm.service.DepartmentService;
import com._520it.crm.service.ITaskService;
import com._520it.crm.utils.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.*;

@Service
public class TaskServiceImpl implements ITaskService {
    @Autowired
    private TaskMapper dao;

    @Autowired
    private DepartmentService departmentService;

    @Override
    public int save(Task task) {
        return dao.insert(task);
    }

    @Override
    public int update(Task task) {
        return dao.updateByPrimaryKey(task);
    }

    @Override
    public int delete(Long id) {
        return dao.deleteByPrimaryKey(id);
    }

    @Override
    public Task get(Long id) {
        return dao.selectByPrimaryKey(id);
    }

    @Override
    public List<Task> selectAll() {
        return dao.selectAll();
    }

    @Override
    public PageResult selectByCondition(TaskQueryObject qo) {
        HttpServletRequest request = UserContext.get();
        Employee current = (Employee) request.getSession().getAttribute(UserContext.USER_IN_SESSION);
        if (current.getAdmin()) {
            Long id = current.getId();
            List<Department> departments = departmentService.listAll();
        } else if (current != null) {
            Long id = current.getId();
            List<Department> departments = departmentService.getByMid(id);
            if (departments == null || departments.size() == 0) {
                qo.setHandleUserId(id);
            }
        }

        Long total = dao.getCount(qo);
        if (total > 0) {
            List<Task> rows = dao.selectByCondition(qo);
            return new PageResult(total, rows);
        }
        return PageResult.EMPTY;
    }

    @Override
    public int change(Task todayTask) {
        Integer dayDelta = todayTask.getDayDelta();
        Date start = todayTask.getStart();
        Date end = todayTask.getEnd();
        Calendar c = Calendar.getInstance();
        c.setTime(start);
        c.add(Calendar.DAY_OF_MONTH, dayDelta);
        Date newStart = c.getTime();
        todayTask.setStart(newStart);
        c.setTime(end);
        c.add(Calendar.DAY_OF_MONTH, dayDelta);
        Date newEnd = c.getTime();
        todayTask.setEnd(newEnd);
        return dao.updateByPrimaryKey(todayTask);
    }

    @Override
    public String completeTask(Long id) {
        Task task = dao.selectByPrimaryKey(id);
        if (task == null || task.getStatus() != 0) {
            return "这条记录已经被标注过,不能重复标注!";
        }
        long day = (System.currentTimeMillis() - task.getStart().getTime()) / 86400000L;
        if (day >= 7L) {
            return "这条记录的状态修改时间超过了限制!请在7天内操作!";
        }
        task.setStatus(1);
        dao.updateByPrimaryKey(task);
        return null;
    }

    @Override
    public String loseTask(Long id) {
        Task task = dao.selectByPrimaryKey(id);
        if (task == null || task.getStatus() != 0) {
            return "这条记录已经被标注过,不能重复标注!";
        }
        long day = (System.currentTimeMillis() - task.getStart().getTime()) / 86400000L;
        if (day >= 7L) {
            return "这条记录的状态修改时间超过了限制!请在7天内操作!";
        }
        task.setStatus(2);
        dao.updateByPrimaryKey(task);
        return null;
    }
}