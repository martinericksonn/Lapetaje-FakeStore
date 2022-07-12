import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  String username;
  String password;

  Login({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
