import 'package:app_briidea/constants.dart';
import 'package:app_briidea/stores/groupchat/groupchat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GroupChatDetails extends StatefulWidget {
  const GroupChatDetails({Key? key}) : super(key: key);

  @override
  State<GroupChatDetails> createState() => _GroupChatDetailsState();
}

class _GroupChatDetailsState extends State<GroupChatDetails> {
  //stores:---------------------------------------------------------------------
  late GroupChatListStore _groupChatListStore;
  String _groupName = '';
  // this end
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _groupChatListStore = Provider.of<GroupChatListStore>(context);
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    if (arguments != null) {
      _groupName = arguments['user_name'];

      // _businessStoreID = arguments['store_id'];
    }
    // check to see if already called api
    _initApis();
  }

  _initApis() async {
    // check to see if already called api
    if (!_groupChatListStore.loading) {
      _groupChatListStore.getGroupChatList();
    }
  }

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
                padding: EdgeInsets.only(right: 16), child: _buildAppTitle()),
          ),
        ),
        body: _buildChatList());
  }

  Widget _buildAppTitle() {
    return Observer(builder: (_) {
      return (_groupChatListStore.loading)
          ? Container()
          : _groupChatListStore.groupChatListSuccess
              ? _groupChatListStore.groupChatListResponse == null
                  ? Container()
                  : Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://randomuser.me/api/portraits/men/5.jpg"),
                          maxRadius: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  _groupName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                '3 participants',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.video_call,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.keyboard_control_outlined,
                          color: Colors.black54,
                        ),
                      ],
                    )
              : Container();
    });
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
      // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        // border: Border.all(color: )
        // borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
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
              size: 20.0,
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

  Widget _buildChatList() {
    return Observer(builder: (_) {
      return (_groupChatListStore.loading)
          ? Container()
          : _groupChatListStore.groupChatListSuccess
              ? _groupChatListStore.groupChatListResponse == null
                  ? Container()
                  : Stack(
                      children: <Widget>[
                        ListView.builder(
                          itemCount: messages.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment:
                                    (messages[index].messageType == "receiver"
                                        ? Alignment.topLeft
                                        : Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (messages[index].messageType ==
                                            "receiver"
                                        ? Colors.grey.shade200
                                        : Colors.pink),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    messages[index].messageContent,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: (messages[index].messageType ==
                                              "receiver"
                                          ? Colors.black
                                          : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            height: 70,
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.grey[50],
                                ),
                                _buildMessageComposer()
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
              : Container();
    });
  }

  Widget _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(
            vertical: -5,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100, width: 1.0),
          ),
          hintText: 'Type a message...',
          suffix: Icon(Icons.emoji_emotions)),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
