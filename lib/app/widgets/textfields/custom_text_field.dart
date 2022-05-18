import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text/textfield_title_widget.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? errorText;
  final Color? textColor;
  final double? fontSize;
  final String? initialValue;
  final double? inBetweenSpace;
  final Function(String val)? onChanged;
  final FormFieldValidator<String>? validator;
  final Function(String val)? onSubmitted;
  final String? title;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? textInputFormatter;
  final double? topPadding;
  final int? maxLength;

  final bool autoFocus;
  final FocusNode? focusNode;

  const CustomTextField(
      {Key? key,
      this.textEditingController,
      this.errorText,
      this.textColor,
      this.fontSize,
      this.focusNode,
      this.initialValue,
      required this.onChanged,
      this.onSubmitted,
      this.title,
      this.textInputFormatter,
      this.keyboardType,
      this.textInputAction,
      this.obscureText,
      this.suffixIcon,
      this.autoFocus = false,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.inBetweenSpace,
      this.topPadding,
      this.prefix,
      this.hint,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldTitleWidget(title: title),
        SizedBox(height: inBetweenSpace ?? 2),
        TextFormField(
            initialValue: initialValue,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType ?? TextInputType.emailAddress,
            textInputAction: textInputAction ?? TextInputAction.next,
            controller: textEditingController,
            decoration: getInputDecoration(errorText ?? ""),
            textCapitalization: textCapitalization,
            maxLength: maxLength,
            inputFormatters: textInputFormatter,
            autofocus: autoFocus,
            focusNode: focusNode,
            onFieldSubmitted: (val) {
              if (onSubmitted != null) onSubmitted!(val);
            },
            onChanged: (val) {
              onChanged!(val);
            },
            validator: (newValue) {
              return validator!(newValue);
            }),
      ],
    );
  }

  InputDecoration getInputDecoration(String error) {
    return const InputDecoration().copyWith(
        isDense: true,
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        errorMaxLines: 2,
        errorText: errorText != null && errorText!.isNotEmpty ? error : null,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColor.hintTextColor)
        // contentPadding: EdgeInsets.fromLTRB(12, topPadding ?? 8, 12, 13),
        );
  }
}
