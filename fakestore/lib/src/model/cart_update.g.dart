// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartUpdate _$CartUpdateFromJson(Map<String, dynamic> json) => CartUpdate(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CartUpdateToJson(CartUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'products': instance.products,
    };
