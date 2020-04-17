import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/movement_model.dart';
import 'package:dart_week_mobile/app/modules/movimentations/widgets/remaining_money_panel/remaining_money_panel_controller.dart';
import 'package:dart_week_mobile/app/repositories/move_repositories.dart';
import 'package:dart_week_mobile/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'movimentations_controller.g.dart';

class MovimentationsController = _MovimentationsControllerBase
    with _$MovimentationsController;

abstract class _MovimentationsControllerBase with Store {
  final MoveRepositories repository;
  final RemainingMoneyPanelController remainingMoneyController;

  _MovimentationsControllerBase(this.repository, this.remainingMoneyController);

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<MovimentationModel>> _futureMoves;

  @observable
  ObservableList<MovimentationModel> moves;

  @computed
  StoreState get moveState => StoreUtils.statusCheck(_futureMoves);

  @action
  Future<void> searchMovimentation() async {
    try {
      _futureMoves = ObservableFuture(
          repository.getMovimentations(remainingMoneyController.yearMonth));
      List<MovimentationModel> resultMoves = await _futureMoves;
      moves = resultMoves.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar movimentações';
      print(e);
    }
  }
}
