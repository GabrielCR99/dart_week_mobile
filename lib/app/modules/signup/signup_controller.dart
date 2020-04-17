import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final UserRepository userRepository;

  _SignupControllerBase(this.userRepository);

  @observable
  String login;

  @observable
  String password;

  @observable
  String confirmPassword;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changePasswod(String passwordValue) => password = passwordValue;

  @action
  changeConfirmPassword(String confirmPasswordValue) =>
      confirmPassword = confirmPasswordValue;

  @observable
  ObservableFuture _signupFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_signupFuture);

  @observable
  String errorMessage;

  Future<void> saveUser() async {
    if (globalKey.currentState.validate()) {
      errorMessage = '';
      try {
        _signupFuture =
            ObservableFuture(userRepository.saveuser(login, password));
        await _signupFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao cadastrar usuário!';
      }
    }
  }
}
