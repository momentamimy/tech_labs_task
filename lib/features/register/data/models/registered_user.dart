class RegisteredUserModel {
  String? fullname;
  String? emailaddress1;
  String? contactid;
  String? firstname;
  String? lastname;
  String? password;

  RegisteredUserModel(
      {this.fullname,
      this.emailaddress1,
      this.contactid,
      this.firstname,
      this.lastname});

  RegisteredUserModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    emailaddress1 = json['emailaddress1'];
    contactid = json['contactid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['adx_identity_passwordhash'];
  }
}
