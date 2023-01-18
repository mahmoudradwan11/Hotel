import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/shared/cubit/cubit.dart';
import 'package:hotel/shared/cubit/states.dart';
import 'package:hotel/shared/stayles/colors.dart';

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
                        child: Image(image: NetworkImage(model.image!))),
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
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Container(
                        height: 230,
                        color: Colors.black.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    model.rite!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 35),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Overall rating',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Location',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 5,
                                    child: Slider(
                                        value: model.locationRite!,
                                        min: 0.0,
                                        max: 5.0,
                                        activeColor: Colors.white,
                                        inactiveColor: defaultColor,
                                        thumbColor: Colors.transparent,
                                        onChanged: (value) {}),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Service',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 5,
                                    child: Slider(
                                        value: model.service!,
                                        min: 0.0,
                                        max: 5.0,
                                        activeColor: Colors.white,
                                        inactiveColor: defaultColor,
                                        thumbColor: Colors.transparent,
                                        onChanged: (value) {}),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Cleanness',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 5,
                                    child: Slider(
                                        value: model.clean!,
                                        min: 0.0,
                                        max: 5.0,
                                        activeColor: Colors.white,
                                        inactiveColor: defaultColor,
                                        thumbColor: Colors.transparent,
                                        onChanged: (value) {}),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Price',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 5,
                                    child: Slider(
                                        value: model.value!,
                                        min: 0.0,
                                        max: 5.0,
                                        activeColor: Colors.white,
                                        inactiveColor: defaultColor,
                                        thumbColor: Colors.transparent,
                                        onChanged: (value) {}),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          );
        });
  }
}
