import 'package:tech_labs_task/features/register/data/models/registered_user.dart';

import '../models/register_params.dart';

abstract class RegisterRepository {
  Future<RegisteredUserModel> register({required RegisterParams params});
}

