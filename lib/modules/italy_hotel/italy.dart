import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/layout/home/home_layout.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';

class ItalyHotel extends StatelessWidget {
  const ItalyHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: defaultColor,
            appBar: AppBar(
              leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {
                navigateTo(context,const HomeLayout());
              },),
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text('Italy Hotels',
                style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Jannah'),),),
          );
        }
    );
  }
}
