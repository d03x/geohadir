class AuthRemoteModel {
  final String accessToken;
  AuthRemoteModel({required this.accessToken});
  factory AuthRemoteModel.fromjson(Map<String, dynamic> json) {
    return AuthRemoteModel(accessToken: json['access_token']);
  }
}
