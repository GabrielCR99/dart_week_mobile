import 'package:mobx/mobx.dart';

part 'movimentations_controller.g.dart';

class MovimentationsController = _MovimentationsControllerBase
    with _$MovimentationsController;

abstract class _MovimentationsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
