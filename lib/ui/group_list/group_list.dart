import 'package:app_briidea/functions/custom_function.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/provider/chat_provider.dart';
import 'package:app_briidea/stores/grouplist/grouplist_store.dart';
import 'package:app_briidea/ui/group_list/widgets/group_list_widgets.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/locale/app_localization.dart';
import 'package:app_briidea/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  //stores:---------------------------------------------------------------------
  late GroupListStore _groupListStore;

  // this end
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _groupListStore = Provider.of<GroupListStore>(context);

    // check to see if already called api
    _initApis();
  }

  _initApis() async {
    // check to see if already called api
    if (!_groupListStore.loading) {
      _groupListStore.getGroupList();
    }

    // check to see if already called api
    /*Future.delayed(Duration(milliseconds: 2000), () {
      if (!_balanceStore.storeBalanceLoading) {
        _fetchBalanceList(true);
      }
   });*/
  }

  @override
  Widget build(BuildContext context) {
    return _buildUserList();
  }

  List<UserListResponse>? item;
  Widget _buildUserList() {
    return Observer(
      builder: (_) {
        return (_groupListStore.loading)
            ? Center(
                child: CircularProgressIndicator(
                strokeWidth: DeviceUtils.getScaledWidth(context, 0.5),
              ))
            : _groupListStore.groupListSuccess
                ? _groupListStore.groupListResponse == null
                    ? Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('chat_no_Data'),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize:
                                      DeviceUtils.getScaledWidth(context, 3)),
                        ),
                      )
                    : MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _groupListStore
                                .groupListResponse!.newGroup!.length,
                            itemBuilder: (context, index) {
                              return GroupListWidget(
                                item: _groupListStore
                                    .groupListResponse!.newGroup![index],
                                onTap: () {
                                  Provider.of<ChatProvider>(context,
                                          listen: false)
                                      .updateChatIndex(index,2);
                                  if (CustomFunctions.isMobile(context)) {
                                    Navigator.of(context).pushNamed(
                                        Routes.group_chat,
                                        arguments: {
                                          'user_name': _groupListStore
                                              .groupListResponse!
                                              .newGroup![index]
                                              .chatGroupName,
                                        });
                                  }
                                },
                              );
                            })
                        // ListView.builder(
                        //     // To make listView scrollable
                        //     // even if there is only a single item.
                        //     physics: const AlwaysScrollableScrollPhysics(),
                        //     itemCount:3,
                        //         // _userListStore.groupListResponse!.data!.length,
                        //     itemBuilder: (_, index) {
                        //       return Text('data');
                        //       // UserListWidget(
                        //       //   item: _userListStore
                        //       //       .userListResponse!.data![index],
                        //       // );
                        //     })
                        )
                : Container();
      },
    );
  }
  
}
