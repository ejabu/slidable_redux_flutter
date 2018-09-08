import 'package:reduxSlidable/models/models.dart';

List<Todo> todosSelector(AppState state) => state.todos;

List<Todo> filteredTodosSelector(
  List<Todo> todos,
  String category,
) {
  return todos.where((todo) {
    if (category.isNotEmpty) {
      return todo.category == category;
    }
  }).toList();
}
