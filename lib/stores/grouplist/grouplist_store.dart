import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/models/grouplist_response/grouplist_response.dart';
import 'package:app_briidea/stores/error/error_store.dart';
import 'package:dio/dio.dart';

import 'package:mobx/mobx.dart';

part 'grouplist_store.g.dart';

class GroupListStore = _GroupListStore with _$GroupListStore;

abstract class _GroupListStore with Store {
  // repository instance
  late final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _GroupListStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<GroupListResponse?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<GroupListResponse?> fetchUserListFuture =
      ObservableFuture<GroupListResponse?>(emptyResponse);

  @observable
  GroupListResponse? groupListResponse;

  @observable
  bool groupListSuccess = false;

  @computed
  bool get loading => fetchUserListFuture.status == FutureStatus.pending;

  @action
  Future getGroupList() async {
    try {
      final future = _repository.getGroupList();
      fetchUserListFuture = ObservableFuture(future);
      var data = await future;
      groupListResponse = data;
      groupListSuccess = true;
    } catch (e) {
      print(e.toString());
      groupListSuccess = false;
      groupListResponse = null;
      if (e is DioError) errorStore.setErrorMessage(e.toString());
    }
  }

  @action
  void setSuccess(bool value) {
    groupListSuccess = value;
  }

  @action
  void resetValues() {
    groupListSuccess = false;
    groupListResponse = null;
  }
}
