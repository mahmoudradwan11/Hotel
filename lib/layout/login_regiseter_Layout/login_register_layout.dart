import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';

class LoginRegisterLayout extends StatelessWidget {
  const LoginRegisterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return DefaultTabController(
              length: cubit.tabs.length,
              child: Scaffold(
                appBar: AppBar(
                  title:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text('Find your ',style: TextStyle(fontFamily:'Jannah',fontSize: 20,color: Color(0xff002147)),),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/App_Icon.png'),
                    ),
                  ],
                ),
                  centerTitle: true,
                  bottom: TabBar(
                    labelColor: Color(0xff002147),
                    tabs: cubit.tabs,
                  ),
                ),
                body: TabBarView(
                  children: cubit.authScreens,
                ),
              ),
          );
    }
    );
  }
}
