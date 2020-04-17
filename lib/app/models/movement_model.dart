import 'dart:convert';

import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:intl/intl.dart';

class MovimentationModel {
  int id;
  DateTime moveDate;
  String description;
  double value;
  CategoryModel category;

  MovimentationModel({
    this.id,
    this.moveDate,
    this.description,
    this.value,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moveDate': moveDate.millisecondsSinceEpoch,
      'description': description,
      'value': value,
      'category': category.toMap(),
    };
  }

  static MovimentationModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var format = DateFormat('y-M-d');

    return MovimentationModel(
      id: map['id'],
      moveDate: format.parse(map['movimentationDate']),
      description: map['description'],
      value: map['value'],
      category: CategoryModel.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentationModel fromJson(String source) =>
      fromMap(json.decode(source));
}
