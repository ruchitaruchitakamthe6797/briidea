import 'package:app_briidea/data/repository.dart';
import 'package:app_briidea/models/groupchat_response/groupchat_response.dart';
import 'package:app_briidea/stores/error/error_store.dart';
import 'package:dio/dio.dart';

import 'package:mobx/mobx.dart';

part 'groupchat_store.g.dart';

class GroupChatListStore = _GroupChatListStore with _$GroupChatListStore;

abstract class _GroupChatListStore with Store {
  // repository instance
  late final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _GroupChatListStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<GroupChatResponse?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<GroupChatResponse?> fetchUserListFuture =
      ObservableFuture<GroupChatResponse?>(emptyResponse);

  @observable
  GroupChatResponse? groupChatListResponse;

  @observable
  bool groupChatListSuccess = false;

  @computed
  bool get loading => fetchUserListFuture.status == FutureStatus.pending;

  @action
  Future getGroupChatList() async {
    try {
      final future = _repository.getGroupChatList();
      fetchUserListFuture = ObservableFuture(future);
      var data = await future;
      groupChatListResponse = data;
      groupChatListSuccess = true;
    } catch (e) {
      print(e.toString());
      groupChatListSuccess = false;
      groupChatListResponse = null;
      if (e is DioError) errorStore.setErrorMessage(e.toString());
    }
  }

  @action
  void setSuccess(bool value) {
    groupChatListSuccess = value;
  }

  @action
  void resetValues() {
    groupChatListSuccess = false;
    groupChatListResponse = null;
  }
}
