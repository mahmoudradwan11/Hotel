import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Test extends StatelessWidget {
   Test({Key? key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel'
        ),
      ),
      body:Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed:(){
             //signInWithGoogle();
            },icon:const FaIcon(FontAwesomeIcons.google,color: Colors.blue,),),
            IconButton(onPressed:()
            async{
             // await signOut();
            },icon:const Icon(Icons.g_translate,size: 50,),),
          ],
        ),
      ),
    );
  }

    // void signInWithGoogle()async{
    // GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    // GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount!.authentication;
    // AuthCredential authCredential = GoogleAuthProvider.credential(
    //     idToken:googleSignInAuthentication.idToken ,
    //     accessToken:googleSignInAuthentication.accessToken);
    //     print('User id = ${googleSignInAuthentication.idToken}');
    //     await auth.signInWithCredential(authCredential).then((value) {
    //       print(auth.currentUser!.displayName);
    //       print(auth.currentUser!.email);
    //       print(auth.currentUser!.phoneNumber);
    //       print(value.user!.email);
    //       print(value.user!.uid);
    //       print('+++++++++++++++++++++++++++++++');
    //       print(value.user!.photoURL);
    //       print("++++++++++++++++++++++++++++++++++++");
    //     }).catchError((error){
    //       print('Error Ocurr SignIn');
    //     });
  }
  // Future<void>signOut()async
  // {
  //    await googleSignIn.signOut();
  //    print('SignOut');
  // }
