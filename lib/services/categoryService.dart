import 'package:todoapp_flutter/models/category.dart';
import 'package:todoapp_flutter/repositories/repository.dart';

class CategoryService {
  Repository _repository;
  CategoryService() {
    _repository = Repository();
  }
  saveCategory(Category category) async {
    print(category.name);
    print(category.description);
    return await _repository.insertData('categories', category.categoryMap());
  }
}
