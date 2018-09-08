// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxSlidable/actions/actions.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/presentation/todo_list.dart';
import 'package:reduxSlidable/selectors/selectors.dart';

class FilteredTodos extends StatelessWidget {
  final bool viewSlidable;

  FilteredTodos({
    Key key,
    @required this.viewSlidable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return TodoList(
          viewSlidable: viewSlidable,
          todos: vm.todos,
          incrementItem: vm.incrementItem,
          decrementItem: vm.decrementItem,
          zeroItem: vm.zeroItem,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Todo> todos;
  final bool loading;
  final Function(Todo) incrementItem;
  final Function(Todo) decrementItem;
  final Function(Todo) zeroItem;

  _ViewModel({
    @required this.todos,
    @required this.loading,
    @required this.incrementItem,
    @required this.decrementItem,
    @required this.zeroItem,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      todos: filteredTodosSelector(
        todosSelector(store.state),
        store.state.categoryPicker,
      ),
      loading: store.state.isLoading,
      incrementItem: (todo) {
        store.dispatch(UpdateTodoAction(
          todo.id,
          todo.copyWith(quantity: todo.quantity + 1),
        ));
      },
      decrementItem: (todo) {
        if (todo.quantity > 0) {
          store.dispatch(UpdateTodoAction(
            todo.id,
            todo.copyWith(quantity: todo.quantity - 1),
          ));
        }
      },
      zeroItem: (todo) {
        if (todo.quantity > 0) {
          store.dispatch(UpdateTodoAction(
            todo.id,
            todo.copyWith(quantity: 0),
          ));
        }
      },
    );
  }
}
