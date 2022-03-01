/// status : 201
/// error : null
/// messages : {"success":"User info list successfully"}
/// userdetails : {"basicinfo":"{\"id\":\"6\",\"adminid\":null,\"code\":\"\",\"fname\":\"Subedar\",\"lname\":null,\"email\":\"test@gmail.com\",\"phone\":\"1111111111\",\"alt_mobile_no\":\"1234567860\",\"password\":\"$2y$10$IeiWYXLv40S42pAlv1pVQeSHkJuK3Kdw0mURwzKhcopX4YA4R5X6.\",\"passcode\":\"1234\",\"os\":null,\"user_status\":\"1\",\"phone_model\":\"\",\"gender\":\"male\",\"pincode\":\"\",\"address\":\"\",\"dob\":\"1988-03-09\",\"qualification\":\"1\",\"pancard\":\"ASDFG1234G\",\"adharcard\":\"123456789012\",\"maritalstatus\":\"single\",\"imei_no\":\"0\",\"demo_imei_no\":\"0\",\"is_finance\":\"0\",\"is_fl_installed\":\"0\",\"location\":\"\",\"lat\":\"19.2783961\",\"long\":\"72.8794414\",\"temp_password\":\"6681\",\"created_date\":\"2021-12-24 13:00:11\",\"expire_date\":null}","residentialinfo":"[{\"ur_id\":\"1\",\"ur_userid\":\"6\",\"ur_ownership\":\"sd\",\"ur_residingwith\":\"sdsd\",\"ur_noofyears\":\"2\",\"ur_address\":\"sadsa\",\"ur_locality\":\"sad\",\"ur_pincode\":\"33456\",\"ur_city\":\"mumbai\",\"ur_state\":\"Gujrat\"},{\"ur_id\":\"2\",\"ur_userid\":\"6\",\"ur_ownership\":\"sd\",\"ur_residingwith\":\"sa\",\"ur_noofyears\":\"5\",\"ur_address\":\"sadas\",\"ur_locality\":\"Miraoad\",\"ur_pincode\":\"401117\",\"ur_city\":\"Thane\",\"ur_state\":\"Maharastra\"},{\"ur_id\":\"3\",\"ur_userid\":\"6\",\"ur_ownership\":\"Owned\",\"ur_residingwith\":\"Family\",\"ur_noofyears\":\"Less than Six Months\",\"ur_address\":\"brand factory , Mira road \",\"ur_locality\":\"Mira road \",\"ur_pincode\":\"488065\",\"ur_city\":\"Mumbai \",\"ur_state\":\"Maharashtra \"},{\"ur_id\":\"4\",\"ur_userid\":\"6\",\"ur_ownership\":\"Owned\",\"ur_residingwith\":\"Family\",\"ur_noofyears\":\"Less than Six Months\",\"ur_address\":\"brand factory , Mira road \",\"ur_locality\":\"Mira road \",\"ur_pincode\":\"488065\",\"ur_city\":\"Mumbai \",\"ur_state\":\"Maharashtra \"}]","references":"[{\"urf_id\":\"1\",\"urf_userid\":\"6\",\"urf_name\":\"test1\",\"urf_mobile\":\"88888888\"},{\"urf_id\":\"2\",\"urf_userid\":\"6\",\"urf_name\":\"test3\",\"urf_mobile\":\"99999999\"},{\"urf_id\":\"3\",\"urf_userid\":\"6\",\"urf_name\":\"reference 1\",\"urf_mobile\":\"1234567890\"},{\"urf_id\":\"4\",\"urf_userid\":\"6\",\"urf_name\":\"reference 2\",\"urf_mobile\":\"2345678901\"},{\"urf_id\":\"5\",\"urf_userid\":\"6\",\"urf_name\":\"reference 3\",\"urf_mobile\":\"3456789012\"},{\"urf_id\":\"6\",\"urf_userid\":\"6\",\"urf_name\":\"reference 4\",\"urf_mobile\":\"4567890123\"}]"}

class PersonalDetailsModel {
  PersonalDetailsModel({
      int? status, 
      dynamic error, 
      Messages? messages, 
      Userdetails? userdetails,}){
    _status = status;
    _error = error;
    _messages = messages;
    _userdetails = userdetails;
}

  PersonalDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    _userdetails = json['userdetails'] != null ? Userdetails.fromJson(json['userdetails']) : null;
  }
  int? _status;
  dynamic _error;
  Messages? _messages;
  Userdetails? _userdetails;

  int? get status => _status;
  dynamic get error => _error;
  Messages? get messages => _messages;
  Userdetails? get userdetails => _userdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    if (_userdetails != null) {
      map['userdetails'] = _userdetails?.toJson();
    }
    return map;
  }

}

