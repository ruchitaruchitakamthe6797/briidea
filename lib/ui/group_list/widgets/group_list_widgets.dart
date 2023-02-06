import 'package:app_briidea/constants.dart';
import 'package:app_briidea/constants/assets.dart';
import 'package:app_briidea/functions/custom_function.dart';
import 'package:app_briidea/models/grouplist_response/grouplist_response.dart';
import 'package:app_briidea/provider/chat_provider.dart';
import 'package:app_briidea/ui/group_chat/group_chat_details.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/responsive.dart';
import 'package:app_briidea/utils/routes/routes.dart';
import 'package:app_briidea/widgets/circular_image.dart';
import 'package:app_briidea/widgets/message_count.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupListWidget extends StatefulWidget {
  final NewGroup? item;
  final onTap;
  const GroupListWidget({Key? key, @required this.item, @required this.onTap})
      : super(key: key);

  @override
  State<GroupListWidget> createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<GroupListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 1),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Icon(
                  //   Icons.alternate_email,
                  //   size: 20,
                  //   color: Colors.black,
                  // ),
                  Text(
                    '@',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    // style: Theme.of(context).textTheme.headline6!.copyWith(
                    //     fontSize: Responsive.isDesktop(context)
                    //         ? DeviceUtils.getScaledWidth(context, 1.7)
                    //         : DeviceUtils.getScaledWidth(context, 5)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onTap,
                      // () {
                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) {
                      //   //   return GroupChatDetails();
                      //   // }));
                      //   //            Provider.of<ChatProvider>(context, listen: false)
                      //   // .updateChatIndex(widget.item!.chatGroupName);
                      //   if (CustomFunctions.isMobile(context)) {
                      //     Navigator.of(context)
                      //         .pushNamed(Routes.group_chat, arguments: {
                      //       'user_name': widget.item!.chatGroupName,
                      //     });
                      //   }
                      // },

                      child: Text(
                        widget.item!.chatGroupName!,
                        // style: Theme.of(context).textTheme.headline6!.copyWith(
                        //     fontSize: Responsive.isDesktop(context)
                        //         ? DeviceUtils.getScaledWidth(context, 1)
                        //         : DeviceUtils.getScaledWidth(context, 4)),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildMessageCount(widget.item!.groupId!),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildProfile() {
    // print(
    //     'profile name exception: ${_profileStore.firstName[0]}${_profileStore.lastName[0]}');
    // ignore: prefer_const_constructors
    return CircularImage(
      image: Assets.man_logo,
    );
  }

  Widget _buildMessageCount(text) {
    // print(
    //     'profile name exception: ${_profileStore.firstName[0]}${_profileStore.lastName[0]}');
    // ignore: prefer_const_constructors
    return MessageCount(
      text: text,
    );
  }
}
