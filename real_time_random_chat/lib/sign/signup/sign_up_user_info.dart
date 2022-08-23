import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real_time_random_chat/sign/signup/widget/birth_date_picker.dart';
import 'package:real_time_random_chat/sign/signup/widget/gender_select_checkbox.dart';

enum Gender{
  MALE, FEMALE
}

class SignUpUserInfo extends StatefulWidget {
  const SignUpUserInfo({Key? key}) : super(key: key);

  @override
  State<SignUpUserInfo> createState() => _SignUpUserInfoState();
}

class _SignUpUserInfoState extends State<SignUpUserInfo> {

  var _isChecked = false;
  Gender _gender = Gender.MALE;
  GenderSelectCheckbox genderSelectCheckbox = GenderSelectCheckbox();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("회원가입"), centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8
                )
              ]
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("이름", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: TextField(decoration: InputDecoration(labelText: "이름 입력"),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("닉네임(한글, 영문, 숫자)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: TextField(decoration: InputDecoration(labelText: "닉네임 입력"),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("아이디(이메일)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: TextField(decoration: InputDecoration(labelText: "이메일 입력"),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("비밀번호(6자 이상 영문, 숫자 조합)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: TextField(decoration: InputDecoration(labelText: "비밀번호 입력"),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("비밀번호 확인", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: TextField(decoration: InputDecoration(labelText: "비밀번호 입력"),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("생년월일", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 8, top: 8),
                  child: BirthDatePicker()
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: Text("성별", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16, top: 16),
                  child: genderSelectCheckbox
                ),


                Container(
                  child: TextButton(
                    child: Text("가입하기", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      print(genderSelectCheckbox.gender);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ));
  }
}
