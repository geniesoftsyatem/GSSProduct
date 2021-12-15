/// response : "success"
/// message : "Otp sent successfull"
/// otp : 4842

class Generate_otp {
  Generate_otp({
      String? response, 
      String? message, 
      int? otp,}){
    _response = response;
    _message = message;
    _otp = otp;
}

  Generate_otp.fromJson(dynamic json) {
    _response = json['response'];
    _message = json['message'];
    _otp = json['otp'];
  }
  String? _response;
  String? _message;
  int? _otp;

  String? get response => _response;
  String? get message => _message;
  int? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['message'] = _message;
    map['otp'] = _otp;
    return map;
  }

}