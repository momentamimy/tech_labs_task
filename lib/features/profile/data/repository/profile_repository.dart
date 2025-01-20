import 'package:tech_labs_task/features/register/data/models/registered_user.dart';

import '../models/profile_params.dart';

abstract class ProfileRepository {
  Future<RegisteredUserModel> editProfile({required ProfileParams params});
}

