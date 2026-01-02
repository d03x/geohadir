class AuthLoginValidationModel {
  List<String>? email;
  List<String>? password;

  AuthLoginValidationModel({this.email, this.password});

  AuthLoginValidationModel.fromJson(Map<String, dynamic> json) {
    if (json['email'] != null) {
      email = json['email'].cast<String>();
    }
    if (json['password'] != null) {
      password = json['password'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
