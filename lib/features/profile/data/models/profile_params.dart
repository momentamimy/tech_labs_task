class ProfileParams {
  final String contactId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;

  ProfileParams({
    required this.contactId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });
}
