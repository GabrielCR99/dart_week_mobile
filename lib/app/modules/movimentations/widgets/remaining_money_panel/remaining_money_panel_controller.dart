import 'package:mobx/mobx.dart';

part 'remaining_money_panel_controller.g.dart';

class RemainingMoneyPanelController = _RemainingMoneyPanelControllerBase
    with _$RemainingMoneyPanelController;

abstract class _RemainingMoneyPanelControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