/// basicinfo : "{\"id\":\"6\",\"adminid\":null,\"code\":\"\",\"fname\":\"Subedar\",\"lname\":null,\"email\":\"test@gmail.com\",\"phone\":\"1111111111\",\"alt_mobile_no\":\"1234567860\",\"password\":\"$2y$10$IeiWYXLv40S42pAlv1pVQeSHkJuK3Kdw0mURwzKhcopX4YA4R5X6.\",\"passcode\":\"1234\",\"os\":null,\"user_status\":\"1\",\"phone_model\":\"\",\"gender\":\"male\",\"pincode\":\"\",\"address\":\"\",\"dob\":\"1988-03-09\",\"qualification\":\"1\",\"pancard\":\"ASDFG1234G\",\"adharcard\":\"123456789012\",\"maritalstatus\":\"single\",\"imei_no\":\"0\",\"demo_imei_no\":\"0\",\"is_finance\":\"0\",\"is_fl_installed\":\"0\",\"location\":\"\",\"lat\":\"19.2783961\",\"long\":\"72.8794414\",\"temp_password\":\"6681\",\"created_date\":\"2021-12-24 13:00:11\",\"expire_date\":null}"
/// residentialinfo : "[{\"ur_id\":\"1\",\"ur_userid\":\"6\",\"ur_ownership\":\"sd\",\"ur_residingwith\":\"sdsd\",\"ur_noofyears\":\"2\",\"ur_address\":\"sadsa\",\"ur_locality\":\"sad\",\"ur_pincode\":\"33456\",\"ur_city\":\"mumbai\",\"ur_state\":\"Gujrat\"},{\"ur_id\":\"2\",\"ur_userid\":\"6\",\"ur_ownership\":\"sd\",\"ur_residingwith\":\"sa\",\"ur_noofyears\":\"5\",\"ur_address\":\"sadas\",\"ur_locality\":\"Miraoad\",\"ur_pincode\":\"401117\",\"ur_city\":\"Thane\",\"ur_state\":\"Maharastra\"},{\"ur_id\":\"3\",\"ur_userid\":\"6\",\"ur_ownership\":\"Owned\",\"ur_residingwith\":\"Family\",\"ur_noofyears\":\"Less than Six Months\",\"ur_address\":\"brand factory , Mira road \",\"ur_locality\":\"Mira road \",\"ur_pincode\":\"488065\",\"ur_city\":\"Mumbai \",\"ur_state\":\"Maharashtra \"},{\"ur_id\":\"4\",\"ur_userid\":\"6\",\"ur_ownership\":\"Owned\",\"ur_residingwith\":\"Family\",\"ur_noofyears\":\"Less than Six Months\",\"ur_address\":\"brand factory , Mira road \",\"ur_locality\":\"Mira road \",\"ur_pincode\":\"488065\",\"ur_city\":\"Mumbai \",\"ur_state\":\"Maharashtra \"}]"
/// references : "[{\"urf_id\":\"1\",\"urf_userid\":\"6\",\"urf_name\":\"test1\",\"urf_mobile\":\"88888888\"},{\"urf_id\":\"2\",\"urf_userid\":\"6\",\"urf_name\":\"test3\",\"urf_mobile\":\"99999999\"},{\"urf_id\":\"3\",\"urf_userid\":\"6\",\"urf_name\":\"reference 1\",\"urf_mobile\":\"1234567890\"},{\"urf_id\":\"4\",\"urf_userid\":\"6\",\"urf_name\":\"reference 2\",\"urf_mobile\":\"2345678901\"},{\"urf_id\":\"5\",\"urf_userid\":\"6\",\"urf_name\":\"reference 3\",\"urf_mobile\":\"3456789012\"},{\"urf_id\":\"6\",\"urf_userid\":\"6\",\"urf_name\":\"reference 4\",\"urf_mobile\":\"4567890123\"}]"

class Userdetails {
  Userdetails({
      String? basicinfo, 
      String? residentialinfo, 
      String? references,}){
    _basicinfo = basicinfo;
    _residentialinfo = residentialinfo;
    _references = references;
}

  Userdetails.fromJson(dynamic json) {
    _basicinfo = json['basicinfo'];
    _residentialinfo = json['residentialinfo'];
    _references = json['references'];
  }
  String? _basicinfo;
  String? _residentialinfo;
  String? _references;

  String? get basicinfo => _basicinfo;
  String? get residentialinfo => _residentialinfo;
  String? get references => _references;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['basicinfo'] = _basicinfo;
    map['residentialinfo'] = _residentialinfo;
    map['references'] = _references;
    return map;
  }

}

/// success : "User info list successfully"

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