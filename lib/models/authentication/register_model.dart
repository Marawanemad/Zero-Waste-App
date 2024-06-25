class RegisterModel {
  bool? status;
  String? name;
  String? email;
  String? phone;
  String? qr_code;
  String? token;
  // named constructor
  RegisterModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    qr_code = json['qr_code'];
    token = json['token'];
  }
}
