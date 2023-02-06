import 'package:app_briidea/datas/chat_data.dart';
import 'package:app_briidea/functions/custom_function.dart';
import 'package:app_briidea/models/chat.dart';
import 'package:app_briidea/models/message.dart';
import 'package:app_briidea/models/usercaht_response/userchat_response.dart';
import 'package:app_briidea/provider/chat_provider.dart';
import 'package:app_briidea/stores/userchat/userchat_store.dart';
import 'package:app_briidea/widgets/chat_message_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:app_briidea/constants.dart';

class UserChatScreen extends StatefulWidget {
  UserChatScreen();

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  String? friendName, lastname, firstname;
  String? imageUrl;
  List<Message>? messagesList;
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 500.0);
  //stores:---------------------------------------------------------------------
  late UserChatListStore _userChatListStore;
  String _userName = '', _userLName = '';
  // this end
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _userChatListStore = Provider.of<UserChatListStore>(context);
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    if (arguments != null) {
      _userName = arguments['user_name'];
      _userLName = arguments['user_lname'];

      // _businessStoreID = arguments['store_id'];
    }
    // check to see if already called api
    _initApis();
  }

  _initApis() async {
    // check to see if already called api
    if (!_userChatListStore.loading) {
      _userChatListStore.getUserChatList();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String currentdate = '';
  @override
  Widget build(BuildContext context) {
    if (_userChatListStore.userChatListSuccess) {
      if (_userChatListStore.UserChatListResponse!.senderDataRow != null) {
        if (_userChatListStore.UserChatListResponse!.senderDataRow != null) {
          String datetime = _userChatListStore
              .UserChatListResponse!.senderDataRow!.lastOnlineAt!;
          var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
          var newFormat = DateFormat("dd MMM yyyy");
          var currentDateTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              DateTime.now().hour,
              DateTime.now().minute);
          print(currentDateTime);
          print(dateFormat);
          String today = newFormat.format(DateTime.now());
          // var date = widget.item!.messageTime;
          DateTime date = dateFormat.parse(datetime);
          if (dateFormat.parse(currentDateTime.toString()).toString() ==
              today) {
            // currentdate = dateFormat.parse(currentDateTime.toString()).toString();
            currentdate = 'Now';
          }

          currentdate = DateFormat('MMM d').format(date);
          print(date
              .toString()); // prints something like 2019-12-10 10:02:22.287949
          print(DateFormat('EEEE').format(date)); // prints Tuesday
          print(DateFormat('EEEE, d MMM, yyyy')
              .format(date)); // prints Tuesday, 10 Dec, 2019
          print(DateFormat('MMM d').format(date));
          print(DateFormat('h:mm a').format(date));
        }
      }
    }

    final Chat chat =
        chats[Provider.of<ChatProvider>(context).currentChatIndex];
    final Chat chagroupt = chats[Provider.of<ChatProvider>(context).chat];
    // final Data datas =
    //     data[Provider.of<ChatProvider>(context).data];
    // firstname = datas.firstname;
    // lastname = datas.firstname;

    imageUrl = chat.memberTwoProfilePicUrl;
    messagesList = chat.messagesList;

    return CustomFunctions.isMobile(context)
        ? Scaffold(body: _buildChat())
        //  Scaffold(body: Observer(builder: (_) {
        //     return (_userChatListStore.loading)
        //         ? Container()
        //         : _userChatListStore.userChatListSuccess
        //             ? _userChatListStore.UserChatListResponse != null
        //                 ? _userChatListStore
        //                             .UserChatListResponse!.senderDataRow !=
        //                         null
        //                     ? _buildChat()
        //                     : Container()
        //                 : Container()
        //             : Container();
        //   }))
        : Observer(builder: (_) {
            return (_userChatListStore.loading)
                ? Container()
                : _userChatListStore.userChatListSuccess
                    ? _userChatListStore.UserChatListResponse != null
                        ? _userChatListStore
                                    .UserChatListResponse!.senderDataRow !=
                                null
                            ? _buildChat()
                            : Container()
                        : Container()
                    : Container();
          });
    // : _buildChat();
  }

  Container _buildChat() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          _buildAppBar(context),
          _buildMessagesList(),
          _buildMessageComposer()
        ],
      ),
    );
  }

  Expanded _buildMessagesList() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messagesList!.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatMessageWidget(messagesList![index]);
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomFunctions.isMobile(context)
          ? CustomColors.kPrimaryColor
          : CustomColors.kGreyColor,
      titleSpacing: 0.0,
      title: Row(
        children: [
          CustomFunctions.isMobile(context)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : SizedBox(
                  width: 10.0,
                ),
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl!),
            radius: 20,
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_userChatListStore.UserChatListResponse!.senderDataRow!.username}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: CustomFunctions.isMobile(context)
                      ? CustomColors.kLightColor
                      : Colors.black,
                ),
              ),
              Text(
                _userChatListStore
                            .UserChatListResponse!.senderDataRow!.isOnline ==
                        1
                    ? 'Online'
                    : 'last seen $currentdate',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: CustomFunctions.isMobile(context)
                        ? CustomColors.kLightColor
                        : Colors.black,
                    fontSize: 10),
              ),
            ],
          )
        ],
      ),
      actions: [
        Icon(
          Icons.video_call,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.call,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
        SizedBox(width: 15.0),
        Icon(
          Icons.more_vert,
          color: CustomFunctions.isMobile(context)
              ? CustomColors.kLightColor
              : CustomColors.kIconColor,
        ),
      ],
    );
  }

  Widget _buildMessageComposer() {
    final textField = Container(
      decoration: BoxDecoration(
        color: CustomColors.kLightColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 8.0),
          Icon(
            Icons.attach_file,
            color: Colors.grey.shade400,
            size: 20,
          ),
          SizedBox(width: 5.0),
          Icon(
            Icons.photo_size_select_actual_outlined,
            color: Colors.grey.shade400,
            size: 20,
          ),
          SizedBox(width: 5.0),
          Icon(
            Icons.settings_voice_sharp,
            color: Colors.grey.shade400,
            size: 20,
          ),
          SizedBox(width: 8.0),
          Expanded(child: _buildTextFeild()
              // TextField(
              //   decoration: InputDecoration(
              //       hintText: 'Type a message...', border: InputBorder.none),
              // ),
              ),
          // Icon(
          //   Icons.insert_emoticon,
          //   color: CustomColors.kIconColor,
          // ),
          SizedBox(width: 8.0)
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: textField),
          SizedBox(width: 8.0),
          Icon(
            Icons.send,
            color: Colors.purple,
          )
        ],
      ),
    );
  }

  Widget _buildTextFeild() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        // border: Border.all(color: )
        // borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    isDense: true,
                    // contentPadding: EdgeInsets.symmetric(
                    //   vertical: 0,
                    // ),
                    hintText: 'Type a message...',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.insert_emoticon,
              size: 20,
              color: CustomColors.kIconColor,
            ),
            SizedBox(
              width: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
