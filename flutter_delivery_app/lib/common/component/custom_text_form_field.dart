import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;


  const CustomTextFormField({
    required this.onChanged,
    this.obscureText = false, //기본값은 false
    this.autoFocus = false,
    this.hintText,
    this.errorText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0
      )
    );  //테두리 있는 input border

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autoFocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith( //copy with 그대로 복사하여 원하는 값만 따로 수정한다.
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR
          )
        )
      ),
    );
  }
}
