import 'package:app_mobile/models/auth/auth_login_validation_model.dart';
import 'package:app_mobile/models/user/user_model.dart';

class AuthState {
  final UserModel? currentUser;
  AuthState({this.currentUser});
}

class AuthLoginState extends AuthState {}

class AuthLoadingState extends AuthLoginState {}

class AuthValidationErrorState extends AuthState {
  AuthLoginValidationModel? errors;
  AuthValidationErrorState({this.errors});
  AuthValidationErrorState.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] != null
        ? AuthLoginValidationModel.fromJson(json['errors'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}
