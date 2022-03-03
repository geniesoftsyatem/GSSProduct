/// status : 201
/// error : null
/// messages : {"success":"User info list successfully"}
/// employmentdetail : [{"ue_id":"1","ue_userid":"6","ue_emptype":"4444","ue_employername":"ue_officeemail","ue_officeemail":null,"ue_workingsince":"test@gmail.com","ue_monthsalary":"25-7-1979","ue_salaryaccount":"Icici","ue_jobcategory":null,"ue_designation":"1","ue_worksector":"1","ue_orgtype":"1","ue_officeaddress":"sasadasds","ue_createdate":"2022-03-02 13:41:37"},{"ue_id":"2","ue_userid":"6","ue_emptype":"4444","ue_employername":"ue_officeemail","ue_officeemail":null,"ue_workingsince":"test@gmail.com","ue_monthsalary":"25-7-1979","ue_salaryaccount":"Icici","ue_jobcategory":null,"ue_designation":"1","ue_worksector":"1","ue_orgtype":"1","ue_officeaddress":"sasadasds","ue_createdate":"2022-03-02 13:52:02"},{"ue_id":"3","ue_userid":"6","ue_emptype":"4444","ue_employername":"ue_officeemail","ue_officeemail":null,"ue_workingsince":"test@gmail.com","ue_monthsalary":"25-7-1979","ue_salaryaccount":"Icici","ue_jobcategory":null,"ue_designation":"1","ue_worksector":"1","ue_orgtype":"1","ue_officeaddress":"sasadasds","ue_createdate":"2022-03-02 13:52:20"}]

class EmploymentDetailsModel {
  EmploymentDetailsModel({
      int? status, 
      dynamic error, 
      Messages? messages, 
      List<Employmentdetail>? employmentdetail,}){
    _status = status;
    _error = error;
    _messages = messages;
    _employmentdetail = employmentdetail;
}

  EmploymentDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['employmentdetail'] != null) {
      _employmentdetail = [];
      json['employmentdetail'].forEach((v) {
        _employmentdetail?.add(Employmentdetail.fromJson(v));
      });
    }
  }
  int? _status;
  dynamic _error;
  Messages? _messages;
  List<Employmentdetail>? _employmentdetail;

  int? get status => _status;
  dynamic get error => _error;
  Messages? get messages => _messages;
  List<Employmentdetail>? get employmentdetail => _employmentdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    if (_employmentdetail != null) {
      map['employmentdetail'] = _employmentdetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ue_id : "1"
/// ue_userid : "6"
/// ue_emptype : "4444"
/// ue_employername : "ue_officeemail"
/// ue_officeemail : null
/// ue_workingsince : "test@gmail.com"
/// ue_monthsalary : "25-7-1979"
/// ue_salaryaccount : "Icici"
/// ue_jobcategory : null
/// ue_designation : "1"
/// ue_worksector : "1"
/// ue_orgtype : "1"
/// ue_officeaddress : "sasadasds"
/// ue_createdate : "2022-03-02 13:41:37"

class Employmentdetail {
  Employmentdetail({
      String? ueId, 
      String? ueUserid, 
      String? ueEmptype, 
      String? ueEmployername, 
      dynamic ueOfficeemail, 
      String? ueWorkingsince, 
      String? ueMonthsalary, 
      String? ueSalaryaccount, 
      dynamic ueJobcategory, 
      String? ueDesignation, 
      String? ueWorksector, 
      String? ueOrgtype, 
      String? ueOfficeaddress, 
      String? ueCreatedate,}){
    _ueId = ueId;
    _ueUserid = ueUserid;
    _ueEmptype = ueEmptype;
    _ueEmployername = ueEmployername;
    _ueOfficeemail = ueOfficeemail;
    _ueWorkingsince = ueWorkingsince;
    _ueMonthsalary = ueMonthsalary;
    _ueSalaryaccount = ueSalaryaccount;
    _ueJobcategory = ueJobcategory;
    _ueDesignation = ueDesignation;
    _ueWorksector = ueWorksector;
    _ueOrgtype = ueOrgtype;
    _ueOfficeaddress = ueOfficeaddress;
    _ueCreatedate = ueCreatedate;
}

  Employmentdetail.fromJson(dynamic json) {
    _ueId = json['ue_id'];
    _ueUserid = json['ue_userid'];
    _ueEmptype = json['ue_emptype'];
    _ueEmployername = json['ue_employername'];
    _ueOfficeemail = json['ue_officeemail'];
    _ueWorkingsince = json['ue_workingsince'];
    _ueMonthsalary = json['ue_monthsalary'];
    _ueSalaryaccount = json['ue_salaryaccount'];
    _ueJobcategory = json['ue_jobcategory'];
    _ueDesignation = json['ue_designation'];
    _ueWorksector = json['ue_worksector'];
    _ueOrgtype = json['ue_orgtype'];
    _ueOfficeaddress = json['ue_officeaddress'];
    _ueCreatedate = json['ue_createdate'];
  }
  String? _ueId;
  String? _ueUserid;
  String? _ueEmptype;
  String? _ueEmployername;
  dynamic _ueOfficeemail;
  String? _ueWorkingsince;
  String? _ueMonthsalary;
  String? _ueSalaryaccount;
  dynamic _ueJobcategory;
  String? _ueDesignation;
  String? _ueWorksector;
  String? _ueOrgtype;
  String? _ueOfficeaddress;
  String? _ueCreatedate;

  String? get ueId => _ueId;
  String? get ueUserid => _ueUserid;
  String? get ueEmptype => _ueEmptype;
  String? get ueEmployername => _ueEmployername;
  dynamic get ueOfficeemail => _ueOfficeemail;
  String? get ueWorkingsince => _ueWorkingsince;
  String? get ueMonthsalary => _ueMonthsalary;
  String? get ueSalaryaccount => _ueSalaryaccount;
  dynamic get ueJobcategory => _ueJobcategory;
  String? get ueDesignation => _ueDesignation;
  String? get ueWorksector => _ueWorksector;
  String? get ueOrgtype => _ueOrgtype;
  String? get ueOfficeaddress => _ueOfficeaddress;
  String? get ueCreatedate => _ueCreatedate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ue_id'] = _ueId;
    map['ue_userid'] = _ueUserid;
    map['ue_emptype'] = _ueEmptype;
    map['ue_employername'] = _ueEmployername;
    map['ue_officeemail'] = _ueOfficeemail;
    map['ue_workingsince'] = _ueWorkingsince;
    map['ue_monthsalary'] = _ueMonthsalary;
    map['ue_salaryaccount'] = _ueSalaryaccount;
    map['ue_jobcategory'] = _ueJobcategory;
    map['ue_designation'] = _ueDesignation;
    map['ue_worksector'] = _ueWorksector;
    map['ue_orgtype'] = _ueOrgtype;
    map['ue_officeaddress'] = _ueOfficeaddress;
    map['ue_createdate'] = _ueCreatedate;
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