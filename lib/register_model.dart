class RegisterModel {
  bool? status;
  String? message;
  RegisterData? data;

  RegisterModel({this.status, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? RegisterData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegisterData {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? otp;
  String? token;
  RegisterData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.otp,
    this.token
  });

  RegisterData.fromJson(Map<String, dynamic> json) {
    name = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['_id'] = id;
    data['token'] = token;
    data['otp'] = otp;
    return data;
  }
}
