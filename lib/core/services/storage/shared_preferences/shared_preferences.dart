import '../../../constants/shared_preferences_constants.dart';
import 'shared_preferences_helper.dart';

class SharedPrefs {
  static bool? get isLogin =>
      SharedPreferencesHelper.getBool(SharedPreferencesConstants.isLoginKey);

  static Future setIsLogin(bool value) async =>
      await SharedPreferencesHelper.setBool(SharedPreferencesConstants.isLoginKey, value);

  static Future clearIsLogin() async {
    await SharedPreferencesHelper.remove(SharedPreferencesConstants.isLoginKey);
  }
}
