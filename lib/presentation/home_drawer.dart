import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Text('Slidable Redux'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Material(
            color: Colors.red,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/no_slidable');
              },
              title: Text("List Tile no Slidable"),
            ),
          ),
          Material(
            color: Colors.red,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              title: Text("List Tile With Slidable"),
            ),
          ),
        ],
      ),
    );
  }
}
