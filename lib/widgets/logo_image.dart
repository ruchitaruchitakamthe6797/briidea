import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final image;
  const LogoImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: DeviceUtils.getScaledHeight(context, 10),
      width: DeviceUtils.getScaledHeight(context, 10),
      // fit: BoxFit.fitWidth,
    );
  }
}
