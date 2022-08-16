import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_time_random_chat/sign/signup/sign_up_user_info.dart';

class SignInHome extends StatefulWidget {
  const SignInHome({Key? key}) : super(key: key);

  @override
  State<SignInHome> createState() => _SignInHomeState();
}

class _SignInHomeState extends State<SignInHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text("로그인"), centerTitle: true,),
        body: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 8
                )
              ]
          ),


          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Center(
                        child: Image(image: AssetImage("assets/chatimage.png",), width: 100, height: 100,)
                        ),
                      ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Text("ID(이메일주소)", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),

                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: TextField(decoration: InputDecoration(labelText: "아이디 입력"),)
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(alignment: Alignment.centerLeft, margin: EdgeInsets.only(left: 16, top: 16, right: 16), child: Text("패스워드", style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(alignment: Alignment.centerLeft, margin: EdgeInsets.only(left: 16, right: 16), child: TextField(decoration: InputDecoration(labelText: "패스워드 입력"),))
                  ],
                ),


                Column(
                  children: [
                    Container(
                      child: TextButton(child: Text("로그인"), style: ButtonStyle(),onPressed: (){

                      },),
                    ),
                    Container(
                      child: TextButton(child: Text("회원가입"),onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpUserInfo())
                        );
                      },),

                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );

  }
}
