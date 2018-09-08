// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:reduxSlidable/actions/actions.dart';
import 'package:reduxSlidable/models/models.dart';

final categoriesReducer = combineReducers<List<Category>>([
  TypedReducer<List<Category>, CategoriesLoadedAction>(_setLoadedCategories),
]);

List<Category> _setLoadedCategories(
    List<Category> category, CategoriesLoadedAction action) {
  return action.category;
}
