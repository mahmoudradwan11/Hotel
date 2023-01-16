import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
    builder: (context, state) {
    var cubit = HotelCubit.get(context);
    var userModel = cubit.userModel;
    return Scaffold(
    appBar: AppBar(
    title:Text('${cubit.userName}'),
    ),
      body: Image(image: NetworkImage(cubit.userImage!),),
    );
    }
    );
  }
}
