// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimentations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovimentationsController on _MovimentationsControllerBase, Store {
  Computed<StoreState> _$moveStateComputed;

  @override
  StoreState get moveState =>
      (_$moveStateComputed ??= Computed<StoreState>(() => super.moveState))
          .value;

  final _$errorMessageAtom =
      Atom(name: '_MovimentationsControllerBase.errorMessage');

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

  final _$_futureMovesAtom =
      Atom(name: '_MovimentationsControllerBase._futureMoves');

  @override
  ObservableFuture<List<MovimentationModel>> get _futureMoves {
    _$_futureMovesAtom.context.enforceReadPolicy(_$_futureMovesAtom);
    _$_futureMovesAtom.reportObserved();
    return super._futureMoves;
  }

  @override
  set _futureMoves(ObservableFuture<List<MovimentationModel>> value) {
    _$_futureMovesAtom.context.conditionallyRunInAction(() {
      super._futureMoves = value;
      _$_futureMovesAtom.reportChanged();
    }, _$_futureMovesAtom, name: '${_$_futureMovesAtom.name}_set');
  }

  final _$movesAtom = Atom(name: '_MovimentationsControllerBase.moves');

  @override
  ObservableList<MovimentationModel> get moves {
    _$movesAtom.context.enforceReadPolicy(_$movesAtom);
    _$movesAtom.reportObserved();
    return super.moves;
  }

  @override
  set moves(ObservableList<MovimentationModel> value) {
    _$movesAtom.context.conditionallyRunInAction(() {
      super.moves = value;
      _$movesAtom.reportChanged();
    }, _$movesAtom, name: '${_$movesAtom.name}_set');
  }

  final _$searchMovimentationAsyncAction = AsyncAction('searchMovimentation');

  @override
  Future<void> searchMovimentation() {
    return _$searchMovimentationAsyncAction
        .run(() => super.searchMovimentation());
  }

  @override
  String toString() {
    final string =
        'errorMessage: ${errorMessage.toString()},moves: ${moves.toString()},moveState: ${moveState.toString()}';
    return '{$string}';
  }
}
