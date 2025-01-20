import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tech_labs_task/features/profile/data/models/profile_params.dart';
import 'package:tech_labs_task/features/profile/data/repository/profile_repository.dart';
import 'package:tech_labs_task/features/register/provider/register_provider.dart';
import 'package:tech_labs_task/shared/utils/toast_utils.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository;
  bool _isEditable = false;

  bool get isEditable => _isEditable;

  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
  }

  bool _isLoading = false;

  ProfileProvider({required ProfileRepository repository})
      : _repository = repository;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> editProfile(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    isLoading = true;
    RegisterProvider.userModel = await _repository.editProfile(
      params: ProfileParams(
        contactId: RegisterProvider.userModel!.contactid!,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      ),
    );
    ToastUtils.showToast(message: "edit_success".tr());
    isLoading = false;
  }
}
