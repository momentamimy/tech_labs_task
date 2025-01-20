import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../core/services/network/network_service.dart';
import '../models/registered_user.dart';

import '../../../../core/constants/urls_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/register_params.dart';
import '../repository/register_repository.dart';

class RegisterRemoteDatasource extends RegisterRepository {
  final NetworkService _networkService;

  RegisterRemoteDatasource({required NetworkService networkService})
      : _networkService = networkService;



  @override
  Future<RegisteredUserModel> register({required RegisterParams params}) async {
    try {
      await _networkService.getAccessToken();
      final response = await _networkService.dio.post(
        UrlsConst.contacts,
        data: {
          "firstname": params.firstName,
          "lastname": params.lastName,
          "emailaddress1": params.email,
          "adx_identity_passwordhash": params.password
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          "Prefer": "return=representation"
        }),
      );
      if (response.statusCode == 201) {
        return RegisteredUserModel.fromJson(jsonDecode(response.toString()));
      }
      throw ServerException();
    } catch (ex) {
      rethrow;
    }
  }
}
