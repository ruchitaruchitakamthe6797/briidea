import 'package:app_briidea/constants/colors.dart';
import 'package:app_briidea/ui/chat_page/chat_list_load.dart';
import 'package:app_briidea/ui/dashboard/dashboard_file.dart';
import 'package:app_briidea/ui/group_list/group_list.dart';
import 'package:app_briidea/ui/user_list/user_list.dart';
import 'package:app_briidea/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_briidea/constants/assets.dart';
import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:app_briidea/utils/locale/app_localization.dart';
import 'package:app_briidea/widgets/bold_text_widget.dart';
import 'package:app_briidea/widgets/logo_image.dart';
import 'package:app_briidea/widgets/search_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controllers:-----------------------------------------------------------
  final TextEditingController _searchController = TextEditingController();
//stores:---------------------------------------------------------------------
  // late RegisterStore _registerStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    // _registerStore = Provider.of<RegisterStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // SingleChildScrollView(
          //   scrollDirection: Axis.vertical,
          //   child: Padding(
          //     padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 1)),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text('Hello'),
          //         Expanded(
          //           child: ListView.builder(
          //               itemCount: 5,
          //               scrollDirection: Axis.vertical,
          //               physics: const AlwaysScrollableScrollPhysics(),
          //               itemBuilder: (BuildContext context, int index) {
          //                 return ListTile(
          //                     leading: const Icon(Icons.list),
          //                     trailing: const Text(
          //                       "GFG",
          //                       style: TextStyle(color: Colors.green, fontSize: 15),
          //                     ),
          //                     title: Text("List item $index"));
          //               }),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            DeviceUtils.getScaledHeight(context, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildLogoImage(Assets.about),
                              // SizedBox(
                              //   width: DeviceUtils.getScaledWidth(context, 10),
                              // ),
                              _buildTitle('Briidea')
                            ],
                          ),
                          SizedBox(
                            height: DeviceUtils.getScaledHeight(context, 1),
                          ),
                          _buildSearchField(),
                          SizedBox(
                            height: DeviceUtils.getScaledHeight(context, 1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: DeviceUtils.getScaledWidth(context, 1.5),
                            ),
                            child: _buildTitle('Direct message'),
                          ),
                          SizedBox(
                            height: DeviceUtils.getScaledHeight(context, 1),
                          ),
                          Expanded(flex: 3, child: UserList()),
                          SizedBox(
                            height: DeviceUtils.getScaledHeight(context, 1),
                          ),
                          Expanded(flex: 3, child: UserListSecond()),
                          Padding(
                            padding: EdgeInsets.only(
                              left: DeviceUtils.getScaledWidth(context, 1.5),
                            ),
                            child: _buildTitle('Commute/Group', ),
                          ),
                          SizedBox(
                            height: DeviceUtils.getScaledHeight(context, 1),
                          ),
                          GroupList(),
                          DashBoardFile(),
                        ],
                      )),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 1),
                  ),
                  Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          _buildSearchField(),
                        ],
                      )),
                  SizedBox(
                    width: DeviceUtils.getScaledWidth(context, 1),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          _buildSearchField(),
                        ],
                      )),
                ],
              ),
            ],
          ),
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

  // Widget _buildSearchField() {
  //   return SearchWidget(
  //     hint: 'Search',
  //     searchController: _searchController,
  //     onPressed: () {
  //       setState(() {
  //         _searchController.clear();

  //         // filterSearchResults('');
  //       });
  //     },
  //     onChanged: (value) {
  //       setState(() {
  //         if (value.toString().isEmpty || value.toString().length > 2) {
  //           print("cross 0 if ");
  //           print("Search me Changed $value");
  //           print("Search me Changed controller ${_searchController.text}");

  //           // filterSearchResults(value);
  //           //  sV = value;
  //         }
  //         if (_searchController.text.isEmpty) {
  //           // filterSearchResults('');
  //         }
  //       });
  //     },
  //   );
  // }
  Widget _buildSearchField() {
    return TextFormField(
      decoration: const InputDecoration(
          fillColor: Colors.grey,
          contentPadding: EdgeInsets.all(0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintText: 'Mobile Number',
          prefixIcon: Icon(Icons.search)),
    );

    // Observer(
    //   builder: (context) {
    //     return CustomIconTextFieldWidget(
    //       // padding: EdgeInsets.symmetric(
    //       //     horizontal: DeviceUtils.getScaledWidth(context, 0.7),
    //       //     vertical: DeviceUtils.getScaledHeight(context, 0)),
    //       hint: 'Search',
    //       inputType: TextInputType.name,
    //       icon: Icon(Icons.search),
    //       iconColor: Colors.black,
    //       textController: _searchController,
    //       inputAction: TextInputAction.done,
    //       autoFocus: false,
    //       onChanged: (value) {
    //         // _store.setFirstName(_searchController.text);
    //       },
    //       onFieldSubmitted: (value) {
    //         // FocusScope.of(context).requestFocus(_lastNameFocusNode);
    //       },
    //       // errorText: _store.formErrorStore.firstName,
    //       errorText: '',
    //     );
    //   },
    // );
  }
}
