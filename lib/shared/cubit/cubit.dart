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

class HotelCubit extends Cubit<HotelStates> {
  HotelCubit() :super(HotelInitState());

  static HotelCubit get(context) => BlocProvider.of(context);
  UserData? userModel;
  String? userName;

  String? userImage;
  List<ReviewModel> reviews = [];
  List<EgyptHotels> egyptHotels = [];
  List<EnglandHotels> englandHotels = [];
  List<SpainHotels> spainHotels = [];
  List<ItalyHotels> italyHotels = [];
  List<GermanyHotels> germanyHotels = [];
  List<FranceHotels> franceHotels = [];
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
      name: userModel!.name,
      text: description,
      dateTime: DateTime.now().toString(),
      image: userModel!.photo,
      userId: userModel!.uid,);
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
    FirebaseFirestore.instance.collection('Users').doc(userId).get().then((
        value) {
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

  void getEgyptHotels() {
    FirebaseFirestore.instance.collection('Egypt Hotels').get().then((value) {
      egyptHotels = [];
      value.docs.forEach((element) {
        egyptHotels.add(EgyptHotels.fromJson(element.data()));
      });
      emit(GetEgyptHotel());
      print('Egypt Lenth = ${egyptHotels.length}');
    }).catchError((error) {
      emit(ErrorGetEgyptHotel());
    });
  }
  void getEnglandHotels() {
    FirebaseFirestore.instance.collection('England Hotels').get().then((value) {
      englandHotels = [];
      value.docs.forEach((element) {
        englandHotels.add(EnglandHotels.fromJson(element.data()));
      });
      emit(GetEnglandHotel());
      print('England Lenth = ${englandHotels.length}');
    }).catchError((error) {
      emit(ErrorGetEnglandHotel());
    });
  }
  void getFranceHotels() {
    FirebaseFirestore.instance.collection('France Hotels').get().then((value) {
      franceHotels = [];
      value.docs.forEach((element) {
        franceHotels.add(FranceHotels.fromJson(element.data()));
      });
      emit(GetFranceHotel());
      print('France Lenth = ${franceHotels.length}');
    }).catchError((error) {
      emit(ErrorGetFranceHotel());
    });
  }
  void getSpainHotels() {
    FirebaseFirestore.instance.collection('Spain Hotels').get().then((value) {
      spainHotels = [];
      value.docs.forEach((element) {
        spainHotels.add(SpainHotels.fromJson(element.data()));
      });
      emit(GetSpainHotel());
      print('Spain Lenth = ${spainHotels.length}');
    }).catchError((error) {
      emit(ErrorGetSpainHotel());
    });
  }
  void getItalyHotels() {
    FirebaseFirestore.instance.collection('Italy Hotels').get().then((value) {
      italyHotels = [];
      value.docs.forEach((element) {
        italyHotels.add(ItalyHotels.fromJson(element.data()));
      });
      emit(GetItalyHotel());
      print('Italy Lenth = ${italyHotels.length}');
    }).catchError((error) {
      emit(ErrorGetItalyHotel());
    });
  }
  void getGermanyHotels() {
    FirebaseFirestore.instance.collection('Germany Hotels').get().then((value) {
      germanyHotels = [];
      value.docs.forEach((element) {
        germanyHotels.add(GermanyHotels.fromJson(element.data()));
      });
      emit(GetGermanyHotel());
      print('Germany Lenth = ${germanyHotels.length}');
    }).catchError((error) {
      emit(ErrorGetGermanyHotel());
    });
  }
}