// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:reduxSlidable/actions/actions.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/selectors/selectors.dart';
import 'package:reduxSlidable/tr_copy/todos_repository.dart';
import 'package:reduxSlidable/trf_copy/todos_repository_flutter.dart';
import 'categRepo.dart';

List<Middleware<AppState>> createStoreTodosMiddleware([
  TodosRepository repository = const TodosRepositoryFlutter(
    fileStorage: const FileStorage(
      '__redux_app__',
      getApplicationDocumentsDirectory,
    ),
  ),
  categRepository = const CategRepositoryFlutter(),
]) {
  final saveTodos = _createSaveTodos(repository);
  final loadTodos = _createLoadTodos(repository);
  final loadCateg = _createLoadCateg(categRepository);

  return [
    TypedMiddleware<AppState, LoadTodosAction>(loadTodos),
    TypedMiddleware<AppState, AddTodoAction>(saveTodos),
    TypedMiddleware<AppState, UpdateTodoAction>(saveTodos),
    TypedMiddleware<AppState, TodosLoadedAction>(saveTodos),
    TypedMiddleware<AppState, DeleteTodoAction>(saveTodos),
    TypedMiddleware<AppState, LoadCategAction>(loadCateg),
  ];
}

Middleware<AppState> _createSaveTodos(TodosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveTodos(
      todosSelector(store.state).map((todo) => todo.toEntity()).toList(),
    );
  };
}

Middleware<AppState> _createLoadTodos(TodosRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadTodos().then(
      (todos) {
        store.dispatch(
          TodosLoadedAction(
            todos.map(Todo.fromEntity).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(TodosNotLoadedAction()));

    next(action);
  };
}

Middleware<AppState> _createLoadCateg(CategRepositoryFlutter categRepository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    categRepository.loadCateg().then(
      (categ) {
        var chosenCateg = categ.map(Category.fromEntity).toList();
        store.dispatch(
          CategoriesLoadedAction(chosenCateg),
        );
        return chosenCateg;
      },
    ).then((categ) {
      if (categ.isNotEmpty) {
        store.dispatch(UpdateCategoryAction(categ.first.name));
      }
    });

    next(action);
  };
}
