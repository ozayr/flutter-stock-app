import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xff1f99af);
Color kSecondaryColor = const Color(0xff37ca7d);
Color kBackgroundColor = const Color(0xff0c1325);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: false,
  // fillColor: Colors.white,
  errorStyle:
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red),
  disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kSecondaryColor, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
  border: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(10))),
  hintStyle: TextStyle(color: kSecondaryColor.withOpacity(0.5)),
  floatingLabelStyle: TextStyle(color: kSecondaryColor, fontSize: 18),
  labelStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
);

TextStyle kDefaultTextStyle = const TextStyle(color: Colors.white);

TextStyle kSmallHeaderText = const TextStyle(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

TextStyle kSmallSubText = const TextStyle(
  color: Colors.grey,
  fontSize: 12,
);
