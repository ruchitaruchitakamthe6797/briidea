import 'package:app_briidea/stores/userchat/userchat_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key}) : super(key: key);

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
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
      return (_userChatListStore.loading)
          ? Container()
          : _userChatListStore.userChatListSuccess
              ? _userChatListStore.UserChatListResponse == null
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
                                  '$_userName $_userLName',
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
                                'Online',
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

  Widget _buildChatList() {
    return Observer(builder: (_) {
      return (_userChatListStore.loading)
          ? Container()
          : _userChatListStore.userChatListSuccess
              ? _userChatListStore.UserChatListResponse == null
                  ? Container()
                  : Stack(
                      children: <Widget>[
                        Column(
                          children: [
                            Divider(
                              color: Colors.grey[50],
                            ),
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
                                    alignment: (messages[index].messageType ==
                                            "receiver"
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
                                      child:
                                          Text(messages[index].messageContent,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: (messages[index]
                                                            .messageType ==
                                                        "receiver"
                                                    ? Colors.black
                                                    : Colors.white),
                                              )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
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
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.attach_file_sharp,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.attach_file_sharp,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(child: _buildSearchField()
                                        //  TextField(
                                        //   decoration: InputDecoration(
                                        //       hintText: "Type a  message...",
                                        //       hintStyle: TextStyle(
                                        //           color: Colors.black54),
                                        //       border: InputBorder.none),
                                        // ),
                                        ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.send,
                                        color: Colors.purple,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
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
          prefixIcon: Icon(Icons.search)),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
