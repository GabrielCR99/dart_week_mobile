import 'package:dart_week_mobile/app/core/custom_dio.dart';
import 'package:dart_week_mobile/app/models/category_model.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategories(String type) {
    final dio = CustomDio.withAuthentication().instance;
    return dio.get('/categories/$type').then((res) =>
        res.data.map<CategoryModel>((c) => CategoryModel.fromMap(c)).toList());
  }
}
