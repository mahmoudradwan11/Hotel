import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/User/user_model.dart';
import 'package:hotel/models/hotel/egypt_model.dart';
import 'package:hotel/models/hotel/england_hotel.dart';
import 'package:hotel/models/hotel/france_hotel.dart';
import 'package:hotel/models/hotel/germany_hotel.dart';
import 'package:hotel/models/hotel/italy_hotel.dart';
import 'package:hotel/models/hotel/spain_model.dart';
import 'package:hotel/models/review_model/review_Model.dart';
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
  List<ReviewModel> reviews = [];
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
  void createReview({
    required String description,
   // String? bookImage,
  }) {
    emit(CreateReviewLoading());
    ReviewModel model = ReviewModel(
       name:userModel!.name,
       text:description,
       dateTime:DateTime.now().toString(),
       image:userModel!.photo,
        userId:userModel!.uid,);
    FirebaseFirestore.instance
        .collection('Reviews')
        .add(model.toMap())
        .then((value) {
      emit(CreateReview());
    }).catchError((error) {
      emit(CreateReviewError());
    });
  }
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