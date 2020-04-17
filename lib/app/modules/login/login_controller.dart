import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/utils/store_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final UserRepository userRepository;
  _LoginControllerBase(this.userRepository);

  @observable
  String login;

  @observable
  String password;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changePasswod(String passwordValue) => password = passwordValue;

  @observable
  ObservableFuture<bool> _futureLogin;

  @computed
  StoreState get state => StoreUtils.statusCheck(_futureLogin);

  @observable
  String errorMessage;

  @observable
  bool isLoginSuccess;

  @action
  Future<void> requestLogin() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        isLoginSuccess = null;
        _futureLogin = ObservableFuture(userRepository.login(login, password));
        isLoginSuccess = await _futureLogin;
      } catch (e) {
        errorMessage = 'Erro ao realizar login: $e';
      }
    }
  }
}
