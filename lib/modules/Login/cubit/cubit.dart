import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:hotel/models/User/user_model.dart';
import 'package:hotel/modules/Login/cubit/states.dart';
//import 'package:hotel/shared/components/components.dart';
//import 'package:hotel/shared/network/local.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  void userLogin({required String email, required String password}){
    emit(LoadingLogin());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      print(error.toString());
      emit(LoginFailedState(error));
    });
  }
   void loginWithGoogle()async {
     emit(LoadingLogin());
        GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
     GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount!
         .authentication;
     AuthCredential authCredential = GoogleAuthProvider.credential(
         idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await auth.signInWithCredential(authCredential).then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      print('Error Ocurr SignIn');
      print(error.toString());
      emit(LoginFailedState(error));
    });
  }
  void changePasswordIcon() {
    passwordShow = !passwordShow;
    suffixIcon =
    passwordShow ? Icons.visibility : Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
  }

}