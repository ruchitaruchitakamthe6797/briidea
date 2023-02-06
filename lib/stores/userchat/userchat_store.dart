import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/models/usercaht_response/userchat_response.dart';
import 'package:app_briidea/stores/error/error_store.dart';
import 'package:dio/dio.dart';

import 'package:mobx/mobx.dart';

part 'userchat_store.g.dart';

class UserChatListStore = _UserChatListStore with _$UserChatListStore;

abstract class _UserChatListStore with Store {
  // repository instance
  late final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _UserChatListStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<UserChatResponse?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UserChatResponse?> fetchUserListFuture =
      ObservableFuture<UserChatResponse?>(emptyResponse);

  @observable
  UserChatResponse? UserChatListResponse;

  @observable
  bool userChatListSuccess = false;

  @computed
  bool get loading => fetchUserListFuture.status == FutureStatus.pending;

  @action
  Future getUserChatList() async {
    try {
      final future = _repository.getUserChatList();
      fetchUserListFuture = ObservableFuture(future);
      var data = await future;
      UserChatListResponse = data;
      userChatListSuccess = true;
    } catch (e) {
      print(e.toString());
      userChatListSuccess = false;
      UserChatListResponse = null;
      if (e is DioError) errorStore.setErrorMessage(e.toString());
    }
  }

  @action
  void setSuccess(bool value) {
    userChatListSuccess = value;
  }

  @action
  void resetValues() {
    userChatListSuccess = false;
    UserChatListResponse = null;
  }
}
