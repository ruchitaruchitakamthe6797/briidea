import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/stores/error/error_store.dart';
import 'package:dio/dio.dart';

import 'package:mobx/mobx.dart';

part 'userlist_store.g.dart';

class UserListStore = _UserListStore with _$UserListStore;

abstract class _UserListStore with Store {
  // repository instance
  late final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _UserListStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<UserListResponse?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UserListResponse?> fetchUserListFuture =
      ObservableFuture<UserListResponse?>(emptyResponse);

  @observable
  UserListResponse? userListResponse;

  @observable
  bool userListSuccess = false;

  @computed
  bool get loading => fetchUserListFuture.status == FutureStatus.pending;

  @action
  Future getUserList() async {
    try {
      final future = _repository.getUserList();
      fetchUserListFuture = ObservableFuture(future);
      var data = await future;
      userListResponse = data;
      userListSuccess = true;
    } catch (e) {
      print(e.toString());
      userListSuccess = false;
      userListResponse = null;
      if (e is DioError) errorStore.setErrorMessage(e.toString());
    }
  }

  @action
  void setSuccess(bool value) {
    userListSuccess = value;
  }

  @action
  void resetValues() {
    userListSuccess = false;
    userListResponse = null;
  }
}
