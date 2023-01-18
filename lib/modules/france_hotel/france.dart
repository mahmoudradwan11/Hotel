import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/layout/home/home_layout.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/components/widgets.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';

class FranceHotel extends StatelessWidget {
  const FranceHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return Scaffold(
            backgroundColor: defaultColor,
            appBar: AppBar(
              leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {
                navigateTo(context,const HomeLayout());
              },),
              centerTitle: true,
              backgroundColor: Colors.black,
              title: const Text('France Hotels',
                style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Jannah'),),),
            body:ListView.separated(
                itemBuilder:(context,index)=>buildCostomHotel(cubit.franceHotels[index], context),
                separatorBuilder:(context,index)=>const SizedBox(
                  height: 1,
                ),
                itemCount: cubit.franceHotels.length,
            ),
          );
        }
    );
  }
}
