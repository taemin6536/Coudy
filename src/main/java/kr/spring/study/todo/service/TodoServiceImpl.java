package kr.spring.study.todo.service;


import kr.spring.study.todo.dao.TodoMapper;
import kr.spring.study.todo.vo.TodoVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {


    private final TodoMapper todoMapper;

    @Override
    public void createTodo(TodoVO todoVO) {
        todoMapper.createTodo(todoVO);
    }

    @Override
    public List<TodoVO> selectTodos(int memNum, int studyNum) {
        return todoMapper.selectTodos(memNum, studyNum);
    }
    @Override
    public void deleteTodo(int todoNum) {
        todoMapper.deleteTodo(todoNum);
    }

    @Override
    public void modifyTodo(TodoVO todoVO) {
        todoMapper.modifyTodo(todoVO);

    }

    @Override
    public void nextStepTodo(TodoVO todoVO) {
        todoMapper.updateProgressTodo(todoVO);
    }

    @Override
    public List<TodoVO> findProgressingTodos(int studyNum, int memNum) {
        return todoMapper.selectProgressingTodos(studyNum,memNum);
    }
}
