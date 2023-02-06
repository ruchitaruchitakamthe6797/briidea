import 'package:app_briidea/data/local/datasources/post/post_datasource.dart';
import 'package:app_briidea/data/network/apis/posts/post_api.dart';
import 'package:app_briidea/data/network/dio_client.dart';
import 'package:app_briidea/data/network/rest_client.dart';
import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/data/sharedpref/shared_preference_helper.dart';
import 'package:app_briidea/di/module/local_module.dart';
import 'package:app_briidea/di/module/network_module.dart';
import 'package:app_briidea/stores/error/error_store.dart';
import 'package:app_briidea/stores/form/form_store.dart';
import 'package:app_briidea/stores/groupchat/groupchat_store.dart';
import 'package:app_briidea/stores/grouplist/grouplist_store.dart';
import 'package:app_briidea/stores/language/language_store.dart';
import 'package:app_briidea/stores/theme/theme_store.dart';
import 'package:app_briidea/stores/userchat/userchat_store.dart';
import 'package:app_briidea/stores/userlist/userlist_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(GroupListStore(getIt<Repository>()));
  getIt.registerSingleton(UserListStore(getIt<Repository>()));
  getIt.registerSingleton(UserChatListStore(getIt<Repository>()));
  getIt.registerSingleton(GroupChatListStore(getIt<Repository>()));



  
}
