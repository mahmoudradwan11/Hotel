import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel/modules/Login/Login_Screen.dart';
import 'package:hotel/shared/network/local.dart';
import 'package:hotel/shared/stayles/themes.dart';
import 'go.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  var id = await CacheHelper.getData(key:'Uid');
  print('id = $id');
  Widget? widget;
  if (id != null) {
    widget = Test();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}
class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key,this.startWidget}) : super(key:key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: darkTheme,
      home: AnimatedSplashScreen(
        splash: Stack(
          children: const [
            Image(
              fit: BoxFit.contain,
              width: 300,
              image: AssetImage('images/App_Icon.png'),
            ),
          ],
        ),
        duration: 3000,
        nextScreen:startWidget!,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white
      ),
    );
    }
}