import 'package:crud_testing/constant/colors.dart';
import 'package:flutter/material.dart';

TextStyle noteTitleStyle() {
  return const TextStyle(
      color: pPrimaryColor, fontWeight: FontWeight.w600, fontSize: 24);
}

String capitalizeAllWord(String value) {
  var result = value[0].toUpperCase();
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " ") {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
    }
  }
  return result;
}
