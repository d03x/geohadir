class UserModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  bool? isAdmin;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isAdmin,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
