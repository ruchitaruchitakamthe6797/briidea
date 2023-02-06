import 'package:app_briidea/functions/custom_function.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/responsive.dart';
import 'package:app_briidea/utils/routes/routes.dart';
import 'package:app_briidea/widgets/message_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String? imageUrl;
  String time;
  bool isMessageRead;
  final Data? item;
  final ontap;
  ConversationList(
      {Key? key,
      required this.name,
      required this.messageText,
      required this.item,
      this.imageUrl,
      required this.time,
      required this.ontap,
      required this.isMessageRead})
      : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  String currentdate = '';
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    var newFormat = DateFormat("dd MMM yyyy");
    var currentDateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
    print(currentDateTime);
    print(dateFormat);
    String today = newFormat.format(DateTime.now());
    // var date = widget.item!.messageTime;
    DateTime date = dateFormat.parse(widget.item!.messageTime!);
    if (dateFormat.parse(currentDateTime.toString()).toString() ==
        '2023-02-03 22:34:00.000') {
      // currentdate = dateFormat.parse(currentDateTime.toString()).toString();
      currentdate = 'Now';
    }

    currentdate = DateFormat('MMM d').format(date);
    print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
    print(DateFormat('EEEE').format(date)); // prints Tuesday
    print(DateFormat('EEEE, d MMM, yyyy')
        .format(date)); // prints Tuesday, 10 Dec, 2019
    print(DateFormat('MMM d').format(date));
    print(DateFormat('h:mm a').format(date));
    return Column(
      children: [
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 1),
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'http://i.imgur.com/QSev0hg.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: DeviceUtils.getScaledHeight(context, .5),
                            ),
                            child: Icon(
                              Icons.circle,
                              size: DeviceUtils.getScaledHeight(context, 1.5),
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Colors.pink,
                    //   backgroundImage: NetworkImage(
                    //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrsMC13I0XaI8vSQnZUIAIHLlVmDtxoB6OYQ&usqp=CAU"),
                    //   maxRadius: 30,
                    // ),
                    SizedBox(width: 13),
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.ontap,
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.name,
                                // style: TextStyle(
                                //   fontSize:
                                //       DeviceUtils.getScaledHeight(context, 3),
                                // ),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                widget.messageText,
                                // style: TextStyle(
                                //     fontSize:
                                //         DeviceUtils.getScaledHeight(context, 2),
                                //     color: Colors.grey.shade600,
                                //     fontWeight: widget.isMessageRead
                                //         ? FontWeight.bold
                                //         : FontWeight.normal),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  // Text(
                  //   widget.time,
                  //   style: TextStyle(
                  //       fontSize: DeviceUtils.getScaledHeight(context, 3),
                  //       fontWeight: widget.isMessageRead
                  //           ? FontWeight.bold
                  //           : FontWeight.normal),
                  // ),
                  Text(
                    currentdate,
                    // style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    //     fontSize: Responsive.isDesktop(context)
                    //         ? DeviceUtils.getScaledHeight(context, .75)
                    //         : DeviceUtils.getScaledHeight(context, 2)),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: DeviceUtils.getScaledHeight(context, 1),
                  ),
                  Visibility(
                      visible: widget.item!.countUnseenmessageInfo != '0',
                      child: _buildMessageCount(
                          widget.item!.countUnseenmessageInfo))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 1),
        ),
      ],
    );
  }

  Widget _buildMessageCount(text) {
    return MessageCount(
      text: text,
    );
  }
}
