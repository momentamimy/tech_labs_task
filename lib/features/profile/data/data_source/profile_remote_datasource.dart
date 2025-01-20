import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../core/services/network/network_service.dart';
import '../../../register/data/models/registered_user.dart';
import '../repository/profile_repository.dart';

import '../../../../core/constants/urls_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/profile_params.dart';

class ProfileRemoteDatasource extends ProfileRepository {
  final NetworkService _networkService;

  ProfileRemoteDatasource({required NetworkService networkService})
      : _networkService = networkService;

  @override
  Future<RegisteredUserModel> editProfile(
      {required ProfileParams params}) async {
    try {
      final body = <String, String>{};
      if (params.firstName != null) {
        body.addAll({"firstname": params.firstName!});
      }
      if (params.lastName != null) {
        body.addAll({"lastname": params.lastName!});
      }
      if (params.email != null) {
        body.addAll({"emailaddress1": params.email!});
      }
      if (params.password != null) {
        body.addAll({"adx_identity_passwordhash": params.password!});
      }

      final response = await _networkService.dio.patch(
        "${UrlsConst.contacts}(${params.contactId})",
        data: body,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Prefer": "return=representation"
        }),
      );
      if (response.statusCode == 200) {
        return RegisteredUserModel.fromJson(jsonDecode(response.toString()));
      }
      throw ServerException();
    } catch (ex) {
      rethrow;
    }
  }
}
