import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender{ MALE, FEMALE }


class GenderSelectCheckbox extends StatefulWidget {
  var gender = Gender.MALE;
  var isChecked = false;

  @override
  State<GenderSelectCheckbox> createState() => _GenderSelectCheckboxState();
}

class _GenderSelectCheckboxState extends State<GenderSelectCheckbox> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadioListTile(
              title: Text("남자"),
              value: Gender.MALE,
              groupValue: widget.gender,
              onChanged: (Gender? value){
                setState(() {
                  widget.gender = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("여자"),
              value: Gender.FEMALE,
              groupValue: widget.gender,
              onChanged: (Gender? value){
                setState(() {
                  widget.gender = value!;
                });
              },
            ),

          ],
        )

    );
  }
}
