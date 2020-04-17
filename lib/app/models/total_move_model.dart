import 'dart:convert';

import 'package:dart_week_mobile/app/models/total_move_item_model.dart';

class TotalMoveModel {
  double total;
  double remainingMoney;
  TotalMoveItemModel recipes;
  TotalMoveItemModel expenses;

  TotalMoveModel({
    this.total,
    this.remainingMoney,
    this.recipes,
    this.expenses,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'remainingMoney': remainingMoney,
      'recipes': recipes.toMap(),
      'expenses': expenses.toMap(),
    };
  }

  static TotalMoveModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TotalMoveModel(
      total: map['total'],
      remainingMoney: map['remainingMoney'],
      recipes: TotalMoveItemModel.fromMap(map['recipes']),
      expenses: TotalMoveItemModel.fromMap(map['expenses']),
    );
  }

  String toJson() => json.encode(toMap());

  static TotalMoveModel fromJson(String source) => fromMap(json.decode(source));
}
