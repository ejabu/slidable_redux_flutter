import 'dart:async';
import 'dart:core';

class CategRepositoryFlutter {
  const CategRepositoryFlutter();

  Future<List> loadCateg() async {
    return [
      "Category A",
      "Category B",
      "Category C",
      "Category D",
      "Category E",
      "Category F",
    ];
  }
}
