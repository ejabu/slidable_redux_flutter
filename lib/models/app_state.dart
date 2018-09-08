// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:reduxSlidable/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Todo> todos;
  final List<Category> categories;
  final AppTab activeTab;
  final String categoryPicker;

  AppState({
    this.isLoading = false,
    this.todos = const [],
    this.categories = const [],
    this.categoryPicker = "Category A",
    this.activeTab = AppTab.todos,
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Todo> todos,
    List<Category> categories,
    AppTab activeTab,
    String categoryPicker,
    String queryFilter,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
      categories: categories ?? this.categories,
      activeTab: activeTab ?? this.activeTab,
      categoryPicker: categoryPicker ?? this.categoryPicker,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      todos.hashCode ^
      categories.hashCode ^
      activeTab.hashCode ^
      categoryPicker.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          todos == other.todos &&
          categories == other.categories &&
          activeTab == other.activeTab &&
          categoryPicker == other.categoryPicker;

  @override
  String toString() {
    return 'AppState';
  }
}
