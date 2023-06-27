class BannerInformationModel {
  String? status;
  int? statusCode;
  List<BannerInformationData>? bannerInformationData;

  BannerInformationModel({this.status, this.statusCode, this.bannerInformationData});

  BannerInformationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      bannerInformationData = <BannerInformationData>[];
      json['data'].forEach((v) {
        bannerInformationData!.add(BannerInformationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    if (bannerInformationData != null) {
      data['data'] = bannerInformationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerInformationData {
  int? id;
  String? type;
  String? link;
  String? description;
  bool? isActive;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<BannerInformationMedia>? bannerInformationMedia;

  BannerInformationData({
    this.id,
    this.type,
    this.link,
    this.description,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.bannerInformationMedia
  });

  BannerInformationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    link = json['link'];
    description = json['description'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      bannerInformationMedia = <BannerInformationMedia>[];
      json['media'].forEach((v) {
        bannerInformationMedia!.add(BannerInformationMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['link'] = link;
    data['description'] = description;
    data['is_active'] = isActive;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (bannerInformationMedia != null) {
      data['media'] = bannerInformationMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerInformationMedia {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  BannerInformationMedia({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  BannerInformationMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['uuid'] = uuid;
    data['collection_name'] = collectionName;
    data['name'] = name;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['disk'] = disk;
    data['conversions_disk'] = conversionsDisk;
    data['size'] = size;
    data['order_column'] = orderColumn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}