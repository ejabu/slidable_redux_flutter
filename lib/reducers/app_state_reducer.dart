import 'package:reduxSlidable/models/models.dart';
import 'package:reduxSlidable/reducers/todos_reducer.dart';
import 'package:reduxSlidable/reducers/category_picker.dart';
import 'package:reduxSlidable/reducers/categories_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    todos: todosReducer(state.todos, action),
    categories: categoriesReducer(state.categories, action),
    categoryPicker: categoryReducer(state.categoryPicker, action),
  );
}
