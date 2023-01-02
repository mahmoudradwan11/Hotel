import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel/go.dart';
import 'package:hotel/modules/Register/cubit/cubit.dart';
import 'package:hotel/modules/Register/cubit/states.dart';
import 'package:hotel/shared/components/components.dart';
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>RegisterCubit(),
      child:BlocConsumer<RegisterCubit,RegisterStates>(
        listener:(context,state){
          if(state is CreateUserSuccessState)
          {
            showToast('UserCreated',ToastStates.SUCCESS);
            navigateAndFinish(context,Test());
          }
        },
        builder:(context,state){
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'REGISTER',
                            style:
                            Theme.of(context).textTheme.bodyText1
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Register now to Chats with friends',
                            style:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFieldForm(
                          labelStyle: Theme.of(context).textTheme.subtitle1,
                          show: false,
                          controller: nameController,
                          keyboard: TextInputType.name,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Name Must not be Empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFieldForm(
                          labelStyle: Theme.of(context).textTheme.subtitle1,
                          show: false,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Email Must not be Empty';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFieldForm(
                          labelStyle: Theme.of(context).textTheme.subtitle1,
                          show: cubit.isPassword,
                          suffix: cubit.suffix,
                          suffixPress:(){
                            cubit.changePasswordVisibility();
                          },
                          controller: passwordController,
                          keyboard: TextInputType.visiblePassword,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Password is to short must be more than 5 letter';
                            }
                            return null;
                          },
                          label: 'password',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFieldForm(
                          labelStyle: Theme.of(context).textTheme.subtitle1,
                          show: false,
                          controller: phoneController,
                          keyboard: TextInputType.phone,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'phone Must not be Empty';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFieldForm(
                          labelStyle: Theme.of(context).textTheme.subtitle1,
                          show: false,
                          controller: addressController,
                          keyboard: TextInputType.text,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Address Must not be Empty';
                            }
                            return null;
                          },
                          label: 'address',
                          prefix: Icons.location_city,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        if(state is RegisterLoad)
                          const LinearProgressIndicator(),
                        defButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegisterWithEmailAndPassword(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  address:addressController.text,
                                );
                              }
                            },
                            text: 'register',
                            isUpper: true
                        ),
                        IconButton(onPressed:(){
                          cubit.signInWithGoogle();
                        },icon:const FaIcon(FontAwesomeIcons.google,color: Colors.blue,),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}