class ProfileModel {
  String? status;
  int? statusCode;
  ProfileData? profileData;

  ProfileModel({this.status, this.statusCode, this.profileData});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    profileData = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (profileData != null) {
      data['data'] = profileData!.toJson();
    }
    return data;
  }
}

class ProfileData {
  int? id;
  String? companyName;
  String? address;
  String? email;
  String? phone;
  String? fax;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  bool? block;
  dynamic deposit;
  int? userId;
  String? dob;
  String? qrCode;
  User? user;

  ProfileData({
    this.id,
    this.companyName,
    this.address,
    this.email,
    this.phone,
    this.fax,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.block,
    this.deposit,
    this.userId,
    this.dob,
    this.qrCode,
    this.user,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    fax = json['fax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    block = json['block'];
    deposit = json['deposit'];
    userId = json['user_id'];
    dob = json['dob'];
    qrCode = json['qr_code'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['fax'] = fax;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['deposit'] = deposit;
    data['user_id'] = userId;
    data['dob'] = dob;
    data['qr_code'] = qrCode;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? emailVerifiedAt;
  bool? active;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  int? userTypeId;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.active,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.userTypeId
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    userTypeId = json['user_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['active'] = active;
    data['last_login'] = lastLogin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['avatar'] = avatar;
    data['user_type_id'] = userTypeId;
    return data;
  }
}