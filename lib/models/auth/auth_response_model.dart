import 'package:app_mobile/models/auth/auth_jwt_model.dart';
import 'package:app_mobile/models/user/user_model.dart';

class AuthLoginResponseModel {
  AuthJwtModel? jwt;
  UserModel? user;

  AuthLoginResponseModel({this.jwt, this.user});

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginResponseModel(
      jwt: json['jwt'] != null ? AuthJwtModel.fromJson(json['jwt']) : null,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jwt != null) {
      data['jwt'] = jwt!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
