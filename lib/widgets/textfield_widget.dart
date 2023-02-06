import 'package:app_briidea/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class CustomIconTextFieldWidget extends StatelessWidget {
  final Widget icon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isReadOnly;
  final int maxLength;
  final bool isPrefixText;
  final String prefixText;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: padding,
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          readOnly: this.isReadOnly,
          controller: textController,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          autofocus: autoFocus,
          textInputAction: inputAction,
          obscureText: this.isObscure,
          maxLength: this.maxLength,
          keyboardType: this.inputType,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontSize: DeviceUtils.getScaledWidth(context, 3.5)),
          //style: Theme.of(context).textTheme.bodyText1,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: -1),
            /* border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),*/
            hintText: this.hint,
            hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: hintColor,
                fontSize: DeviceUtils.getScaledWidth(context, 3.5)),
            errorText: errorText,
            counterText: '',
            prefixIcon: icon,
            prefixText: this.prefixText,
            //icon: this.isIcon ? Icon(this.icon, color: iconColor) : null
          ),
        ),
      ),
    );
  }

  const CustomIconTextFieldWidget({
    Key? key,
    required this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isReadOnly = false,
    this.isPrefixText = false,
    this.prefixText = '',
    this.maxLength = 25,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
