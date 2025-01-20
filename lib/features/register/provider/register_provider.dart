import 'package:flutter/material.dart';
import 'package:tech_labs_task/features/register/data/models/registered_user.dart';
import 'package:tech_labs_task/features/register/data/repository/register_repository.dart';

import '../data/models/register_params.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepository _registerRepository;

  RegisterProvider({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  static RegisteredUserModel? userModel;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    isLoading = true;
    userModel = await _registerRepository.register(
      params: RegisterParams(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      ),
    );
    isLoading = false;
  }
}
