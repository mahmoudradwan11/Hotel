import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/User/user_model.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/cubit/states.dart';

class HotelCubit extends Cubit<HotelStates>
{
  HotelCubit():super(HotelInitState());
  static HotelCubit get(context)=>BlocProvider.of(context);
  UserData? userModel;
  String? userName ;
  String? userImage;
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