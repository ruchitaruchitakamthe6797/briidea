import 'package:app_briidea/constants/colors.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/responsive.dart';
import 'package:flutter/material.dart';

class MessageCount extends StatelessWidget {
  final text;
  const MessageCount({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context)
          ? DeviceUtils.getScaledHeight(context, 2.5)
          : DeviceUtils.getScaledHeight(context, 3),
      width: Responsive.isDesktop(context)
          ? DeviceUtils.getScaledHeight(context, 2.5)
          : DeviceUtils.getScaledHeight(context, 3),
      alignment: Alignment.center,
      // padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 5.3)),
      decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
      child: Center(
        child: Text(
          text,
          // style: Theme.of(context).textTheme.subtitle2!.copyWith(
          // fontSize: Responsive.isDesktop(context)
          //     ? DeviceUtils.getScaledHeight(context, .75)
          //     : DeviceUtils.getScaledWidth(context, 3),
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),

          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
