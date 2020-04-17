import 'package:dart_week_mobile/app/core/custom_dio.dart';
import 'package:dart_week_mobile/app/models/movement_model.dart';
import 'package:dart_week_mobile/app/models/total_move_model.dart';

class MoveRepositories {
  Future<List<MovimentationModel>> getMovimentations(String yearMonth) {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get('/movimentations/$yearMonth').then((res) => res.data
        .map<MovimentationModel>((m) => MovimentationModel.fromMap(m))
        .toList());
  }

  Future<TotalMoveModel> getTotalMonth(String yearMonth) {
    var dio = CustomDio.withAuthentication().instance;
    return dio
        .get('/movimentations/total/$yearMonth')
        .then((res) => TotalMoveModel.fromMap(res.data));
  }

  Future<void> saveMovimentation(
      int category, DateTime moveDate, String description, double value) {
    var dio = CustomDio.withAuthentication().instance;
    return dio.post('/movimentations', data: {
      'category': category,
      'movimentationDate': moveDate.toIso8601String(),
      'description': description,
      'value': value,
    });
  }
}
