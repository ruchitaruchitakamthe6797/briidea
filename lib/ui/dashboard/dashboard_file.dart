import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/responsive.dart';
import 'package:app_briidea/widgets/message_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashBoardFile extends StatefulWidget {
  // String name;
  // String messageText;
  // String? imageUrl;
  // String time;
  // bool isMessageRead;
  // final Data? item;
  DashBoardFile({
    Key? key,
    // required this.name,
    // required this.messageText,
    // required this.item,
    // this.imageUrl,
    // required this.time,
    // required this.isMessageRead
  }) : super(key: key);
  @override
  _DashBoardFileState createState() => _DashBoardFileState();
}

class _DashBoardFileState extends State<DashBoardFile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrsMC13I0XaI8vSQnZUIAIHLlVmDtxoB6OYQ&usqp=CAU'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: DeviceUtils.getScaledHeight(context, .5),
                    ),
                    child: Icon(
                      Icons.circle,
                      size: DeviceUtils.getScaledHeight(context, 1.5),
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return ChatDetails();
                    // }));
                  },
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    // style: Theme.of(context).textTheme.headline6!.copyWith(
                    //     fontSize: Responsive.isDesktop(context)
                    //         ? DeviceUtils.getScaledWidth(context, 1)
                    //         : DeviceUtils.getScaledWidth(context, 5)),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 2),
        ),
        Row(
          children: [
            Icon(
              Icons.settings,
              size: DeviceUtils.getScaledHeight(context, 4),
            ),
            SizedBox(width: 11),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return ChatDetails();
                // }));
              },
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // style: Theme.of(context).textTheme.headline6!.copyWith(
                //     fontSize: Responsive.isDesktop(context)
                //         ? DeviceUtils.getScaledWidth(context, 1)
                //         : DeviceUtils.getScaledWidth(context, 5)),
                textAlign: TextAlign.start,
              ),
            ),
          ],
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
