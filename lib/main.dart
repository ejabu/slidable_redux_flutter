// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:reduxSlidable/fas_copy/flutter_architecture_samples.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxSlidable/actions/actions.dart';
import 'package:reduxSlidable/localization.dart';
import 'package:reduxSlidable/middleware/store_todos_middleware.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/presentation/home_screen.dart';
import 'package:reduxSlidable/reducers/app_state_reducer.dart';

void main() {
  runApp(ReduxApp());
}

class ReduxApp extends StatefulWidget {
  @override
  ReduxAppState createState() {
    return new ReduxAppState();
  }
}

class ReduxAppState extends State<ReduxApp> {
  @override
  void initState() {
    super.initState();
  }

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreTodosMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Slidable Redux",
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          ReduxLocalizationsDelegate(),
        ],

        routes: {
          '/': (context) {
            return StoreBuilder<AppState>(
              onInit: (store) {
                store.dispatch(LoadTodosAction());
              },
              builder: (context, store) {
                return HomeScreen(slidable: true);
              },
            );
          },
          '/no_slidable': (context) {
            return StoreBuilder<AppState>(
              onInit: (store) {
                store.dispatch(LoadTodosAction());
              },
              builder: (context, store) {
                return HomeScreen(slidable: false);
              },
            );
          }
        },
        // home: StoreBuilder<AppState>(
        //   onInit: (store) {
        //     store.dispatch(LoadTodosAction());
        //   },
        //   builder: (context, store) {
        //     return HomeScreen();
        //   },
        // ),
      ),
    );
  }
}
