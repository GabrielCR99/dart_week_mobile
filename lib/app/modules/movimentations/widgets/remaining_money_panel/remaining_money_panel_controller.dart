import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/total_move_item_model.dart';
import 'package:dart_week_mobile/app/models/total_move_model.dart';
import 'package:dart_week_mobile/app/repositories/move_repositories.dart';
import 'package:dart_week_mobile/app/utils/store_utils.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'remaining_money_panel_controller.g.dart';

class RemainingMoneyPanelController = _RemainingMoneyPanelControllerBase
    with _$RemainingMoneyPanelController;

abstract class _RemainingMoneyPanelControllerBase with Store {
  final MoveRepositories moveRepositories;

  @observable
  DateTime date = DateTime.now();

  _RemainingMoneyPanelControllerBase(this.moveRepositories);

  @computed
  String get yearMonth => DateFormat('yyyyMM').format(date);

  @action
  nextMonth() {
    date = DateTime(date.year, date.month + 1, 1);
  }

  @action
  previousMonth() {
    date = DateTime(date.year, date.month - 1, 1);
  }

  @observable
  String errorMessage;

  @observable
  ObservableFuture<TotalMoveModel> _totalMove;

  @computed
  StoreState get totalState => StoreUtils.statusCheck(_totalMove);

  @observable
  TotalMoveModel totalMoveModel;

  @action
  searchTotalMonth() async {
    try {
      errorMessage = '';
      _totalMove = ObservableFuture(moveRepositories.getTotalMonth(yearMonth));
      totalMoveModel = await _totalMove;
    } catch (e) {}
  }
}
