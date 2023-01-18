import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/hotel/egypt_model.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';
import 'package:rating_summary/rating_summary.dart';

class HotelDetails extends StatelessWidget {
  var model;
  HotelDetails({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: defaultColor,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 260,
                        width: double.infinity,
                        child: Image(image: NetworkImage(model.image!),fit: BoxFit.cover,)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Row(
                        children: [
                          Text(
                            model.name!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                          Spacer(),
                          Text(
                            model.price!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          Text(
                            model.location!,
                            style: const TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          const Spacer(),
                         const  Text(
                            '/Per night',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Summary',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: ExpansionTile(
                        title: Text(
                          model.description!,
                          style: const TextStyle(
                            fontFamily: 'Jannah',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                        ),
                        children: [
                          ListTile(
                            title: Text(
                              model.description!,
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontFamily: 'Jannah',
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RatingSummary(
                              counter:5,
                              average: num.parse(model.rite!).toDouble(),
                            showAverage:true,
                            counterFiveStars:num.parse(model.rite!).toInt(),
                            counterTwoStars:model.locationRite!.toInt(),
                            counterThreeStars:model.clean!.toInt(),
                            counterOneStars:model.service!.toInt(),
                            counterFourStars: model.value!.toInt(),
                            averageStyle:const TextStyle(color: Colors.white,fontSize: 40),
                            // label: 'Overrate',
                            // labelStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 40,color: Colors.white),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
