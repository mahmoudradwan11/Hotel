import 'package:flutter/material.dart';
import 'package:hotel/models/review_model/review_Model.dart';
import 'package:hotel/modules/hotel_details/hotel_details.dart';
import 'package:hotel/shared/components/components.dart';
import 'package:intl/intl.dart';

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
        onTap: () {
          navigateTo(context, HotelDetails(model: model));
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
Widget buildReview(ReviewModel model) => Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        height: 120,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: NetworkImage(model.image!),height: 100,width: 100,fit: BoxFit.cover,),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: const TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      Text(
                        DateFormat('MM--dd--20yy At KK:mm')
                            .format(DateTime.tryParse(model.dateTime!)!),
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      Text(model.text!,style:const TextStyle(fontSize: 14,color: Colors.white,),maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
