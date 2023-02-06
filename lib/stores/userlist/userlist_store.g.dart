// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userlist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListStore on _UserListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_UserListStore.loading'))
      .value;

  final _$fetchUserListFutureAtom =
      Atom(name: '_UserListStore.fetchUserListFuture');

  @override
  ObservableFuture<UserListResponse?> get fetchUserListFuture {
    _$fetchUserListFutureAtom.reportRead();
    return super.fetchUserListFuture;
  }

  @override
  set fetchUserListFuture(ObservableFuture<UserListResponse?> value) {
    _$fetchUserListFutureAtom.reportWrite(value, super.fetchUserListFuture, () {
      super.fetchUserListFuture = value;
    });
  }

  final _$userListResponseAtom = Atom(name: '_UserListStore.userListResponse');

  @override
  UserListResponse? get userListResponse {
    _$userListResponseAtom.reportRead();
    return super.userListResponse;
  }

  @override
  set userListResponse(UserListResponse? value) {
    _$userListResponseAtom.reportWrite(value, super.userListResponse, () {
      super.userListResponse = value;
    });
  }

  final _$userListSuccessAtom = Atom(name: '_UserListStore.userListSuccess');

  @override
  bool get userListSuccess {
    _$userListSuccessAtom.reportRead();
    return super.userListSuccess;
  }

  @override
  set userListSuccess(bool value) {
    _$userListSuccessAtom.reportWrite(value, super.userListSuccess, () {
      super.userListSuccess = value;
    });
  }

  final _$getUserListAsyncAction = AsyncAction('_UserListStore.getUserList');

  @override
  Future<dynamic> getUserList() {
    return _$getUserListAsyncAction.run(() => super.getUserList());
  }

  final _$_UserListStoreActionController =
      ActionController(name: '_UserListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_UserListStoreActionController.startAction(
        name: '_UserListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_UserListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValues() {
    final _$actionInfo = _$_UserListStoreActionController.startAction(
        name: '_UserListStore.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_UserListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUserListFuture: ${fetchUserListFuture},
userListResponse: ${userListResponse},
userListSuccess: ${userListSuccess},
loading: ${loading}
    ''';
  }
}
