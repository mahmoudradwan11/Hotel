import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/User/user_model.dart';
import 'package:hotel/modules/Login/Login_Screen.dart';
import 'package:hotel/modules/Register/Register_Screen.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/cubit/states.dart';

class HotelCubit extends Cubit<HotelStates>
{
  HotelCubit():super(HotelInitState());
  static HotelCubit get(context)=>BlocProvider.of(context);
  UserData? userModel;
  String? userName ;
  String? userImage;
  List<Widget>authScreens = [
    LoginScreen(),
    RegisterScreen(),
  ];
  List<Tab> tabs = const [
    Tab(
      text: 'Login',
    ),
    Tab(
      text: 'SignUp',
    ),
  ];
  void getUserData() {
    FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) {
      print(value.data());
      userModel = UserData.fromJson(value.data()!);
      userName = userModel!.name;
      userImage = userModel!.photo;
      emit(GetUserDataState());
    }).catchError((error) {
      print(error);
      emit(ErrorGetUserDataState());
    });
  }
}