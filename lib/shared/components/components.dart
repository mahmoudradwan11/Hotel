import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel/shared/stayles/colors.dart';
Widget builtDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    color: Colors.grey,
    height: 1.0,
    width: double.infinity,
  ),
);
var userId ;
Widget defaultFieldForm({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  String? label,
  IconData? prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal:5,vertical:5),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: defaultColor,),
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPress,
          color: Colors.blueGrey,
        )
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
);
Widget defButton({
  double width = double.infinity,
  double heigth = 40.0,
  bool isUpper = true,
  Color background = defaultColor,
  Color textColor = Colors.white,
  required var function,
  required String text,
}) =>
    Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(color: textColor, fontFamily: 'Jannah'),
        ),
      ),
    );
Widget textButton({
  required String text,
  required var function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
void showToast(String message, ToastStates state) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  SUCCESS,
  ERROR,
  WARNING,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget buildTextForm(
    BuildContext context,
    double height, {
      TextEditingController? buttonController,
      double? width,
      String? title,
      double? fontSize = 16.0,
      Color? color = Colors.white,
    }) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: fontSize, color: color),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 1.0,color: Colors.white),
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: buttonController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );