import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus{
  registerSuccess,
  registerFail,
  loginSuccess,
  loginFail,
}



/**
 *  이메일주소가 잘못되었거나 이상하거나 비밀번호가 6자리 이하일 경우 에러가 발생한다.
 * */
class FirebaseAuthProvider with ChangeNotifier{
  FirebaseAuth authClient;
  User? user;

  //auth를 authClient에 할당 만약 null일 경우 FirebaseAuth.instance를할당
  FirebaseAuthProvider({auth}) : authClient = auth ?? FirebaseAuth.instance;

  Future<AuthStatus> registerWithEmail(String email, String password) async{
    try{
      UserCredential credential = await authClient
          .createUserWithEmailAndPassword(email: email, password: password);
      return AuthStatus.registerSuccess;
    }catch(e){
      print(e);
      return AuthStatus.registerFail;
    }
  } // registerWithEmail

  Future<AuthStatus> loginWithEmail(String email, String password) async{
    try{

      authClient.signInWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        user = credential.user;
        print("loginWithEamil"+user.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setBool('isLogin', true);
        prefs.setString('email', email);
        prefs.setString('password', password);
        print("[+] 로그인 유저 : " + user!.email.toString());
      });

      return AuthStatus.loginSuccess;

    }catch(e){
      print("loginWithEmail "+e.toString());
      return AuthStatus.loginFail;
    }
  }

  Future<void> logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', false);
    prefs.setString('email', '');
    prefs.setString('password', '');
    user = null;
    await authClient.signOut();
    print("logout() - 로그아웃");
  }


}