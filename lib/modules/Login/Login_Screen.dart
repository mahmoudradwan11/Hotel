import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel/layout/home/home_layout.dart';
import 'package:hotel/modules/Login/cubit/cubit.dart';
import 'package:hotel/modules/Login/cubit/states.dart';
import 'package:hotel/modules/profile/profile.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/network/local.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              CacheHelper.saveData(key:'Uid', value: state.uid).then((value){
                navigateAndFinish(context, const HomeLayout());
                showToast('Login Done',ToastStates.SUCCESS);
              });
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Text('Nice To See You Again',style: TextStyle(fontFamily: 'Jannah',fontSize: 20),),
                          const Image(image: AssetImage('images/login_icon.png',),height: 200,),
                         const  SizedBox(
                            height: 50,
                          ),
                          defaultFieldForm(
                              labelStyle: const TextStyle(
                                color: Color(0xff002147)
                              ),
                              label:'Email',
                              controller:emailController,
                              keyboard:TextInputType.emailAddress,
                              valid:(value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Email';
                                }
                                return null;
                              },
                            show: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFieldForm(
                            labelStyle: const TextStyle(
                                color: Color(0xff002147)
                            ),
                            label:'Password',
                            controller:passwordController,
                            keyboard:TextInputType.visiblePassword,
                            valid:(value) {
                              if (value.isEmpty) {
                                return 'Please Enter Your password';
                              }
                              return null;
                            },
                            show: cubit.passwordShow,
                            suffix: cubit.suffixIcon,
                            suffixPress: (){
                              cubit.changePasswordIcon();
                            }
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defButton(function:(){
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          }, text:'Login'),
                         const  SizedBox(
                            height: 15,
                          ),
                          IconButton(onPressed:(){
                            cubit.loginWithGoogle();
                          }, icon:FaIcon(FontAwesomeIcons.google,size: 25,))
                        ],
                      ),
                    ),
                  ),
                )
            );
          },
        ));
  }
}
