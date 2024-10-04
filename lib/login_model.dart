// class LoginModel {
//   bool? status;
//   String? message;
//   LoginData? data;
//   String? token;

//   LoginModel({this.status, this.message, this.data, this.token});

//   LoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }

// class LoginData {
//   OldUser? oldUser;

//   LoginData({this.oldUser});

//   LoginData.fromJson(Map<String, dynamic> json) {
//     oldUser =
//         json['oldUser'] != null ? new OldUser.fromJson(json['oldUser']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.oldUser != null) {
//       data['oldUser'] = this.oldUser!.toJson();
//     }
//     return data;
//   }
// }

// class OldUser {
//   String? sId;
//   String? username;
//   String? email;
//   String? otp;
//   String? phone;
//   int? iV;

//   OldUser({this.sId, this.username, this.email, this.otp, this.phone, this.iV});

//   OldUser.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     username = json['username'];
//     email = json['email'];
//     otp = json['otp'];
//     phone = json['phone'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['otp'] = this.otp;
//     data['phone'] = this.phone;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
class LoginModel {
  bool? status;
  String? message;
  LoginDatat? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LoginDatat.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginDatat {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  LoginDatat(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});

  LoginDatat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['token'] = this.token;
    return data;
  }
}
