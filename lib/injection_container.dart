import 'package:get_it/get_it.dart';
import 'package:tech_labs_task/features/profile/data/data_source/profile_remote_datasource.dart';
import 'package:tech_labs_task/features/profile/data/repository/profile_repository.dart';
import 'package:tech_labs_task/features/profile/provider/profile_provider.dart';
import 'package:tech_labs_task/features/register/data/data_source/register_remote_datasource.dart';
import 'package:tech_labs_task/features/register/data/repository/register_repository.dart';
import 'package:tech_labs_task/features/register/provider/register_provider.dart';
import 'core/services/network/network_service.dart';
import 'core/services/storage/shared_preferences/shared_preferences_helper.dart';

class AppDependencies {
  static final sl = GetIt.instance;

  AppDependencies._();

  static Future<void> initAppInjections() async {
    /// Features
    _injectProviders();
    _injectRepositories();

    /// External
    await SharedPreferencesHelper.init();
    sl.registerLazySingleton<NetworkService>(() => NetworkService());
  }

  static void _injectProviders() {
    sl.registerFactory(() => ProfileProvider(repository: sl()));
    sl.registerFactory(() => RegisterProvider(registerRepository: sl()));
  }

  static void _injectRepositories() {
    sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRemoteDatasource(networkService: sl()));
    sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRemoteDatasource(networkService: sl()));
  }
}
