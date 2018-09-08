// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reduxSlidable/fas_copy/flutter_architecture_samples.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/presentation/todo_item.dart';
import 'package:reduxSlidable/presentation/todo_item.noSlidable.dart';

class TodoList extends StatelessWidget {
  final bool viewSlidable;
  final List<Todo> todos;
  final Function(Todo) incrementItem;
  final Function(Todo) decrementItem;
  final Function(Todo) zeroItem;

  TodoList({
    Key key,
    @required this.viewSlidable,
    @required this.todos,
    @required this.incrementItem,
    @required this.decrementItem,
    @required this.zeroItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  ListView _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.only(right: 4.0, left: 4.0, bottom: 140.0),
      key: ArchSampleKeys.todoList,
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];
        if (this.viewSlidable) {
          return TodoItem(
            todo: todo,
            onDismissed: (direction) {},
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              incrementItem(todo);
            },
            onMinusTap: () {
              decrementItem(todo);
            },
            onZeroTap: () {
              zeroItem(todo);
            },
          );
        } else {
          return TodoItemNoSlidable(
            todo: todo,
            onDismissed: (direction) {},
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              incrementItem(todo);
            },
            onMinusTap: () {
              decrementItem(todo);
            },
            onZeroTap: () {
              zeroItem(todo);
            },
          );
        }
      },
    );
  }
}
