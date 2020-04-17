// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_move_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterMoveController on _RegisterMoveControllerBase, Store {
  Computed<StoreState> _$categoriesStatusComputed;

  @override
  StoreState get categoriesStatus => (_$categoriesStatusComputed ??=
          Computed<StoreState>(() => super.categoriesStatus))
      .value;
  Computed<StoreState> _$saveMovimentationStatusComputed;

  @override
  StoreState get saveMovimentationStatus =>
      (_$saveMovimentationStatusComputed ??=
              Computed<StoreState>(() => super.saveMovimentationStatus))
          .value;

  final _$includedDateAtom =
      Atom(name: '_RegisterMoveControllerBase.includedDate');

  @override
  DateTime get includedDate {
    _$includedDateAtom.context.enforceReadPolicy(_$includedDateAtom);
    _$includedDateAtom.reportObserved();
    return super.includedDate;
  }

  @override
  set includedDate(DateTime value) {
    _$includedDateAtom.context.conditionallyRunInAction(() {
      super.includedDate = value;
      _$includedDateAtom.reportChanged();
    }, _$includedDateAtom, name: '${_$includedDateAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_RegisterMoveControllerBase.errorMessage');

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

  final _$selectedTypeAtom =
      Atom(name: '_RegisterMoveControllerBase.selectedType');

  @override
  String get selectedType {
    _$selectedTypeAtom.context.enforceReadPolicy(_$selectedTypeAtom);
    _$selectedTypeAtom.reportObserved();
    return super.selectedType;
  }

  @override
  set selectedType(String value) {
    _$selectedTypeAtom.context.conditionallyRunInAction(() {
      super.selectedType = value;
      _$selectedTypeAtom.reportChanged();
    }, _$selectedTypeAtom, name: '${_$selectedTypeAtom.name}_set');
  }

  final _$categoriesAtom = Atom(name: '_RegisterMoveControllerBase.categories');

  @override
  List<CategoryModel> get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(List<CategoryModel> value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$isCategoryValidAtom =
      Atom(name: '_RegisterMoveControllerBase.isCategoryValid');

  @override
  bool get isCategoryValid {
    _$isCategoryValidAtom.context.enforceReadPolicy(_$isCategoryValidAtom);
    _$isCategoryValidAtom.reportObserved();
    return super.isCategoryValid;
  }

  @override
  set isCategoryValid(bool value) {
    _$isCategoryValidAtom.context.conditionallyRunInAction(() {
      super.isCategoryValid = value;
      _$isCategoryValidAtom.reportChanged();
    }, _$isCategoryValidAtom, name: '${_$isCategoryValidAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_RegisterMoveControllerBase.category');

  @override
  CategoryModel get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(CategoryModel value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$descriptionAtom =
      Atom(name: '_RegisterMoveControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_RegisterMoveControllerBase.value');

  @override
  double get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_futureCategoriesAtom =
      Atom(name: '_RegisterMoveControllerBase._futureCategories');

  @override
  ObservableFuture<List<CategoryModel>> get _futureCategories {
    _$_futureCategoriesAtom.context.enforceReadPolicy(_$_futureCategoriesAtom);
    _$_futureCategoriesAtom.reportObserved();
    return super._futureCategories;
  }

  @override
  set _futureCategories(ObservableFuture<List<CategoryModel>> value) {
    _$_futureCategoriesAtom.context.conditionallyRunInAction(() {
      super._futureCategories = value;
      _$_futureCategoriesAtom.reportChanged();
    }, _$_futureCategoriesAtom, name: '${_$_futureCategoriesAtom.name}_set');
  }

  final _$_saveFutureMovimentationAtom =
      Atom(name: '_RegisterMoveControllerBase._saveFutureMovimentation');

  @override
  ObservableFuture<dynamic> get _saveFutureMovimentation {
    _$_saveFutureMovimentationAtom.context
        .enforceReadPolicy(_$_saveFutureMovimentationAtom);
    _$_saveFutureMovimentationAtom.reportObserved();
    return super._saveFutureMovimentation;
  }

  @override
  set _saveFutureMovimentation(ObservableFuture<dynamic> value) {
    _$_saveFutureMovimentationAtom.context.conditionallyRunInAction(() {
      super._saveFutureMovimentation = value;
      _$_saveFutureMovimentationAtom.reportChanged();
    }, _$_saveFutureMovimentationAtom,
        name: '${_$_saveFutureMovimentationAtom.name}_set');
  }

  final _$searchCategoriesAsyncAction = AsyncAction('searchCategories');

  @override
  Future<void> searchCategories(String type) {
    return _$searchCategoriesAsyncAction
        .run(() => super.searchCategories(type));
  }

  final _$saveMoveAsyncAction = AsyncAction('saveMove');

  @override
  Future<void> saveMove() {
    return _$saveMoveAsyncAction.run(() => super.saveMove());
  }

  final _$_RegisterMoveControllerBaseActionController =
      ActionController(name: '_RegisterMoveControllerBase');

  @override
  void changeDescription(String description) {
    final _$actionInfo =
        _$_RegisterMoveControllerBaseActionController.startAction();
    try {
      return super.changeDescription(description);
    } finally {
      _$_RegisterMoveControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCategory(CategoryModel categoryModel) {
    final _$actionInfo =
        _$_RegisterMoveControllerBaseActionController.startAction();
    try {
      return super.changeCategory(categoryModel);
    } finally {
      _$_RegisterMoveControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValue(double value) {
    final _$actionInfo =
        _$_RegisterMoveControllerBaseActionController.startAction();
    try {
      return super.changeValue(value);
    } finally {
      _$_RegisterMoveControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIncludedDate(DateTime date) {
    final _$actionInfo =
        _$_RegisterMoveControllerBaseActionController.startAction();
    try {
      return super.setIncludedDate(date);
    } finally {
      _$_RegisterMoveControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'includedDate: ${includedDate.toString()},errorMessage: ${errorMessage.toString()},selectedType: ${selectedType.toString()},categories: ${categories.toString()},isCategoryValid: ${isCategoryValid.toString()},category: ${category.toString()},description: ${description.toString()},value: ${value.toString()},categoriesStatus: ${categoriesStatus.toString()},saveMovimentationStatus: ${saveMovimentationStatus.toString()}';
    return '{$string}';
  }
}
