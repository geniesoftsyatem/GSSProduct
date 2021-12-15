/// response : "success"
/// message : "login successfull"

class Login_model {
  Login_model({
      String? response, 
      String? message,}){
    _response = response;
    _message = message;
}

  Login_model.fromJson(dynamic json) {
    _response = json['response'];
    _message = json['message'];
  }
  String? _response;
  String? _message;

  String? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }
}