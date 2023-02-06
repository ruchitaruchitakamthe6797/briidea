import 'package:app_briidea/functions/custom_function.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/provider/chat_provider.dart';
import 'package:app_briidea/stores/userlist/userlist_store.dart';
import 'package:app_briidea/ui/chat_page/chat_list.dart';
import 'package:app_briidea/ui/user_list/widgets/user_list_widgets.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/locale/app_localization.dart';
import 'package:app_briidea/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UserListSecond extends StatefulWidget {
  const UserListSecond({Key? key}) : super(key: key);

  @override
  State<UserListSecond> createState() => _UserListSecondState();
}

class _UserListSecondState extends State<UserListSecond> {
  //stores:---------------------------------------------------------------------
  late UserListStore _userListStore;

  // this end
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _userListStore = Provider.of<UserListStore>(context);

    // check to see if already called api
    _initApis();
  }

  _initApis() async {
    // check to see if already called api
    if (!_userListStore.loading) {
      _userListStore.getUserList();
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
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceUtils.getScaledHeight(context, 2),
            ),
            child: _buildUserList(),
          ),
        ],
      ),
    );
  }

  List<UserListResponse>? item;
  Widget _buildUserList() {
    return Observer(
      builder: (_) {
        return (_userListStore.loading)
            ? Center(
                child: CircularProgressIndicator(
                strokeWidth: DeviceUtils.getScaledWidth(context, 0.5),
              ))
            : _userListStore.userListSuccess
                ? _userListStore.userListResponse == null
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
                            itemCount:
                                _userListStore.userListResponse!.data!.length,
                            itemBuilder: (context, index) {
                              final chatUsers =
                                  _userListStore.userListResponse!.data;
                              return ConversationList(
                                item: chatUsers![index],
                                name: chatUsers[index].firstname!,
                                messageText: chatUsers[index].message!,
                                // imageUrl: chatUsers![index].imageURL,
                                time: chatUsers[index].isSeen!,
                                isMessageRead:
                                    (index == 0 || index == 3) ? true : false,
                                ontap: () {
                                  Provider.of<ChatProvider>(context,
                                          listen: false)
                                      .updateChatIndex(
                                          index,1);

                                  if (CustomFunctions.isMobile(context)) {
                                    Navigator.of(context).pushNamed(
                                        Routes.user_chat,
                                        arguments: {
                                          'user_name':
                                              chatUsers[index].firstname,
                                          'user_lname':
                                              chatUsers[index].lastname,
                                        });
                                  }
                                },
                              );

                              // UserListWidget(
                              //   item: _userListStore
                              //       .userListResponse!.data![index],
                              // );
                            })
                        // ListView.builder(
                        //     // To make listView scrollable
                        //     // even if there is only a single item.
                        //     physics: const AlwaysScrollableScrollPhysics(),
                        //     itemCount:3,
                        //         // _userListStore.userListResponse!.data!.length,
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
