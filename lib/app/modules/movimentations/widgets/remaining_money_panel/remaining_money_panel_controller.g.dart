// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remaining_money_panel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RemainingMoneyPanelController
    on _RemainingMoneyPanelControllerBase, Store {
  Computed<String> _$yearMonthComputed;

  @override
  String get yearMonth =>
      (_$yearMonthComputed ??= Computed<String>(() => super.yearMonth)).value;
  Computed<StoreState> _$totalStateComputed;

  @override
  StoreState get totalState =>
      (_$totalStateComputed ??= Computed<StoreState>(() => super.totalState))
          .value;

  final _$dateAtom = Atom(name: '_RemainingMoneyPanelControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_RemainingMoneyPanelControllerBase.errorMessage');

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

  final _$_totalMoveAtom =
      Atom(name: '_RemainingMoneyPanelControllerBase._totalMove');

  @override
  ObservableFuture<TotalMoveModel> get _totalMove {
    _$_totalMoveAtom.context.enforceReadPolicy(_$_totalMoveAtom);
    _$_totalMoveAtom.reportObserved();
    return super._totalMove;
  }

  @override
  set _totalMove(ObservableFuture<TotalMoveModel> value) {
    _$_totalMoveAtom.context.conditionallyRunInAction(() {
      super._totalMove = value;
      _$_totalMoveAtom.reportChanged();
    }, _$_totalMoveAtom, name: '${_$_totalMoveAtom.name}_set');
  }

  final _$totalMoveModelAtom =
      Atom(name: '_RemainingMoneyPanelControllerBase.totalMoveModel');

  @override
  TotalMoveModel get totalMoveModel {
    _$totalMoveModelAtom.context.enforceReadPolicy(_$totalMoveModelAtom);
    _$totalMoveModelAtom.reportObserved();
    return super.totalMoveModel;
  }

  @override
  set totalMoveModel(TotalMoveModel value) {
    _$totalMoveModelAtom.context.conditionallyRunInAction(() {
      super.totalMoveModel = value;
      _$totalMoveModelAtom.reportChanged();
    }, _$totalMoveModelAtom, name: '${_$totalMoveModelAtom.name}_set');
  }

  final _$searchTotalMonthAsyncAction = AsyncAction('searchTotalMonth');

  @override
  Future searchTotalMonth() {
    return _$searchTotalMonthAsyncAction.run(() => super.searchTotalMonth());
  }

  final _$_RemainingMoneyPanelControllerBaseActionController =
      ActionController(name: '_RemainingMoneyPanelControllerBase');

  @override
  dynamic nextMonth() {
    final _$actionInfo =
        _$_RemainingMoneyPanelControllerBaseActionController.startAction();
    try {
      return super.nextMonth();
    } finally {
      _$_RemainingMoneyPanelControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousMonth() {
    final _$actionInfo =
        _$_RemainingMoneyPanelControllerBaseActionController.startAction();
    try {
      return super.previousMonth();
    } finally {
      _$_RemainingMoneyPanelControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},errorMessage: ${errorMessage.toString()},totalMoveModel: ${totalMoveModel.toString()},yearMonth: ${yearMonth.toString()},totalState: ${totalState.toString()}';
    return '{$string}';
  }
}
