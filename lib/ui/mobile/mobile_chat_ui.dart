import 'package:app_briidea/constants/assets.dart';
import 'package:app_briidea/ui/chat_page/chat_list_load.dart';
import 'package:app_briidea/ui/dashboard/dashboard_file.dart';
import 'package:app_briidea/ui/group_list/group_list.dart';
import 'package:app_briidea/ui/side_list/side_list.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/responsive.dart';
import 'package:app_briidea/widgets/bold_text_widget.dart';
import 'package:app_briidea/widgets/logo_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileChatUi extends StatefulWidget {
  const MobileChatUi({Key? key}) : super(key: key);

  @override
  State<MobileChatUi> createState() => _MobileChatUiState();
}

class _MobileChatUiState extends State<MobileChatUi> {
  bool _isAlwaysShown = true;
  ScrollController controller = ScrollController();
  ScrollController _scrollcontroller = ScrollController();

  bool _showTrackOnHover = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: Responsive.isTablet(context) ? 3 : 2,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(
                      DeviceUtils.getScaledHeight(context, 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 1),
                        ),
                        _buildSearchField(),
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: DeviceUtils.getScaledHeight(context, 2),
                          ),
                          child: _buildTitle(
                            'Direct message',
                          ),
                        ),
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 2),
                        ),
                        // UserList(),

                        Expanded(
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.grey.shade100),
                            child: Scrollbar(
                              controller: controller,
                              isAlwaysShown: true,
                              showTrackOnHover: true,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  controller: controller,
                                  child: UserListSecond()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 1),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: DeviceUtils.getScaledHeight(context, 2),
                          ),
                          child: _buildTitle(
                            'Commute/Group',
                          ),
                        ),
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 1.5),
                        ),
                        Expanded(
                          child: Container(
                            decoration:
                                BoxDecoration(color: Colors.grey.shade100),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    DeviceUtils.getScaledHeight(context, 2),
                              ),
                              child: Scrollbar(
                                  controller: _scrollcontroller,
                                  isAlwaysShown: true,
                                  showTrackOnHover: true,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      controller: _scrollcontroller,
                                      child: GroupList())),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: DeviceUtils.getScaledHeight(context, 1),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: DeviceUtils.getScaledHeight(context, 2),
                    ),
                    child: DashBoardFile(),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 4,
            // ),
            // Visibility(
            //   visible:
            //       Responsive.isDesktop(context) || Responsive.isTablet(context),
            //   child: Expanded(
            //       flex: 6,
            //       child: Column(
            //         children: [
            //           _buildSearchField(),
            //         ],
            //       )),
            // ),
            // VerticalDivider(
            //   color: Colors.grey.shade100,
            // ),
            // SizedBox(
            //   width: 4,
            // ),
            // Visibility(
            //   visible: Responsive.isDesktop(context),
            //   child: Expanded(
            //       flex: 2,
            //       child: Column(
            //         children: [
            //           SideList(),
            //         ],
            //       )),
            // ),
            // SizedBox(
            //   width: 4,
            // ),
          ],
        ),
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

  Widget _buildSearchField() {
    return TextFormField(
      decoration: const InputDecoration(
          isDense: true,
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.symmetric(
            vertical: -5,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintText: 'Search',
          prefixIcon: Icon(Icons.search)),
    );
  }
}
