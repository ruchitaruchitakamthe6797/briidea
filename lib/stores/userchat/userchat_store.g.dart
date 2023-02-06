// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userchat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserChatListStore on _UserChatListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_UserChatListStore.loading'))
      .value;

  final _$fetchUserListFutureAtom =
      Atom(name: '_UserChatListStore.fetchUserListFuture');

  @override
  ObservableFuture<UserChatResponse?> get fetchUserListFuture {
    _$fetchUserListFutureAtom.reportRead();
    return super.fetchUserListFuture;
  }

  @override
  set fetchUserListFuture(ObservableFuture<UserChatResponse?> value) {
    _$fetchUserListFutureAtom.reportWrite(value, super.fetchUserListFuture, () {
      super.fetchUserListFuture = value;
    });
  }

  final _$UserChatListResponseAtom =
      Atom(name: '_UserChatListStore.UserChatListResponse');

  @override
  UserChatResponse? get UserChatListResponse {
    _$UserChatListResponseAtom.reportRead();
    return super.UserChatListResponse;
  }

  @override
  set UserChatListResponse(UserChatResponse? value) {
    _$UserChatListResponseAtom.reportWrite(value, super.UserChatListResponse,
        () {
      super.UserChatListResponse = value;
    });
  }

  final _$userChatListSuccessAtom =
      Atom(name: '_UserChatListStore.userChatListSuccess');

  @override
  bool get userChatListSuccess {
    _$userChatListSuccessAtom.reportRead();
    return super.userChatListSuccess;
  }

  @override
  set userChatListSuccess(bool value) {
    _$userChatListSuccessAtom.reportWrite(value, super.userChatListSuccess, () {
      super.userChatListSuccess = value;
    });
  }

  final _$getUserChatListAsyncAction =
      AsyncAction('_UserChatListStore.getUserChatList');

  @override
  Future<dynamic> getUserChatList() {
    return _$getUserChatListAsyncAction.run(() => super.getUserChatList());
  }

  final _$_UserChatListStoreActionController =
      ActionController(name: '_UserChatListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_UserChatListStoreActionController.startAction(
        name: '_UserChatListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_UserChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValues() {
    final _$actionInfo = _$_UserChatListStoreActionController.startAction(
        name: '_UserChatListStore.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_UserChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUserListFuture: ${fetchUserListFuture},
UserChatListResponse: ${UserChatListResponse},
userChatListSuccess: ${userChatListSuccess},
loading: ${loading}
    ''';
  }
}
