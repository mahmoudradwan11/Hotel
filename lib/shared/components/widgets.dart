import 'package:flutter/material.dart';
import 'package:hotel/modules/hotel_details/hotel_details.dart';
import 'package:hotel/shared/components/components.dart';

Widget buildCountryItem(String image, String text,
        AlignmentGeometry alignmentGeometry, context, widget) =>
    InkWell(
      onTap: () {
        navigateTo(context, widget);
      },
      child: Container(
        child: Stack(
          alignment: alignmentGeometry,
          children: [
            Image(
              image: AssetImage(image),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
Widget buildSizedBox() => const SizedBox(
      height: 10,
    );
Widget buildCostomHotel(model, context) => Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 5),
      child: InkWell(
        onTap:(){
          navigateTo(context,HotelDetails(model: model));
        },
        child: Container(
          height: 255,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                fit: BoxFit.cover,
                image: NetworkImage(model.image!),
                height: 255,
                width: double.infinity,
              ),
              Positioned(
                  bottom: 60,
                  left: 20,
                  child: Text(
                    model.name!,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.transparent.withOpacity(0.5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        model.location!,
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          const Text(
                            'Guest Rite',
                            style: TextStyle(fontSize: 9, color: Colors.white),
                          ),
                          Text(
                            model.rite!,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
