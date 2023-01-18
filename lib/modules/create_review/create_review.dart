import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';

class CreateReviewScreen extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();

  CreateReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return Scaffold(
            backgroundColor: defaultColor,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text('Create Review',style: TextStyle(color: Colors.white),),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildTextForm(
                      context,
                      buttonController: descriptionController,
                      title: 'Review',
                      MediaQuery
                          .of(context)
                          .size
                          .height * 0.22,
                    ),
                    const Spacer(),
                    defButton(function: () {
                      cubit.createReview(description:descriptionController.text);
                      showToast('Send', ToastStates.SUCCESS);
                    }, text: 'Send'),
                  ],
                ),
              )
          );
        }
    );
  }
}
