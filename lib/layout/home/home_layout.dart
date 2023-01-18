import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/country/country.dart';
import 'package:hotel/modules/egypt_hotel/egypt.dart';
import 'package:hotel/modules/england_hotel/england.dart';
import 'package:hotel/modules/france_hotel/france.dart';
import 'package:hotel/modules/germany_hotel/germany.dart';
import 'package:hotel/modules/italy_hotel/italy.dart';
import 'package:hotel/modules/spain_hotel/spain.dart';
import 'package:hotel/shared/components/widgets.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return Scaffold(
            drawer:Drawer(
              backgroundColor: Colors.transparent,
              child: ListView(children: [
                UserAccountsDrawerHeader(
                    accountName:Text(cubit.userModel!.name!),
                    accountEmail:Text(cubit.userModel!.email!),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:NetworkImage(cubit.userModel!.photo!)
                  ),
                ),
              ],),
            ),
            backgroundColor: defaultColor,
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text(
                'Select Your Country',
                style: TextStyle(
                    fontFamily: 'Jannah', fontSize: 20, color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buildCountryItem(
                      CountryImage.egypt,
                      'Egypt',
                      AlignmentDirectional.bottomStart,
                      context,
                      const EgyptHotel()),
                  buildSizedBox(),
                  buildCountryItem(
                      CountryImage.france,
                      'France',
                      AlignmentDirectional.topEnd,
                      context,
                      const FranceHotel()),
                  buildSizedBox(),
                  buildCountryItem(
                      CountryImage.germany,
                      'Germany',
                      AlignmentDirectional.bottomStart,
                      context,
                      const GermanyHotel()),
                  buildSizedBox(),
                  buildCountryItem(
                      CountryImage.england,
                      'England',
                      AlignmentDirectional.topEnd,
                      context,
                      const EnglandHotel()),
                  buildSizedBox(),
                  buildCountryItem(
                      CountryImage.spain,
                      'Spain',
                      AlignmentDirectional.bottomStart,
                      context,
                      const SpainHotel()),
                  buildSizedBox(),
                  buildCountryItem(CountryImage.italy, 'Italy',
                      AlignmentDirectional.topEnd, context, const ItalyHotel()),
                ],
              ),
            ),
          );
        });
  }
}
