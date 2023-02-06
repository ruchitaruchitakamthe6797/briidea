import 'package:app_briidea/constants.dart';
import 'package:app_briidea/constants/assets.dart';
import 'package:app_briidea/ui/screens/chat_screen.dart';
import 'package:app_briidea/ui/side_list/side_list.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/widgets/bold_text_widget.dart';
import 'package:app_briidea/widgets/chat_list.dart';
import 'package:app_briidea/widgets/chatlist.dart';
import 'package:app_briidea/widgets/logo_image.dart';
import 'package:flutter/material.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: CustomColors.kGreyColor.withOpacity(0.5),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  color: CustomColors.kPrimaryColor),
            ),
            Positioned(
              top: screenHeight * 0.05,
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.02,
              right: screenWidth * 0.02,
              child: Container(
                height: screenHeight * 0.9,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: CustomColors.kLightColor,
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10.0),
                  ],
                ),
                child: Row(
                  children: [
                    _buildLeftSide(screenWidth, context),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                    ),
                    Container(
                      width: screenWidth * 0.50,
                      height: screenHeight * 0.9,
                      child: UserChatScreen(),
                    ),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: Container(
                        width: screenWidth * 0.50,
                        height: screenHeight * 0.9,
                        child: SideList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLeftSide(double screenWidth, context) {
    return Container(
      width: screenWidth * 0.25,
      child: Column(
        children: [
          Container(
            height: 56.0,
            // color: CustomColors.kGreyColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLogoImage(Assets.appLogo),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 1),
                  ),
                  _buildTitle(
                    'Briidea',
                  )
                ],
              ),
              // Row(
              //   children: [
              //     CircleAvatar(
              //       backgroundImage: AssetImage('assets/images/user.jpg'),
              //     ),
              //     Expanded(
              //       child: Container(),
              //     ),
              //     Icon(Icons.star_outline_sharp,
              //         color: CustomColors.kIconColor),
              //     SizedBox(width: 15.0),
              //     Icon(Icons.chat, color: CustomColors.kIconColor),
              //     SizedBox(width: 15.0),
              //     Icon(Icons.more_vert, color: CustomColors.kIconColor),
              //   ],
              // ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              // border: Border.all(color: )
              // borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.search,
                    size: 25.0,
                    color: CustomColors.kIconColor,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          // contentPadding: EdgeInsets.symmetric(
                          //   vertical: 0,
                          // ),
                          hintText: 'Search',
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ChatLists(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(text) {
    return TitleWidget(
      text: text,
    );
  }

  Widget _buildLogoImage(
    image,
  ) {
    return LogoImage(image: image);
  }
}
