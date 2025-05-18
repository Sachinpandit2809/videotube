
class UserModel1 {
  int? statusCode;
  Data? data;
  String? message;
  bool? success;

  UserModel1({this.statusCode, this.data, this.message, this.success});

  UserModel1.fromJson(Map<String, dynamic> json) {
    if(json["statusCode"] is int) {
      statusCode = json["statusCode"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["success"] is bool) {
      success = json["success"];
    }
  }

  static List<UserModel1> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["statusCode"] = statusCode;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["message"] = message;
    _data["success"] = success;
    return _data;
  }
}

class Data {
  String? id;
  String? username;
  String? email;
  String? fullname;
  String? avatar;
  String? coverImage;
  List<dynamic>? watchHistory;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({this.id, this.username, this.email, this.fullname, this.avatar, this.coverImage, this.watchHistory, this.createdAt, this.updatedAt, this.v});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["fullname"] is String) {
      fullname = json["fullname"];
    }
    if(json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if(json["coverImage"] is String) {
      coverImage = json["coverImage"];
    }
    if(json["watchHistory"] is List) {
      watchHistory = json["watchHistory"] ?? [];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["username"] = username;
    _data["email"] = email;
    _data["fullname"] = fullname;
    _data["avatar"] = avatar;
    _data["coverImage"] = coverImage;
    if(watchHistory != null) {
      _data["watchHistory"] = watchHistory;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}