// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouplist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupListStore on _GroupListStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_GroupListStore.loading'))
      .value;

  final _$fetchUserListFutureAtom =
      Atom(name: '_GroupListStore.fetchUserListFuture');

  @override
  ObservableFuture<GroupListResponse?> get fetchUserListFuture {
    _$fetchUserListFutureAtom.reportRead();
    return super.fetchUserListFuture;
  }

  @override
  set fetchUserListFuture(ObservableFuture<GroupListResponse?> value) {
    _$fetchUserListFutureAtom.reportWrite(value, super.fetchUserListFuture, () {
      super.fetchUserListFuture = value;
    });
  }

  final _$groupListResponseAtom =
      Atom(name: '_GroupListStore.groupListResponse');

  @override
  GroupListResponse? get groupListResponse {
    _$groupListResponseAtom.reportRead();
    return super.groupListResponse;
  }

  @override
  set groupListResponse(GroupListResponse? value) {
    _$groupListResponseAtom.reportWrite(value, super.groupListResponse, () {
      super.groupListResponse = value;
    });
  }

  final _$groupListSuccessAtom = Atom(name: '_GroupListStore.groupListSuccess');

  @override
  bool get groupListSuccess {
    _$groupListSuccessAtom.reportRead();
    return super.groupListSuccess;
  }

  @override
  set groupListSuccess(bool value) {
    _$groupListSuccessAtom.reportWrite(value, super.groupListSuccess, () {
      super.groupListSuccess = value;
    });
  }

  final _$getGroupListAsyncAction = AsyncAction('_GroupListStore.getGroupList');

  @override
  Future<dynamic> getGroupList() {
    return _$getGroupListAsyncAction.run(() => super.getGroupList());
  }

  final _$_GroupListStoreActionController =
      ActionController(name: '_GroupListStore');

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetValues() {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.resetValues');
    try {
      return super.resetValues();
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUserListFuture: ${fetchUserListFuture},
groupListResponse: ${groupListResponse},
groupListSuccess: ${groupListSuccess},
loading: ${loading}
    ''';
  }
}
