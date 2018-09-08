// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/presentation/category_picker.dart';
import 'package:reduxSlidable/actions/actions.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return MyTabbedPage(
          onCategorySelected: vm.onCategorySelected,
          categories: vm.categories,
        );
      },
    );
  }
}

class _ViewModel {
  final Function onCategorySelected;
  final List categories;

  _ViewModel({
    @required this.onCategorySelected,
    @required this.categories,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onCategorySelected: (categoryName) {
        store.dispatch(UpdateCategoryAction(categoryName));
      },
      categories:
          store.state.categories.map((category) => category.name).toList(),
    );
  }
}
