// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupchat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupChatListStore on _GroupChatListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_GroupChatListStore.loading'))
      .value;

  final _$fetchUserListFutureAtom =
      Atom(name: '_GroupChatListStore.fetchUserListFuture');

  @override
  ObservableFuture<GroupChatResponse?> get fetchUserListFuture {
    _$fetchUserListFutureAtom.reportRead();
    return super.fetchUserListFuture;
  }

  @override
  set fetchUserListFuture(ObservableFuture<GroupChatResponse?> value) {
    _$fetchUserListFutureAtom.reportWrite(value, super.fetchUserListFuture, () {
      super.fetchUserListFuture = value;
    });
  }

  final _$groupChatListResponseAtom =
      Atom(name: '_GroupChatListStore.groupChatListResponse');

  @override
  GroupChatResponse? get groupChatListResponse {
    _$groupChatListResponseAtom.reportRead();
    return super.groupChatListResponse;
  }

  @override
  set groupChatListResponse(GroupChatResponse? value) {
    _$groupChatListResponseAtom.reportWrite(value, super.groupChatListResponse,
        () {
      super.groupChatListResponse = value;
    });
  }

  final _$groupChatListSuccessAtom =
      Atom(name: '_GroupChatListStore.groupChatListSuccess');

  @override
  bool get groupChatListSuccess {
    _$groupChatListSuccessAtom.reportRead();
    return super.groupChatListSuccess;
  }

  @override
  set groupChatListSuccess(bool value) {
    _$groupChatListSuccessAtom.reportWrite(value, super.groupChatListSuccess,
        () {
      super.groupChatListSuccess = value;
    });
  }

  final _$getGroupChatListAsyncAction =
      AsyncAction('_GroupChatListStore.getGroupChatList');

  @override
  Future<dynamic> getGroupChatList() {
    return _$getGroupChatListAsyncAction.run(() => super.getGroupChatList());
  }

  final _$_GroupChatListStoreActionController =
      ActionController(name: '_GroupChatListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_GroupChatListStoreActionController.startAction(
        name: '_GroupChatListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_GroupChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValues() {
    final _$actionInfo = _$_GroupChatListStoreActionController.startAction(
        name: '_GroupChatListStore.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_GroupChatListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUserListFuture: ${fetchUserListFuture},
groupChatListResponse: ${groupChatListResponse},
groupChatListSuccess: ${groupChatListSuccess},
loading: ${loading}
    ''';
  }
}
