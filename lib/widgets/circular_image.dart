import 'package:app_briidea/constants/colors.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final image;
  const CircularImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
            height: DeviceUtils.getScaledHeight(context, 6),
            width: DeviceUtils.getScaledHeight(context, 6),
            alignment: Alignment.center,
            // padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 5.3)),
            decoration:
                BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
            child: Container()),
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
    );
  }
}
