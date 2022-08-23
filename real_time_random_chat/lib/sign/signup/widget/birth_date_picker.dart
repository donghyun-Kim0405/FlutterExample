import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String initDateStr;

  BirthDatePicker({
    required this.onDateTimeChanged,
    required this.initDateStr
})

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: DateTime.now().year,
        initialDateTime: DateTime.now(),
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}
