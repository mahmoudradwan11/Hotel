import 'package:flutter/material.dart';
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
