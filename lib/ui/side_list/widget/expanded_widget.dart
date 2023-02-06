import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqWidget extends StatefulWidget {
  final question, children, icon, initiallyExpanded,subquestion;

  const FaqWidget({
    Key? key,
    @required this.initiallyExpanded,
    // @required this.onExpansionChanged,
    @required this.icon,
    @required this.subquestion,
    @required this.question,
    @required this.children,
  }) : super(key: key);

  @override
  _FaqWidgetState createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  // late ThemeStore _themeStore;
  // late FirebaseAnalytics? _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    // _analytics = FirebaseAnalytics.instance;
    // init();
  }

  // void init() async {
  //   await _analytics?.setCurrentScreen(screenName: 'foxpe_FAQ_screen_view');
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Theme.of(context).copyWith(dividerColor: Colors.transparent); //new
    return Column(
      children: [
        ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          child: ExpansionWidget(
            // key: Key(widget.index.toString()), //attention
            initiallyExpanded: true, //attention

            titleBuilder:
                (double animationValue, _, bool isExpaned, toogleFunction) {
              return InkWell(
                onTap: () => toogleFunction(animated: true),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: DeviceUtils.getScaledWidth(context, 2.0),
                      left: DeviceUtils.getScaledWidth(context, 1.0),
                      right: DeviceUtils.getScaledWidth(context, 1.0)),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Expanded(
                            child: Text(widget.question!,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)
                                // style: TextStyle(
                                //     color: AppColors.appBlue,
                                //     fontFamily: FontFamily.hedley,
                                //     fontWeight: FontWeight.w700,
                                //     fontSize:
                                //         DeviceUtils.getScaledWidth(context, 4.0)),
                                ),
                          ),
                          Row(
                            children: [
                               Text(widget.subquestion!,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)
                                  // style: TextStyle(
                                  //     color: AppColors.appBlue,
                                  //     fontFamily: FontFamily.hedley,
                                  //     fontWeight: FontWeight.w700,
                                  //     fontSize:
                                  //         DeviceUtils.getScaledWidth(context, 4.0)),
                                  ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                  isExpaned
                                      ? Icons.arrow_drop_up_outlined
                                      : Icons.arrow_drop_down_sharp ,
                                  color:
                                      isExpaned ? Colors.black : Colors.black,
                                  size: 16),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            // onExpansionChanged: widget.onExpansionChanged,

            content: Container(
                width: double.infinity,
                // padding: EdgeInsets.only(left: 20),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: DeviceUtils.getScaledWidth(context, 1.0),
                    bottom: DeviceUtils.getScaledWidth(context, 1.7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [widget.children],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
