import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/layout/home/home_layout.dart';
import 'package:hotel/layout/login_regiseter_Layout/login_register_layout.dart';
import 'package:hotel/modules/splash_screen/splash_screen.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/network/local.dart';
import 'package:hotel/shared/stayles/themes.dart';
import 'bloc_observer.dart';

void main() async {
  // This Code Is Written By Eng:Mahmoud Radwan;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  userId = await CacheHelper.getData(key: 'Uid');
  print('id = $userId');
  Widget? widget;
  if (userId != null) {
    widget = const HomeLayout();
  } else {
    widget = const LoginRegisterLayout();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, this.startWidget}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit()..getUserData(),
      child: BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hotel',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            home: SplashScreen(nextScreen: startWidget!),
          );
        },
      ),
    );
  }
}
