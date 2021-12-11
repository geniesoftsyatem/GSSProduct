class RegistrationModel {
  String response, message, mobile, email;

  RegistrationModel(this.response, this.message, this.mobile, this.email);

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(json['response'], json['message'], json['mobile'], json['email']);
  }
}