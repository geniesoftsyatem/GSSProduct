/// status : 201
/// error : null
/// messages : {"success":"Otp generated successfully"}
/// otp : "1081"

class Generate_otp {
  Generate_otp({
      int? status, 
      dynamic error, 
      Messages? messages, 
      int? otp,}){
    _status = status;
    _error = error;
    _messages = messages;
    _otp = otp;
}

  Generate_otp.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    _otp = json['otp'];
  }
  int? _status;
  dynamic _error;
  Messages? _messages;
  int? _otp;

  int? get status => _status;
  dynamic get error => _error;
  Messages? get messages => _messages;
  int? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    map['otp'] = _otp;
    return map;
  }

}

/// success : "Otp generated successfully"

class Messages {
  Messages({
      String? success,}){
    _success = success;
}

  Messages.fromJson(dynamic json) {
    _success = json['success'];
  }
  String? _success;

  String? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }

}