class LoginModel {
  String? status;
  int? statusCode;
  LoginData? loginData;

  LoginModel({this.status, this.statusCode, this.loginData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    loginData = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (loginData != null) {
      data['data'] = loginData!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  bool? isActive;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? lastLogin;
  String? accessToken;
  String? tokenType;

  LoginData({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
    this.accessToken,
    this.tokenType
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLogin = json['last_login'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['last_login'] = lastLogin;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}