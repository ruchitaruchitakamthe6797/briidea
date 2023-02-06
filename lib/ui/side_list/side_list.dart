import 'package:app_briidea/ui/side_list/widget/expanded_widget.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class SideList extends StatefulWidget {
  const SideList({Key? key}) : super(key: key);

  @override
  State<SideList> createState() => _SideListState();
}

class _SideListState extends State<SideList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [_buildTask(), _buildAlert()],
      ),
    );
  }

  Widget _buildTask() {
    return FaqWidget(
      question: 'Task',
      subquestion: '3 Task',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildList(
              Icons.auto_awesome_motion_rounded, 'Work on gmail', 'text2'),
          SizedBox(
            height: 5,
          ),
          _buildList(Icons.auto_awesome_motion_rounded, 'Visit member', ''),
          SizedBox(
            height: 5,
          ),
          _buildList(Icons.auto_awesome_motion_rounded, 'Make appointment', ''),
          SizedBox(
            height: 5,
          ),
          _buildViewAll(() {}),
        ],
      ),
    );
  }
}

Widget _buildAlert() {
  return FaqWidget(
    question: 'Alert',
    subquestion: '',
    children: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildList(Icons.error_outlined, 'interest rate change to 5%', ''),
        SizedBox(
          height: 5,
        ),
        _buildList(Icons.error_outlined, 'fill form of onboarding', ''),
        SizedBox(
          height: 5,
        ),
        _buildList(Icons.error_outlined, 'Check leave count of month', ''),
        SizedBox(
          height: 5,
        ),
        _buildList(Icons.error_outlined, 'New scheme Closed', ''),
        SizedBox(
          height: 5,
        ),
        _buildViewAll(() {}),
      ],
    ),
  );
}

Widget _buildViewAll(
  ontap,
) {
  return GestureDetector(
    onTap: ontap,
    child: Text(
      '+ view all',
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.pink,
        fontSize: 12,
      ),
    ),
  );
}

Widget _buildList(icon, text, String? text2) {
  return Row(
    children: [
      Expanded(
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Visibility(
        visible: text2!.isNotEmpty,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              text2,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.keyboard_control_outlined,
        color: Colors.black,
      ),
    ],
  );
}
