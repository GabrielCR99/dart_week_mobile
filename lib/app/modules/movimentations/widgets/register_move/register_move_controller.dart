import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:dart_week_mobile/app/repositories/categories_repository.dart';
import 'package:dart_week_mobile/app/repositories/move_repositories.dart';
import 'package:dart_week_mobile/app/utils/store_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_move_controller.g.dart';

class RegisterMoveController = _RegisterMoveControllerBase
    with _$RegisterMoveController;

abstract class _RegisterMoveControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final moneyController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  CategoryRepository _categoryRepository = Modular.get<CategoryRepository>();

  MoveRepositories _moveRepositories = Modular.get<MoveRepositories>();

  @observable
  DateTime includedDate = DateTime.now();

  @observable
  String errorMessage;

  @observable
  String selectedType;

  @observable
  List<CategoryModel> categories;

  @observable
  bool isCategoryValid = true;

  @observable
  CategoryModel category;

  @observable
  String description;

  @observable
  double value;

  @action
  void changeDescription(String description) {
    this.description = description;
  }

  @action
  void changeCategory(CategoryModel categoryModel) {
    category = categoryModel;
  }

  @action
  void changeValue(double value) {
    this.value = value;
  }

  @action
  void setIncludedDate(DateTime date) {
    includedDate = date;
  }

  @observable
  ObservableFuture<List<CategoryModel>> _futureCategories;

  @computed
  StoreState get categoriesStatus => StoreUtils.statusCheck(_futureCategories);

  @action
  Future<void> searchCategories(String type) async {
    try {
      selectedType = type;
      _futureCategories =
          ObservableFuture(_categoryRepository.getCategories(type));
      List<CategoryModel> categoriesModel = await _futureCategories;
      this.categories = categoriesModel;
    } catch (e) {
      errorMessage = 'Erro ao buscar categoria!';
      print(e);
    }
  }

  @observable
  ObservableFuture _saveFutureMovimentation;

  @computed
  StoreState get saveMovimentationStatus =>
      StoreUtils.statusCheck(_saveFutureMovimentation);

  @action
  Future<void> saveMove() async {
    try {
      if (formKey.currentState.validate()) {
        if (category == null) {
          isCategoryValid = false;
        } else {
          _saveFutureMovimentation = ObservableFuture(
            _moveRepositories.saveMovimentation(
              category.id,
              includedDate,
              description,
              moneyController.numberValue,
            ),
          );
          await _saveFutureMovimentation;
        }
      } else {
        if (category == null) {
          isCategoryValid = false;
        }
      }
    } catch (e) {}
  }

  @action
  resetForm() {
    changeCategory(null);
    changeDescription('');
    moneyController.text = '';
    isCategoryValid = true;
  }
}
