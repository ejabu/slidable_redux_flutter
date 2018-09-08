import 'package:flutter/material.dart';
import 'package:reduxSlidable/fas_copy/flutter_architecture_samples.dart';
import 'package:reduxSlidable/containers/filtered_todos.dart';

import 'package:reduxSlidable/containers/category.dart';
import 'package:reduxSlidable/presentation/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  final bool slidable;

  HomeScreen({
    @required this.slidable,
  }) : super(key: ArchSampleKeys.homeScreen);

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 50.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 166.0,
                child: Scrollbar(
                  child: FilteredTodos(viewSlidable: slidable),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: CategoryWidget(),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerList(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Slidable Redux : $slidable",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _buildBody(),
      ),
    );
  }
}
