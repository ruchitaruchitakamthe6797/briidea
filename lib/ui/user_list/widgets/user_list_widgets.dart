import 'package:app_briidea/constants/assets.dart';
import 'package:app_briidea/models/userlist/userlist_response.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/widgets/circular_image.dart';
import 'package:app_briidea/widgets/message_count.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatefulWidget {
  final Data? item;
  final onTap;
  const UserListWidget({Key? key, @required this.item, this.onTap})
      : super(key: key);

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildProfile(),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 0.5),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //                             Routes.merchant,
                          //                             // arguments: {'store_id': item.businessStoreId});
                          //                             arguments: {
                          //                               'business_id': _balanceStore
                          //                                   .entities[index].businessId,
                          //                               // 'store_id': item.businessStoreId, /* 'is_store': false, */
                          //                             });
                        },
                        child: Text(
                          widget.item!.firstname!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .headline6!
                          //     .copyWith(
                          //         fontSize:
                          //             DeviceUtils.getScaledWidth(context, 1)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: DeviceUtils.getScaledHeight(context, 1),
                      ),
                      Text(
                        widget.item!.address!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: DeviceUtils.getScaledWidth(context, .75)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  widget.item!.isDelivered!,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: DeviceUtils.getScaledWidth(context, .75)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: DeviceUtils.getScaledHeight(context, 1),
                ),
                _buildMessageCount(widget.item!.countUnseenmessageInfo!),
              ],
            )
          ],
        ),
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 1.5),
        ),
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
