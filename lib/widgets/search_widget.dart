// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:briidea_app/constants/colors.dart';
// import 'package:briidea_app/stores/theme/theme_store.dart';
// import 'package:briidea_app/utils/device/device_utils.dart';
// import 'package:briidea_app/utils/responsive.dart';
// import 'package:briidea_app/widgets/textfield_widget.dart';


// class SearchWidget extends StatefulWidget {
//   final searchController, onChanged, hint, onPressed;

//   const SearchWidget(
//       {Key? key,
//       @required this.searchController,
//       @required this.onChanged,
//       @required this.hint,
//       @required this.onPressed})
//       : super(key: key);

//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }

// class _SearchWidgetState extends State<SearchWidget> {
//   late ThemeStore _themeStore;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();

//     // initializing stores
//     _themeStore = Provider.of<ThemeStore>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Container(
//       height: Responsive.isTablet(context) && _size.height < 1000
//           ? DeviceUtils.getScaledHeight(context, 7)
//           : Responsive.isTablet(context)
//               ? DeviceUtils.getScaledHeight(context, 6.1)
//               : Responsive.isSmallMobile(context) && _size.height < 600
//                   ? DeviceUtils.getScaledHeight(context, 7)
//                   : DeviceUtils.getScaledHeight(context, 5.8),
//       decoration: BoxDecoration(
//           borderRadius:
//               BorderRadius.circular(DeviceUtils.getScaledWidth(context, 10)),
//           color: _themeStore.darkMode ? AppColors.darkThemeCard : Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: _themeStore.darkMode
//                   ? AppColors.darkThemeCard
//                   : AppColors.greyBorderShade,
//               blurRadius: 5.0,
//             ),
//           ]),
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: DeviceUtils.getScaledWidth(context, 3.2),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextFieldWidget(
//                 padding: EdgeInsets.symmetric(
//                     // horizontal: DeviceUtils.getScaledWidth(context, 3.2),
//                     // vertical: DeviceUtils.getScaledWidth(context, 0)
//                     ),
//                 // contentPadding: EdgeInsets.symmetric(vertical: -5),
//                 // cursorHeight: DeviceUtils.getScaledWidth(context, 3.7),
//                 hint: widget.hint,
//                 inputType: TextInputType.text,
//                 // icon: Icon(Icons.search),
//                 // icon: Icons.search,

//                 textAlign: TextAlign.start,
//                 iconColor: AppColors.appBlue,
//                 textController: widget.searchController,
//                 inputAction: TextInputAction.done,
//                 autoFocus: false,
//                 // maxLength: 20,
//                 onChanged: widget.onChanged,
//                 onPressed: widget.onPressed,
//                 /* onChanged: (value) {
//                   // filterSearchResults(value);
//                   // _formStore.setMobile(_userMobileController.text);
//                 },*/
//                 errorText: null, //_formStore.formErrorStore.mobile,
//               ),
//             ),
//             // Padding(
//             //   padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 2)),
//             //   child: IconButton(
//             //     onPressed: () {},
//             //     child: Icon(
//             //       Icons.clear,
//             //       color: _themeStore.darkMode
//             //           ? Colors.white70
//             //           : AppColors.blackShade,
//             //       size: DeviceUtils.getScaledWidth(context, 6.4),
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: EdgeInsets.only(
//                 right: DeviceUtils.getScaledWidth(context, 3.2),
//                 // bottom: DeviceUtils.getScaledWidth(context, 1.2),
//               ),
//               child: Center(
//                 child: InkWell(
//                     onTap: () {
//                       // _profileStore.scannerScan = false;
//                       // _profileStore.setScannerSuccess(false);
//                       // DeviceUtils.hideKeyboard(context);
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //   builder: (context) => QRViewExample(),
//                       // ));
//                     },
//                     child: Padding(
//                       padding: Responsive.isTablet(context) ||
//                               Responsive.isSmallMobile(context)
//                           ? EdgeInsets.only()
//                           : EdgeInsets.all(
//                               DeviceUtils.getScaledWidth(context, 2)),
//                       child: Icon(
//                         Icons.qr_code_scanner_outlined,
//                         color: AppColors.appBlue,
//                         size: DeviceUtils.getScaledWidth(context, 6.4),
//                       ),
//                     )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
