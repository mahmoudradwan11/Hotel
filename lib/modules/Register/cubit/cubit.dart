import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel/models/User/user_model.dart';
import 'package:hotel/modules/Register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  void userRegisterWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    String?photo,
  })
  {
    emit(RegisterLoad());
    auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        phone: phone,
        uid:value.user!.uid,
        address:address,
       // photo:photo!,
      );
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }
  void signInWithGoogle()async{
    emit(RegisterGoogleLoad());
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken:googleSignInAuthentication.idToken ,
        accessToken:googleSignInAuthentication.accessToken);
    print('User id = ${googleSignInAuthentication.idToken}');
    await auth.signInWithCredential(authCredential).then((value) {
      print(auth.currentUser!.displayName);
      print(auth.currentUser!.email);
      print(auth.currentUser!.phoneNumber);
      print(value.user!.email);
      print(value.user!.uid);
      print('+++++++++++++++++++++++++++++++');
      print(value.user!.photoURL);
      print("++++++++++++++++++++++++++++++++++++");
      createUser(
          name:value.user!.displayName!,
          email:value.user!.email!,
          uid: value.user!.uid,
          photo: value.user!.photoURL!,
      );
      emit(RegisterSuccessState());
    }).catchError((error){
      print('Error Ocurr SignIn');
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }
  void createUser({
    required String name,
    required String email,
    String? phone,
    required String uid,
    String? address,
    String? photo,
  })
  {
    UserData model = UserData(
      name: name,
      email: email,
      phone: phone,
      address:address,
      uid: uid,
      photo:photo
    );
    FirebaseFirestore.instance.collection('Users').
    doc(uid).
    set(model.toMap()).
    then((value){
      emit(CreateUserSuccessState());
    }).catchError((error){
      emit(CreateUserErrorState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(RegisterChangePasswordVisibilityState());
  }
}