class LoginModel {
  String? name;
  String? email;
  String? phone;
  String? qr_code;
  String? token;

  // named constructor
  LoginModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    qr_code = json['qr_code'];
    token = json['token'];
  }
}
