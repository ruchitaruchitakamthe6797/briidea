import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final text;
  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
      // style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: size),
      textAlign: TextAlign.center,
    );
  }
}
