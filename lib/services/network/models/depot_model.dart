class DepotModel {
  String? status;
  int? statusCode;
  List<DepotData>? depotData;

  DepotModel({this.status, this.statusCode, this.depotData});

  DepotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      depotData = <DepotData>[];
      json['data'].forEach((v) {
        depotData!.add(DepotData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (depotData != null) {
      data['data'] = depotData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DepotData {
  int? id;
  int? leaderId;
  String? code;
  String? name;
  String? address;
  String? phone;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  DepotData({
    this.id,
    this.leaderId,
    this.code,
    this.name,
    this.address,
    this.phone,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  DepotData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaderId = json['leader_id'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['leader_id'] = leaderId;
    data['code'] = code;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}