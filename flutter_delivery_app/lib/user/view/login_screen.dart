import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/const/colors.dart';
import 'package:flutter_delivery_app/common/layout/defailt_layout.dart';

import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //manual 의 경우 완료 버튼을 눌러야 사라짐
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),  //좌우만 적용
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                SizedBox(height: 16.0,),
                _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CustomTextFormField(
                  hintText: '이메일을 입력해주세요',
                  onChanged: (String value) {},
                ),
                const SizedBox(height: 16.0,),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해 주세요',
                  onChanged: (String value) {},
                  obscureText: true,
                ),
                const SizedBox(height: 16.0,),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                    ),
                    child: Text('로그인')),
                TextButton(
                    onPressed: (){
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text('회원가입')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다!',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길!',
      style: TextStyle(fontSize: 16, color: BODY_TEXT_COLOR),
    );
  }
}
