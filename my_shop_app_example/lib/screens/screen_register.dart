import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop_app_example/models/model_auth.dart';
import 'package:my_shop_app_example/models/model_register.dart';
import 'package:my_shop_app_example/screens/screen_login.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFieldModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('회원가입 화면'),
          ),
          body: Column(
            children: [
              EmailInput(),
              PasswordInput(),
              PasswordConfirmInput(),
              RegisterButton()
            ],
          )
      )
    );

  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerFieldModel = Provider.of<RegisterFieldModel>(context, listen: false);


    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (email){
          registerFieldModel.setEmail(email);
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: '이메일',
            helperText: ''
        ),
      ),
    );
  }
}


class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerFieldModel = Provider.of<RegisterFieldModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (password){
          registerFieldModel.setPassword(password);
        },
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            labelText: '비밀번호',
            helperText: ''
        ),
      ),
    );
  }
}




class PasswordConfirmInput extends StatelessWidget {
  const PasswordConfirmInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerField = Provider.of<RegisterFieldModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (password){
          registerField.setPasswordConfirm(password);
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: "비밀번호 확인",
          helperText: ""
        ),


      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authClient = Provider.of<FirebaseAuthProvider>(context, listen: false);
    final registerFiled = Provider.of<RegisterFieldModel>(context, listen: false);
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )
        ),
        onPressed: () async{
          await authClient
              .registerWithEmail(registerFiled.email, registerFiled.password)
              .then((registerStatus){
                if(registerStatus == AuthStatus.registerSuccess) {
                  ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text('회원가입이 완료되었습니다!')),
                      );
                  Navigator.pop(context);
                }else{
                  ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text('회원가입을 실패했습니다. 다시 시도해주세요.'))
                      );
                }
          });
        },
        child: Text('회원가입'),
      ),
    );

  }
}
