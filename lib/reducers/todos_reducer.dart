// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:reduxSlidable/actions/actions.dart';
import 'package:reduxSlidable/models/models.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, DeleteTodoAction>(_deleteTodo),
  TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
]);

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {
  return List.from(todos)..add(action.todo);
}

List<Todo> _deleteTodo(List<Todo> todos, DeleteTodoAction action) {
  return todos.where((todo) => todo.id != action.id).toList();
}

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action) {
  return todos
      .map((todo) => todo.id == action.id ? action.updatedTodo : todo)
      .toList();
}

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action) {
  return action.todos;
}

List<Todo> _setNoTodos(List<Todo> todos, TodosNotLoadedAction action) {
  return [];
}
