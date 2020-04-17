// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$loginAtom = Atom(name: '_LoginControllerBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$_futureLoginAtom = Atom(name: '_LoginControllerBase._futureLogin');

  @override
  ObservableFuture<bool> get _futureLogin {
    _$_futureLoginAtom.context.enforceReadPolicy(_$_futureLoginAtom);
    _$_futureLoginAtom.reportObserved();
    return super._futureLogin;
  }

  @override
  set _futureLogin(ObservableFuture<bool> value) {
    _$_futureLoginAtom.context.conditionallyRunInAction(() {
      super._futureLogin = value;
      _$_futureLoginAtom.reportChanged();
    }, _$_futureLoginAtom, name: '${_$_futureLoginAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$isLoginSuccessAtom =
      Atom(name: '_LoginControllerBase.isLoginSuccess');

  @override
  bool get isLoginSuccess {
    _$isLoginSuccessAtom.context.enforceReadPolicy(_$isLoginSuccessAtom);
    _$isLoginSuccessAtom.reportObserved();
    return super.isLoginSuccess;
  }

  @override
  set isLoginSuccess(bool value) {
    _$isLoginSuccessAtom.context.conditionallyRunInAction(() {
      super.isLoginSuccess = value;
      _$isLoginSuccessAtom.reportChanged();
    }, _$isLoginSuccessAtom, name: '${_$isLoginSuccessAtom.name}_set');
  }

  final _$requestLoginAsyncAction = AsyncAction('requestLogin');

  @override
  Future<void> requestLogin() {
    return _$requestLoginAsyncAction.run(() => super.requestLogin());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswod(String passwordValue) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changePasswod(passwordValue);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'login: ${login.toString()},password: ${password.toString()},errorMessage: ${errorMessage.toString()},isLoginSuccess: ${isLoginSuccess.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
