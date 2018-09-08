// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:intl/intl.dart';

class TodoItemNoSlidable extends StatefulWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final GestureTapCallback onMinusTap;
  final GestureTapCallback onZeroTap;
  final Todo todo;

  TodoItemNoSlidable({
    @required this.onDismissed,
    @required this.onTap,
    @required this.onMinusTap,
    @required this.onZeroTap,
    @required this.todo,
  });

  @override
  TodoItemNoSlidableState createState() {
    return new TodoItemNoSlidableState();
  }
}

class TodoItemNoSlidableState extends State<TodoItemNoSlidable> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("###,###.###", "pt-br");
    String priceFormatted = formatter.format(widget.todo.price);

    final leftSection = Container(
      child: Container(
        alignment: Alignment.center,
        width: 55.0,
        height: 55.0,
        color: Colors.amberAccent,
        child: Text(
          "${widget.todo.quantity}",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );

    final middleSection = Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 18.0, bottom: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "${widget.todo.task}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            Text(
              "\$ $priceFormatted",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );

    final rightSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
              onTap: widget.onMinusTap,
              child: Container(
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                width: 55.0,
                height: 55.0,
                child: Text(
                  "-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );

    Widget _buildTodoContent(BuildContext context) {
      return Column(
        children: <Widget>[
          Divider(
            height: 0.0,
            indent: 1.0,
          ),
          ListTile(
            onTap: () {
              widget.onTap();
            },
            title: Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  leftSection,
                  middleSection,
                  rightSection,
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Without Slidable
    return _buildTodoContent(context);
  }
}
