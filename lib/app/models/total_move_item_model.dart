import 'dart:convert';

class TotalMoveItemModel {
  double total;
  String type;

  TotalMoveItemModel({
    this.total,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'type': type,
    };
  }

  static TotalMoveItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TotalMoveItemModel(
      total: map['total'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  static TotalMoveItemModel fromJson(String source) =>
      fromMap(json.decode(source));
}
