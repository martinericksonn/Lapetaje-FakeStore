import 'package:json_annotation/json_annotation.dart';

part 'cart_update.g.dart';

@JsonSerializable()
class CartUpdate {
  int? id;
  String userId;
  DateTime date;
  List<Map<String, dynamic>> products;

  CartUpdate({
    this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
  factory CartUpdate.fromJson(Map<String, dynamic> data) =>
      _$CartUpdateFromJson(data);

  Map<String, dynamic> toJson() => _$CartUpdateToJson(this);
}
